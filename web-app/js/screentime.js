/*
 * screentime.js
 * 
 */

(function(Spine, $, exports) {

	//Model
	var Page = Spine.Model.sub();
	Page.configure("Page","id","pageName","pageUrl","pageOrder");
	Page.extend(Spine.Model.Ajax);
	Page.include({
		
		validate: function() {
			var msg = '';
			if(!this.pageName) {
				msg += 'You must provide a Page Name\n';
			}
			if(!this.pageUrl) {
				msg += 'You must provide a Page URL';
			}
			return msg;
		}
		
	});

	//Controller
	var PageList = Spine.Controller.sub({
		elements : {
			"ul.pageList":"pageList",
			"ul.pageList li[data-id]":"pageListPageItem",
			"ul.pageList li > a":"pageListItemLink"
		},
		
		events : {
			"click ul.pageList li a.activatePageButton":"activatePage",
			"click ul.pageList li a.deletePageButton":"deletePage"
		},
		
	
		init: function(options){
			Page.bind("refresh change", this.proxy(this.render));
			
			$('#home').live('pageshow', function(){
				Page.fetch();
			});

		},
		
		render: function() {

			this.pageListPageItem = $("ul.pageList li[data-id]");
			this.pageListPageItem.remove();				

			this.pageList.prepend(
				$('#pageListItemTemplate').tmpl(Page.all())
				);
			this.pageList.listview('refresh');
		},
		
		activatePage: function(event) {
			this.trigger("gotoPage", $(event.currentTarget).attr('data-id'));
		},
		
		deletePage: function(event) {
			var pageIdToDelete = $(event.currentTarget).attr('data-id');
			Page.find(pageIdToDelete).destroy();
		} 
	});
	
	var ScreenManager = Spine.Controller.sub({
		elements : {
			".pageScreen": "pageScreens",
			".pageScreen div.pageNavbar ul": "pageScreenNavbars",
			"#pageRotationDelaySlider" : "rotationDelaySlider"
		},
		
		events : {
			"click .playButton": "play",
			"click .refreshButton" : "refreshPages",
			"click .pageScreenHeader": "pause",
			"click #pageRotationDelaySlider": "updateRotationDelay",
			"keyup .pageScreen": "keyboardCommand",
			"click .homeButton": "gotoHome"
		},
				
		activePage: 'home',
		activePageIndex: -1,
		pages : [],
		timer: '',
		overlayTimer: '',
		screenInterval: 5000,
		overlayShown: false,
				
		init: function(options, pageListController) {

			this.rotationDelaySlider.bind( "change", this.proxy(this.updateRotationDelay));
			
			this.pageListController = options.pageListController;
			
			//attach event listeners to Page and PageListController
			Page.bind("refresh change", this.proxy(this.refreshScreens));
			this.pageListController.bind("gotoPage", this.proxy(this.gotoScreen));
		},
		
		refreshPages: function() {
			Page.fetch();
		},
		
		refreshScreens: function() {

			//remove any existing pageScreens
			this.pageScreens.remove();
			
			//get and cache pages
			//TODO: revisit if pages become dynamic
			this.pages = Page.all();
			
			//create and append new pageScreens
			this.el.append(
				$('#pageScreenTemplate').tmpl(Page.all())
			);
						
			//update the navbars on all page screens
			this.pageScreens = $('.pageScreen');
			this.pageScreenNavbars = $('.pageScreen div.pageNavbar ul'); //this needed to be recalced
			this.pageScreenNavbars.append(
				$('#pageScreenNavbarListItem').tmpl(Page.all())
			);
			
			//attach page events
			this.pageScreens.live('pageshow', this.proxy(this.onScreen));
			this.pageScreens.live('pagehide', this.proxy(this.offScreen));
			this.pageScreens.live('click', this.proxy(this.pageClick));
			
			$('li a[data-id]', this.pageScreenNavbars).click(this.proxy(this.navbarClick));
			
			//update the next previous links on all screens
			$('.next').click(this.proxy(this.nextScreen));
			$('.prev').click(this.proxy(this.prevScreen));	
			$('.next').click(this.proxy(this.pause));
			$('.prev').click(this.proxy(this.pause));
			$('.togglePlayPause').click(this.proxy(this.togglePlayPause));

		},
		
		navbarClick: function(event) {
			this.pause();
			this.gotoScreen($(event.currentTarget).attr('data-id'));
		},
		
		gotoScreen: function(pageId, reverse) {
			var screenToNavigateTo, content, position, fromHome, transition;
			
			//find the screen we need to navigate to
			screenToNavigateTo = $('.pageScreen[data-id="'+ pageId + '"]')
			
			//find out if we are coming from home
			fromHome = this.activePage == 'home';

			//check the screen exists
			if(screenToNavigateTo.length === 0) {
				throw("gotoscreen: Page with id " + pageId + " does not exist");
			}
			
			//update active navigation bars
			$('a', this.pageScreenNavbars).removeClass('ui-btn-active');
			$('a[data-id="' + pageId + '"]', this.pageScreenNavbars).addClass('ui-btn-active');

			//change to the required screen
			$.mobile.changePage(screenToNavigateTo, {
				changeHash:false,
				transition: fromHome?'flip':'slide',
				reverse: (reverse && !fromHome)
			});
			
			screenToNavigateTo.focus();
			
			//update the controller about what the current active screen is
			this.activePage = pageId;
			this.activePageIndex = this._pageIndex(pageId);
			
			
		},

		nextScreen: function() {
			this.gotoScreen(this.pages[this._nextPageIndex()].id); 
		},
		
		prevScreen: function() {
			this.gotoScreen(this.pages[this._prevPageIndex()].id, true); 		
		},
		
		gotoHome: function() {
			this.pause();

			//update the controller about what the current active screen is
			this.activePage = 'home';

			//change to the required screen
			$.mobile.changePage('#home', {
				changeHash:false,
				transition:'flip',
				reverse: (true)
			});			
		},
		
		onScreen: function(e) {
			var currentPage = $(e.currentTarget);
			var pageId = currentPage.attr('data-id');
			this._shimScreenContent(pageId);
		},
		
		offScreen: function(e) {
			var currentPage = $(e.currentTarget);
			var pageId = currentPage.attr('data-id');
			
			this._shimScreenContent(pageId);
			this.hideOverlay(pageId);
			console.log('offscreen');
		},
		
		pageClick: function(e) {
			var currentPage = $(e.currentTarget);
			var pageId = currentPage.attr('data-id');
			
			if(this.isOverlayShown()) {
				this.pause();
				this.hideOverlay(pageId);				
			} else {
				this.showOverlay(pageId);
			}
		},

		play: function() {
			
			if(!this.timer) {
				this.trigger("play");
				this.timer = setInterval(this.proxy(this.play), this.screenInterval);
			}
			this.nextScreen();
		},
		
		pause: function() {
			if(this.timer) {
				this.trigger("pause");				
				clearInterval(this.timer);	
			}
			this.timer = '';
		},
		
		togglePlayPause: function() {
			if(this.isPlaying()) {
				this.pause();
			} else {
				this.play();
			}
		},
		
		isPlaying: function() {
			return this.timer;
		},
		
		showOverlay:function(pageId) {
			console.log('show overlay: ' + pageId)
			
			var overlay = $('.pageScreen[data-id="' + pageId +'"] .overlay')
			var message = $('.overlayMessage', overlay);
			
			console.log(message.length);
			
			message.fadeIn();
			
			this.overlayShown = true;
			
		},
		
		hideOverlay: function(pageId) {
			var overlay = $('.pageScreen[data-id="' + pageId +'"] .overlay')
			var message = $('.overlayMessage', overlay);

			message.fadeOut();
			
			if(this.overlayTimer) {
				clearTimeout(this.overlayTimer);
			}

			this.overlayTimer = '';
			this.overlayShown = false;
			
			console.log('hiding overaly for ' + pageId);	
		},
		
		isOverlayShown: function() {
			return(this.overlayShown);
		},
		
		keyboardCommand: function(e) {
			
			if(e.keyCode == 37) { this.prevScreen(); }
			if(e.keyCode == 39 | e.keyCode == 190) { this.nextScreen(); }
			if(e.keyCode == 27 | e.keyCode == 188) { this.gotoHome(); }
			if(e.keyCode == 80) { this.togglePlayPause(); }
			
			console.log(e.keyCode);

		},
		
		updateRotationDelay: function(e) {
			this.screenInterval = parseInt(this.rotationDelaySlider.val() * 1000)
		},		
		
		_shimScreenContent: function(pageId) {

			var page, content, shim, contentOffset, cssPosition;

			//setup the content shim
			page = $('.pageScreen[data-id="' + pageId +'"]');
			content = $('.content', page);
			shim = $('.overlay', page);

			contentOffset = content.offset();		

			cssPosition = {
				'top': contentOffset.top,
				'left': contentOffset.left,
				'height': content.height(),
				'width': content.width()					
			};

			$('.overlay', page).css({
				'display': 'block',
				'position': 'absolute'
			}).css(
				cssPosition
			);			
		},
		
		_pageIndex: function(pageId){
			var i, pageLength = this.pages.length;
			
			for(i = 0; i < pageLength; i+=1) {
				if(this.pages[i].id == pageId) {
					return i;
				}
			}
			return -1;
		},
		
		_nextPageIndex: function() {
			if(this.activePageIndex === this.pages.length - 1) {
				return 0;
			} else {
				return this.activePageIndex + 1;
			}
		},			
		
		_prevPageIndex: function() {
			if(this.activePageIndex <= 0) {
				return this.pages.length - 1; 
			} else {
				return this.activePageIndex - 1;
			}				
		}
		
	});
	
	var PageFormManager = Spine.Controller.sub({
		elements : {
			"form":"form",
			".pageNameInput":"pageNameInput",
			".pageUrlInput": "pageUrlInput"
		},
		
		events : {
			"submit form":"createPage"
		},
		
		init : function(options) {
			this.el = options.el;
		},
		
		createPage : function(e){
			var newPage, validationErrors;
			
			e.preventDefault();
			newPage = Page.fromForm(this.form);
			
			if(!(newPage.save()))
			{
				validationErrors = newPage.validate();
				alert(validationErrors);
			} else {
				$('#newPage').dialog('close');			
			}
		},

	});
	
	$(function(){
		var pages = new PageList({el:$('#pages')});
		var screens = new ScreenManager({el:$('body'), pageListController:pages});
		var pageForm = new PageFormManager({el:$('.pageForm')});
		
		Page.fetch();
				
	});

})(Spine, jQuery, window);

	




/*
 * screentime.js
 * 
 */

(function(Spine, $, exports) {

	//Model
	var Page = Spine.Model.sub();
	Page.configure("Page","id","pageName","pageUrl","pageOrder");
	Page.extend(Spine.Model.Ajax);

	//Controller
	var PageList = Spine.Controller.sub({
		elements : {
			"ul.pageList":"pageList",
			"ul.pageList li a":"pageListItemLink"
		},
		
		events : {
			"click ul.pageList li a.activatePageButton":"activatePage",
			"click ul.pageList li a.deletePageButton":"deletePage"
		},
		
	
		init: function(options){
			Page.bind("refresh change", this.proxy(this.render));
			Page.fetch();
		},
		
		render: function() {
			this.pageList.empty().append(
				$('#pageListItemTemplate').tmpl(Page.all())
				).listview('refresh');
		},
		
		activatePage: function(event) {
			this.trigger("gotoPage", $(event.target).attr('data-id'));
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
		},
		
		events : {
			"click .playButton": "play",
			"click .pageScreenHeader": "pause",
			"keyup .pageScreen": "keyboardCommand",
			"movemove .overlay" : "mouseActivity"
		},
				
		activePage: -1,
		activePageIndex: -1,
		pages : [],
		timer: '',
		screenInterval: 5000,
				
		init: function(options, pageListController) {
			
			this.pageListController = options.pageListController;
			
			//attach event listeners to Page and PageListController
			Page.bind("refresh change", this.proxy(this.refreshScreens));
			this.pageListController.bind("gotoPage", this.proxy(this.gotoScreen));
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
			$('li a[data-id]', this.pageScreenNavbars).click(this.proxy(this.navbarClick));
			
			//update the next previous links on all screens
			$('a.next').click(this.proxy(this.nextScreen));
			$('a.prev').click(this.proxy(this.prevScreen));

		},
		
		navbarClick: function(event) {
			this.gotoScreen($(event.currentTarget).attr('data-id'));
		},
		
		gotoScreen: function(pageId, reverse) {
			
			//find the screen we need to navigate to
			var screenToNavigateTo = $('.pageScreen[data-id="'+ pageId + '"]')
			
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
				transition:'slide',
				reverse: (reverse?true:false)
			});
			
			//update the controller about what the current active screen is
			this.activePage = pageId;
			this.activePageIndex = this._pageIndex(pageId);

			//setup the iframe shim
			var content = $('.content', screenToNavigateTo);
			var position = content.position();

			$('#pageScreenOverlay').tmpl().appendTo(screenToNavigateTo).css({
				'top': position.top,
				'left': position.left,
				'height': content.height(),
				'width': content.width()	
			}).click(this.proxy(this.pause));			
			
		},
		
		nextScreen: function() {
			this.gotoScreen(this.pages[this._nextPageIndex()].id); 
		},
		
		prevScreen: function() {		
			this.gotoScreen(this.pages[this._prevPageIndex()].id, true); 		
		},
		
		
		play: function() {
			if(!this.timer) {
				this.timer = setInterval(this.proxy(this.play), this.screenInterval);
			}
			this.nextScreen();
		},
		
		pause: function() {
			if(this.timer) {
				clearInterval(this.timer);	
			}
			this.timer = '';
		},
		
		keyboardCommand: function() {
			console.log('command');
		},
		
		
		
		_pageIndex: function(pageId){
			var i, pageLength = this.pages.length;
			
			for(i = 0; i < pageLength; i+=1) {
				if(this.pages[i].id === pageId) {
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
	
	$(function(){
		var pages = new PageList({el:$('#pages')});
		var screens = new ScreenManager({el:$('body'), pageListController:pages});		
	});

})(Spine, jQuery, window);

	




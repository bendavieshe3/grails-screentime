<!doctype html>
<html>
	<head>
		<meta name="layout" content="dash"/>
		<title>Screentime</title>
		<style type="text/css" media="screen">

		</style>

	</head>
	<body>
		<section id="home" data-role="page">
			<header data-role="header" data-postion="fixed">
				<h1>Site Name</h1>
			</header>
			<div class="content" data-role="content">
				<h3>All Pages</h3>
				<ul data-role="listview" id="pageList">
					<li>loading...</li>
				</ul>
				
				<br/>
				
				<div data-role="fieldcontain">
					<div data-role="controlgroup">
						<a href="#page1" data-role="button" 
							data-icon="arrow-r"
							data-transition="slide">Play</a>
						<a href="#admin" data-role="button" 
							data-icon="gear"
							data-rel="dialog">Admin</a>						
					</div>
				</div>
			</div>
			<footer data-role="footer"
				data-position="fixed"><h4>Screentime</h4></footer>
		</section>

		<section id="admin" data-role="page">
			<header data-role="header">
				<h1>Screentime Options</h1>
			</header>
			<div class="content" data-role="content">
				<form>
					<label for="sitename">Site Name:</label>
					<input type="text" name="sitename" id="sitename"
						value="" placeholder="site name..." />
					<a href="#home" data-role="button" data-inline="true">Cancel</a>
					<input type="submit" value="OK" data-inline="true"
						data-theme="b" />
				</form>			
			</div>
			<footer data-role="footer"><h4>Screentime</h4></footer>
		</section>
		
		<section id="templates">
			<section id="page-template" data-role="page">
				<header data-role="header" data-postion="fixed">
					<a href="#home" data-icon="arrow-l"
						data-transition="slide"
						data-direction="reverse">Prev</a>
					<h1>Site name</h1>
					<a href="#home" data-icon="arrow-r"
						data-transition="slide"
						data-iconpos="right">Next</a>
				</header>
				<div class="content" data-role="content">
					<iframe class="dashPageIFrame" src="#"></iframe>
				</div>
				<footer data-role="footer"
					 data-position="fixed">
					<div data-role="navbar" class="pageNavbar">
						<ul data-role="navbar">
							<li>loading...</li>
						</ul>
					</div>	 
				</footer>			
			</section>
		</section>
		
		<script type="text/javascript">
			var screentime = {};
			screentime.dashPages = []
		
			screentime.createNavPagesNavItems = function() {
				var dashPage = '';
				var dashPageNavbarItems = [];

				$.each(screentime.dashPages, function(val) {
					
					dashPage = screentime.dashPages[val];
					dashPageNavbarItems.push('<li><a href="#dashPageId' + dashPage.id + '" ' 
						+ 'data-transition="slide">' + dashPage.pageName + '</a></li>');
				});	
				return $(dashPageNavbarItems.join(''));
			}
		
			screentime.refreshDashPages = function() {
				
				var dashPage = '';
				var newDashPageId = '';
				var jqmPage = '';
				var dashPages = screentime.dashPages;
				var dashPageListItems = [];

				//create nav bar menu for new screens
				var dashPageNavItems = '';
				
				$.each(dashPages, function(val) {
					dashPage = dashPages[val];
					newDashPageId = 'dashPageId' + dashPage.id;
					
					//create new page if required
					if(!$('#' + newDashPageId).length) {
						//create actual page and set ID
						jqmPage = $('#page-template').clone();
						jqmPage.attr('id', newDashPageId);
						
						//update iframe
						$('.dashPageIFrame', jqmPage)
							.attr('src', dashPage.pageUrl)
							.height('100%')
							.width('100%');
						//size iframe
						
						
						//update nav bar items for current page
						dashPageNavItems = screentime.createNavPagesNavItems();
						$('a:contains("'+ dashPage.pageName + '")', dashPageNavItems).addClass('ui-btn-active');										
						//append nav bar items for bottom navigation bar		
						$('.pageNavbar ul', jqmPage).empty().append(dashPageNavItems);
					
						//add to new page to Dom
						jqmPage.appendTo('body');					
					}
					

					//create list item entry for adding the home page list view
					dashPageListItems.push('<li><a href="#dashPageId' + dashPage.id + '" ' 
						+ 'data-transition="slide">' + dashPage.pageName + '</a></li>');
					
				});
				$('#pageList').empty().append(dashPageListItems.join('')).listview('refresh');				
			}
		
			$(document).bind('pageinit', function() {
				jQuery.getJSON('/pages/get', function(data) {

					screentime.dashPages = data;
					screentime.refreshDashPages();
				});
			});
			
		
		</script>		
		
	</body>
</html>

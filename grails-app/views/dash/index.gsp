<!doctype html>
<html>
	<head>
		<meta name="layout" content="dash"/>
		<title>Screentime</title>
		

		
		<script id="pageListItemTemplate" type="text/x-jquery-tmpl" >
			<li data-id="{{= id }}">
				<a href="#" data-transition="slide" data-id="{{= id }}" class="activatePageButton">
					<h3>{{= pageName }}</h3>
					<p>{{= pageUrl }}</p>
				</a>
								
				<a href="#" data-icon="delete" class="deletePageButton" data-theme="b"
 					data-id="{{= id }}">Delete Page</a>
			</li>
		</script>

		<script id="pageScreenTemplate" type="text/x-jquery-tmpl">
			<section data-role="page" class="pageScreen" id="pageScreen{{= id }}" data-id="{{= id }}">
				<header data-role="header" data-postion="fixed" class="pageScreenHeader">
					<a href="#" data-icon="arrow-l" class="prev ui-btn-left"
						data-transition="slide"
						data-direction="reverse">Prev</a>
					<h1 class="homeButton">{{= pageName }}</h1>
					<a href="#" data-icon="arrow-r" class="next ui-btn-right"
						data-transition="slide"
						data-iconpos="right">Next</a>
				</header>
				<div class="content" data-role="content">
					<iframe class="dashPageIFrame" src="{{= pageUrl }}"></iframe>
					<div class="overlay">
						<div class="overlayMessage">
							<div class="overlayPrev prev">
								<span class="overlayLetter">&lt;</span>
							 	previous screen
							</div>

							<div class="overlayNext next">
								<span class="overlayLetter">&gt;</span>
							 	next screen
							</div>
							<div class="overlayPlayPause togglePlayPause">
								<span class="overlayLetter">P</span>
							 	to Play or Pause
							</div>		
							<div class="overlayOptions homeButton">
								<span class="overlayLetter">ESC</span>
								to return to see options
							</div>					
						</div>
					</div>
				</div>

				<footer data-role="footer"
					 data-position="fixed">
					<div data-role="navbar" class="pageNavbar">
						<ul data-role="navbar">
						</ul>
					</div>	 
				</footer>	
		
			</section>
		</script>
		
		<script id="pageScreenNavbarListItem" type="text/x-jquery-tmpl">
			<li><a href="#" data-transition="slide" data-id="{{= id }}">{{= pageName }}</a></li>
		</script>

	</head>
	
	<body id="pageContainer">
	
		<section id="home" data-role="page" data-theme="b">
			<header data-role="header" data-postion="fixed">
				<h1>Screentime</h1>
			</header>
			<div class="content" data-role="content">
			
				<div class="title clearfix">
					<g:img uri="/images/icons/television@2x.png" />
					<h1>Screentime</h1>
				</div>
				
				<div class="ui-grid-a">
					<div id="pages" class="ui-block-a">
						<ul data-role="listview" class="pageList" data-inset="true"  data-theme="b">
							<li data-theme="a"><a href="#newPage" data-rel="dialog">Create New...</a></li>
						</ul>
					</div>	
					
					<div class="ui-block-b">
						<div id="controls" data-role="fieldcontain">
							<div data-role="controlgroup" data-type="horizontal" data-theme="a">
								<a class="playButton" href="#" data-role="button" 
									data-icon="arrow-r" data-theme="a"
									data-transition="slide">Play</a>
								<a href="#" data-role="button" class="refreshButton" 
									data-icon="gear" data-theme="a"
									data-rel="dialog">refresh</a>								
							</div>
						
						</div>
						<div>
							<form method="post" action="/group">
								<label for="pageRotationDelaySlider">Playback Speed:</label>
								<input type="range" name="pageRotationDelay" id="pageRotationDelaySlider"
									class=".pageRotationDelay" value="5" min="5" max="60">
							</form>						
						</div>

					</div>	
				</div>
				
			</div>
			<footer data-role="footer"
				data-position="fixed"><h4>Screentime</h4></footer>
		</section>

		<section id="newPage" data-role="page">
			<header data-role="header">
				<h1>New Screen</h1>
			</header>
			<div class="content pageForm" data-role="content">
				<form method="post" action="#home" data-ajax="false">
					<label for="pageNameInput">Page Name:</label>
					<input type="text" name="pageName" id="pageNameInput"
						value="" placeholder="My sensible page name" />
					<label for="pageUrlInput">Page URL:</label>	
					<input type="text" name="pageUrl" id="pageUrlInput"
						value="" placeholder="http://www.mysite.com/interesting.page" />						
					<a href="#home" data-role="button" data-inline="true" data-rel="back">Cancel</a>
					<input type="submit" value="OK" data-inline="true"
						data-theme="b" />
				</form>			
			</div>
			<footer data-role="footer"><h4>Screentime</h4></footer>
		</section>
	
		
	</body>
</html>

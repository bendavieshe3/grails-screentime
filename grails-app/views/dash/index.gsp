<!doctype html>
<html>
	<head>
		<meta name="layout" content="dash"/>
		<title>Screentime</title>
		<style type="text/css" media="screen">
			.pageScreen div.content {
				margin:0px;
				padding:0px;
			}
			
			.pageScreen iframe {
				margin:0px;
				padding:0px;
				width:100%;
				height:100%;
			}
			
			.pageScreen div.content {
				margin:0px;
				padding:0px;
				width:100%;
				height:100%;
			}
			
			div.overlay {
				background-color:#444;
				position:absolute;
				opacity:0;
				z-index:1;
			}

			div.overlayMessage {
				margin:auto;
				margin-top:3em;
				opacity:1;
				font-size:3em;
				width:7em;
				background-color:#333;
				color:#ddd;
				text-align:center;
				border-radius:1em;
				padding:1em;
				
			}			
		</style>
		
		<script id="pageListItemTemplate" type="text/x-jquery-tmpl" >
			<li data-theme="e">
				<a href="#" data-transition="slide" data-id="{{= id }}" class="activatePageButton">{{= pageName }}</a>
				<a href="#" data-icon="delete" class="deletePageButton">Delete Page</a>
			</li>
		</script>

		<script id="pageScreenTemplate" type="text/x-jquery-tmpl">
			<section data-role="page" class="pageScreen" id="pageScreen{{= id }}" data-id="{{= id }}">
				<header data-role="header" data-postion="fixed" class="pageScreenHeader">
					<a href="#" data-icon="arrow-l" class="prev"
						data-transition="slide"
						data-direction="reverse">Prev</a>
					<h1>{{= pageName }}</h1>
					<a href="#" data-icon="arrow-r" class="next"
						data-transition="slide"
						data-iconpos="right">Next</a>
				</header>
				<div class="content" data-role="content">
					<iframe class="dashPageIFrame" src="{{= pageUrl }}"></iframe>
				</div>
				<footer data-role="footer"
					 data-position="fixed">
					<div data-role="navbar" class="pageNavbar">
						<ul data-role="navbar">
							<li><a href="#home" data-transition="slide"
								data-direction="reverse">Home</a></li>
						</ul>
					</div>	 
				</footer>			
			</section>
		</script>
		
		<script id="pageScreenNavbarListItem" type="text/x-jquery-tmpl">
			<li><a href="#" data-transition="slide" data-id="{{= id }}">{{= pageName }}</a></li>
		</script>
		
		<script id="pageScreenOverlay" type="text/x-jquery-tmpl">
			<div class="overlay">
				<div class="overlayMessage">
					click to pause
				</div>
			</div>
		</script>
				

	</head>
	<body id="pageContainer">
		<section id="home" data-role="page">
			<header data-role="header" data-postion="fixed">
				<h1>Site Name</h1>
			</header>
			<div class="content" data-role="content">
				<h3>All Pages</h3>
				<div id="pages">
					<ul data-role="listview" class="pageList">
						<li>loading...</li>
					</ul>
				</div>	
				<br/>
				
				<div data-role="fieldcontain">
					<div data-role="controlgroup">
						<a class="playButton" href="#" data-role="button" 
							data-icon="arrow-r"
							data-transition="slide">Play</a>
						<a href="#admin" data-role="button" 
							data-icon="gear"
							data-rel="dialog">Admin</a>						
					</div>
				</div>
				<br />
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

		<script type="text/javascript">

		</script>		
		
	</body>
</html>

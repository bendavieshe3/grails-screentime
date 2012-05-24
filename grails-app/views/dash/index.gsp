<!doctype html>
<html>
	<head>
		<meta name="layout" content="dash"/>
		<title>Screentime</title>
		<g:external uri="/images/icons/favicon.ico" />
		<g:external uri="/images/icons/favicon.png" />
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
			
			.title img {
				float:left;
			}
			
			.title h1 {
				float:right;
				margin:1.2em;
			}
			
			.clearfix:after {
				content: ".";
				display: block;
				clear: both;
				visibility: hidden;
				line-height: 0;
				height: 0;
			}
 
			.clearfix {
				display: inline-block;
			}
			 
			html[xmlns] .clearfix {
				display: block;
			}
			 
			* html .clearfix {
				height: 1%;
			}
						
		</style>
		
		<script id="pageListItemTemplate" type="text/x-jquery-tmpl" >
			<li>
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
					<a href="#" data-icon="arrow-l" class="prev ui-btn-left"
						data-transition="slide"
						data-direction="reverse">Prev</a>
					<h1>{{= pageName }}</h1>
					<a href="#" data-icon="arrow-r" class="next ui-btn-right"
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
		<section id="home" data-role="page" data-theme="b">
			<header data-role="header" data-postion="fixed">
				<h1>Site Name</h1>
			</header>
			<div class="content" data-role="content">
			
				<div class="title clearfix">
					<g:img uri="/images/icons/television@2x.png" />
					<h1>Screentime</h1>
				</div>
				
				<div class="ui-grid-a">
					<div id="pages" class="ui-block-a">
						<ul data-role="listview" class="pageList" data-inset="true"  data-theme="b">
							<li>loading...</li>
						</ul>
					</div>	
					
					<div id="controls" data-role="fieldcontain"  class="ui-block-a">
						<div data-role="controlgroup" data-type="horizontal" data-theme="a">
							<a class="playButton" href="#" data-role="button" 
								data-icon="arrow-r" data-theme="a"
								data-transition="slide">Play</a>
							<a href="#admin" data-role="button" 
								data-icon="gear" data-theme="a"
								data-rel="dialog">Admin</a>						
						</div>
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

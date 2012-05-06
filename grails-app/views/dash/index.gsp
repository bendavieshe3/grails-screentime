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
				<ul data-role="listview">
					<li><a href="#page1"
						data-transition="slide">W3 Schools</a></li>
				</ul>
				
				<div data-role="controlgroup">
					<a href="#page1" data-role="button" 
						data-icon="arrow-r"
						data-transition="slide">Play</a>
					<a href="#admin" data-role="button" 
						data-icon="gear"
						data-rel="dialog">Admin</a>						
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

		<section id="page1" data-role="page">
			<header data-role="header" data-postion="fixed">
				<a href="#home" data-icon="arrow-l"
					data-transition="slide"
					data-direction="reverse">Prev</a>
				<h1>W3 Schools</h1>
				<a href="#home" data-icon="arrow-r"
					data-transition="slide"
					data-iconpos="right">Next</a>
			</header>
			<div class="content" data-role="content">
				<iframe src="http://www.w3schools.com"></iframe>
			</div>
			<footer data-role="footer"
				 data-position="fixed">
				<div data-role="navbar">
					<ul data-role="navbar">
						<li><a href="#page1">W3 Schools</a></li>
						<li><a href="#page1">W3 Schools</a></li>
					</ul>
				</div>	 
			</footer>
		</section>
		
	</body>
</html>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="site"/>
		<title>Screentime</title>
		<style>
			header { margin-top:20px; }
			
			footer { 
				margin-top: 20px;
				border-top: 1px solid whiteSmoke; 
			
		</style>
	</head>
	<body>
		<div class="container">
			<header class="hero-unit">
				<h1>Screentime</h1>
				<p>Cycles Web Pages for Simple Dashboards</p>
				<a class="btn btn-primary btn-large" href="/dash">Launch Screentime</a>
			</header>
			<div class="row body">
				<div class="span6">
					<h3>What is Screentime?</h3>
					<p>
					<i>Screentime is a simple application that cycles through (and displays) a list of web pages.</i>
					</p>
					<p>
						Do you have spare television or computer console near your work area and
						want to put it to good use? Screentime cycles through a list of web 
						addresses (URLs). Use it to display the whether, your software build status,
						current stock prices or whatever you want. 
					</p>
					<blockquote>
						<p>I wrote Screentime to fill a need I had to present to several web sites
						such as Jira and Jenkins on a project team television. It also let me 
						play around for the first time with 
						<a href="http://jquerymobile.com">JQuery Mobile</a>, 
						<a href="http://spinejs.com">Spine.js</a> and now 
						<a href="http://twitter.github.com/bootstrap/index.html">Bootstrap</a></p>
						<small>Ben Davies</small>
					</blockquote>
				</div>
				
				<div class="span6">
					<h3>Launch Screentime</h3>
					<br/>
					<div class="alert">
						<strong>Warning!</strong> Supports only Webkit Browsers such as 
							<a href="http://www.google.com/chrome">Chrome</a> and 
							<a href="http://www.apple.com/safari">Safari</a>.
					</div>
					<p>Other important things to know about Screentime:</p>
					<ul>
						<li>It is in development and has a range of issues and limitations.</li>
						<li>Your pages are rendered in IFrames within your browser, so you can access
						an intranet and other private resources</li>
						<li>Your URLs and settings are not persistent and will eventually disappear 
						forever</li>
						<li>You can download and customise this code from the 
						<a href="https://github.com/bendavieshe3/grails-screentime">Screentime GitHub project</a></li>
						
					</ul>
					<a class="btn btn-primary" href="/dash">Launch Screentime</a>
				</div>				
			</div>
			<footer class="row">
				<div class="span12">
					<p><small>Brought to you by <a href="https://plus.google.com/u/0/116070896518800324770">Ben Davies</a> 
					| <a href="http://www.learningtechnicalstuff.com">(blog)</a></small></p>
				</div>
			</footer>			
		</div>
	</body>
</html>

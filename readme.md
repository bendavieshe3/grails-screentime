Screentime
==========

Screentime is Grails application that displays a set of configured external web pages.

Usage
-----
Screentime is set to use the root context when deployed within Grails. Launch the application
by navigating to the root URL. Eg. http://localhost:8080/. A number of random web pages have been
configured by default.

From the home screen that appears, you can delete or add pages, or click 'play' to start cycling. The
delay between page cyclying can also be adjusted.

To pause the cycling, click on a page.

To return to the home screen where the pages can be configured, click on the title bar heading or
hit escape.

To cycle forward through the pages while paused, click the 'next' button in the top title bar or 
press the right arrow key.

To cycle backward through the pages while paused, click the 'prev' button in the top title bar or
press the left arrow key.

There is not too much more to know. 


General Issues and Limitations
------------------------------
* Screentime has not been tested extensively on many browsers.
* The application is not currently secured in any way
* The pages don't currently refresh

Under the Hood
--------------

Screentime was developed as a sandbox for trying out a number of technologies and techniques, specifically:
* Grails REST support
* JQuery Mobile
* Spine.js

The external webpages are displayed using IFRAMEs. What this means is that the client connects to
the webpages, not the server. This has a couple of implications: 
* Screentime can be hosted on the internet but used to display pages from an intranet
* Pages with frame-busting javascript will take the application over


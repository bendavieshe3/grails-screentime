modules = {
    application {
        resource url:'js/application.js'
    }
	screentime {
		dependsOn 'jquery,jquery-mobile'
		resource url:'/js/jquery.tmpl.min.js'
		resource url:'/js/assertions.js'
		resource url:'/js/spine/spine.js'
		resource url:'/js/spine/ajax.js'
		resource url:'/js/screentime.js'
e	}
}
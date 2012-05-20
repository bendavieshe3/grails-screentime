jslint.options = "white,undef"
jslint.directory = "web-app/js"
jslint.includes = "**/*.js"
jslint.excludes = "**/*.min.js, **/i18n/**/*.js, **/prototype/*.js,**/*-min.js,**/*.pack.js,**/spine.js"
jslint.haltOnFailure = true
jslint.reports = {

	TxtReport('plain') {                    
		destfile = 'target/test-reports/plain/jslint.txt'  
	}
	JunitReport('junit') {
		destfile = 'target/test-reports/jslint'
	}
	
	HtmlReport('report') {                  
		destfile = 'target/test-reports/html/jslint.html'
	}
}
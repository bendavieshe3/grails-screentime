package screentime

class Page {

	String pageName
	String pageUrl
	int pageOrder = 1
	
    static constraints = {
		pageName size:1..50, blank:false
		pageUrl url:true, size:1..255, blank:false
		pageOrder min:1
    }
}

package screentime

class Page {

	String pageName
	String pageUrl
	int pageOrder = 1
	
    static constraints = {
		pageName size:1..50
		pageUrl url:true, size:1..255
		pageOrder min:1
    }
}

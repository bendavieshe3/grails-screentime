package screentime

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(PageController)
@Mock([Page])
class PageControllerTests {

    void testList() {

		controller.list()
		assert 1 == response.json.size()
		assert "Google" == response.json[0].pageName
		assert 1 == response.json[0].id
	}
	
	void testShow() {
		controller.show(1)
	}
	
	void testUpdate() {
		params.pageName = "Google Search"
		params.pageUrl = "http://www.google.com/search"
		
		controller.update(1)
	}
	
	void testDelete() {
		controller.delete(1)
	}
	
	void testSave() {
		params.id = "EEAF4B17-5F1D-4C06-B535-D9B58D84142F"
		params.pageName = "Google Search"
		params.pageUrl = "http://www.google.com/search"
		
		controller.save()
		
	}
	
	@Before
	void addSamplePages() {
		def p = new Page(pageName:"Google",pageUrl:"http://www.google.com")
		assert p.save()
	}
	
}
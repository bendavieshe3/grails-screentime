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
		params.id = 1
		controller.show()
	}
	
	void testUpdate() {
		params.id = 1
		params.pageName = "Google Search"
		params.pageUrl = "http://www.google.com/search"
		
		controller.update()
	}
	
	void testDelete() {
		params.id = 1
		controller.delete()
	}
	
	void testSave() {
		
		params.id = "EEAF4B17-5F1D-4C06-B535-D9B58D84142F"
		params.pageName = "Google Search"
		params.pageUrl = "http://www.google.com/search"
		
		controller.save()

		assertEquals(201, controller.response.status)
		assert(response.json)
		assertEquals('Google Search', response.json.pageName)
		assertEquals(2, response.json.id)
		
	}
	
	void testSaveWithJson() {
		
		def jsonPost = '{"id":"c-4","pageName":"spine","pageUrl":"http://spinejs.com/docs/forms"}'
		
		request.contentType = 'application/json'
		request.content = jsonPost
		
		controller.save()
		
		assertEquals(201, controller.response.status)
		assert(response.json)
		assertEquals('spine', response.json.pageName)
		assertEquals(2, response.json.id)
		
	}
	
	void testSaveValidationFail() {
		params.id = "EEAF4B17-5F1D-4C06-B535-D9B58D84142F"
		params.pageName = "Google Search"
		params.pageUrl = ''
		
		controller.save()

		assertEquals(400, controller.response.status)
		assert(response.json.errors)
		assertEquals('pageUrl', response.json.errors[0].field)
		
	}
	
	@Before
	void addSamplePages() {
		def p = new Page(pageName:"Google",pageUrl:"http://www.google.com")
		assert p.save()
	}
}
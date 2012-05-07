package screentime



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(PagesController)
@Mock(Page)
class PagesControllerTests {

    void testGet() {
       controller.get()
	   assert 1 == response.json.size()
	   assert "Google" == response.json[0].pageName
    }
	
	@Before
	void addSamplePages() {
		def p = new Page(pageName:"Google",pageUrl:"http://www.google.com")
		assert p.save()
	}
	
}
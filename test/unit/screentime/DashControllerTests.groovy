package screentime



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(DashController)
class DashControllerTests {

    void testIndex() {
		controller.index()
		
		assert view == "/dash/index"
		   
	}
	
}

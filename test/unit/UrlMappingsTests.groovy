import grails.test.mixin.*
import org.junit.*

import screentime.PageController

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */

@TestFor(UrlMappings)
@Mock([PageController, UrlMappings])
class UrlMappingsTests {

	void testPagesCollectionGet() {
		
		assertForwardUrlMapping("/pages", controller:'page',action:'list')		
    }
	
	void testPageGet() {
		webRequest.currentRequest.setMethod("GET")
		assertForwardUrlMapping("/pages/1", controller:'page',action:'show')
		
		PageController myController = mapURI('/pages/1')
		assert myController != null
	}
	
	void testPageDelete() {
		webRequest.currentRequest.setMethod("DELETE")
		assertForwardUrlMapping("/pages/1", controller:'page',action:'delete')
	}
	
}

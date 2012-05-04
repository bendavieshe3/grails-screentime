package screentime



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Page)
class PageTests {

	void testValidPageConstraints()
	{
		def validPage = new Page(pageName:"google", pageUrl:"http://www.google.com")
		
		mockForConstraintsTests(Page, [validPage])
		
		assert validPage.validate()
	}
	
    void testPageNameConstraints()
	{
		def validPage = new Page(pageName:"google", pageUrl:"http://www.google.com")
		def noPageNamePage = new Page(pageUrl:"http://www.google.com")
		
		mockForConstraintsTests(Page, [validPage, noPageNamePage])
		
		assert validPage.validate()
		assert !noPageNamePage.validate()
		
	}
	
	void testPageUrlConstraints()
	{
		def validPage = new Page(pageName:"google", pageUrl:"http://www.google.com")
		def noPageUrlPage = new Page(pageName:"yahoo")
		
		mockForConstraintsTests(Page, [validPage,noPageUrlPage])
		
		assert validPage.validate()
	
		assert !noPageUrlPage.validate()
	}
	
	void testPageOrderConstraints()
	{
		def validPageOrderPage = new Page(pageName:"google"
			, pageUrl:"http://www.google.com"
			, pageOrder:1)
		
		def negativePageOrderPage = new Page(pageName:"google"
			, pageUrl:"http://google.com.au", pageOrder:-1)
	
		def noPageOrderSpecifiedPage = new Page(pageName:"google",
			pageUrl:"http://www.google.com")
			
		mockForConstraintsTests(Page, [validPageOrderPage, noPageOrderSpecifiedPage,
			negativePageOrderPage])
		
		assert validPageOrderPage.validate()
		assert !negativePageOrderPage.validate()
		
		assert noPageOrderSpecifiedPage.pageOrder == 1
	}
}

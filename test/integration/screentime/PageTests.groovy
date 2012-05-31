package screentime

import static org.junit.Assert.*
import org.junit.*

class PageTests {

    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testValidationFail() {
        def p = new Page(pageName:'a page')
		
		assert !p.save()
    }
}

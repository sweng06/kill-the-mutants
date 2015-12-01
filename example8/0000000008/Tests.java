package example3;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class Tests {

	private Snippet h;

	@Before
	public void setUp() throws Exception {
		h = new Snippet();
	}

	@Test
	public void testFirstCase() {
		assertEquals(h.printWord("mutation", 0, 1), "mutation");
	}

	@Test
	public void testSecondCase() {
		assertEquals(h.printWord("mutation", 1, 0), "m");
	}

}

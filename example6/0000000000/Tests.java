package example6;

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
	public void testAdd() {
		assertEquals(h.addNums(1, 2), 3);
	}
	
	@Test
	public void testSubstract() {
		assertEquals(h.subtractNums(5, 4), 1);
		assertEquals(h.subtractNums(4, 5), 1);
	}
	
	@Test
	public void testMultiply() {
		assertEquals(h.multiplyNums(4, 5), 20);
	}

}

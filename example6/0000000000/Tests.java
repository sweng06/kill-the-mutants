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
		assertEquals(h.crazyAdd(1, 2), 17);
	}
	
	@Test
	public void testSubstract() {
		assertEquals(h.crazySubtract(5, 4), 1);
		assertEquals(h.crazySubtract(4, 5), 11);
		assertEquals(h.crazySubtract(4, 4), 10);
	}
	
	@Test
	public void testMultiply() {
		assertEquals(h.crazyMultiply(4, 5), 40);
	}

}

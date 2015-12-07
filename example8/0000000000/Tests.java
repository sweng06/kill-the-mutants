package example8;

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
	public void test() {
<<<<<<< HEAD
		assertEquals(h.printWord(0, 1), "mutation");
		assertEquals(h.printWord(1, 0), "testing");
		assertEquals(h.printWord(1, 1), "kill-the-mutants");
=======
		assertEquals(h.printWord(0, 1), "Mutation Testing");
		assertEquals(h.printWord(1, 0), "M");
		//assertEquals(h.printWord(1, 1), "M");
>>>>>>> origin/master
	}

}

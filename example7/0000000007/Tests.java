package example7;

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
	public void testArrayIncre() {
		int[] array = { 1, 2, 3, 4 };
		int[] actualResult = h.arrayIncre(4);
		assertArrayEquals(actualResult, array);
	}

}

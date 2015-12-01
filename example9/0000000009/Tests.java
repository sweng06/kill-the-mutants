package example4;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

public class Tests {

	private Snippet h;

	@Before
	public void setUp() throws Exception {
		h = new Snippet();
	}

	@Test
	public void testModArray() {
		ArrayList<Integer> arrayList = new ArrayList<Integer>();
		arrayList.add(2);
		arrayList.add(4);
		arrayList.add(6);
		arrayList.add(8);
		arrayList.add(10);
		assertEquals(h.modArray(), arrayList);
	}

}

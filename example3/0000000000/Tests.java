package example3;

/*
 * Special thanks to
 * http://users.csc.calpoly.edu/~djanzen/tdl/tddintro/helloworld/
 * for getting us started.
 */

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


public class Tests
{

	private Snippet h;

	@Before
	public void setUp() throws Exception
	{
		h = new Snippet();
	}

	@Test
	public void test() {
		int[] array = {2,4,5,3,1,7,4,9,10};
		int[] answer = {1,2,3,4,4,5,7,9,10};
		int[] sortedArray = h.doInsertionSort(array);
		assertArrayEquals(sortedArray,answer);
	}

}

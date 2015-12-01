package example2;

public class Snippet {

	// if num = 0, return null
	// inserts numbers chronologically into array from 0, increase each number
	// value by 1
	public int[] arrayIncre(int num) {

		if (num <= 0) {
			return null;
		}

		int[] array = new int[num];
		for (int i = 0; i < array.length; i++) {
			int tmp = i;
			array[i] = tmp + 1;
		}
		return array;
	}
}

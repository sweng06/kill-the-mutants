package example9;

import java.util.ArrayList;

public class Snippet {

	public ArrayList<Integer> modArray() {
		int[] array = new int[20];
		ArrayList<Integer> newArray = new ArrayList<Integer>();

		for (int i = 0; i < array.length; i++) {
			array[i] = i;
			if (array[i] < 10) {
				newArray.add(array[i]);
			}
		}
		return newArray;
	}
}

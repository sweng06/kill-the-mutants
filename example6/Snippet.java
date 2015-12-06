package example6;

public class Snippet {

	// simple addition of 2 ints
	public int addNums(int one, int two) {
		int added = one + two;
		return added;
	}
	
	public int subtractNums(int one, int two) {
		if(one < two)
			int subtracted = two - one;
		else
			int subtracted = one - two;
		return subtracted;
	}
	
	public multiplyNums(int one, int two) {
		int multiplied = one * two;
		return multiplied;
	}
}

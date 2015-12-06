package example6;

public class Snippet {

	// simple addition of 2 ints
	public int addNums(int one, int two) {
		int added = one + two;
		return added;
	}
	
	public int subtractNums(int one, int two) {
		int subtracted = 0;
		if(one < two)
			subtracted = two - one;
		else
			subtracted = one - two;
		return subtracted;
	}
	
	public int multiplyNums(int one, int two) {
		int multiplied = one * two;
		return multiplied;
	}
}

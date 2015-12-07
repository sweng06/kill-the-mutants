package example6;

public class Snippet {

	public int crazyAdd(int one, int two) {
		return (one + two + 14);
	}
	
	public int crazySubtract(int one, int two) {
		if(one > two)
			return (one - two);
		else
			return (two - one + 10);
	}
	
	public int crazyMultiply(int one, int two) {
		return (one * two * 2);
	}
}

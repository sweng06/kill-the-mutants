package example8;

public class Snippet {
	
	public String printWord(int x, int y) {
		if (x < y)
			return "mutation";
		if (x > y)
			return "testing";
		
		return "kill-the-mutants";
	}
}
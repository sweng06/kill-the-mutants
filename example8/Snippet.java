package example8;

public class Snippet {
	// Prints out a word if x<y, else, print out one char of word
	public String printWord(int x, int y) {

		String word = "Mutation Testing";
		String trueWord;

		if (x < y) {
			trueWord = word;
		} else {
			char wordChar = word.charAt(0);
			trueWord = String.valueOf(wordChar);
		}
		return trueWord;
	}
}
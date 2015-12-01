package example3;

public class Snippet {
	// Prints out a word if x<y, else, print out substring of word
	public String printWord(String word, int x, int y) {
		if (word.length() <= 1) {
			return null;
		}
		String trueWord = null;

		if (x < y) {
			trueWord = word;
		} else {
			char wordChar = word.charAt(0);
			trueWord = String.valueOf(wordChar);
		}
		return trueWord;
	}
}

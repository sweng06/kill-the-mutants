package examples.example1;

public class Snippet {
	
	private String name = "";

	public String getName() {
		return name;
	}

	public String getMessage() {
		if (name == "")
			return "Hello!";
		
		return "Hello " + name + "!";
	}

	public void setName(String name) {
		this.name = name;
	}
}
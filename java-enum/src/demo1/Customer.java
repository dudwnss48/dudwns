package demo1;

public class Customer {

	private String name;
	private int Grade;		// VIP, Gold, Silver, Bronze
	
	public Customer() {}

	public Customer(String name, int grade) {
		super();
		this.name = name;
		Grade = grade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGrade() {
		return Grade;
	}

	public void setGrade(int grade) {
		Grade = grade;
	}
	
}

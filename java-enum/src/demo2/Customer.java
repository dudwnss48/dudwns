package demo2;

public class Customer {
	
	private String name;
	private Grade grade;		// grade변수의 타입은 enum타입이다.
	
	public Customer() {}

	public Customer(String name, Grade grade) {
		super();
		this.name = name;
		this.grade = grade;
	}
	
	public Customer(String name, String gradeName) {
		this.name = name;
		
//		this.grade= Enum.valueOf(Grade.class, gradeName);
		this.grade= grade.valueOf(gradeName);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

}

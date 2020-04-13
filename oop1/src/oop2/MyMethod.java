package oop2;

public class MyMethod {
	
	// 인스턴스 변수
	String name;
	
	// 클래스 변수
	static final double PI = 3.14;
	
	// 인스턴스 메소드
	// 인스턴스 변수, 클래스 변수 모두 사용가능
	
	void memberMathod() {
		System.out.println("인스턴스변수 사용: " + name);
		System.out.println("클래스변수 사용: " + MyMethod.PI);
	} 
	
	// 인스턴스 메소드
	// 인스턴스 메소드, 클래스 메소드 모두 사용가능
	void memberMethod2() {
		memberMathod();
		MyMethod.staticMethod();
	}
	
	//클래스 메소드,정적메소드
	// 인스턴스 변수 사용불가, 클래스변수 사용 가능
	static void staticMethod() {
	//	System.out.println("인스턴스변수 사용: " + name);		//오류
		System.out.println("클래스변수 사용: " + MyMethod.PI);
	}
	
	static void staticMethod2() {
	//	memberMethod();		//오류
		MyMethod.staticMethod();
		
	}
	
		
}

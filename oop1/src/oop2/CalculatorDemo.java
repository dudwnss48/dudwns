package oop2;

public class CalculatorDemo {
	
	public static void main(String[] args) {
		Calculator calculator = new Calculator();
		
		// int result1 = calculator.plus(6,8);
		// double result2 = calculator.plus(6.9,8.1);
		// long result3 = calculator.plus(6000000L, 8000000L );
		int a = calculator.plus(6,8,7);
		
		System.out.println(a);
	
	}

}

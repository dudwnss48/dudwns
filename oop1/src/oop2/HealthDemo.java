package oop2;

public class HealthDemo {
	
	public static void main(String[] args) {
		
		Health h = new Health();
		
		double result1 = h.bmi(70, 1.76);
		System.out.println("bmi지수: " + result1);
		
		System.out.println();
		
		String result2 = h.bmiText(63, 1.6);
		System.out.println(result2);
	
		
	
	}
}

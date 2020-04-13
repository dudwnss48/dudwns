package oop2;

/**
 * 여러가지 구구단 출력을 제공하는 클래스다.
 * @author JHTA
 *
 */

public class Gugudan {
	
	/**
	 * 2단 ~ 9단까지 출력한다. 
	 * @param begin
	 * @param end
	 */
	void print99dan() {
		print99danByRnage(2, 9);
				System.out.print("\t");	
			}
		
	
	/**
	 * 지정된 단에 해당하는 구구단을 출력한다.
	 * @param dan 출력할 단의 숫자
	 */
	void print99danByNumber(int dan) {	
		print99danByRnage(dan,dan);
		}	
	
	
	/**
	 * 지정된 시작번호부터 끝번호까지의 구구단을 출력한다.
	 * @param begin 출력할 시작 단의 숫자
	 * @param end 출력할 끝 단의 숫자
	 */
	void print99danByRnage (int begin, int end) {
		System.out.println("----------------- 구구단(" + begin + " ~ " + end + ") 출력 ----------------");
		for (int i=1; i<=9; i++) {
			for(int j = begin; j<=end; j++ ) {
				System.out.print(j + " x " + i + " = " + (i*j) + "\t");
			}
			System.out.println();
			
		}
	}
}

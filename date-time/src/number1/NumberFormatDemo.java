package number1;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class NumberFormatDemo {
	
	public static void main(String[] args) {
		
		double number = 1234567.89;
		
		// DecimalFormet
		// 숫자를 지정된 형식의 텍스트로 변환한다.
		
		DecimalFormat df = new DecimalFormat("0000000.000######");
		String text = df.format(number);
		System.out.println(text);
		/*
		 * "0"					1234568
		 * "#"					1234568
		 * "000000000"	001234568
		 * "#######"		1234568
		 * "0.0"				1234567.9
		 * "#.#"				1234567.9
		 * "0.000"			1234567.890		반올림 4째자리에서함
		 * "#.###"			1234567.89			반올림 어디서한지모름
		 * "#,###"			1,234,568
		 * "0,000"			1,234,568
		 * "0,000.000		1,234,567.890
		 * "#,###.###	1,234,567.89
		 */
		
		
	}

}

/*
 * 기호			의미					설명
 * --------------------------------------------------------------------------------
 * 0				숫자					해당위치에 숫자 없어도 0을 표시한다.
 * #				숫자					해당위치에 숫자가 없으면 표시하지 않는다.
 * .				소숫점					
 * ,				단위구분자
 * 
 */
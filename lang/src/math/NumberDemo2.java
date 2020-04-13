package math;

import java.math.BigDecimal;
import java.math.BigInteger;

public class NumberDemo2 {
	
	public static void main(String[] args) {
		
		// BigIntger : long으로 다를 수 없는 정수
		// BigDecimal : double으로 다를 수 없는 실수
		
		
//		long number1 = 123124124213123124123123451234123412125L;
//		long number2 = 123124123123124L;
		
		// 정수가 long 의 범위를 벗어날 때는 BigInteger사용
		BigInteger big1 = new BigInteger("123124124213123124123123451234123412125");
		BigInteger big2 = new BigInteger("123124123123124");
		
		BigInteger result1= big1.add(big2);
		System.out.println("덧셈결과: " + result1.toString());
		
		BigInteger result2 = big1.subtract(big2);
		System.out.println("뺄셈결과: " + result2.toString());
		
		BigInteger result3= big1.multiply(big2);
		System.out.println("곱셈결과: " + result3.toString());
		
		BigInteger result4 = big1.divide(big2);
		System.out.println("나눗셈결과: " + result4.toString());
		
		
		
		
		
		
	}
}

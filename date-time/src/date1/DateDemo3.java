package date1;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDemo3 {
	
	public static void main(String[] args) {
		/*
		 * Date를 지정된 형식의 문자열로 변환하기
		 */
		
		Date today = new Date();
		
		SimpleDateFormat df = new SimpleDateFormat("a");
		String formeteDateText = df.format(today);
		
		System.out.println(formeteDateText);
		
	}

}
/*
 * 패턴								출력내용
 * -------------------------------------------------------------------------------
 * yyyy				년				2020
 * MM				월				04						1월부터 9월까지 01, 02, 03, ... , 09 텍스트로 표현
 * M					월				4						
 * dd					일				06
 * d					일				6
 * yyyy-MM-dd					2020-04-06
 * yyyy.M.d						2020.4.6
 * yyyy년M월d일					2020년4월6일
 * EEEE				요일			월요일
 * a					오전/오후		오전
 * HH					0~23시
 * H					
 * hh					1~12시			
 * h					
 * mm				0~59분
 * m					
 * dd					0~59초
 * d					
 */




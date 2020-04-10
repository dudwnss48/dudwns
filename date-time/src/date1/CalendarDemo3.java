package date1;

import java.util.Calendar;
import java.util.Date;

public class CalendarDemo3 {
	
	public static void main(String[] args) {
		
		// Date ----> Calendat
		Date date1 = new Date();
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);
		
		
		// Calendar ----> Date
		Calendar cal2 = Calendar.getInstance();
		Date date2 = new Date(cal2.getTimeInMillis());
		
		
		/*
		 * Date 
		 * 주요생성자
		 * 				new Date()							// 현재 날짜와 시간정보를 포함하는 객체생성
		 * 				new Date(long time) 			// 전달받은 유닉스 타입에 해당하는 날짜/시간정보를 포함하는 객체 생성
		 * 주요 메소드 
		 * 				long getTime()						// 유닉스타임을 반환
		 * 				boolean before(Date when)	//when으로 전달받은 날짜보다 이전날짜이면 true반환
		 * 				boolean after(Date when)		//when으로 전달받은 날짜보다 이전날짜이면 true반환
		 * 
		 * 
		 * SimpleDateFormat
		 * 				날짜를 지정된 형식의 텍스트로 변환
		 *				String parse(String text)
		 * 
		 * 				초(0~59)
		 *				밀리초(0~999)
		 * 
		 * DecimalFormet
		 * 				숫자를 지정된 형식의 텍스트로 변환한다.
		 * 				String format(double number)
		 * 				String format(long number)
		 * 
		 * 				지정된 형식의 텍스트를 숫자로 변환
		 * 				Number format(String text)
		 * 
		 * 				주요기호
		 * 				-----------------------
		 * 				0 숫자
		 * 				# 숫자
		 * 				. 소숫점
		 * 				, 자리수 구분
		 * 
		 * 
		 * String 과 Integer, long, Double
		 * 				정수나 실수를 문자열로 변환하기
		 * 				String.value(int number)
		 * 				String.value(long number)
		 * 				String.value(double)
		 * 
		 * 				텍스트를 숫자로 변환하기(* 텍스트에 숫자 아닌 내용이 포함되어 있으면 오류가 발생)
		 * 				int Integer.parseInt(String text)
		 * 				long long.parselong(String text)
		 * 				int double.parseDouble(String text)
		 * 
		 * 
		 * 
		 */
		
		
		
	}

}

package date1;

import java.io.ObjectInputStream.GetField;
import java.util.Calendar;

public class CalendarDemo2 {
	
	public static void main(String[] args) {
		// 특정 날짜의 캘린더 객체 만들기
		Calendar date1 = Calendar.getInstance();
		// 2019년 4월 11일
		date1.set(2019,4,11);
		
		// 3일전 날짜 구하기
		Calendar date2 = Calendar.getInstance();
		date2.add(Calendar.DATE, -3);
		System.out.println("오늘기준3일전 " + toString(date2));
		
		// 7일전 날짜 구하기
		Calendar date3 = Calendar.getInstance();
		date3.add(Calendar.DATE,-7);
		System.out.println("오늘기준7일전" + toString(date3));
		
		Calendar date4 = Calendar.getInstance();
		date4.add(Calendar.MONTH,-3);
		System.out.println("오늘기준7일전" + toString(date4));
	}
	
	
	private static String toString(Calendar date) {
		return date.get(Calendar.YEAR) + "년 "
					+ (date.get(Calendar.MONTH)+1) + "월 "
					+ (date.get(Calendar.DAY_OF_MONTH)+ "일 ");
		
		
	}
	
}

package utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtils {
	
	private static final DecimalFormat NUMBER_FORMATER = new DecimalFormat("#,###");
	private static final SimpleDateFormat NORMAL_DATE_FORMATER = new SimpleDateFormat("yyyy-MM-dd");
	private static final SimpleDateFormat DETAILL_DATE_FORMATER = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public static String numberToString (long number) {
		return NUMBER_FORMATER.format(number);
	}
	
	public static String simpleDateString(Date date) {
		if (date==null) {
			return "";
		}
		return NORMAL_DATE_FORMATER.format(date);
	}
	
	public static String detailDateString(Date date) {
		if (date==null) {
			return "";
		}
		return DETAILL_DATE_FORMATER.format(date);
	}
	
	
}

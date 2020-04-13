package oop2;

import java.text.DecimalFormat;

public class MyUtills {
	
	public static String numberWithcomma(long number) {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(number);
				
	
		
	}

}

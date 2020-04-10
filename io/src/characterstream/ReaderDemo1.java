package characterstream;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class ReaderDemo1 {
	
	public static void main(String[] args) throws IOException{
		FileReader fr = new FileReader("c:/files/data.txt");
		BufferedReader br = new BufferedReader(fr);
	
		int totalOrderPrice = 0;
		String text = null;
		while ((text=br.readLine()) !=null) {
			if (!text.isEmpty()) {
				String[] items = text.split(",");
				int price = Integer.parseInt(items[4]);		// "28000" --> 28000
				totalOrderPrice += price;
			}
		}
		System.out.println("총 구매금액: " + totalOrderPrice);
//		String text1 = br.readLine();
//		String text2 = br.readLine();
//		String text3 = br.readLine();
//		String text4 = br.readLine();
//		String text5 = br.readLine();
//		String text6 = br.readLine();
//		
//		System.out.println(text1);
//		System.out.println(text2);
//		System.out.println(text3);
//		System.out.println(text4);
//		System.out.println(text5);
//		System.out.println(text6);
		
		br.close();
		
		
		
		
		
		
		
		
		
		
	}

}

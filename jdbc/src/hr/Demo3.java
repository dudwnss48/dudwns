package hr;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class Demo3 {

	private static BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

	private static String nextString() throws Exception {
		return reader.readLine();
	}
//	private static  int nextInt() throws Exception {
//		return Integer.parseInt(reader.readLine());
//	}

	public static void main(String[] args) throws Exception {

		System.out.println("[도서 검색하기]");

		System.out.print("제목을 입력하세요: ");
		String keyword = nextString();
		
		// jdbc driver 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		// Connection 객체 획득
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "zxcv1234";
		Connection connection = DriverManager.getConnection(url, user, password);
		
		String sql = "select * "
				+ "from sample_books "
				+ "where book_title like '%' || ? || '%'  "
				+ "order by book_no desc ";
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, keyword);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int no = rs.getInt("book_no");
			String title = rs.getString("book_title");
			String writer = rs.getString("book_writer");
			String genre = rs.getString("book_genre");
			String publisher = rs.getString("book_publisher");
			int price = rs.getInt("book_price");
			int discountedPrice = rs.getInt("book_discount_price");
			Date registeredDate = rs.getDate("book_registered_date");
			
			System.out.println("도서 번호 : " + no + ", 도서제목 : "+  title + ", 저자 : "+ writer + ", 장르 : " + genre + ", 출판사 : " + publisher + ", 도서가격 : " + price + ", 할인된가격 : " + discountedPrice + ", 날짜 : " + registeredDate);
			
			
			
		}
		
		rs.close();
		pstmt.cancel();
		connection.close();
		
//		System.out.print("저자를 입력하세요: ");
//		String writer = nextString();
//		System.out.print("장르를 입력하세요: ");
//		String genre = nextString();
//		System.out.print("출판사를 입력하세요: ");
//		String publisher = nextString();
//		System.out.print("가격을 입력하세요: ");
//		int price = nextInt();
//		System.out.print("할인가격을 입력하세요: ");
//		int discountedPrice = nextInt();

		
		
		
		
		
		
	}
}
package hr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Demo1 {

	public static void main(String[] args) throws Exception{
		// 1. JDBC 드라이버를 JVM의 드라이버 레지스트리에 등록하기
		Class.forName("oracle.jdbc.OracleDriver");

		// 2. 데이터베이스와 연결을 담당하는 Connection객체 획득하기
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "zxcv1234";
		Connection connection = DriverManager.getConnection(url, user, password);

		// 3. SQL 실행, 결과값반환을 담당하는 PreparedStatement객체 획득하기


		String sql = "select gra, lowest_sal, highest_sal from job_grades  where gra in (? , ? , ?)";


		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, "A");
		pstmt.setString(2, "B");
		pstmt.setString(3, "C");


		// 4. SQL 실행하고, 조회결과 획득하기
		ResultSet rs = pstmt.executeQuery();

		// 5. 조회결과 가져오기
		while (rs.next()) {
			String 등급 = rs.getString("gra");
			int 최소급여 = rs.getInt("lowest_sal");
			int 최대급여 = rs.getInt("highest_sal");


			System.out.println(등급 + " " + 최소급여 + " " + 최대급여);



		}

		// 6. 데이터베이스와 연결된 모든 자원 해제하기, 획득한 순서의 역순으로 해제
		rs.close();
		pstmt.close();
		connection.close();



	}
}

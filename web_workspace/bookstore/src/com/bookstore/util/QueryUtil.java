package com.bookstore.util;

import java.util.Properties;

public class QueryUtil {

	//query.properties에 정의된 내용을 key,value의 쌍으로 보관하는 객체
	private static Properties prop = new Properties();
	static {
		try {
			prop.load(Class.forName("com.bookstore.util.QueryUtil").getResourceAsStream("query.properties"));
		
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 지정된 이름의 쿼리문을 반환
	 * @param name query.properties에 정의된 sql 이름
	 * @return sql 구문, 유효한 이름이 아닌 경우 null 이 반환됨
	 */
	
	public static String getSQL(String name) {
		return prop.getProperty(name);
	}
	
}

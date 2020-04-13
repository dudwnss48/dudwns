package demo1.annotation;

import java.lang.reflect.Field;

public class NotNullAnnotationProcessor {

	public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException {
		User user = new User();
		user.setName("홍길동");
		
		Class clz = user.getClass();
		
		Field[]  fields = clz.getDeclaredFields();
		for (Field field : fields) {
			// 필드명 조회하기
			String fieldName = field.getName();
			// 해당 필드에 저장된
			boolean isNotNullField = field.isAnnotationPresent(NotNull.class);
			if (isNotNullField) {
				String value = (String) field.get(user);
				// System.out.println("필드명: " + fieldName + ", " + value);
				if (value == null) {
					NotNull annotation = field.getAnnotation(NotNull.class);
					String message = annotation.message();
					System.out.println("에러 메세지: " + message);
				}
			}
		}
	}
}

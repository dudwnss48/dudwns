package demo1.annotation;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

// 마크업 이노테이션
// 이노테이션 요소가 정의되어 있지 않는 이노테이션 (= 마킹이노테이션)
@Retention(RUNTIME)
@Target(METHOD)

public @interface Test {
	// 이노테이션 요소정의하는곳 

}

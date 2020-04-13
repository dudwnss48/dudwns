package demo1.person;

import java.util.ArrayList;

public class PersonDemo {

	// 학생, 대학생, 대학원생이 파라미터 타입으로 지정된 Course 객체만 전달받는다.
	public static void addStudentCourse(Course<? extends Student> c) {}
	
	// 직장인, 일반사람이 파라미터 타입으로 지정된 Course 객체만 전달받는다.
	public static void addWorkAndPersonCourse(Course<? super Worker> c) {}
	
	public static void main(String[] args) {
		
		Course<Student> c1 = new Course<Student>("전공과정");
		Course<PostGraduateStudent> c2 = new Course<PostGraduateStudent>("석사과정");
		Course<Worker> c3 = new Course<Worker>("직장인과정");
		Course<Person> c4 = new Course<Person>("일반인과정");
		
		addStudentCourse(c1);
		addStudentCourse(c2);
//		addStudentCourse(c3);		// c3는 파라미터 타입이 Worker로 지정되어 있어서 전달불가
//		addStudentCourse(c4);		// c4는 파라미터 타입이 Person으로 지정되어 있어서 전달불가
		
//		addWorkAndPersonCourse(c1);		// c1은 파라미터 타입이 Student로 지정되어 있어서 전달불가
//		addWorkAndPersonCourse(c2);		// c2는 파라미터 타입이 PostGraduateStudent로 지정되어 있어서 전달불가
		addWorkAndPersonCourse(c3);
		addWorkAndPersonCourse(c4);
		/*
		 * 와일드카드 제네릭 타입제한
		 * 			<? extends T>		상위제한		T와 T의 자손들
		 * 			<? super T>		하위제한		T와 T의 조상들
		 * 			<?>					제한없음		<? extends Object>와 동일
		 * 		* 단, 와일드카드를 사용해서 타입제한을 하기 위해서는 해당 클래스가 	
		 * 			제네릭타입 클래스여야 한다.
		 */
		
		// <? extends Student>는 Student와 Student의 자손으로 타입을 제한한다.
		ArrayList<? extends Student> list1 = new ArrayList<Student>();
//		list1.add(new Person());
//		list1.add(new Student());
//		list1.add(new CollegeStudent());
//		list1.add(new PostGraduateStudent());
//		
		
		// <? super Worker> 은 worker과 worker의 부모들로 타입을 제한한다.
		ArrayList<? super Worker> list2 = new ArrayList<Person>();
	}
}

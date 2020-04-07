package com.sample.school;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import com.sample.school.service.SchoolService;
import com.sample.school.service.SchoolServiceImple;
import com.sample.school.vo.Course;
import com.sample.school.vo.Professor;
import com.sample.school.vo.Student;
import com.sample.school.vo.Subject;

public class SchoolApp {
	static BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

	private static int nextInt() {
		try {
			String text = in.readLine();
			return Integer.parseInt(text);
		} catch (IOException e) {
			return 0;
		}
	}

	private static String next() {
		try {
			return in.readLine();
		} catch (IOException e) {
			return "";
		}
	}

	public static void main(String[] args) {
		SchoolService service = new SchoolServiceImple();
		Scanner sc = new Scanner(System.in);

		while (true) {

			System.out.println();
			System.out.println();
			System.out.println("##### 수강신청 #####");
			System.out.println("=================================================================================");
			System.out.println("1.학생관리 2.교수관리 0. 종료");
			System.out.println("=================================================================================");
			System.out.print("메뉴 입력 : ");
			int menuNum = SchoolApp.nextInt();

			//학생 페이지
			if(menuNum == 1) {
				System.out.println("##### 학생관리 PAGE #####");
				System.out.println("=================================================================================");
				System.out.println("1.신규등록 2.수강관리 3.과목조회");
				System.out.println("=================================================================================");

				System.out.print("메뉴 입력 : ");
				int StudentMenuNum = SchoolApp.nextInt();
				if(StudentMenuNum == 1) {

					System.out.println();
					System.out.println("[신 규 등 록]");
					System.out.print("이름을 입력하세요 : ");
					String name = SchoolApp.next();
					System.out.print("이메일을 입력하세요 : ");
					String email = SchoolApp.next();
					System.out.print("학과를 입력하세요 : ");
					String dept = SchoolApp.next();
					System.out.print("학년을 입력하세요 : ");
					int grade = SchoolApp.nextInt();
					Student student = new Student(name,email,dept,grade);
					service.addNewStudent(student);

				}else if(StudentMenuNum == 2) {

					System.out.println();
					System.out.println("#####수 강 관 리######");
					System.out.println("=================================================================================");
					System.out.println("1.수강신청 2.수강취소 3.수강조회 4.점수조회");
					System.out.println("=================================================================================");
					System.out.print("메뉴 입력 : ");
					int myMenuNum = SchoolApp.nextInt();
					//수강신청
					if(myMenuNum == 1) {

						System.out.println();
						System.out.println("[ 수 강 신 청 ]");
						System.out.print("학생번호를 입력하세요 : ");
						int studentNo = SchoolApp.nextInt();
						System.out.println("[수강 가능한 강좌]");
						System.out.println("=================================================================================");
						System.out.println("과정번호	과정명         		정원	교수이름	과목명             		학과");
						System.out.println("=================================================================================");
						service.findRegistedSubject(studentNo);

						System.out.print("수강신청한 강좌 번호를 입력하세요 :  ");
						int courseNo = SchoolApp.nextInt();
						service.registSubject(studentNo, courseNo);
						System.out.println("수강신청이 완료되었습니다.");

						//수강취소
					}else if (myMenuNum == 2) {

						System.out.println();
						System.out.println("[수강 신청 취소]");
						System.out.print("학생 번호를 입력하세요  : ");
						int studentNo = SchoolApp.nextInt();
						System.out.print("취소할 강좌 번호를 입력하세요 : ");
						int courseNo = SchoolApp.nextInt();

						service.iscancleSubject(studentNo, courseNo);

						System.out.println("수강 취소가 완료 되었습니다.");

						//수강조회
					}else if (myMenuNum == 3) {

						System.out.println();
						System.out.println("[수 강 조 회]");
						System.out.print("학생 번호를 입력하세요 : ");
						int studentNo = SchoolApp.nextInt();
						System.out.println("=================================================================================");
						System.out.println("학생번호  학생이름  수강과목   	       교수이름   수강과목 번호	수강취소여부");
						System.out.println("=================================================================================");


						service.findRegistedSubject(studentNo);


						//점수조회
					}else if (myMenuNum == 4) {

						System.out.println();
						System.out.println("[점 수 조 회]");
						System.out.print("학생 번호를 입력하세요 : ");
						int studentNo = SchoolApp.nextInt();
						System.out.println("=================================================================================");
						System.out.println("학생번호  학생이름	학년	수강강의명	점수");
						System.out.println("=================================================================================");

						service.findScore(studentNo);
						System.out.println();
					}
					//과목조회
				}else if(StudentMenuNum == 3) {

					System.out.println();
					System.out.println("[과 목 조 회]");
					System.out.print("학생 번호를 입력하세요 : ");
					int studentNo = SchoolApp.nextInt();

					System.out.println("=================================================================================");
					System.out.println("과목번호  과목명		학과	학점");
					System.out.println("=================================================================================");

					service.findSubjectByStudentNo(studentNo);
				}


				//교수페이지	
			}else if(menuNum == 2) {
				System.out.println("##### 교수관리 PAGE #####");
				System.out.println("===================================================================================================");
				System.out.println("1.신규교수 등록 2.신규 과목 등록 3.과목조회 4.신규 개설과정 등록 5.개설 과정조회 6.개설 과정 신청자 조회 7.성적입력 ");
				System.out.println("===================================================================================================");
				System.out.print("메뉴 입력 : ");
				int professorMenuNum = SchoolApp.nextInt();

				//신규교수등록
				if(professorMenuNum == 1) {

					System.out.println();
					System.out.println("[신 규 등 록 (교 수) ]");
					System.out.print("이름을 입력하세요 : ");
					String name = SchoolApp.next();
					System.out.print("이메일을 입력하세요 : ");
					String email = SchoolApp.next();
					System.out.print("학과를 입력하세요 : ");
					String dept = SchoolApp.next();
					System.out.print("직위를 입력하세요 : ");
					String position = SchoolApp.next();
					System.out.print("급여를 입력하세요 : ");
					int salary = SchoolApp.nextInt();

					Professor professor = new Professor(name, email, dept, position, salary);
					service.addNewProfessor(professor);

					//신규과목 등록	
				}else if(professorMenuNum == 2) {
					System.out.println();
					System.out.println("[ 신 규 과 목 등 록 ]");
					System.out.print("등록하실 과목 명을 입력해주세요 : ");
					String title = SchoolApp.next();
					System.out.print("해당 과목의 학과 명을 입력해주세요 : ");
					String dept = SchoolApp.next();
					System.out.print("해당 과목의 학점을 입력해주세요 : ");
					int credit = SchoolApp.nextInt();
					Subject subject = new Subject(title, dept, credit);

					service.addNewSubject(subject);

					//과목조회	
				}else if(professorMenuNum == 3) {

					System.out.println();
					System.out.println("[과 목 조 회]");
					System.out.print("교수번호를 입력해주세요 : ");
					int professorNo = SchoolApp.nextInt();
					System.out.println("=================================================================================");
					System.out.println("과목번호	과목명	학과	학점");
					System.out.println("=================================================================================");
					service.findSubject(professorNo);

					//신규 개설과정 등록	
				}else if(professorMenuNum == 4) {

					System.out.println();
					System.out.println("[개설 과정 등록]");
					System.out.print("과정 명을 입력해주세요 : 	");
					String courseName = SchoolApp.next();
					System.out.print("과목 번호를 입력해주세요 : ");
					int subjectNo = SchoolApp.nextInt();
					System.out.print("교수 번호를 입력해주세요 : ");
					int professorNo = SchoolApp.nextInt();
					System.out.print("신청 정원을 입력해주세요  :  ");
					int quota = SchoolApp.nextInt();
					service.addNewCourse(courseName, subjectNo, professorNo, quota);

					//개설 과정조회	
				}else if(professorMenuNum == 5) {

					System.out.println();
					System.out.println("[개설 과정 조회]");
					System.out.print("교수 번호를 입력해주세요 : ");
					int professorNo = SchoolApp.nextInt();
					System.out.println("=======================================================================================");
					System.out.println("과정번호	과정명			과목번호	과목명	학점");
					System.out.println("=======================================================================================");
					service.findCourse(professorNo);

					//개설 과정 신청자 조회	
				}else if(professorMenuNum == 6) {

					System.out.println();
					System.out.println("[개설 과정 신청자 조회]");
					System.out.print("교수 번호를 입력 해주세요 : ");
					int professorNo = SchoolApp.nextInt();
					System.out.print("과정 번호를 입력 해주세요 : ");
					int courseNo = SchoolApp.nextInt();
					System.out.println("=================================================================================");
					System.out.println("과정명			학생번호	학생이름	학년	학과	학생이메일	취소여부");
					System.out.println("=================================================================================");
					service.findCourseApplicant(professorNo, courseNo);

					//성적입력	
				}else if(professorMenuNum == 7) {

					System.out.println("[성적 입력]");
					System.out.print("교수 번호를 입력해주세요 : ");
					int professorNo = SchoolApp.nextInt();
					System.out.print("개설 강좌 번호를 입력해주세요 : ");
					int registrationNo = SchoolApp.nextInt();
					System.out.println("=================================================================================");
					System.out.println("개설과정번호	학생번호	학생이름	학년	학과	학생이메일	취소여부	현재성적	전체평균	전체학점");
					System.out.println("=================================================================================");				
					System.out.println();
					System.out.print("점수를 입력해주세요 : ");
					int score = SchoolApp.nextInt();
					service.giveScore(professorNo, registrationNo, score);


				}


			}else if(menuNum == 0) {
				System.out.println();
				System.out.println("[프로그램 종료]");
				break;
			}


		}
	}
}
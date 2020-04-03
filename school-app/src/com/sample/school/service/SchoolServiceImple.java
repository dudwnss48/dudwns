package com.sample.school.service;

import com.sample.school.repository.CourseRepository;
import com.sample.school.repository.ProfessorRepository;
import com.sample.school.repository.RegistrationRepository;
import com.sample.school.repository.StudentRepository;
import com.sample.school.repository.SubjectRepository;
import com.sample.school.vo.Course;
import com.sample.school.vo.Professor;
import com.sample.school.vo.Registration;
import com.sample.school.vo.Student;
import com.sample.school.vo.Subject;

public class SchoolServiceImple implements SchoolService {

	private CourseRepository courseRepo = new CourseRepository();
	private ProfessorRepository professorRepo = new ProfessorRepository();
	private RegistrationRepository registrationRepo = new RegistrationRepository();
	private SubjectRepository subjectRepo = new SubjectRepository();
	private StudentRepository studentRepo = new StudentRepository();

	@Override
	public void addNewProfessor(Professor professor) {
		Professor[] professors = professorRepo.getAllProfessor();
		for(Professor pro : professors) {
			if (pro.getEmail().equals(professor.getEmail())) {
				System.out.println("입력하신 이메일로 가입한 회원정보가 있습니다.");
				return;
			}
		}
		professorRepo.insertProfessor(professor);
	}



	@Override
	public void addNewSubject(Subject subject) {
		Subject[] subjects = subjectRepo.getAllSubject();
		for (Subject sub : subjects) {
			if (sub.getTitle().equals(subject.getTitle())) {
				System.out.println("동일한 제목의 과목이 이미 등록되어있습니다.");
				return;
			}
		}
		subjectRepo.insertSubject(subject);
	}

	@Override
	public void addNewStudent(Student student) {
		Student[] students = studentRepo.getAllStudents();
		for(Student stu : students) {
			if (stu.getEmail().equals(student.getEmail())) {
				System.out.println("입력하신 이메일로 가입한 회원정보가 있습니다.");
				return;
			}
		}
		studentRepo.insertStudent(student);
	}
	
	@Override
	public void findSubject(int professorNo) {
		Subject[] subjects = subjectRepo.getAllSubject();
		Professor professor = professorRepo.getProfessorByNo(professorNo);
		for(Subject sub : subjects) {
			if(sub.getDept().equals(professor.getDept())) {
				System.out.println(sub.getTitle());
			}
		}
	}
	@Override
	public void addNewCourse (String courseName, int subjectNo, int professorNo, int quota) {
		Professor professor = professorRepo.getProfessorByNo(professorNo);
		Subject subject = subjectRepo.getSubjectByNo(subjectNo);
		if (!professor.getDept().equals(subject.getDept())) {
			System.out.println("일치하지 않는 정보입니다.");
			return;
		}
		Course course = new Course();
		course.setName(courseName);
		course.setSubjectNo(subjectNo);
		course.setProfessorNo(professorNo);
		course.setQuota(quota);
		courseRepo.insertCourse(course);
		
		System.out.println("신규 개설과정을 등록하였습니다.");
	}
	
	@Override
	public void findCourse(int professorNo) {
		Professor professor = professorRepo.getProfessorByNo(professorNo);
		professor.getDept();
		Course [] courses = courseRepo.getAllCourse();
		for (Course cou : courses) {
			if (cou.getProfessorNo()==professorNo) {
				Course c1= courseRepo.getCourseByNo(cou.getNo());
				Subject subject = subjectRepo.getSubjectByNo(cou.getSubjectNo());
				System.out.println("개설과정번호"+cou.getNo() + "\t\t" + "과정명" +cou.getName() + "\t\t" + "과목명" +subject.getTitle());
				
			}  
		}
		
	}
	public static void main(String[] args) {
		SchoolServiceImple service = new SchoolServiceImple();
		service.findCourse(20001);
	}

	@Override
	public void findSubjectByStudentNo(int studentNo) {
		Subject[] subjects = subjectRepo.getAllSubject();
		Student student = studentRepo.getStudentByNo(studentNo);
		for(Subject sub : subjects) {
			if(sub.getDept().equals(student.getDept())) {
				System.out.println(sub.getTitle());
			}
		}
		
		
	}
	
	
	@Override
	public void findCourseApplicant(int professorNo, int courseNo) {
		Professor p1 = professorRepo.getProfessorByNo(professorNo);
		Course c1 = courseRepo.getCourseByNo(courseNo);
		Subject subject = subjectRepo.getSubjectByNo(c1.getSubjectNo());
		System.out.println("과목번호: " + c1.getName() + "\t과목명: " + subject.getTitle() +  "\t개설과정명: " + c1.getName() + "\t정원: " + c1.getQuota());
		Registration[] r1 = registrationRepo.getAllRegistrationis();
		for (Registration registration : r1) {
			if(registration.getCourseNo() == courseNo || c1.getProfessorNo() == professorNo ) {  
				Student s1 = studentRepo.getStudentByNo(registration.getStudentNo());
				System.out.println("학생이름: " + s1.getName() + "\t학과: " + s1.getDept() +  "\t학년: " + s1.getGrade());
			}
		}
	}
		
	@Override
	public void giveScore(int professorNo, int registrationNo, int score) {
		Registration r1 = registrationRepo.getRegistrationByNo(registrationNo);
		Course c1 = courseRepo.getCourseByNo(r1.getCourseNo());
		if (c1.getProfessorNo()==professorNo) {
			System.out.println("성적: " + r1.getScore());
		}
		 
	}
	
	@Override
	public void registSubject() {
		
		
	}

	@Override
	public void findRegistedSubject() {
		 
		
	}

	@Override
	public void iscancleSubject() {
		 
	}

	@Override
	public void findScore() {
		
	}

}

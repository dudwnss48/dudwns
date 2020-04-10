package collection.recruit.service;

import java.util.ArrayList;

import collection.recruit.repo.RecruitmentRepository;
import collection.recruit.vo.Career;
import collection.recruit.vo.Recruitment;
import collection.recruit.vo.Resume;

public class RecruitmentService {

	private RecruitmentRepository repo = new RecruitmentRepository();

	// 이력서 등록기능
	public void addNewResume(Resume resume) {
		// 구직신청객체 생성
		Recruitment recruitment = new Recruitment();
		// 구직신청객체에 전달받은 이력서 객체 저장
		recruitment.setResume(resume);
		// 레포지토리객체를 사용해서 db에 저장하고, 자신의 구직신청번호를 반환받는다.
		repo.addRecuitment(recruitment);
		// 구직신청번호를 반환한다.
		int rNo = recruitment.getNo();
		System.out.println("구직신청번호: " + rNo);

	}

	// 경력사항 등록기능
	public void addCareer(int recruitmentNo, Career career) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		// 구직신청객체의 경력사항에 전달받은 경력사항객체를 추가한다.
		recruitment.addCareer(career);
		System.out.println("등록이 완료되었습니다.");
	}

	// 구직신청 상태 조회 기능
	public void printRecruitmentDetail(int recruitmentNo) {
		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		Resume resume = recruitment.getResume();
		ArrayList<Career> careers = recruitment.getCareers();
		System.out.println("구직신청번호\t구직자이름\t전화번호\t지원부서\t재직했던 회사명\t근무했던 부서명\t최종직급\t근무기간\t합격여부\t같은부서 신청수\t같은부서를 신청한 지원자들의 평균근로기간");
		for(Recruitment r1 :recruitments) {
			int count = 0;
			ArrayList<Career>careers1 = r1.getCareers();
			careers1.g
			if(resume.getDept() == r1.getResume().getDept()) {
				count++;
			

				}
			for(Career career :careers) {
				String c1 = career.getCompanyName();
				String c2 = career.getDept();
				String c3 = career.getPosition();
				int c4 = career.getYear();
				
				

			System.out.println(recruitmentNo+"\t"+"\t"+resume.getName()+"\t"+resume.getTel()+"\t"+resume.getDept()+"\t"+c1+"\t"+c2+"\t"+c3+"\t"+c4+"\t"+recruitment.isPassed() + "\t" + count);
			}
		}

		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회해서 화면에 출력한다.

	}

	// 경력사항 상세조회
	public void printCareerDetail(int recruitmentNo, String companyName) {
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		for(Career career : recruitment.getCareers()) {
			if(career.getCompanyName().equals(companyName)) {
				System.out.println("경력사항 상세 내역");
			}
		}
	}







	// 경력사항 수정기능
	public void updateCarrer(int recruitmentNo, String companyName, Career careers) {
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		for(Career career : recruitment.getCareers()) {
			if(career.getCompanyName().equals(companyName)) {
				career.setCompanyName(careers.getCompanyName());
				career.setDept(careers.getDept());
				career.setPosition(careers.getPosition());
				career.setYear(careers.getYear());
			}
		}
		System.out.println("수정이 완료되었습니다.");
	}


	// 이력서 수정 기능
	public void updateResume(int recruitmentNo, Resume resume) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		// 구직신청객체의 이력서정보를 전달받은 이력서 정보로 교체한다.
		recruitment.setResume(resume);
		System.out.println("수정이 완료되었습니다.");
	}

	// 경력사항 삭제하기
	public void deleteCareer(int recruitmentNo , String companyName) {
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		for(Career career : recruitment.getCareers()) {
			if(career.getCompanyName().equals(companyName)) {
				recruitment.getCareers().remove(career);
			}
		}
		System.out.println("삭제가 완료되었습니다.");
	}

	// 구직신청 삭제하기
	public void deleteRecruitment(int recruitmentNo) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 삭제한다.
		repo.deleteRecruitmentByNo(recruitmentNo);
		System.out.println("삭제가 완료되었습니다.");
	}

	// 전체 구직신청정보 간단 조회
	public void printAllRecruitment() {
		// 레포지토리에서 모든 구직신청 정보를 조회해서 화면에 출력한다.

		ArrayList<Recruitment> recruitments = repo.getAllRecruitments();
		System.out.println("구직신청번호\t구직자이름\t전화번호\t지원부서\t합격여부");
		for(Recruitment recruitment : recruitments) {
			Resume resume = recruitment.getResume();

			System.out.println(recruitment.getNo()+"\t"+"\t"+resume.getName()+"\t"+resume.getTel()+"\t"+resume.getDept()+"\t"+recruitment.isPassed());
		}
	}


	// 구직신청 심사하기
	public void checkRecruitment(int recruitmentNo, boolean isPassed) {
		// 레포지토리에서 구직신청번호에 해당하는 구직신청객체를 조회한다.
		Recruitment recruitment = repo.getRecruitmentByNo(recruitmentNo);
		// 합격/불합격여부를 결정한다.
		recruitment.setPassed(isPassed);
		if(isPassed) {
			System.out.println("합격!");
		} else {
			System.out.println("불합격!");
		}
	}
}
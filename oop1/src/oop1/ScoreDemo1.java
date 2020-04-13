package oop1;

import java.util.Scanner;

public class ScoreDemo1 {
	
	public static void main(String[] args) {
		/*
		 * 학생의 이름, 국어, 영어, 수학점수를 입력받아서 배열에 저장한다.
		 * 배열에 저장된 학생성적정보를 출력할 수 있다.
		 * 배열에 저장된 학생성적정보를 검색할 수 있다.
		 */
		
		Scanner sc = new Scanner(System.in);
		Score[] scores = new Score[100];
		int savePosition = 0;
		
		while (true) {
			System.out.println();
			System.out.println("======================================");
			System.out.println("1.조회	2.검색	3.입력	4.수정	0.종료");
			System.out.println("======================================");
			
			System.out.print("번호를 입력하세요: ");
			int menuNo = sc.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[성적정보 조회]");
				
				System.out.println("이름	국어	영어	수학	총점	평균	합격여부");
				System.out.println("--------------------------------------------------------");
				for (int i=0; i<savePosition; i++) {
					Score score = scores[i];
					System.out.print(score.studentName + "\t");
					System.out.print(score.kor + "\t");
					System.out.print(score.eng + "\t");
					System.out.print(score.math + "\t");
					System.out.print(score.total + "\t");
					System.out.print(score.average + "\t");
					System.out.println(score.isPassed + "\t");
					}
				} else if (menuNo == 2) {
					System.out.println("[성적 검색]");
					
					System.out.println("조회할 학생이름을 입력하세요: ");
					String searchName = sc.next();
					
					Score foundScore = null;
					for (int i=0; i<savePosition; i++) {
						Score score = scores[i];
						if (searchName.equals(score.studentName)) {
							foundScore = score;
							break;
						}
					}
					
					if (foundScore != null) {
						System.out.println("[검색 결과]");
						System.out.println("---------------------------");
						System.out.println("학생이름: " + searchName);
						System.out.println("국어점수: " + foundScore.kor);
						System.out.println("영어점수: " + foundScore.eng);
						System.out.println("수학점수: " + foundScore.math);
						System.out.println("총       점: " + foundScore.total);
						System.out.println("평       균: " + foundScore.average);
						System.out.println("합격여부: " + foundScore.isPassed);
						System.out.println("---------------------------");
						
					} else {
						System.out.println("["+searchName+"]과 일치하는 성적정보가 존재하지 않습니다.");
					}
					
					
				} else if (menuNo == 3) {
				System.out.println("[성적정보 입력]");
				
				// 이름, 국어/영어/수학점수를 입력받는다.
				System.out.print("이름을 입력하세요: ");
				String name = sc.next();
				
				System.out.print("국어점수를 입력하세요: ");
				int korScore = sc.nextInt();
				
				System.out.print("영어점수를 입력하세요: ");
				int engScore = sc.nextInt();
				
				System.out.print("수학점수를 입력하세요: ");
				int mathScore = sc.nextInt();
				
				// Score객체를 생성한다.
				Score score = new Score();
				
				// 생성된 Score객체의 각 속성에 입력받은 이름, 국어 , 영어, 수학점수를 저장한다.
				score.studentName = name;
				score.kor = korScore;
				score.eng = engScore;
				score.math = mathScore;
				score.total = korScore+engScore+mathScore;
				score.average = score.total/3;
				score.isPassed = (score.average >= 60 ? true : false);
				
				// 성적정보가 저장된 Score 객채를 위에서 정의한 scores 배열에 순서대로 저장한다.
				scores[savePosition] = score;
				savePosition++;
				
				} else if (menuNo == 4) {
					System.out.println("[성적 수정]");
					
					System.out.println("성적을 변경할 학생이름을 입력하세요: ");
					String searchName = sc.next();
					
					// scores배열에서 이름과 일치하는 학생을 찾는다.
					// 2번의 검색과 같은 작업이 필요함.
					Score foundScore = null;
					for (int i=0; i<savePosition; i++) {
						Score score = scores[i];
						if (searchName.equals(score.studentName)) {
							foundScore = score;
							break;
						}
					}
					// foundScore가 null이 아니라면 입력한 과목명에 해당 점수를 변경한다.
					// 과목명이 "국어"라면 foundScore의 kor값을 변경하고,
					// 과목명이 "영어"라면 foundScore의 eng값을 변경하고,
					// 과목명이 "수학"이라면 foundScore의 math값을 변경한다.

					if (foundScore!= null) {
						System.out.println("성적을 변경할 과목명을 입력하세요: ");
						String className = sc.next();
						System.out.println("변경될 점수를 입력하세요: ");
						int score = sc.nextInt();
						
						if (className.equals("국어")) {
							foundScore.kor = score;
						} else if (className.equals("영어")) {
							foundScore.eng = score;
						} else if (className.equals("수학")) {
							foundScore.math = score;
						}
						foundScore.average = foundScore.total/3;
						foundScore.total = foundScore.kor + foundScore.eng + foundScore.math;
						foundScore.isPassed = (foundScore.average >= 60 ? true : false);
						}
							
					} else if (menuNo == 0) {
					System.out.println("프로그램을 종료합니다.");
					break;
			}
			
		}
		sc.close();
	}

}

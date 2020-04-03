package com.sample.school;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import com.sample.school.service.SchoolService;
import com.sample.school.service.SchoolServiceImple;

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
			System.out.println("##### 작은 쇼핑몰 #####");
			System.out.println("==========================================================================================");
			System.out.println("1.교수 2.학생  0.종료");
			System.out.println("==========================================================================================");

			System.out.print("메뉴를 선택하세요: ");
			int menuNo = sc.nextInt();

			if (menuNo == 1) {
				int proMenuNo = sc.nextInt();
				if(proMenuNo == 1) {
//					교수등록
					
				} else if (proMenuNo == 2) {
//					과목등록
				} else if (proMenuNo == 3) {
//					과목조회
				} else if (proMenuNo == 4) {
//					개설과정등록
				} else if (proMenuNo == 5) {
//					개설과정조회
				} else if (proMenuNo == 6) {
//					과정신청자 조회
				} else if (proMenuNo == 7) {
//					성적부여
				}

			} else if(menuNo == 2) {
				int stuMenuNo = sc.nextInt();
				
				if (stuMenuNo == 1) {
//					학생등록
				} else if (stuMenuNo == 2) {
//					과목조회
				} else if (stuMenuNo == 3) {
//					개설과정조회
				} else if (stuMenuNo == 4) {
//					수강신청
				} else if (stuMenuNo == 5) {
//					수강신청현황조회
				} else if (stuMenuNo == 6) {
//					수강신청취소
				} else if (stuMenuNo == 7) {
//					성정조회
				}
			} else if(menuNo == 0) {
				
				System.out.println("학사정보 시스템을 종료합니다.");
				
			}
			break;		
			
			
			
		}

	}

}

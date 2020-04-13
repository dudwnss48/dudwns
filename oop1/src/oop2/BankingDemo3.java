package oop2;

import java.util.Scanner;

public class BankingDemo3 {
	
	public static void main(String[] args) {
		
		BankingService service = new BankingService();
		
		Scanner sc = new Scanner(System.in);
		
		
		while (true) {
			System.out.println();
			System.out.println("[계좌관리 프로그램]");
			System.out.println("-----------------------------------------------------");
			System.out.println("1.조회	2.검색	3.신규	4.입금	5.출금	6.해지	0.종료");
			System.out.println("-----------------------------------------------------");
			
			System.out.println("메뉴를 선택하세요:");
			int menuNo = sc.nextInt();
			
			if (menuNo == 1) {
				service.printAllBankings();
				
			} else if (menuNo == 2) {
				System.out.println("조회할 계좌번호를 입력하세요.");
				String no = sc.next();
				service.printBankingByNo(no);
				
			} else if (menuNo == 3) {
				System.out.println("신규 계좌개설에 필요한 정보를 입력해주세요.");
				System.out.print("고객명을 입력하세요: ");
				String name = sc.next();
				System.out.print("비밀번호를 입력하세요: ");
				int pwd = sc.nextInt();
				System.out.print("첫 입금액을 입력하세요: ");
				long money = sc.nextLong();
				
				service.addNewBanking(name, pwd, money);
				
			} else if (menuNo == 4) {
				System.out.println("================== 입금 ==================");
				System.out.println("계좌번호 입력");
				String bankingNo = sc.next();
				System.out.println("입금할돈 입력");
				int money = sc.nextInt();
				
				service.depositToBankin(bankingNo, money);
				
			} else if (menuNo == 5) {
				System.out.println("================== 출금 ==================");
				System.out.print("계좌 번호를 입력하세요: ");
				String bankingNo = sc.next();
				System.out.print("비밀번호를 입력하세요: ");
				int pwd = sc.nextInt();
				System.out.print("출금할 금액을 입력하세요: ");
				long money = sc.nextLong();
				
				long withdrawMoney = service.withdrawFromBanking(bankingNo, pwd, money);
				System.out.println("고객님["+withdrawMoney+"]원을 가져가세요.");
				
			} else if (menuNo == 6) {
				System.out.println("================== 해지 ==================");
				System.out.print("계좌 번호를 입력하세요: ");
				String bankingNo = sc.next();
				System.out.print("비밀번호를 입력하세요: ");
				int pwd = sc.nextInt();
				
				long money = service.closeBanking(bankingNo, pwd);
				System.out.println("고객님 총 해지금액["+money+"]원을 가져가세요.");
			} else if (menuNo == 0) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
	}
}
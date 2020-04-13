package lang2;

public class StringDemo4 {
	
	public static void main(String[] args) {
		// StringBuilder과 StringBuffer
		// 두 객체 모두 문자열을 다루기 위한 객체다.
		// 내부에 버퍼(저장소) 를 가지고 있어서, 문자열을 추가 , 변경, 삭제하는 것이 가능하다.
		// 주요 메소드
		//			StringBuilder append(다양한타입 값) : 맨 뒤에 붙인다.
		//			StringBuilder delete(int begin, int end) : 지정된 범위의 문자열을 삭제한다.
		//			StringBuilder insert(int position, 다양한 타입 값) :지정된 위치에 문자열을 삽입한다.
		//			StringBuilder replace(int start, int end,String str) : 지정된 범위의 문자열을 새 문자열로 변경한다.
		//			String          toString() : 버퍼에 저장된 값을 하나의 문자열로 반환한다.
		
		String name = "홍길동";
		String tel = "010-1111-1111";
		String dept = "영업팀";
		int workedYear = 6;
		int salary = 35000000;
		
		StringBuilder sb = new StringBuilder();
		sb.append("이름: ");
		sb.append(name);
		sb.append(", 전화번호: ");
		sb.append(tel);
		sb.append(", 소속부서: ");
		sb.append(dept);
		sb.append(", 근무연수: ");
		sb.append(workedYear);
		
		String text = sb.toString();
		System.out.println(text);
		
		StringBuffer sb1 = new StringBuffer();
		// StringBuilder와 StringBerffer은 메소드 체이닝을 지원한다.
//		sb1.append("이름: ").append(name).append(", 전화번호:").append(tel);
		String resultText = sb1.append("이름: ")
		.append(name)
		.append(", 전화번호:")
		.append(tel)
		.toString();
		
		System.out.println(resultText);
		
		
		
		

	}
}

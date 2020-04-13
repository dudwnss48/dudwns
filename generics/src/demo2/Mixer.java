package demo2;

public class Mixer {
	
	/*
	 * 제네릭메소드
	 * 		메소드가 여거 종류의 객체를 다루는 경우
	 * 		(여러 종류의 객체를 매개변수로 전달받아야 하는 경우) 제네릭메소드로 만든다.
	 * 
	 * 		메소드의 리턴타입앞에 제네릭을 선언한다.
	 * 		메소드 호출시 전달받은 객체의 타입을 추정해서 T를 알아낸다.
	 * 		제네릭클레스가 아니여도 제네릭 메소드를 정의할 수 있다.
	 */
	public static <T extends Fruit> void mix(FruitBox<T> box) {
		int size = box.size();
		for (int i=0; i<size; i++) {
			T t = box.get(i);
			System.out.println(t.toString() + "를 믹싱합니다.");
		}
		System.out.println();
	}

	public static <T> void mix2(FruitBox<? extends T >box) {
		int size = box.size();
		for (int i=0; i <size; i++) {
			T t = (T) box.get(i);
			System.out.println(t.toString());
		}
		System.out.println();
	}
}

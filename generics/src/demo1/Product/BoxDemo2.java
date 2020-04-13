package demo1.Product;

public class BoxDemo2 {
	
	public static void main(String[] args) {
		
		// Tv가 타입파라미터로 지정된 Box객체
		// Tv객체만 다룰 수 있다.
		Box<Tv> box1 = new Box<Tv>();
		box1.add(new Tv("초대형 텔레비젼", 500000, 100.5));
//		box1.add(new SmartPhone("아이폰", 160000,"010-1111-1111","192.168.19.190"));
		
		// SmartPhone이 타입파라미터로 지정된 Box객체
		// SmartPhone객체만 다룰 수 있다.
		Box<SmartPhone> box2 = new Box<SmartPhone>();
		box2.add(new SmartPhone("아이폰", 160000,"010-1111-1111","192.168.19.190"));
//		box2.add(new Tv("초대형 텔레비젼", 500000, 100.5));
		
		// Product가 타입파라미터로 지정된 Box객체
		// Product, Product의 자손힌 Tv, SmartPhone 객체도 다룰 수 있다.
		Box<Product> box3 = new Box<Product>();
		box3.add(new Product("노트북", 200000));
		box3.add(new Tv("초대형 텔레비젼", 500000, 100.5));
		box3.add(new SmartPhone("아이폰", 160000,"010-1111-1111","192.168.19.190"));
	}
}

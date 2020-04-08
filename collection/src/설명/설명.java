package 설명;


public class 설명 {
	
	/*
	 * 04-07
	 * Collection<E>
	 * 				여러개의 객체를 저장하는 객체에 대한 표준을 설계한 인터페이스
	 * 				add(E e), contains(Object o), clear(), isEmpty(), remove(Object o), size(), iterator()
	 * 
	 * 				List<E>
	 * 							★★★저장한 순서대로 다시 꺼낼 수 있다.(순서 보장)★★★
	 * 							구현클래스
	 * 										ArrayList<E>					: 가장 많이 사용된다.
	 * 										LinkedList<E>					: 추가, 삭제가 빈번한 경우 사용된다.
	 * 										Vector<E>						: 멀티스레드 환경에서 사용한다.
	 * 										Stack<E>
	 * 				Set<E>
	 * 							★★★동일한 객체를 저장할 수 없다.(중복을 허용하지 않음)★★★
	 * 							구현클래스
	 * 										HashSet<E>					: 가장 많이 사용된다.
	 * 										SortedSet<E>
	 * 										TreeSet<E>						:오름차순으로 정렬되어 저장된다.
	 * 
	 * 	Iterator<E>
	 * 				Collection<E> 에 저장된 객체를 하나씩 꺼내는데 필요한 기능을 제공하는 인터페이스다.
	 * 				모든 collection<E>의 구현클래스(ArrayList, HashSet, LinkedList, Vector, Stack, TreeSet 등) 는
	 * 				Iterator객체를 반환하는 iterator()메소드가 존재한다.
	 * 				* Iterator 객체는 해당 콜렉션 객체에 저장된 객체를 하나씩 꺼내도록 구현되어 있다.
	 * 				주요 메소드
	 * 							boolean hasNext()						: 꺼낼 다음 번 객체가 있으면 ture를 반환
	 * 							E next()										: 다음 번 객체를 꺼낸다.
	 * 							void remove()								: 현재 객체를 삭제한다.
	 * 
	 * 
	 * Map<K, V>
	 * 				key(이름)와 value(값)을 하나의 쌍으로 묶어서 저장하는 객체들의 표준이 설계된 인터페이스
	 * 				key는 중복될 수 없다.
	 * 				주요메소드
	 * 							★★★ V put(K key, V value)			: key 와 value의 쌍으로 값을 객체에 저장한다.★★★
	 * 																			동일한 이름의 key가 존재하면 value를 덮어쓴다.
	 * 							V get(Object key)						: 키와 대응되는 value를 꺼낸다.
	 * 							boolean containsKey(Object key)	: 지정된 key와 일치하는 key 가 있으면 true를 반환.
	 * 							boolean containsValue(Object value): 지정된 value와 일치하는 value 가 있으면 true를 반환.
	 * 							Set<K> keySet()							: Map에 저장된 모든 key를 Set에 담이서 반환
	 * 							Set<Entry<K, V> entrySet()			: Map에 저장된 모든 Entry(키와값의 쌍)를 Set에 담아서 반환.
	 * 							V remove(Ovject key)					: Map에서 지정된 key에 해당하는 Entry를 삭제한다.			
	 * 							void clear									: 전부 삭제
	 * 							boolean isEmpty()							: Map에 저장된 value가 하나도 없으면 true를 반환.
	 * 							int size()										: Map에 저장된 객체의 갯수를 반환
	 * 							구현클래스
	 * 									HashMap					: 가장많이 사용된다.
	 * 									HashTable				: 멀티스레드 환경에서 사용한다.
	 * 									TreeMap					: key를 기분으로 오름차순 정렬한다.		
	 * 
	 * ===================================================================
	 * 04-08
	 * 배열, 콜랙션의 값 정렬하기
	 * 			배열
	 * 					Arrays.sort(배열)
	 * 			Set
	 * 					TreeSet에 값을 저장하면 자동으로 정렬되어서 저장된다.
	 * 			List 
	 * 					Collection.sort(리스트)
	 * 			* 배열, TreeSet, List에 저장되는 객체가 정렬되기 위해서는 Comparable<E> 인터페이스를 구현해야한다.
	 * 			* Comparable<E> 인터페이스를 구현한 주요 클래스
	 * 					모든 Wrapper 클래스(Byte, Short, Insteger, Long, Float, Double, Boolean, Character)
	 * 					String, Date, Files
	 * 					
	 * 정렬이 가능한 객체로 만듣기
	 * 			Comparable<E> 인터페이스를 구현 해야한다.
	 * 					int comparaTo(T t);
	 * 					* T는 비교대상이되는 클래스를 적는다
	 * 						비교대상은 항상 이 객체와 꼭같은 다른 객체를 비교하는 것이기 때문에
	 * 						comparable 를 구현하는 클래스의 이름을 적으면 된다.
	 * 					*compareTo()메소드는 현재 객체와 다른 객체를 비교해서
	 * 						현재 객체의 값이 다른 객체의 값보다 크면 0보다 큰 정수 
	 * 						현재 객체의 값이 다른 객체의 번호가 같으면 0
	 * 						현재 객체의 값이 다른 객체의 번호보다 작으면 0보다 작은 정수를 반환해야한다
	 * 					*배열,List<E>, TreeSet<E> 에 저장된 객체를 정렬할수 있다.
	 * 
	 * 작성예
	 * public class Score implements comparable<Score> {
	 * 			private int no;
	 *			private String name;
	 *			private int totalScore;
	 * 
	 * 			// compareTo(T t) 재정의하기
	 * 			public int compareTo(Score other){
	 * 				return this.totalScore - other.totalScore;
	 * 			}
	 * }
	 * 
	 * 
	 * 객체를 비교할 수 있는 비교기를 만들어거 객체를 정렬하기
	 * 			Comparator<T> 인터페이스를 구현한 비교기를 사용해서 객체들을 정렬한다.
	 * 					int comparator(T o1, T o2)
	 * 					* T는 비교대상이 되는 클래스를 적는다.
	 * 						비교기는 비교대상이 되는 객체 2개를 전달받아서 비교한다.
	 * 					* Arrays.sort(배열, 비교기), Collections.sort(리스트, 비교기)
	 * 					* TreeSet<E> set = new TreeSet<E>(비교기)
	 * 
	 * 			작성예)
	 * 			public class Score {
	 *					private int no;
	 *					private String name;
	 *					private int totalScore;
	 *			 }
	 *
	 * 
	 * 			ArrayList<Score> scores =  new ArrayList<>();
	 * 			// 비교기는 익명객체의 형태로 주로 사용된다.
	 *			Collections.sort(scores, new Comparator<Score>(){
	 *					public int compare(Score s1, Score s2) {
	 *							return s1.getTotalScore()  - s2.getTotalScore();
	 *					}
	 * 			});
	 * 
	 *	// java8의 람다식으로 비교기 구현하기(추상메소드가 2개이상이면 안됨)
	 * 	Collections.sort(scores, (s1, s2) -> s1.getTotalScore() - s2.getTotalScore());
	 * 
	 *	
	 */

}

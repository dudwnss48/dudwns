package data.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NavigableSet;
import java.util.TreeMap;
import java.util.TreeSet;

import data.repo.DataRepo;
import data.vo.Data;

public class DataService {

	private DataRepo repo;

	public DataService() throws Exception {
		repo = new DataRepo();

	}

	// 전체 사고건수,사망자수를 출력하는 기능
	public void printAllDataCount() {
		List<Data> datas = repo.getAllData();

		int totalDeath = 0;
		for (Data data : datas) {
			totalDeath += data.getDeath();
		}
		System.out.println("전체 사고건수: " + datas.size());
		System.out.println("전체 사망자수: " + totalDeath);

	}

	// 시도를 전달받아서 해당 지역의 사고건수와 사망자수를 출력하는 기능
	public void printDataBySido(String sido) {
		List<Data> datas = repo.getDataBySido(sido);

		int totalDeath = 0;
		for (Data data : datas) {
			totalDeath += data.getDeath();
		}
		System.out.println("["+sido+"] 지역사고 현황");
		System.out.println("전체 사고건수: " + datas.size());
		System.out.println("전체 사망자수: " + totalDeath);

	}

	// 날짜를 전달받아서 해당 날짜의 사고건수와 사망자수를 출력하는 기능
	public void printDataByDay(String day) {
		List<Data> datas = repo.getDataByDay(day);

		int totalDeath = 0;
		for (Data data : datas) {
			totalDeath += data.getDeath();
		}
		System.out.println("["+day+"] 날짜 사고 현황");
		System.out.println("전체 사고건수: " + datas.size());
		System.out.println("전체 사망자수: " + totalDeath);

	}

	// 시도를 전달받아서 해당 지역의 구군별 사고현황 통계를 출력하는 기능
	public void printDataStatBySido(String sido) {
		List<Data> datas = repo.getDataBySido(sido);
		TreeMap<String, Stat> map = new TreeMap<String, DataService.Stat>();

		for (Data data : datas) {
			String gugun = data.getGugun();
			int death = data.getDeath();

			if (map.containsKey(gugun)) {
				Stat stat = map.get(gugun);
				stat.setRecords(stat.getRecords()+1);
				stat.setDeath(stat.getDeath()+death);

			} else {
				Stat stat = new Stat();
				stat.setRecords(1);
				stat.setDeath(death);
				map.put(gugun, stat);
			}
			NavigableSet<String> set = map.navigableKeySet();
			System.out.println("[구군] 사고건수 사망자수");
			for(String key :set) {
				Stat stat = map.get(key);
				System.out.println(key+"\t"+stat.getRecords()+"\t"+stat.getDeath());
			}


		}


	}
	// 월별 사고현황 통계를 출력하는 기능
	public void printDataStatByMonth() {
		List<Data> datas = repo.getAllData();
		TreeMap<Integer, Stat> stats = new TreeMap<Integer, Stat>(); 

		for (Data data : datas) {
			String day = data.getDay();
			String monthString = day.substring(0,2);
			int month = 0;
			if (monthString.startsWith("0")) {
				month = Integer.parseInt(monthString.substring(1));
			} else {
				month = Integer.parseInt(monthString);
			}

			Stat savedStat = stats.get(month);		// Map에서 month를 key로 Stat객체를 조회한다.
			if (savedStat == null) {							// 저장된 Stat 객체가 없으면
				Stat stat = new Stat();						// Stat객체를 생성한다.
				stat.setDeath(data.getDeath());			// 사망자수와 사고건수를 담아서
				stat.setRecords(1);

				stats.put(month, stat);						// Map month로 Stat를 저장한다.
			} else {												 
				savedStat.setDeath(savedStat.getDeath() + data.getDeath());
				savedStat.setRecords(savedStat.records+1);
			}


		}
		System.out.println("월\t사고건수\t사망자수");
		System.out.println("==========================================");
		int size = stats.size();
		for (int i=1; i<=size; i++) {
			Stat stat = stats.get(i);
			System.out.println((i) +"월\t" + stat.getRecords()+"\t"+stat.getRecords());

		}



	}
	// 요일별 사고현황 통계를 출력하는 기능
	public void printDataStatByDayOfWeek() {
		List<Data> datas = repo.getAllData();
		TreeMap<String, Stat> stats = new TreeMap<String, Stat>(); 

		for (Data data : datas) {
			String day = data.getDay();
			String dayOfWeekString = day.substring(2,4);
			String dayOfWeek = null;
			if (dayOfWeekString.startsWith("0")) {
				dayOfWeek = dayOfWeekString.substring(1);
			} else {
				dayOfWeek = dayOfWeekString;
			}

			Stat savedStat = stats.get(dayOfWeek);		// Map에서 month를 key로 Stat객체를 조회한다.
			if (savedStat == null) {							// 저장된 Stat 객체가 없으면
				Stat stat = new Stat();						// Stat객체를 생성한다.
				stat.setDeath(data.getDeath());			// 사망자수와 사고건수를 담아서
				stat.setRecords(1);

				stats.put(dayOfWeek, stat);
			} else {												 
				savedStat.setDeath(savedStat.getDeath() + data.getDeath());
				savedStat.setRecords(savedStat.records+1);
			}


		}
		System.out.println("요일\t사고건수\t사망자수");
		System.out.println("==========================================");
		int size = stats.size();
		for (int i=1; i<=size; i++) {
			Stat stat = stats.get(i);
			System.out.println((i) +"월\t" + stat.getRecords()+"\t"+stat.getRecords());

		}

	}

	// 위반내용별 사고현황 통계를 출력하는 기능
	public void printDataStatByViolation() {
		List<Data> datas = repo.getAllData();
		TreeMap<String, Stat> stats = new TreeMap<String, Stat>(); 

		for (Data data : datas) {
			String violation = data.getDay();
//			String violationString = day.substring(0,2);
//			int violation = null;
//			if (violationString.startsWith("0")) {
//				violation = Integer.parseInt(violationString.substring(1));
//			} else {
//				violation = Integer.parseInt(violationString);
//			?}

			Stat savedStat = stats.get(violation);		// Map에서 violation를 key로 Stat객체를 조회한다.
			if (savedStat == null) {							// 저장된 Stat 객체가 없으면
				Stat stat = new Stat();						// Stat객체를 생성한다.
				stat.setDeath(data.getDeath());			// 사망자수와 사고건수를 담아서
				stat.setRecords(1);

				stats.put(violation, stat);						// Map violation로 Stat를 저장한다.
			} else {												 
				savedStat.setDeath(savedStat.getDeath() + data.getDeath());
				savedStat.setRecords(savedStat.records+1);
			}


		}
		System.out.println("위반내용\t사고건수\t사망자수");
		System.out.println("==========================================");
		int size = stats.size();
		for (int i=1; i<=size; i++) {
			Stat stat = stats.get(i);
			System.out.println((i) +"월\t" + stat.getRecords()+"\t"+stat.getRecords());

		}


	}
	// 사고현황 요약결과를 출력하는 기능
	public void printDataStatByStat() {
		// 최다 사고 발생 시도, 최다 사고발생 월 , 최다 사고 발생일, 최다사고 발생요일, 최다사고 발생유형
		Map<String, Map<String,Stat>> map = new HashMap<String, Map<String,Stat>>();
		map.put("시도별", new HashMap<String, DataService.Stat>());
		map.put("월별", new HashMap<String, DataService.Stat>());
		map.put("날짜별", new HashMap<String, DataService.Stat>());
		map.put("요일별", new HashMap<String, DataService.Stat>());
		map.put("사고유형별", new HashMap<String, DataService.Stat>());

		Map<String, Stat> sidoMap = map.get("시도별");
		Map<String, Stat> monthMap = map.get("월별");
		Map<String, Stat> dayMap = map.get("날짜별");
		Map<String, Stat> dayOfWeekMap = map.get("요일별");
		Map<String, Stat> violationMap = map.get("사고유형별");

		List<Data> datas = repo.getAllData();
		for (Data data : datas) {
			String sido = data.getSido();
			String month = data.getDay().substring(0,2);
			String day = data.getDay();
			String dayOfWeek = data.getDayOfWeek();
			String violation = data.getViolation();
			int death = data.getDeath();


			reduceStat(sido, death, sidoMap);
			reduceStat(month, death, monthMap);
			reduceStat(day, death, dayMap);
			reduceStat(dayOfWeek, death, dayOfWeekMap);
			reduceStat(violation, death, violationMap);
			
		}
//		Collection<Stat> sidoCollections = sidoMap.values();
//		Collection<Stat> monthCollections = monthMap.values();
//		Collection<Stat> dayCollections = dayMap.values();
//		Collection<Stat> dayOfWeekCollections = dayOfWeekMap.values();
//		Collection<Stat> violationCollections = violationMap.values();
		
		Stat sidoMaxStat = maxState(sidoMap);
		Stat monthMaxStat = maxState(monthMap);
		Stat dayMaxStat = maxState(dayMap);
		Stat dayOfWeekMaxStat = maxState(dayOfWeekMap);
		Stat violationMaxStat = maxState(violationMap);

		System.out.println("=====================교통사고현황요약====================");
		System.out.println("구		      분:  이름				건수	사망자수");
		System.out.println("최다 사고 발생 시도:  " + sidoMaxStat.getName()+"\t\t\t\t"+sidoMaxStat.getRecords()+"\t "+sidoMaxStat.getDeath());
		System.out.println("최다 사고 발생 월   :  " + monthMaxStat.getName()+"\t\t\t\t"+monthMaxStat.getRecords()+"\t "+monthMaxStat.getDeath());
		System.out.println("최다 사고 발생 날짜:  " + dayMaxStat.getName()+"\t\t\t"+dayMaxStat.getRecords()+"\t "+dayMaxStat.getDeath());
		System.out.println("최다 사고 발생 요일:  " + dayOfWeekMaxStat.getName()+"\t\t\t\t"+dayOfWeekMaxStat.getRecords()+"\t "+dayOfWeekMaxStat.getDeath());
		System.out.println("최다 사고 발생 유형:  " + violationMaxStat.getName()+"\t"+violationMaxStat.getRecords()+"\t "+violationMaxStat.getDeath());
	}
	private Stat maxState(Map<String, Stat> map) {
		Collection<Stat> stats = map.values();
		TreeSet<Stat> treeSet = new TreeSet<Stat>(stats);
		return treeSet.last();
		
		
	}

	private void reduceStat(String key, int death, Map<String, Stat> map) {
		if (map.containsKey(key)) {
			Stat stat = map.get(key);
			stat.setRecords(stat.getRecords()+1);
			stat.setDeath(stat.getDeath()+death);

		} else {
			Stat stat = new Stat();
			stat.setName(key);
			stat.setRecords(1);
			stat.setDeath(death);
			map.put(key, stat);

		}
	}

	class Stat implements Comparable<Stat> {
		private String name;

		private int records;
		private int death;



		public Stat() {
			super();
		}
		
		public String getName() {
			return name;
		}
		
		public void setName(String name) {
			this.name = name;
		}

		public int getRecords() {
			return records;
		}

		public void setRecords(int records) {
			this.records = records;
		}

		public int getDeath() {
			return death;
		}

		public void setDeath(int death) {
			this.death = death;
		}
		
		@Override
		public int compareTo(Stat o) {
			// TODO Auto-generated method stub
			return this.death - o.death;
		}


	}
}

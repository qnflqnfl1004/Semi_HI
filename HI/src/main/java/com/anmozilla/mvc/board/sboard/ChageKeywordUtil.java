package com.anmozilla.mvc.board.sboard;

public class ChageKeywordUtil {

	
	public static String getQuery() {
		String query = 	"WHERE \r\n"
						+ "s.S_STATUS = 'Y' \r\n";
						
		return query;
	}
	public static String getQuery(int searchLang, int searchTest) {
		String query = 	"WHERE \r\n"
				+ "s.S_STATUS = 'Y' \r\n";
		
		//언어, 시험 둘 다 검색
		if(searchLang > 0 && searchTest > 0) {
			query = "WHERE \r\n"
					+ "s.S_STATUS = 'Y' \r\n"
					+ "AND \r\n"
					+ "s.L_NO = " + searchLang + "\r\n"
					+ "AND \r\n"
					+ "s.TEST_NO = " + searchTest + "\r\n";
			
		}else if(searchLang > 0 && searchTest <= 0){
			//언어 단일 검색
			query = "WHERE \r\n"
					+ "s.S_STATUS = 'Y' \r\n"
					+ "AND \r\n"
					+ "s.L_NO = " + searchLang + "\r\n";
			
		}else if(searchLang <= 0 && searchTest > 0){
			//시험 단일 검색
			query = "WHERE \r\n"
					+ "s.S_STATUS = 'Y' \r\n"
					+ "AND \r\n"
					+ "s.TEST_NO = " + searchTest + "\r\n";
			
		}
			
			return query;
	}
}

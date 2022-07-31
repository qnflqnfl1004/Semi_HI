package com.anmozilla.mvc.board.sboard.model.dao;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.anmozilla.mvc.member.model.vo.Member;
import com.anmozilla.mvc.board.sboard.model.vo.Board;
import com.anmozilla.mvc.board.sboard.model.vo.Language;
import com.anmozilla.mvc.board.sboard.model.vo.Test;

public class BoardDao {
// !!!!!!!!!!!!! 민주 !!!!!!!!!!!!!!
	public Board getsBoardByNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String query = "SELECT s.S_NO, s.S_WRITER_NO, s.S_WRITE_DATE, s.S_TITLE, s.S_CONTENT, s.S_DUE_DATE, CASE s.S_MEMBER WHEN -1 THEN '미정' WHEN 1 THEN s.S_MEMBER || '개월' WHEN 2 THEN s.S_MEMBER || '개월' WHEN 3 THEN s.S_MEMBER || '개월' WHEN 4 THEN s.S_MEMBER || '개월' ELSE s.S_MEMBER || '개월' END AS S_MEMBER, CASE s.S_MEMBER WHEN -1 THEN '미정' WHEN 1 THEN s.S_MEMBER || '명' WHEN 2 THEN s.S_MEMBER || '명' WHEN 3 THEN s.S_MEMBER || '명' WHEN 4 THEN s.S_MEMBER || '명' WHEN 5 THEN s.S_MEMBER || '명' ELSE s.S_MEMBER || '명' END AS S_MEMBER, m.MEM_NICKNAME s_Writer_Nickname, l.L_TYPE, t.TEST_TYPE FROM STUDY s JOIN MEM_LIST m ON s.S_WRITER_NO = m.MEM_NO JOIN LANGUAGE l ON s.L_NO = l.L_NO JOIN TEST t ON s.TEST_NO = t.TEST_NO WHERE s.S_NO = ? AND s.S_STATUS = 'Y'";
		String query = "SELECT \r\n"
				+ "	s.S_NO,\r\n"
				+ "	s.S_WRITER_NO,\r\n"
				+ "	s.S_WRITE_DATE,\r\n"
				+ "	s.S_TITLE,\r\n"
				+ "	s.S_CONTENT,\r\n"
				+ "	s.S_DATE,\r\n"
				+ "	s.S_DUE_DATE,\r\n"
				+ "	CASE s.S_PERIOD \r\n"
				+ "	    WHEN -1 THEN '미정'\r\n"
				+ "		WHEN 1 THEN s.S_PERIOD || '개월'\r\n"
				+ "		WHEN 2 THEN s.S_PERIOD || '개월'\r\n"
				+ "		WHEN 3 THEN s.S_PERIOD || '개월'\r\n"
				+ "		WHEN 4 THEN s.S_PERIOD || '개월'\r\n"
				+ "		ELSE s.S_PERIOD || '개월'\r\n"
				+ "	END AS S_PERIOD,\r\n"
				+ " 	CASE s.S_MEMBER\r\n"
				+ "	 	WHEN -1 THEN '미정'\r\n"
				+ "		WHEN 1 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 2 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 3 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 4 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 5 THEN s.S_MEMBER || '명'\r\n"
				+ "		ELSE s.S_MEMBER || '명'\r\n"
				+ "	END AS S_MEMBER,\r\n"
				+ "	s.S_CONTACT,\r\n"
				+ "	s.S_LEVEL,"
				+ "	m.MEM_NICKNAME s_Writer_Nickname, \r\n"
				+ "	l.L_TYPE, \r\n"
				+ "	t.TEST_TYPE \r\n"
				+ "FROM \r\n"
				+ "	STUDY s JOIN MEM_LIST m \r\n"
				+ "ON s.S_WRITER_NO = m.MEM_NO JOIN LANGUAGE l \r\n"
				+ "ON s.L_NO = l.L_NO JOIN TEST t \r\n"
				+ "ON s.TEST_NO = t.TEST_NO \r\n"
				+ "WHERE \r\n"
				+ "	s.S_NO = ?\r\n"
				+ "AND\r\n"
				+ "s.S_STATUS = 'Y'";

		Board board = null;
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new Board();
				
				board.setSNo(rs.getInt("S_NO"));
				
				Member member = new Member();
				member.setNo(rs.getInt("S_WRITER_NO"));
				
				board.setSWriteDate(rs.getDate("S_WRITE_DATE"));
				board.setSTitle(rs.getString("S_TITLE"));
				board.setSContent(rs.getString("S_CONTENT"));
				board.setSDate(rs.getDate("S_DATE"));
				board.setSDueDate(rs.getDate("S_DUE_DATE"));
				board.setSPeriod(rs.getString("S_PERIOD"));
				board.setSMember(rs.getString("S_MEMBER"));
				board.setSContact(rs.getString("S_CONTACT"));
				board.setSLevel(rs.getString("S_LEVEL"));
				board.setSStatus(rs.getString("S_STATUS"));
				member.setNickName(rs.getString("s_Writer_Nickname"));
				board.setMember(member);
				
				
				Language language = new Language();
				language.setLType(rs.getString("L_TYPE"));
				board.setLanguage(language);
				
				Test test = new Test();
				test.setTestType(rs.getString("TEST_TYPE"));
				board.setTest(test);

	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

	public int insertStudy(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO STUDY (\r\n"
				+ "    S_NO,\r\n"
				+ "    S_WRITER_NO,\r\n"
				+ "    S_WRITE_DATE,\r\n"
				+ "    S_TITLE,\r\n"
				+ "    S_CONTENT,\r\n"
				+ "    S_DATE,\r\n"
				+ "    S_DUE_DATE,\r\n"
				+ "    S_MEMBER,\r\n"
				+ "    S_PERIOD,\r\n"
				+ "    S_CONTACT,\r\n"
				+ "    S_LEVEL,\r\n"
				+ "    S_STATUS,\r\n"
				+ "    L_NO,\r\n"
				+ "    TEST_NO\r\n"
				+ ") VALUES ( \r\n"
				+ "    SEQ_STUDY_NO.NEXTVAL,\r\n"
				+ "    ?,\r\n"
				+ "    DEFAULT,\r\n"
				+ "    ?,\r\n"
				+ "    ?,\r\n"
				+ "    to_date(?, 'yyyy-mm-dd'),\r\n"
				+ "    to_date(?, 'yyyy-mm-dd'),\r\n"
				+ "    ?,\r\n"
				+ "    ?,\r\n"
				+ "    ?,\r\n"
				+ "    ?,\r\n"
				+ "    DEFAULT,\r\n"
				+ "    ?,\r\n"
				+ "    ?\r\n"
				+ ")";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board.getMember().getNo());
			pstmt.setString(2, board.getSTitle());
			pstmt.setString(3, board.getSContent());
			
//			pstmt.setDate(4, (java.sql.Date) board.getSDate());
//			pstmt.setDate(5, (java.sql.Date) board.getSDueDate());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String sDate = sdf.format(board.getSDate());
			String sDueDate = sdf.format(board.getSDueDate());
			pstmt.setString(4, sDate);
			pstmt.setString(5, sDueDate);
			
			pstmt.setString(6, board.getSMember());
			pstmt.setString(7, board.getSPeriod());
			pstmt.setString(8, board.getSContact());
			pstmt.setString(9, board.getSLevel());
			pstmt.setInt(10, board.getLanguage().getLNo());
			pstmt.setInt(11, board.getTest().getTestNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteBoard(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE STUDY SET S_STATUS = 'N' WHERE S_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public List<Board> selectAllBoard(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();
		String query = "SELECT \r\n"
				+ "	s.S_NO,\r\n"
				+ "	s.S_WRITER_NO,\r\n"
				+ "	s.S_WRITE_DATE,\r\n"
				+ "	s.S_TITLE,\r\n"
				+ "	s.S_CONTENT,\r\n"
				+ "	s.S_DATE,\r\n"
				+ "	s.S_DUE_DATE,\r\n"
				+ "	CASE s.S_PERIOD \r\n"
				+ "	    WHEN -1 THEN '미정'\r\n"
				+ "		WHEN 1 THEN s.S_PERIOD || '개월'\r\n"
				+ "		WHEN 2 THEN s.S_PERIOD || '개월'\r\n"
				+ "		WHEN 3 THEN s.S_PERIOD || '개월'\r\n"
				+ "		WHEN 4 THEN s.S_PERIOD || '개월'\r\n"
				+ "		ELSE s.S_PERIOD || '개월'\r\n"
				+ "	END AS S_PERIOD,\r\n"
				+ " CASE s.S_MEMBER\r\n"
				+ "	 	WHEN -1 THEN '미정'\r\n"
				+ "		WHEN 1 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 2 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 3 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 4 THEN s.S_MEMBER || '명'\r\n"
				+ "		WHEN 5 THEN s.S_MEMBER || '명'\r\n"
				+ "		ELSE s.S_MEMBER || '명'\r\n"
				+ "	END AS S_MEMBER,\r\n"
				+ "	s.S_CONTACT,\r\n"
				+ "	s.S_LEVEL,"
				+ "	m.MEM_NICKNAME s_Writer_Nickname, \r\n"
				+ "	l.L_TYPE, \r\n"
				+ "	t.TEST_TYPE \r\n"
				+ "FROM \r\n"
				+ "	STUDY s JOIN MEM_LIST m \r\n"
				+ "ON s.S_WRITER_NO = m.MEM_NO JOIN LANGUAGE l \r\n"
				+ "ON s.L_NO = l.L_NO JOIN TEST t \r\n"
				+ "ON s.TEST_NO = t.TEST_NO \r\n"
				+ "WHERE \r\n"
				+ "s.S_STATUS = 'Y' \r\n"
				+ "ORDER BY \r\n"
				+ "s.S_WRITE_DATE ASC";
		Board board = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new Board();
				board.setSNo(rs.getInt("S_NO"));
				
				Member member = new Member();
				member.setNo(rs.getInt("S_WRITER_NO"));
				
				board.setSWriteDate(rs.getDate("S_WRITE_DATE"));
				board.setSTitle(rs.getString("S_TITLE"));
				board.setSContent(rs.getString("S_CONTENT"));
				board.setSDate(rs.getDate("S_DATE"));
				board.setSDueDate(rs.getDate("S_DUE_DATE"));
				board.setSPeriod(rs.getString("S_PERIOD"));
				board.setSMember(rs.getString("S_MEMBER"));
				board.setSContact(rs.getString("S_CONTACT"));
				board.setSLevel(rs.getString("S_LEVEL"));
				board.setSStatus(rs.getString("S_STATUS"));
				member.setNickName(rs.getString("s_Writer_Nickname"));
				board.setMember(member);
				
				
				Language language = new Language();
				language.setLType(rs.getString("L_TYPE"));
				board.setLanguage(language);
				
				Test test = new Test();
				test.setTestType(rs.getString("TEST_TYPE"));
				board.setTest(test);
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// !!!!!!!!!!!!!!!!!!!! 현진
//	public int getMyStudyBox(Connection connection, Member member) {
//		int count = 0;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String query = "SELECT ROWNUM, A.MEM_NO, A.MEM_ID, A.S_TITLE, A.S_CONTENT FROM (SELECT S.S_NO, M.MEM_ID, S.S_TITLE, S_CONTENT, M.MEM_NO"
//					+ "FROM STUDY S"
//					+ "INNER JOIN MEM_LIST M ON(S.S_WRITER_NO = M.MEM_NO)"
//					+ "ORDER BY S.S_NO DESC"
//					+ ") A"
//					+ "WHERE ROWNUM <= 3 AND A.MEM_ID=?;"; 
//		
//			try {
//				ps = connection.prepareStatement(query);
//				
//				ps.setString(1, member.getId());
//				
//				rs = ps.executeQuery();
//				
//				if(rs.next()) {
//					// 카운트에 rs 정수값 넣기
//				}
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				close(rs);
//				close(ps);
//			}
//		
//		return count;
//	}


	// view 느낌으로?????
//	public Board findMyStudyByNo(Connection connection, int userNo) {
////		List<Board> myStudy = null;
//		Board myStudy = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String query = "SELECT ROWNUM, A.MEM_NO, A.MEM_ID, A.S_TITLE, A.S_CONTENT FROM (SELECT S.S_NO, M.MEM_ID, S.S_TITLE, S_CONTENT, M.MEM_NO"
//				+ "FROM STUDY S"
//				+ "INNER JOIN MEM_LIST M ON(S.S_WRITER_NO = M.MEM_NO)"
//				+ "ORDER BY S.S_NO DESC"
//				+ ") A";
////				+ "WHERE ROWNUM <= 3 AND A.MEM_NO=?;"; 
//		
//		try {
//			ps = connection.prepareStatement(query);
//			
//			ps.setInt(1, userNo);
//			
//			rs = ps.executeQuery();
//			
//			while(rs.next()) {
//				myStudy = new Board();
//				myStudy.setSNo(rs.getInt("S_NO")); // 게시글 번호
//				
//				Member member = new Member();
//				member.setNo(rs.getInt("S_WRITE_NO")); // 작성자 번호
//				
//				myStudy.setSWriteDate(rs.getDate("S_WRITE_DATE"));// 작성일자
//				myStudy.setSTitle(rs.getString("S_TITLE")); // 스터디 제목
////				myStudy.setSContent(rs.getString("S_CONTENT")); // 스터디 소개
//				myStudy.setSDate(rs.getDate("S_DATE")); // 시작 예정일
//				myStudy.setSDueDate(rs.getDate("S_DUE_DATE"));// 모집 마감일
////				myStudy.setSMember(rs.getString("S_MEMBER"));// 모집 인원
//				myStudy.setSPeriod(rs.getString("S_PERIOD")); // 진행 기간
////				myStudy.setSContact(rs.getString("S_CONTACT")); // 연락 방법
//				myStudy.setSLevel(rs.getString("S_LEVEL")); // 모집 레벨
////				board.setSStatus(rs.getString("S_STATUS")); // 상태값(Y/N)
//				member.setNickName(rs.getString("s_Writer_Nickname"));
//				// 언어 아이디
//				// 시험 종류 아이디
//				
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(ps);
//		}
//	
//		return myStudy;
//	}
	
	
//	// LIST 느낌으로
//	public List<Board> findMyStudyAll(Connection connection, int userNo) {
//		List<Board> myStudyList = new ArrayList<>();
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String query = "SELECT ROWNUM, A.MEM_NO, A.MEM_ID, A.S_TITLE, A.S_CONTENT FROM (SELECT S.S_NO, M.MEM_ID, S.S_TITLE, S_CONTENT, M.MEM_NO"
//				+ "FROM STUDY S"
//				+ "INNER JOIN MEM_LIST M ON(S.S_WRITER_NO = M.MEM_NO)"
//				+ "ORDER BY S.S_NO DESC"
//				+ ") A"
//				+ "WHERE ROWNUM <= 3 AND A.MEM_NO=?;"; 
//		
//		try {
//			ps = connection.prepareStatement(query);
//			
//			ps.setInt(1, userNo);
//			
//			rs = ps.executeQuery();
//			
//			while(rs.next()) {
//				Board myStudy = new Board();
//				myStudy.setSNo(rs.getInt("S_NO")); // 게시글 번호
//				
//				Member member = new Member();
//				member.setNo(rs.getInt("S_WRITE_NO")); // 작성자 번호
//				
//				myStudy.setSWriteDate(rs.getDate("S_WRITE_DATE"));// 작성일자
//				myStudy.setSTitle(rs.getString("S_TITLE")); // 스터디 제목
////				myStudy.setSContent(rs.getString("S_CONTENT")); // 스터디 소개
//				myStudy.setSDate(rs.getDate("S_DATE")); // 시작 예정일
//				myStudy.setSDueDate(rs.getDate("S_DUE_DATE"));// 모집 마감일
////				myStudy.setSMember(rs.getString("S_MEMBER"));// 모집 인원
//				myStudy.setSPeriod(rs.getString("S_PERIOD")); // 진행 기간
////				myStudy.setSContact(rs.getString("S_CONTACT")); // 연락 방법
//				myStudy.setSLevel(rs.getString("S_LEVEL")); // 모집 레벨
////				board.setSStatus(rs.getString("S_STATUS")); // 상태값(Y/N)
//				member.setNickName(rs.getString("s_Writer_Nickname"));
//				// 언어 아이디
//				// 시험 종류 아이디
//				
//				myStudyList.add(myStudy);
//				
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(ps);
//		}
//		
//		return myStudyList;
//	}
	
	
	
	// List 만들어서 목록 >> loginmember 없이 해보기
	public List<Board> findMyStudyAll(Connection connection) {
		List<Board> myStudyList = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "SELECT ROWNUM, A.MEM_NO, A.MEM_ID, A.S_TITLE, A.S_CONTENT FROM (SELECT S.S_NO, M.MEM_ID, S.S_TITLE, S_CONTENT, M.MEM_NO"
						+ "FROM STUDY S"
						+ "INNER JOIN MEM_LIST M ON(S.S_WRITER_NO = M.MEM_NO)"
						+ "ORDER BY S.S_NO DESC"
						+ ") A";
//						+ "WHERE ROWNUM <= 3 AND A.MEM_NO=?;"; 
		
		try {
			ps = connection.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Board myStudy = new Board();
				myStudy.setSNo(rs.getInt("S_NO")); // 게시글 번호
				
				Member member = new Member();
				member.setNo(rs.getInt("S_WRITE_NO")); // 작성자 번호
				
				myStudy.setSWriteDate(rs.getDate("S_WRITE_DATE"));// 작성일자
				myStudy.setSTitle(rs.getString("S_TITLE")); // 스터디 제목
//				myStudy.setSContent(rs.getString("S_CONTENT")); // 스터디 소개
				myStudy.setSDate(rs.getDate("S_DATE")); // 시작 예정일
				myStudy.setSDueDate(rs.getDate("S_DUE_DATE"));// 모집 마감일
//				myStudy.setSMember(rs.getString("S_MEMBER"));// 모집 인원
				myStudy.setSPeriod(rs.getString("S_PERIOD")); // 진행 기간
//				myStudy.setSContact(rs.getString("S_CONTACT")); // 연락 방법
				myStudy.setSLevel(rs.getString("S_LEVEL")); // 모집 레벨
//				board.setSStatus(rs.getString("S_STATUS")); // 상태값(Y/N)
				member.setNickName(rs.getString("s_Writer_Nickname"));
				// 언어 아이디
				// 시험 종류 아이디
				
				myStudyList.add(myStudy);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		return myStudyList;
	}
	
	
//	public Board findMyStudyByNo(Connection connection, int userNo) {
////		List<Board> myStudy = null;
//		Board myStudy = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String query = "SELECT ROWNUM, A.MEM_NO, A.MEM_ID, A.S_TITLE, A.S_CONTENT FROM (SELECT S.S_NO, M.MEM_ID, S.S_TITLE, S_CONTENT, M.MEM_NO"
//				+ "FROM STUDY S"
//				+ "INNER JOIN MEM_LIST M ON(S.S_WRITER_NO = M.MEM_NO)"
//				+ "ORDER BY S.S_NO DESC"
//				+ ") A"
//				+ "WHERE ROWNUM <= 3 AND A.MEM_NO=?;"; 
//		
//		try {
//			ps = connection.prepareStatement(query);
//			
//			ps.setInt(1, userNo);
//			
//			rs = ps.executeQuery();
//			
//			while(rs.next()) {
//				myStudy = new Board();
//				myStudy.setSNo(rs.getInt("S_NO")); // 게시글 번호
//				
//				Member member = new Member();
//				member.setNo(userNo); // 작성자 번호
//				
//				myStudy.setSWriteDate(rs.getDate("S_WRITE_DATE"));// 작성일자
//				myStudy.setSTitle(rs.getString("S_TITLE")); // 스터디 제목
////				myStudy.setSContent(rs.getString("S_CONTENT")); // 스터디 소개
//				myStudy.setSDate(rs.getDate("S_DATE")); // 시작 예정일
//				myStudy.setSDueDate(rs.getDate("S_DUE_DATE"));// 모집 마감일
////				myStudy.setSMember(rs.getString("S_MEMBER"));// 모집 인원
//				myStudy.setSPeriod(rs.getString("S_PERIOD")); // 진행 기간
////				myStudy.setSContact(rs.getString("S_CONTACT")); // 연락 방법
//				myStudy.setSLevel(rs.getString("S_LEVEL")); // 모집 레벨
////				board.setSStatus(rs.getString("S_STATUS")); // 상태값(Y/N)
//				member.setNickName(rs.getString("s_Writer_Nickname"));
//				// 언어 아이디
//				// 시험 종류 아이디
//				
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(ps);
//		}
//		
//		return myStudy;
//	}
	


}

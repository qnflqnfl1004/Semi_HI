package com.anmozilla.mvc.board.sboard.model.dao;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.anmozilla.mvc.board.sboard.model.vo.Board;
import com.anmozilla.mvc.member.model.vo.Member;

public class BoardDao {

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

package com.anmozilla.mvc.board.nboard.model.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.anmozilla.mvc.board.nboard.model.vo.Board;
import com.anmozilla.mvc.board.sboard.model.vo.Like;
import com.anmozilla.mvc.common.util.PageInfo;
import com.anmozilla.mvc.member.model.vo.Member;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;
//영은!!!!!!!!!!!!!!!!!!!!!!!!
public class BoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM NOTICE WHERE NOTICE_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

	public List<Board> findAll(Connection connection, PageInfo pageInfo) {
		List<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, NOTICE_NO, NOTICE_TITLE, MEM_ID, NOTICE_DATE, NOTICE_STATUS "
						+ "FROM ("
						+    "SELECT ROWNUM AS RNUM, "
						+           "NOTICE_NO, "
						+ 			"NOTICE_TITLE, "
						+ 			"MEM_ID, "
						+ 			"NOTICE_DATE, "
						+     		"NOTICE_STATUS "
						+ 	 "FROM ("
						+ 	    "SELECT B.NOTICE_NO, "
						+ 			   "B.NOTICE_TITLE, "
						+  			   "M.MEM_ID, "
						+ 			   "B.NOTICE_DATE, "
						+ 	   		   "B.NOTICE_STATUS "
						+ 		"FROM NOTICE B "
						+ 		"JOIN MEM_LIST M ON(B.MEM_NO = M.MEM_NO) "
						+ 		"WHERE B.NOTICE_STATUS = 'Y' ORDER BY B.NOTICE_NO DESC"
						+ 	 ")"
						+ ") WHERE RNUM BETWEEN ? and ? ";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
//			pstmt.setInt(3, pageInfo.getListCount() - (pageInfo.getCurrentPage() - 1) * 10); 역순으로 하는 방법??????
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setRowNum(rs.getInt("RNUM"));
				board.setNo(rs.getInt("NOTICE_NO"));
				board.setTitle(rs.getString("NOTICE_TITLE"));
				board.setWriterId(rs.getString("MEM_ID"));
				board.setCreateDate(rs.getDate("NOTICE_DATE"));
				board.setStatus(rs.getString("NOTICE_STATUS"));
				
				list.add(board);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Board findBoardByNo(Connection connection, int no) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
					   "SELECT B.NOTICE_TITLE, "
							+ "B.NOTICE_NO, "
							+ "M.MEM_ID, "
							+ "B.NOTICE_DATE, "
							+ "B.NOTICE_CONTENT "
						+ "FROM NOTICE B "
						+ "JOIN MEM_LIST M ON(B.MEM_NO = M.MEM_NO) "
						+ "WHERE B.NOTICE_STATUS = 'Y' AND B.NOTICE_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				
				board.setTitle(rs.getString("NOTICE_TITLE"));
				board.setNo(rs.getInt("NOTICE_NO"));
				board.setWriterId(rs.getString("MEM_ID"));
				board.setCreateDate(rs.getDate("NOTICE_DATE"));
				board.setContent(rs.getString("NOTICE_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

	public int updateStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null ;
		String query = "UPDATE NOTICE SET NOTICE_STATUS=? WHERE NOTICE_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);		
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertBoard(Connection connection, Board board) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,?,?,DEFAULT,DEFAULT,?)";
												
		try {
			
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getWriterNo());
			
			result = pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE NOTICE SET NOTICE_TITLE=?,NOTICE_CONTENT=?,NOTICE_DATE=SYSDATE WHERE NOTICE_NO=?"; 
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}

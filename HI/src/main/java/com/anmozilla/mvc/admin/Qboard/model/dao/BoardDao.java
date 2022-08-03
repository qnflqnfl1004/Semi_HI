package com.anmozilla.mvc.admin.Qboard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.anmozilla.mvc.admin.Qboard.model.vo.Board;
import com.anmozilla.mvc.common.util.PageInfo;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

public class BoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM QA WHERE QA_STATUS='Y'";

		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();

			if (rs.next()) {
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
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query =  "SELECT RNUM, QA_NO, QA_SUB, MEM_ID, CREATE_DATE, ORIGINAL_FILENAME, QA_STATUS ,QA_AS  "
				+ "FROM ("
				+    "SELECT ROWNUM AS RNUM, "
				+           "QA_NO, "
				+ 			"QA_SUB, "
				+ 			"MEM_ID, "
				+ 			"CREATE_DATE, "
				+ 			"ORIGINAL_FILENAME, "
				+			"QA_STATUS, "
				+     		"QA_AS "
				+ 	 "FROM ("
				+ 	    "SELECT Q.QA_NO, "
				+ 			   "Q.QA_SUB, "
				+  			   "M.MEM_ID, "
				+ 			   "Q.CREATE_DATE, "
				+ 			   "Q.ORIGINAL_FILENAME, "
				+ 			   "Q.QA_STATUS, "
				+ 	   		   "Q.QA_AS "
				+ 		"FROM QA Q "
				+ 		"JOIN MEM_LIST M ON(Q.MEM_NO = M.MEM_NO) "
				+ 		"WHERE Q.QA_STATUS = 'Y'  ORDER BY Q.QA_NO DESC"
				+ 	 ")"
				+ ") WHERE RNUM BETWEEN ? and ?";
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();

				board.setRowNum(rs.getInt("RNUM"));
				board.setNo(rs.getInt("QA_NO"));
				board.setWriterId(rs.getString("MEM_ID"));
				board.setTitle(rs.getString("QA_SUB"));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				board.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				board.setStatus(rs.getString("QA_STATUS"));
				board.setAs(rs.getString("QA_AS"));

				list.add(board);
			}
		} catch (Exception e) {
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
				"SELECT  Q.QA_NO, " 
						+ "Q.QA_SUB, " 
						+ "M.MEM_ID, " 
						+ "Q.QA_TYPE, " 
						+ "Q.ORIGINAL_FILENAME, "
						+ "Q.RENAMED_FILENAME, " 
						+ "Q.QA_CONTENT, " 
						+ "Q.CREATE_DATE "  
						+ "FROM QA Q "
						+ "JOIN MEM_LIST M ON(Q.MEM_NO = M.MEM_NO) "
						+ "WHERE Q.QA_STATUS = 'Y' AND Q.QA_NO=?";

		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new Board();

				board.setNo(rs.getInt("QA_NO"));
				board.setTitle(rs.getString("QA_SUB"));
				board.setWriterId(rs.getString("MEM_ID"));
				board.setReason(rs.getString("QA_TYPE"));
				board.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				board.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				board.setContent(rs.getString("QA_CONTENT"));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return board;
	}

}

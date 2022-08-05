package com.anmozilla.mvc.board.Qboard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.anmozilla.mvc.board.Qboard.model.vo.Qboard;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

public class QboardDao {
	public int insertBoard(Connection connection, Qboard board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO QA VALUES(SEQ_QA_NO.NEXTVAL,?,?,?,?,?,DEFAULT,?,DEFAULT,DEFAULT)";
		
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, board.getReason());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getOriginalFileName());
			pstmt.setString(5, board.getRenamedFileName());
			pstmt.setInt(6, board.getNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateBoard(Connection connection, Qboard board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE QA SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?,MODIFY_DATE=SYSDATE WHERE NO=?";

		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getOriginalFileName());
			pstmt.setString(4, board.getRenamedFileName());
			// pstmt.setInt(5, board.getNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}

package com.anmozilla.mvc.board.Qboard.model.service;

import java.sql.Connection;

import com.anmozilla.mvc.board.Qboard.model.dao.QboardDao;
import com.anmozilla.mvc.board.Qboard.model.vo.Qboard;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

public class QboardService {
	public int save(Qboard board) {
		int result = 0;
		Connection connection = getConnection();
		
		if(board.getNo() != 0) {
			result = new QboardDao().updateBoard(connection, board);			
		} else {
			result = new QboardDao().insertBoard(connection, board);			
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		
		
		return result;
	}

}

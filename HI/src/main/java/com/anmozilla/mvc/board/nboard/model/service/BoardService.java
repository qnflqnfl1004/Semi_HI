package com.anmozilla.mvc.board.nboard.model.service;

import java.sql.Connection;
import java.util.List;

import com.anmozilla.mvc.board.nboard.model.model.dao.BoardDao;
import com.anmozilla.mvc.board.nboard.model.vo.Board;
import com.anmozilla.mvc.common.util.PageInfo;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

public class BoardService {

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		close(connection);
		
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}

	public Board getBoardByNo(int no) {
		Board board = null;
		Connection connection = getConnection();
		
		board = new BoardDao().findBoardByNo(connection, no);
		
		close(connection);
		
		
		return board;
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().updateStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int save(Board board) {
		int result = 0;
		Connection connection = getConnection();
		
		if(board.getNo() != 0) {
		} else {			
			result = new BoardDao().insertBoard(connection, board);
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

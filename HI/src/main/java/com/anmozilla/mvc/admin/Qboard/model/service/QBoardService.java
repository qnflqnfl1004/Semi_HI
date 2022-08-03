package com.anmozilla.mvc.admin.Qboard.model.service;

import java.sql.Connection;
import java.util.List;

import com.anmozilla.mvc.admin.Qboard.model.dao.BoardDao;
import com.anmozilla.mvc.admin.Qboard.model.vo.Board;
import com.anmozilla.mvc.common.util.PageInfo;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;
public class QBoardService {

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

}

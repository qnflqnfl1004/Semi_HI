package com.anmozilla.mvc.admin.Qboard.model.service;

import java.sql.Connection;
import java.util.List;

import com.anmozilla.mvc.admin.Qboard.model.dao.BoardDao;
import com.anmozilla.mvc.admin.Qboard.model.vo.Board;
import com.anmozilla.mvc.board.Qboard.model.dao.QboardDao;
import com.anmozilla.mvc.board.Qboard.model.vo.Qboard;
import com.anmozilla.mvc.common.util.PageInfo;
import com.anmozilla.mvc.member.model.vo.Member;

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
	
	public int save(Board board) {
		int result = 0;
		Connection connection = getConnection();
		
		if(board.getNo() != 0) {
			result = new BoardDao().updateBoard(connection, board);			
		}
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		
		
		return result;
	}
	
	public List<Board> getBoardList1(PageInfo pageInfo, Member loginMember) {
		List<Board> list = null;
		Connection connection = getConnection(); 
		
		list = new BoardDao().findme(connection, pageInfo, loginMember);
		
		close(connection);
		
		return list;
		
	}

}

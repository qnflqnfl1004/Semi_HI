package com.anmozilla.mvc.board.sboard.model.service;

import java.sql.Connection;
import java.util.List;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

import com.anmozilla.mvc.common.util.PageInfo;
import com.anmozilla.mvc.sboard.model.dao.BoardDao;
import com.anmozilla.mvc.sboard.model.vo.Board;

public class BoardService {

//	public List<Board> getMyStudyByNo(int userNo) {
//		List<Board> myStudyList = null;
//		Connection connection = getConnection();
//		
//		myStudyList = new BoardDao().findMyStudyAll(connection, userNo);
//		
//		close(connection);
//		
//		return myStudyList;
//	}
	
	// List 만들어서 목록 >> loginMember 없이 해보기
	public List<Board> getMyStudyByNo() {
		List<Board> myStudyList = null;
		Connection connection = getConnection();
		
		myStudyList = new BoardDao().findMyStudyAll(connection);
		
		close(connection);
		
		return myStudyList;
	}
	
	
	
	
	
	
	
	
//	public Board getMyStudyByNo() {
//		Board myStudy = null;
//		Connection connection = getConnection();
//		
//		myStudy = new BoardDao().findMyStudyByNo(connection);
//		
//		close(connection);
//		
//		return myStudy;
//	}

//	public List<Board> getMyStudyList(PageInfo pageInfo) {
//		Board myStudy = null;
//		Connection connection = getConnection();
//		
//		myStudy = new BoardDao().findMyStudyByNo(connection, pageInfo);
//	
//		return myStudy;
//	}




}

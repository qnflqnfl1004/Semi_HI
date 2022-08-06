package com.anmozilla.mvc.board.sboard.model.service;

import java.sql.Connection;
import java.util.List;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

import com.anmozilla.mvc.board.sboard.model.dao.BoardDao;
import com.anmozilla.mvc.board.sboard.model.vo.Board;
import com.anmozilla.mvc.board.sboard.model.vo.Like;

public class BoardService {
	// !!!! 민주!!!!!!!!!!!!!!!!
	
	

		public Board getsBoardByNo(int no) {
			Connection conn = getConnection();
			Board board = new BoardDao().getsBoardByNo(conn, no);
			
			close(conn);
			
			return board;
		}

		public int insertStudy(Board board) {
			Connection conn = getConnection();
			int result = new BoardDao().insertStudy(conn, board);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}

		public int deleteBoard(int no) {
			Connection conn = getConnection();
			int result = new BoardDao().deleteBoard(conn, no);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}

		public List<Board> selectAllBoard(String getQuery) {
			Connection conn = getConnection();
			List<Board> list = new BoardDao().selectAllBoard(conn, getQuery);
			close(conn);
			
			return list;
		}
	
	
		public int updateStudy(Board board) {
			Connection conn = getConnection();
			int result = new BoardDao().updateStudy(conn, board);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
		
		public int getBoardCount() {
			int count = 0;
			Connection connection = getConnection();
			
			count = new BoardDao().getBoardCount(connection);
			
			close(connection);
			
			return count;
			
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
// ------------------------------------------------------------ 현진 ------------------------------------------------------------ 
	// studyBox - myStudy 리스트
	public List<Board> getMyStudyByNo(int userNo) {
		List<Board> myStudyList = null;
		Connection connection = getConnection();
		
		myStudyList = new BoardDao().findMyStudyByNo(connection, userNo);
		
		close(connection);
		
		return myStudyList;
	}
	
	// myStudy 전체 리스트
	public List<Board> getMyStudyAll(int userNo) {
		List<Board> myStudyList = null;
		Connection connection = getConnection();
		
		myStudyList = new BoardDao().findMyStudyAll(connection, userNo);
		
		close(connection);
		
		return myStudyList;
	}

	// studyBox - likeStudy 리스트
	public List<Board> getLikeStudyByNo(int userNo) {
		List<Board> likeStudyList = null;
		Connection connection = getConnection();
		
		likeStudyList = new BoardDao().findLikeStudyByNo(connection, userNo);
		
		close(connection);
		
		return likeStudyList;
	}
	
	// likeStudy 전체 리스트
	public List<Board> getLikeStudyAll(int userNo) {
		List<Board> likeStudyList = null;
		Connection connection = getConnection();
		
		likeStudyList = new BoardDao().findLikeStudyAllByNo(connection, userNo);
		
		close(connection);
		
		return likeStudyList;
	}
	
	// 메인 - 스터디 전체 리스트
	public List<Board> getStudyAll(int userNo) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findStudyAll(connection, userNo);
		
		close(connection);
		
		return list;
	}

	// 하트 누르면 찜 스터디에 추가
	public int insertLikeStudy(int userNo, int studyNo) {
		int result = 0;
		Connection connection = getConnection();

		result = new BoardDao().insertLikeStudy(connection, userNo, studyNo);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}

		return result;
	}
	
	// 하트 누르면 찜 스터디에 삭제
	public int deleteLikeStudy(int userNo, int studyNo) {
		int result = 0;
		Connection connection = getConnection();

		result = new BoardDao().deleteLikeStudy(connection, userNo, studyNo);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}

		return result;
	}
	
	// 찜 스터디 
	public Like findLikeByNo(int studyNo, int userNo) {
		Like like = null;
		Connection connection = getConnection();
		
		like = new BoardDao().findLikeByNo(connection, studyNo, userNo);
		
		close(connection);
		
		return like;
	}

}

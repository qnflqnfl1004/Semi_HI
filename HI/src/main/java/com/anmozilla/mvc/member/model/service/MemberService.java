package com.anmozilla.mvc.member.model.service;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.close;
import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.commit;
import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.anmozilla.mvc.member.model.dao.MemberDao;
import com.anmozilla.mvc.member.model.vo.Member;

public class MemberService {
	// 솔이님 ☆
	
	public Boolean isDuplicateID(String userId) {
		return this.findMemberById(userId) != null;
	}

	private Object findMemberById(String userId) {
		Connection connection = getConnection();
		Member member = new MemberDao().findMemberById(connection, userId);
		
		close(connection);
		
		return member;
	}

	public Boolean isDuplicateNick(String userNick) {
		return this.findMemberByNick(userNick) != null;
	}

	private Object findMemberByNick(String userNick) {
		Connection connection = getConnection();
		Member member = new MemberDao().findMemberByNick(connection, userNick);
		
		close(connection);
		
		return member;
	}

	public Boolean isDuplicateEmail(String userEmail) {
		return this.findMemberByEmail(userEmail) != null;
	}

	private Object findMemberByEmail(String userEmail) {
		Connection connection = getConnection();
		Member member = new MemberDao().findMemberByEmail(connection, userEmail);
		
		close(connection);
		
		return member;
	}

	public int getMemberCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new MemberDao().getMemberCount(connection);
		
		close(connection);
		
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 현진
	// 회원가입 데이터 insert & 회원 정보 수정
	public int save(Member member) {
		int result = 0;
		
		// SQL문장을 실행시키기 전에 우선 Connection객체가 있어야 함
		Connection connection = getConnection();
		
		if (member.getNo() != 0) {
			result = new MemberDao().updateMember(connection, member);
		} else {
			result = new MemberDao().insertMember(connection, member);
		}
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}

	// 회원 탈퇴
	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().updateMemberStatus(connection, no, "N");
		
		return result;
	}

	
	// 비밀번호 변경 -> 비밀번호 확인
	public int updatePassword(int no, String userPwd) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().updateMemberPwd(connection, no, userPwd);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		close(connection);
		
		return result;
	}
	

	



}

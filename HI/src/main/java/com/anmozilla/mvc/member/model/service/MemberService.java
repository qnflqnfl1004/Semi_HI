package com.anmozilla.mvc.member.controller;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.anmozilla.mvc.member.model.dao.MemberDao;
import com.anmozilla.mvc.member.model.vo.Member;

public class MemberService {
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
	
	public Boolean isDuplicateID(String userId) {
		return this.findMemberById(userId) != null;
	}

	
	private Member findMemberById(String userId) {
		Connection connection = getConnection();
		Member member = new MemberDao().findMemberById(connection, userId);
		
		close(connection);
		
		return member;
	}



}

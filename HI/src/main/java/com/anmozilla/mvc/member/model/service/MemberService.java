package com.anmozilla.mvc.member.model.service;

import java.sql.Connection;

import static com.anmozilla.mvc.common.jdbc.JDBCTemplate.*;
import com.anmozilla.mvc.member.model.dao.MemberDao;
import com.anmozilla.mvc.member.model.vo.Member;

public class MemberService {

	public int save(Member member) {
		int result = 0;
		Connection connection = getConnection();
		
		if (member.getNo() != 0) {
			System.out.println("업데이트쿼리");
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

}

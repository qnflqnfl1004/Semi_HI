package com.anmozilla.mvc.member.model.service;

import com.anmozilla.mvc.member.model.dao.MemberDao;
import com.anmozilla.mvc.member.model.vo.Member;

public class MemberService {

	public Member login(String id, String password) {
		Member member = null;
		
		member = new MemberDao().findMemberByID(id);
		
		return null;
	}

}

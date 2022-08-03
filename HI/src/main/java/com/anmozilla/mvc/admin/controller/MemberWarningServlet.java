package com.anmozilla.mvc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.member.model.service.MemberService;
import com.anmozilla.mvc.member.model.vo.Member;


@WebServlet("/admin/memberWarning")
public class MemberWarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberWarningServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Member member = new Member();
	       	
		member.setNo(Integer.parseInt(request.getParameter("userNo")));
       	member.setWarning(Integer.parseInt(request.getParameter("userWarning")));
       	
       	System.out.println(member);

       	result = new MemberService().updateMemberWarning(member);
       	
    	if(result > 0) {
       		request.setAttribute("msg", "경고 주기 성공");
			request.setAttribute("location", "/admin/memberList");
       	} else {
       		request.setAttribute("msg", "경고 주기 실패");
			request.setAttribute("location", "/admin/memberList");
       	}
	
	}

}

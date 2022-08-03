package com.anmozilla.mvc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.member.model.service.MemberService;

@WebServlet("/admin/memberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 관리자 체크
		int result = 0;
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println(no);
		
		result = new MemberService().memberdelete(no);
		
		if(result > 0) {
    		request.setAttribute("msg", "회원 강제 탈퇴 성공");
    		request.setAttribute("location", "/admin/memberList");
    	} else {
    		request.setAttribute("msg", "회원 강제 탈퇴 실패");
    		request.setAttribute("location", "/admin/memberList");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}

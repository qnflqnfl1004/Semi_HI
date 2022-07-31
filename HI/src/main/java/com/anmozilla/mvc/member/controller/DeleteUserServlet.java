package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.vo.Member;

@WebServlet("/member/deleteUser")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUserServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		result = new MemberService().delete(loginMember.getNo());
    		
    		if (result > 0) {
//    			request.setAttribute("msg", "bye User"); // 탈퇴 어떤식으로 할까?
    			request.setAttribute("location", "/member/logout"); // 로그아웃 서블릿 만들기
    		} else {
//    			request.setAttribute("msg", "bye User"); // 탈퇴 어떤식으로 할까?
    			request.setAttribute("location", "/member/myPage"); // 로그아웃 서블릿 만들기

    		}
    	} else {
//    		request.setAttribute("msg", "로그인 후 탈퇴해 주세요");
    		request.setAttribute("location", "/");
    	}
    	request.getRequestDispatcher("/").forward(request, response);

	}

}

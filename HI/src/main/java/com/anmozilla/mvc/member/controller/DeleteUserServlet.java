package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.service.MemberService;
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
    			request.setAttribute("msg", "bye User"); 
    			request.setAttribute("location", "/logout"); 
    		} else {
    			request.setAttribute("msg", "좀 더 공부합시다 ! "); 
    			request.setAttribute("location", "/member/myPage"); 

    		}
    	} else {
    		request.setAttribute("msg", "로그인 후 탈퇴해 주세요");
    		request.setAttribute("location", "/home");
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}

package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.member.model.service.MemberService;
import com.anmozilla.mvc.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet(name = "myPagePwdCheck", urlPatterns = "/member/myPagePwdCheck")
public class MyPagePwdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyPagePwdCheck() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String pwdCheck = null;
    	String userId = null;
    	
    	new Gson().toJson(pwdCheck, response.getWriter());
    	response.setContentType("application/json;charset=UTF-8");

    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null ) {
    		pwdCheck = request.getParameter("pwdDoubleCheck");
    		userId = loginMember.getId();
    		Member member = new MemberService().pwdDoubleCheckById(pwdCheck, userId);
    		
    		System.out.println("userId : " + userId);
    		System.out.println("pwdDoubleCheck : " + pwdCheck);
    		System.out.println(member);
    		
    		if (member != null) {
    			request.setAttribute("location", "/member/myPage");
    		} else {
	    		 request.setAttribute("msg", "비밀번호를 확인해 주세요.");
    		} 
    	} else {
    			request.setAttribute("msg", "로그인 먼저 해주세요.");
    			request.setAttribute("location", "/home");
    			
    			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    		}
    	
//	    	request.setAttribute("location", "/member/myPage");
	}
}

package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.member.model.service.MemberService;
import com.anmozilla.mvc.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet("/member/enroll")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollServlet() {
        super();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Member member = new Member();
    	
    	member.setId(request.getParameter("userId"));
    	member.setPassword(request.getParameter("userPwd"));
    	member.setNickName(request.getParameter("userNick"));
    	member.setName(request.getParameter("userName"));
    	member.setEmail(request.getParameter("userEmail"));
    	member.setPhone(request.getParameter("userPhone"));
    	member.setImg(request.getParameter("imgOri"));
    	
    	response.setContentType("appllication/json;charset=UTF-8");
    	new Gson().toJson(member, response.getWriter());
    	
    	System.out.println(member);
    	
    	int result = new MemberService().save(member);
    	
    	if (result > 0) {
    		System.out.println("회원가입 성공");
    	} else {
    		System.out.println("회원가입 실패");
    	}
    	
    	
    	
  
	}

}

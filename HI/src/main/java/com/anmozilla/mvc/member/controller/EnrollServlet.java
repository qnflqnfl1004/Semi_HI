package com.anmozilla.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.common.util.FileRename;
import com.anmozilla.mvc.member.model.service.MemberService;
import com.anmozilla.mvc.member.model.vo.Member;
import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;

@WebServlet(name = "enroll", urlPatterns = "/member/enroll")
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EnrollServlet() {
        super();
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	int result = 0;
    	Member member = null;    	
    	MultipartRequest mr = null;
    	
    	String encoding = "UTF-8";
		int fileMaxSize = 10 * 1024 * 1024;
		String path = getServletContext().getRealPath("/resources/upload/member");
		
		System.out.println("request getContentType : " + request.getContentType());
		
		mr = new MultipartRequest(request, path, fileMaxSize, encoding, new FileRename());
	
		String userId = mr.getParameter("userId");
		String userPwd = mr.getParameter("userPwd");
		String userNick = mr.getParameter("userNick");
		String userName = mr.getParameter("userName");
		String userEmail = mr.getParameter("userEmail");
		String userPhone = mr.getParameter("userPhone");
		String userProfil = mr.getFilesystemName("userProfil");
    	
		member = new Member();
		
    	member.setId(userId);
    	member.setPassword(userPwd);
    	member.setNickName(userNick);
    	member.setName(userName);
    	member.setEmail(userEmail);
    	member.setPhone(userPhone);
    	member.setImg(userProfil);
    	
    	response.setContentType("appllication/json;charset=UTF-8");
    	new Gson().toJson(member, response.getWriter());
    	
    	System.out.println(member);
    	
    	result = new MemberService().save(member);
    	
    	
    	if (result > 0) {
    		System.out.println("회원가입 성공");
    	} else {
    		System.out.println("회원가입 실패");
    	}
    	
	}

}

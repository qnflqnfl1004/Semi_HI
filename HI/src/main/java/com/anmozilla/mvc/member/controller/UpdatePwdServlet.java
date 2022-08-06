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
import com.google.gson.Gson;

@WebServlet(name = "updatePwd", urlPatterns = "/member/updatePwd")
public class UpdatePwdServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    public UpdatePwdServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	String newPwd = request.getParameter("newPwd");
    	String newPwdCheck = request.getParameter("newPwdCheck");
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	response.setContentType("appllication/json;charset=UTF-8");

    	if (loginMember != null && newPwd.equals(newPwdCheck)) {
			result = new MemberService().updatePassword(loginMember.getNo(), newPwd);
			new Gson().toJson("success", response.getWriter());
		} else {
			new Gson().toJson("fail", response.getWriter());
		}
    }
}

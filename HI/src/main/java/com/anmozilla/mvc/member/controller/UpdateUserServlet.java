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


@WebServlet(name = "updateUserInfo", urlPatterns = "/member/updateUserInfo")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateUserServlet() {
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Member member = null;
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		member = new Member();
    		
    		member.setNo(loginMember.getNo());
    		member.setNickName(request.getParameter("newNick"));
    		member.setEmail(request.getParameter("newEmail"));
    		member.setPhone(request.getParameter("newPhone"));
    		
    		result = new MemberService().save(member);
    		System.out.println(member);
    		
    		if (result > 0) {
    			session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
    			
    			request.setAttribute("msg", "회원 정보 수정 완료");
    			request.setAttribute("location", "/member/myPage");
    		} else {
    			request.setAttribute("msg", "회원 정보 수정 실패");
    			request.setAttribute("location", "/home");
    		}
    		
    	} else {
    		request.setAttribute("msg", "로그인 후 수정해주세요");
			request.setAttribute("location", "/home");

    	}
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}

package com.anmozilla.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.vo.Member;


@WebServlet("/member/updateUserInfo")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateUserServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/").forward(request, response);    

	}
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	HttpSession session = request.getSession(false);
//    	// 기억하자 파라미터로 부르는건 name ! loginmember는 login 할 때 세션에 저장해서 유지 가능! 다른 서블릿이나 jsp 부를 수 있음
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	Member member = null;
    	
    	if (loginMember != null) {
    		member = new Member();
    		
    		member.setNo(loginMember.getNo());
    		member.setNickName(request.getParameter("userNick"));
    		member.setEmail(request.getParameter("userEmail"));
    		member.setPhone(request.getParameter("userPhone"));
//    		
    		result = new MemberService().save(member);
    		
    		if (result > 0) {
    			session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
    			
    			request.setAttribute("msg", "회원 정보 수정 완료");
    			request.setAttribute("location", "/");
    		} else {
    			request.setAttribute("msg", "회원 정보 수정 실패");
    			request.setAttribute("location", "/member/myPage");
    		}
    	} else {
    		request.setAttribute("msg", "로그인 후 수정해주세요");
			request.setAttribute("location", "/");

    	}
    		request.getRequestDispatcher("views/common/msg.jsp").forward(request, response);
	}

}

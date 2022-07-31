package com.anmozilla.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.dao.MemberDao;
import com.anmozilla.mvc.member.model.vo.Member;

@WebServlet("/member/updatePwd")
public class UpdatePwdServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    public UpdatePwdServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("${ path }/views/member/myPage.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	String userPwd = request.getParameter("userPwd");
    	
    	if (loginMember != null) {
    		result = new MemberService().updatePassword(loginMember.getNo(), userPwd);
    		
    		if (result > 0) {
    			request.setAttribute("msg", "비밀번호 변경 완료");
    			request.setAttribute("script", "self.close()");
    		} else {
    			request.setAttribute("msg", "비밀번호 변경 실패");
    			request.setAttribute("location", "/member/myPage.jsp");
    		}
    	} else {
    		request.setAttribute("msg", "로그인 후 수정해 주세요");
    		request.setAttribute("script", "self.close()");
    	}
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
}

package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.vo.Member;


@WebServlet("/member/myPage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// 멤버 클래스 정확히 만들고 다시 !!!!!!!!!!
    	// 굳이 false를 넣는 이유는, false가 아닌 경우 새로 만들어 주기 때문이다. 
    	HttpSession session = request.getSession(false);
    	// session이 만들어진 후, session이 null이면 null 아니면 loginMember 호출
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
//    	
    	if(loginMember != null) {
		// 데이터베이스에서 페이지 요청할 시점에 멤버 객체를 가져와서 request 영역에 담아 포워딩 시킨다. 
    		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
    	} else {
    		// 메세지 넣기
    		 request.setAttribute("msg", "로그인 후 수정!!!!!!!!!!!!!!!!!");
    		 request.setAttribute("location", "/");	
//    		 request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    		
    		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
    		
    	}

    }

}

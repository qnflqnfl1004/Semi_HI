package com.anmozilla.mvc.board.sboard.Mcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.member.model.vo.Member;


@WebServlet("/member/likeStudy")
public class LikeStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LikeStudyServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int userNo = 0;
    	int result = 0;
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	 
    	if (loginMember != null ) {
    		int likeNo = Integer.parseInt(request.getParameter("likeNo"));
    		userNo = loginMember.getNo();
    		result = new BoardService().insertLikeStudy(userNo, likeNo);
    	
	    	request.setAttribute("result", result);
	    	System.out.println("userNo : " + userNo);
	    	System.out.println("likeNo : " + likeNo);
	    	
//	    	request.getRequestDispatcher("/home").forward(request, response);
    	
    	} else {
			request.setAttribute("msg", "로그인 후 찜 해주세요.");
			request.setAttribute("location", "/home");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}
}

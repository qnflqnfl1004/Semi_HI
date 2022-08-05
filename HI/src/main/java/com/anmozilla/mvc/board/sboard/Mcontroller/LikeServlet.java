package com.anmozilla.mvc.board.sboard.Mcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.board.sboard.model.vo.Like;
import com.anmozilla.mvc.member.model.vo.Member;


@WebServlet("/like.do")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikeServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Like like = null;
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		System.out.println(studyNo);
		System.out.println(loginMember.getNo());
    	
		like = new BoardService().findLikeByNo(studyNo, loginMember.getNo());
		
		System.out.println(like);
	}
}

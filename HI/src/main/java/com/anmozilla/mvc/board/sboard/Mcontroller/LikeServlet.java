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
import com.google.gson.Gson;


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
		if(like != null) {
			// 좋아요 취소 like 데이터 삭제
			new BoardService().deleteLikeStudy(loginMember.getNo(), studyNo);
		} else {
			// 좋아요 like 데이터 삽입
			new BoardService().insertLikeStudy(loginMember.getNo(), studyNo);
		}
		
		// 지워지면 null, insert 되면 객체
		like = new BoardService().findLikeByNo(studyNo, loginMember.getNo());
		
		response.setContentType("application/json;charset=utf-8");
		
		new Gson().toJson(like, response.getWriter());
	}
}

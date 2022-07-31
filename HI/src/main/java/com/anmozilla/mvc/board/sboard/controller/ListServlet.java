package com.anmozilla.mvc.board.sboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.vo.Member;
import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.board.sboard.model.vo.Board;


@WebServlet("/admin/sboard")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	String msg = "";
    	List<Board> list = new ArrayList<Board>();
		if(loginMember != null && loginMember.getId().equals("admin")) {
			list = new BoardService().selectAllBoard();
			
		} else {
			msg = "관리자 로그인 후 사용할 수 있습니다.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/").forward(request, response);
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/sboard.jsp").forward(request, response);
	}

}

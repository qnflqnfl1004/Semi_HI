package com.anmozilla.mvc.board.sboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.vo.Member;
import com.anmozilla.mvc.board.sboard.model.service.BoardService;

@WebServlet("/sboard/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeleteServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		int no = Integer.parseInt(request.getParameter("no"));
    	String msg = "";
		if(loginMember != null) {
			int result = new BoardService().deleteBoard(no);
			if(result > 0) {
				msg = "게시글 삭제 성공";
			} else {
				msg = "게시글 삭제 실패";
			}
		} else {
			msg = "로그인 후 사용할 수 있습니다.";

		}
			System.out.println(msg);
		request.getSession().setAttribute("msg", msg);
		System.out.println(no);
			response.sendRedirect(request.getContextPath() + "/");
		}
}

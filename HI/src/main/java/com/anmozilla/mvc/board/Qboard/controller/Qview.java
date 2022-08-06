package com.anmozilla.mvc.board.Qboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.admin.Qboard.model.service.QBoardService;
import com.anmozilla.mvc.admin.Qboard.model.vo.Board;

/**
 * Servlet implementation class Qview
 */
@WebServlet("/Qview")
public class Qview extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Qview() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board board = null;
		int no = Integer.parseInt(request.getParameter("no"));
		board = new QBoardService().getBoardByNo(no);
		
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("/views/board/Qboard/view.jsp").forward(request, response);
	}


}

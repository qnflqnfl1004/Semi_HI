package com.anmozilla.mvc.admin.Qboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.admin.Qboard.model.service.QBoardService;
import com.anmozilla.mvc.admin.Qboard.model.vo.Board;

@WebServlet("/admin/Qview")
public class QviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board board = null;
		int no = Integer.parseInt(request.getParameter("no"));
		board = new QBoardService().getBoardByNo(no);
		
		
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("/views/admin/Qboard/Qview.jsp").forward(request, response);
		
		
	}

}

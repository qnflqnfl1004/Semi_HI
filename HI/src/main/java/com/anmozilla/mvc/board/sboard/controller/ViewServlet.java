package com.anmozilla.mvc.board.sboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.board.sboard.model.vo.Board;

@WebServlet("/sboard/view")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ViewServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = Integer.parseInt(request.getParameter("no"));    		
    	
    	System.out.println("no: "+ no);
    	Board board = new BoardService().getsBoardByNo(no);
    	System.out.println(board);
    	request.setAttribute("board", board);
    	request.getRequestDispatcher("/views/sboard/view.jsp").forward(request, response);
	}

}

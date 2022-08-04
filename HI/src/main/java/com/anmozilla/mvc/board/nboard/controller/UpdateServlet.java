package com.anmozilla.mvc.board.nboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.board.nboard.model.service.BoardService;
import com.anmozilla.mvc.board.nboard.model.vo.Board;

@WebServlet(name = "nboardUpdateServlet", urlPatterns = { "/nboard/update" })
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Board board = null;
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	System.out.println("게시글 번호 : " + no);
    	
    	board = new BoardService().getBoardByNo(no);
    	
    	System.out.println(board);
    	
    	request.setAttribute("board", board);
    	request.getRequestDispatcher("/views/nboard/update.jsp").forward(request, response);
	}
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	Board board = null;
    	
    	board = new Board();
    	
    	board.setNo(Integer.parseInt(request.getParameter("no")));
    	board.setTitle(request.getParameter("title"));
    	board.setContent(request.getParameter("content"));
    	
    	System.out.println(board);
    	
    	result = new BoardService().save(board);
    	
    	if( result > 0) {
    		request.setAttribute("msg", "게시글 수정 성공");
    	} else {
    		request.setAttribute("msg", "게시글 수정 실패");
    	}
    	
    	request.setAttribute("location", "/nboard/view?no=" + board.getNo());
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}

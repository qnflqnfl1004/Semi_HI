package com.anmozilla.mvc.board.nboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.board.nboard.model.service.BoardService;

@WebServlet(name = "nboardDeleteServlet", urlPatterns = { "/nboard/delete" })
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	int no = Integer.parseInt(request.getParameter("no"));
    	
    	System.out.println("게시글 번호 : " + no);
    	
    	result = new BoardService().delete(no);
    	
    	if(result > 0) {
    		request.setAttribute("msg", "게시글 삭제 성공");
    		request.setAttribute("location", "/nboard/list");
    	} else {
    		request.setAttribute("msg", "게시글 삭제 실패");
    		request.setAttribute("location", "/nboard/view?no=" + no);
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
    	
    	

}
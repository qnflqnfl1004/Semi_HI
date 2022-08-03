package com.anmozilla.mvc;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.board.sboard.model.vo.Board;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeServlet() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Board> list = new ArrayList<Board>();

    	list = new BoardService().getMyStudyAll();
		
    	for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
    	
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);

	}

}

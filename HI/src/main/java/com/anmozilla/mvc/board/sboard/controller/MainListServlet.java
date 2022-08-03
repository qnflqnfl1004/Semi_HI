package com.anmozilla.mvc.board.sboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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


@WebServlet("/main/sboard")
public class MainListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MainListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Board> list = new ArrayList<Board>();

    	list = new BoardService().getMyStudyAll();
		
    	for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
    	
		request.setAttribute("list", list);
		request.getRequestDispatcher("/").forward(request, response);
		
	}

}

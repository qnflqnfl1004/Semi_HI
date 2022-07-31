package com.anmozilla.mvc.board.nboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.board.nboard.model.service.BoardService;
import com.anmozilla.mvc.board.nboard.model.vo.Board;
import com.anmozilla.mvc.common.util.PageInfo;

@WebServlet("/nboard/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Board> list = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
		}
    	
    	listCount = new BoardService().getBoardCount();
    	pageInfo = new PageInfo(page, 5, listCount, 10);
    	list = new BoardService().getBoardList(pageInfo);
    	
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/nboard/list.jsp").forward(request, response);
    	
	}


}

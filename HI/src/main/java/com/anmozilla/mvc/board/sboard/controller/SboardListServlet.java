package com.anmozilla.mvc.board.sboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.member.model.vo.Member;
import com.anmozilla.mvc.board.sboard.ChageKeywordUtil;
import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.board.sboard.model.vo.Board;
import com.anmozilla.mvc.common.util.PageInfo;

@WebServlet("/admin/sboardList")
public class SboardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SboardListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	String msg = "";
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	
    	String getQuery = ChageKeywordUtil.getQuery();//기본구문
    	
    	//두 키워드가 넘어올 경우만
    	if(request.getParameter("searchLang") != null && request.getParameter("searchTest") != null) {
    		int searchLang = Integer.parseInt(request.getParameter("searchLang"));
    		int searchTest = Integer.parseInt(request.getParameter("searchTest"));  

    		getQuery = ChageKeywordUtil.getQuery(searchLang, searchTest); //수정구문
    	}
    	List<Board> list = new ArrayList<Board>();
		
    	if(loginMember != null && loginMember.getId().equals("admin")) {
			try {
	    		page = Integer.parseInt(request.getParameter("page"));
	    	} catch (NumberFormatException e) {
				page = 1;
			}
	    	
	    	listCount = new BoardService().getBoardCount();
	    	pageInfo = new PageInfo(page, 5, listCount, 10);    
			list = new BoardService().selectAllBoard(getQuery);
			System.out.println(list);
		} else {
			msg = "관리자 로그인 후 사용할 수 있습니다.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("/home").forward(request, response);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("/views/admin/sboardList.jsp").forward(request, response);
	}


}

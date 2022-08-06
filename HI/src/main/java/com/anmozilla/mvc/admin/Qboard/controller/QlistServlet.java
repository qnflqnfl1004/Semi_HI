package com.anmozilla.mvc.admin.Qboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.admin.Qboard.model.service.QBoardService;
import com.anmozilla.mvc.admin.Qboard.model.vo.Board;
import com.anmozilla.mvc.common.util.PageInfo;
import com.anmozilla.mvc.member.model.vo.Member;

@WebServlet("/admin/Qlist")
public class QlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QlistServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    
    	    	
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");

		if (loginMember != null) {
			
			int page = 0;
	    	int listCount = 0;
	    	PageInfo pageInfo = null;
	    	List<Board> list = null;
	    	
	    	try {
	    		page= Integer.parseInt(request.getParameter("page"));
	    	} catch(NumberFormatException e) {
	    		page = 1;
	    	}
	    	
	    	listCount = new QBoardService().getBoardCount();  	
	    	pageInfo = new PageInfo(page, 10, listCount, 10); // listcount 게시판에 몇개씩 조회될지 수정하면됨
	    	list = new QBoardService().getBoardList(pageInfo);
	    	
	    	
	    	request.setAttribute("pageInfo", pageInfo);
	    	request.setAttribute("list", list);
			
			
			request.getRequestDispatcher("/views/admin/Qboard/Qlist.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "관리자 로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/home");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
	}
    
    
}

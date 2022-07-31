package com.anmozilla.mvc.board.nboard.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.board.nboard.model.service.BoardService;
import com.anmozilla.mvc.board.nboard.model.vo.Board;

@WebServlet("/nboard/write")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	HttpSession session = request.getSession(false);
//    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
//    	if (loginMember != null) {  
    		request.getRequestDispatcher("/views/nboard/write.jsp").forward(request, response);  
//    	} else {
//    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
//    		request.setAttribute("location", "/");
//    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//    	}
//    	
    	
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
		Board board = null;
    	
    	String title = request.getParameter("title");
    	String writer = request.getParameter("writer");
    	String content = request.getParameter("content");
    	String createDate = request.getParameter("createDate");
    	Date date = null;
    	
    	try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(createDate);
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
    	System.out.println(title);
    	System.out.println(writer);
    	System.out.println(date);
    	System.out.println(content);
    	
//    	HttpSession session = request.getSession(false);
//    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
//    	if (loginMember != null) {  
    		board = new Board();
			
//			board.setWriterNo(loginMember.getNo());
			board.setTitle(title);
			board.setCreateDate(new Date());
			board.setContent(content);
			
    		result = new BoardService().save(board);
    		
    		if(result > 0) {
        		request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/nboard/list");
    		} else {
        		request.setAttribute("msg", "게시글 등록 실패");
        		request.setAttribute("location", "/nboard/list");
    		}
    	
//    	} else {
//    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
//    		request.setAttribute("location", "/");
//    	}
//    	
//    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}

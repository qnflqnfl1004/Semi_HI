package com.anmozilla.mvc.board.sboard.Mcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.board.sboard.model.vo.Board;
import com.anmozilla.mvc.member.model.vo.Member;


@WebServlet("/member/myStudyBox")
public class MyStudyBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyStudyBoxServlet() {
    }

    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  	
    	int userNo = 0;
    	List<Board> myStudyList = null;
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null ) {
    		userNo = loginMember.getNo();
    		myStudyList = new BoardService().getMyStudyAll(userNo);
    	
	    	request.setAttribute("myStudyList", myStudyList);
	    	System.out.println(myStudyList); 
	    	
	    	request.getRequestDispatcher("/views/member/myStudy.jsp").forward(request, response);
    	
    	} else {
			request.setAttribute("msg", "로그인 후 접속해 주세요.");
			request.setAttribute("location", "/");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			request.getRequestDispatcher("/").forward(request, response); 
    	}
    	
    	for (int i = 0; i < myStudyList.size(); i++) {
			System.out.println(myStudyList.get(i));
    	}
    }
}

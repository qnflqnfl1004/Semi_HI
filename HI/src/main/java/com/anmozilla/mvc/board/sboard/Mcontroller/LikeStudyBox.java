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

@WebServlet("/member/likeStudyBox")
public class LikeStudyBox extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikeStudyBox() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int userNo = 0;
    	List<Board> likeStudyList = null;
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null ) {
    		userNo = loginMember.getNo();
    		likeStudyList = new BoardService().getLikeStudyAll(userNo);
    	
	    	request.setAttribute("likeStudyList", likeStudyList);
	    	System.out.println(likeStudyList); 
	    	
	    	request.getRequestDispatcher("/views/member/likeStudy.jsp").forward(request, response);
    	
    	} else {
			request.setAttribute("msg", "로그인 후 접속해 주세요.");
			request.setAttribute("location", "/");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			request.getRequestDispatcher("/").forward(request, response); 
    	}
    	
    	for (int i = 0; i < likeStudyList.size(); i++) {
			System.out.println(likeStudyList.get(i));
    	}

	}


}

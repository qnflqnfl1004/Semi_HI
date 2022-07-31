package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.common.util.PageInfo;
import com.anmozilla.mvc.sboard.model.service.BoardService;

@WebServlet("/member/myStudy")
public class MyStudyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyStudyServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// 페이지 하나에 다 넣으니까 1이라고 고정해도 될듯?
    	// 작성한 스터디가 10개는 넘지 않을 것 같으니 한 줄에 3개씩 하고
    	// 행도 3줄이면 괜찮을듯??
    	
    	// 한 페이지에 다 보이게 하려면 pageInfo 사용 안해도 된다 !
    	// 개발 초기 단계에는 그러고 나중에 보안하며서 페이징 적용해도 됨 !
//    	int page = 0;
    	
//    	int myStudyCount = 0;
//    	PageInfo myPageInfo = null;
//    	
//    	
//    	
//    	// 1) 클릭했을 때 페이지  
//    	// 3) 게시물 숫자, DB에서 가져오기
//    	myStudyCount = new BoardService().getBoardCount();
//    	
//    	myPageInfo = new PageInfo(1, 0, myStudyCount, 6);
    	
    	
    	
    	
    	request.getRequestDispatcher("/views/member/myStudy.jsp").forward(request, response);    

	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

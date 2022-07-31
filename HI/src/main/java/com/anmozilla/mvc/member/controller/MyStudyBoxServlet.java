package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.common.util.PageInfo;
import com.anmozilla.mvc.member.model.vo.Member;
import com.anmozilla.mvc.sboard.model.service.BoardService;
import com.anmozilla.mvc.sboard.model.vo.Board;


// 게시물 리스트랑 뷰를 합쳐야 할 것 같은데 .....
@WebServlet("/member/myStudyBox")
public class MyStudyBoxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyStudyBoxServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	int userNo = 0;
////    	int page = 0;
////    	int listCount = 0;
//    	Board myStudy = null;
////    	PageInfo pageInfo = null;
////    	List<Board> myStudyList = null; // jsp 에서 <c:if test="${ empty myStudyList }">
//    	
//    	HttpSession session = request.getSession(false);
//    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
//    	
//    	userNo = loginMember.getNo();
////    	listCount = new BoardService().getBoardCountByNo(userNo);
//    	
////    	pageInfo = new PageInfo(page, 1, listCount, 3);
////    	myStudyList = new BoardService().getMyStudyList(pageInfo);
//    	myStudy = new BoardService().getMyStudyByNo(userNo);
//    	
//    	// 세션에 저장된 회원 번호로 작성자 번호
//    	
////    	myStudyList = new BoardService().getBoardByNo(userNo);
//    	request.setAttribute("pageInfo", pageInfo);
//    	request.setAttribute("myStudyList", myStudyList);
//    	
////    	myStudy = new BoardService().getBoardByNo(userNo);
////    	request.setAttribute("myStudy", myStudy);
//    	
//    	request.getRequestDispatcher("/views/member/studyBox.jsp").forward(request, response);   
    	
    	// 상세페이지 느낌??
//    	int userNo = 0;
//    	Board myStudy = null;
//
//    	HttpSession session = request.getSession(false);
//    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
//
//    	userNo = loginMember.getNo();
//
//    	myStudy = new BoardService().getMyStudyByNo(userNo);
    	
    	// List 만들어서 목록??
//    	int userNo = 0;
//    	List<Board> myStudyList = null;
//   
//    	HttpSession session = request.getSession(false);
//    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
//    	
//    	userNo = loginMember.getNo();
//    	myStudyList = new BoardService().getMyStudyByNo(userNo);
//    	
//    	request.setAttribute("myStudyList", myStudyList);
//    	request.setAttribute("userNo", userNo);
//    	request.getRequestDispatcher("/views/member/studyBox.jsp").forward(request, response);
    	
    	
    	
    	
    	// List 만들어서 목록 >> loginMember 없이 해보기
    	int userNo = 0;
    	List<Board> myStudyList = null;
    	
//    	HttpSession session = request.getSession(false);
//    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
//    	userNo = loginMember.getNo();
    	myStudyList = new BoardService().getMyStudyByNo();
    	
    	request.setAttribute("myStudyList", myStudyList);
//    	request.setAttribute("userNo", userNo);
    	request.getRequestDispatcher("/views/member/studyBox.jsp").forward(request, response);
	}

}

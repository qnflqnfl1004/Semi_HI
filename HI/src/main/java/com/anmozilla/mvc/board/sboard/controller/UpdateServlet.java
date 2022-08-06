package com.anmozilla.mvc.board.sboard.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.board.sboard.model.service.BoardService;
import com.anmozilla.mvc.board.sboard.model.vo.Board;
import com.anmozilla.mvc.board.sboard.model.vo.Language;
import com.anmozilla.mvc.board.sboard.model.vo.Test;
import com.anmozilla.mvc.member.model.vo.Member;

@WebServlet("/sboard/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		int no = Integer.parseInt(request.getParameter("no"));
		String msg = "";
    	if(loginMember != null) {
    	
	    	System.out.println("no: "+ no);
	    	Board board = new BoardService().getsBoardByNo(no);
	    	System.out.println(board);
	    	request.setAttribute("board", board);
	    	request.getRequestDispatcher("/views/board/sboard/update.jsp").forward(request, response);
    	
    	} else {
    		msg = "로그인이 필요합니다.";
    	}
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	int result = 0;
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		String msg = "";
		int no = Integer.parseInt(request.getParameter("no"));
    	
    	if(loginMember != null) {
			int langNo = Integer.parseInt(request.getParameter("langNo"));
			int testNo = Integer.parseInt(request.getParameter("testNo"));
			String sMember = request.getParameter("sMember");
			String _sDueDate = request.getParameter("sDueDate");
			Date sDueDate = null;
			String _sDate =  request.getParameter("sDate");
			Date sDate = null;
			try {
				sDueDate = new SimpleDateFormat("yyyy-MM-dd").parse(_sDueDate);
				sDate = new SimpleDateFormat("yyyy-MM-dd").parse(_sDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println(sDueDate);
			System.out.println(sDate);
			String sPeriod = request.getParameter("sPeriod");
			String sContact = request.getParameter("sContact");
			String sLevel = request.getParameter("sLevel");
			String sTitle = request.getParameter("sTitle");
			String sContent = request.getParameter("sContent");
			
			Board board = new Board();
			board.setSNo(no);
			board.setMember(loginMember);
			Language language = new Language();
			language.setLNo(langNo);
			board.setLanguage(language);
			
			Test test = new Test();
			test.setTestNo(testNo);
			board.setTest(test);
			
			board.setSMember(sMember);
			board.setSDueDate(sDueDate);
			board.setSDate(sDate);
			board.setSPeriod(sPeriod);
			board.setSContact(sContact);
			board.setSLevel(sLevel);
			board.setSTitle(sTitle);
			board.setSContent(sContent);
			
			System.out.println(board);
			int result = new BoardService().updateStudy(board);
			if(result > 0) {
				request.setAttribute("msg", "게시글 수정 완료");
				request.setAttribute("location", "/sboard/view?no=" + no);
			} else {
				request.setAttribute("msg", "게시글 수정 실패");
				request.setAttribute("location", "/sboard/view?no=" + no);
					
			}
		} else {
			msg = "로그인 후 사용할 수 있습니다.";

		}
			System.out.println(msg);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			if(result > 0) {
//				msg = "게시글 수정 성공";
//			} else {
//				msg = "게시글 수정 실패";
//			}
//		} else {
//			msg = "로그인 후 사용할 수 있습니다.";
//			request.setAttribute("msg", msg);
//			request.getRequestDispatcher("/").forward(request, response);
//
//		}
//		request.getSession().setAttribute("msg", msg);
//		System.out.println(msg);
//		response.sendRedirect(request.getContextPath() + "/");
	}
}

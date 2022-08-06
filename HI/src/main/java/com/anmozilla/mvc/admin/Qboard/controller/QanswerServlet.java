package com.anmozilla.mvc.admin.Qboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.admin.Qboard.model.service.QBoardService;
import com.anmozilla.mvc.admin.Qboard.model.vo.Board;
import com.anmozilla.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/admin/Qanswer")
public class QanswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QanswerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board board = null;
		int no = Integer.parseInt(request.getParameter("no"));
		board = new QBoardService().getBoardByNo(no);
		
		
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("/views/admin/Qboard/Qanswer.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Board board = null;
		// 경로 설정
		String path = getServletContext().getRealPath("/resources/upload/Qboard");
		  // 크기 설정
		int maxSize = 10485760;
				// 인코딩 설정
		String encoding = "UTF-8";
				
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
				
		System.out.println(mr.getParameter("no"));
		
		board = new Board();
		
		board.setNo(Integer.parseInt(mr.getParameter("no")));
		board.setTitle(mr.getParameter("title"));
        board.setWriterId(mr.getParameter("writer"));
        board.setContent(mr.getParameter("cont"));
        
    
       board.setOriginalFileName(mr.getParameter("originalFileName"));
       board.setRenamedFileName(mr.getParameter("renamedFileName"));
        
        
        result = new QBoardService().save(board);
        
        
        
        if(result > 0) {
            request.setAttribute("msg", "게시글 답변 성공");
        } else {
          request.setAttribute("msg", "게시글 답변 실패");
        }
          request.setAttribute("location", "/home");
          request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}

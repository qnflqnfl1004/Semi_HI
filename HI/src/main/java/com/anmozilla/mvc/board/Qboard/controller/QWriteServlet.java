package com.anmozilla.mvc.board.Qboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anmozilla.mvc.board.Qboard.model.service.QboardService;
import com.anmozilla.mvc.board.Qboard.model.vo.Qboard;
import com.anmozilla.mvc.common.util.FileRename;
import com.anmozilla.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/Qboard/write")
public class QWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QWriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");

		if (loginMember != null) {
			request.getRequestDispatcher("/views/board/Qboard/write.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}

	}
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
		Qboard qboard = null;
		
		// 경로 설정
		String path = getServletContext().getRealPath("/resources/upload/Qboard");
    	// 크기 설정
		int maxSize = 10485760;
		// 인코딩 설정
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
		// 폼 파라미터로 넘어온 값들
		String reason = mr.getParameter("reason");
		String title = mr.getParameter("title");
		String email = mr.getParameter("email");
		String content = mr.getParameter("content");
		
		String filesystemName = mr.getFilesystemName("upfile");
		String OriginalFileName = mr.getOriginalFileName("upfile");
		
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if (loginMember != null) {
			qboard = new Qboard();
			
			qboard.setNo(loginMember.getNo());
			qboard.setReason(reason);
			qboard.setTitle(title);
			qboard.setContent(content);
			qboard.setOriginalFileName(OriginalFileName);
			qboard.setRenamedFileName(filesystemName);
			
			result = new QboardService().save(qboard);
			
			if(result >0) {
				request.setAttribute("msg", "게시글 등록 성공");
				request.setAttribute("location", "/");
			} else {
				request.setAttribute("msg", "게시글 등록 실패");
				request.setAttribute("location", "/");
				
			}
			
		} else {
			request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
}

package com.anmozilla.mvc.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.common.util.PageInfo;
import com.anmozilla.mvc.member.model.service.MemberService;
import com.anmozilla.mvc.member.model.vo.Member;

@WebServlet("/admin/memberSearch")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		List<Member> list = null;
		PageInfo pageInfo = null;
		String searchOption = request.getParameter("searchOption");
		String searchWord = request.getParameter("searchWord");
		String sOption = "";
		String sWord = "";
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
		}
		
		if(searchOption != null && !searchOption.equals(""))
			sOption = searchOption;
		
		if(searchWord != null && !searchWord.equals(""))
			sWord = searchWord;
		
		listCount = new MemberService().getMemberSearchCount(searchOption, searchWord);
		pageInfo = new PageInfo(page, 10, listCount, 10);

		System.out.println("페이지" + page);
		System.out.println("리스트카운트" + listCount);
		
		list = new MemberService().searchMemberList(sOption, sWord , pageInfo);
		System.out.println("리스트" + list);
		System.out.println("현재페이지" + pageInfo.getCurrentPage());
		System.out.println("마지막페이지" + pageInfo.getEndPage());
		System.out.println("처음페이지" + pageInfo.getStartPage());
		System.out.println("다음페이지" + pageInfo.getNextPage());
		System.out.println("이전페이지" + pageInfo.getPrevPage());
		
		request.setAttribute("list", list);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("/views/admin/memberlist.jsp").forward(request, response);
	
	}

}

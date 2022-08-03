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


@WebServlet("/admin/memberList")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListServlet() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 0;
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Member> list = null;
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
		}
		
		listCount = new MemberService().getMemberCount();
		pageInfo = new PageInfo(page, 10, listCount, 10);
		list = new MemberService().getMemberList(pageInfo);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/memberlist.jsp").forward(request, response);
	
	}
	

}

package com.anmozilla.mvc.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
		String searchOption = request.getParameter("searchOption");
		String searchWord = request.getParameter("searchWord");
		
		try {
			page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
		}
		
		if (searchOption != null && !searchOption.equals("")) {
				if(searchOption.equals("mem_warning")) {
//			List<Member> findMember  = list.stream()
//									.filter(member -> member.getWarning() == Integer.parseInt(request.getParameter("searchWord")))
//									.collect(Collectors.toList());
	
				listCount = new MemberService().getMemberSearchCount(searchOption, searchWord);
				pageInfo = new PageInfo(page, 10, listCount, 10);
				System.out.println("리스트카운트:" + listCount);
				list = new MemberService().searchMemberList(searchOption, searchWord , pageInfo);
				System.out.println("경고횟수 검색결과 : " + list);
			} else if(searchOption.equals("mem_id")) {
				listCount = new MemberService().getMemberSearchCount(searchOption, searchWord);
				pageInfo = new PageInfo(page, 10, listCount, 10);
				list = new MemberService().searchMemberList(searchOption, searchWord , pageInfo);
				System.out.println("아이디 검색결과 : " + list);
			} else if(searchOption.equals("mem_nickname")) {
				listCount = new MemberService().getMemberSearchCount(searchOption, searchWord);
				pageInfo = new PageInfo(page, 10, listCount, 10);
				list = new MemberService().searchMemberList(searchOption, searchWord , pageInfo);
				System.out.println("닉네임 검색결과 : " + list);
			} else if(searchOption.equals("mem_email")) {
				listCount = new MemberService().getMemberSearchCount(searchOption, searchWord);
				pageInfo = new PageInfo(page, 10, listCount, 10);
				list = new MemberService().searchMemberList(searchOption, searchWord , pageInfo);
				System.out.println("이메일 검색결과 : " + list);
			} else if(searchOption.equals("mem_phone")) {
				listCount = new MemberService().getMemberSearchCount(searchOption, searchWord);
				pageInfo = new PageInfo(page, 10, listCount, 10);
				list = new MemberService().searchMemberList(searchOption, searchWord , pageInfo);
				System.out.println("전화번호 검색결과 : " + list);
			} 
				
		} else {
			listCount = new MemberService().getMemberCount();
			pageInfo = new PageInfo(page, 10, listCount, 10);
			list = new MemberService().getMemberList(pageInfo);
		}
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/memberlist.jsp").forward(request, response);
	
	}
	

}

package com.anmozilla.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anmozilla.mvc.member.model.service.MemberService;
import com.google.gson.Gson;

@WebServlet("/member/nickCheck")
public class NickCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NickCheckServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Map<String, Boolean> map = new HashMap<>();
    	String userNick = request.getParameter("userNick");

    	map.put("duplicate", new MemberService().isDuplicateNick(userNick));
    	
    	response.setContentType("application/json;charset=UTF-8");
    	
    	new Gson().toJson(map, response.getWriter());
	}

}

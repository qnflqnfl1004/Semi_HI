package com.anmozilla.mvc.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.anmozilla.mvc.common.util.EncryptUtil;

public class EncryptPasswordWrapper extends HttpServletRequestWrapper {

	public EncryptPasswordWrapper(HttpServletRequest request) {
		super(request);
	}
	
	// HttpServletRequest에서 재정의하고 싶은 메소드(getParameter)를 작성한다. 
	@Override
	public String getParameter(String name) {
		String value = "";
		
		// Client가 전달하는 값 중에 userPwd 값만 암호화 처리하고 나머지는 정상적으로 반환하도록 구현
		if(name.equals("userPwd") || name.equals("newPwd") || name.equals("newPwdCheck")) {
			// 암호화 처리
			value = EncryptUtil.oneWayEnc(super.getParameter(name), "SHA-256");
		} else {
			// 정상적으로 반환한다.
			value = super.getParameter(name);
		}
		
		return value;
	}
	
}
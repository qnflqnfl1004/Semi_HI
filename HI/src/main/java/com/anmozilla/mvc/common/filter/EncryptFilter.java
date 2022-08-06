package com.anmozilla.mvc.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import com.anmozilla.mvc.common.wrapper.EncryptPasswordWrapper;

@WebFilter(filterName = "encrypt", servletNames = {"enroll", "login", "updatePwd", "myPage", "myPagePwdCheck", "updateUserInfo"})
public class EncryptFilter extends HttpFilter implements Filter {
       
    public EncryptFilter() {
    }

    @Override
	public void destroy() {
	}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	EncryptPasswordWrapper wrapper = new EncryptPasswordWrapper((HttpServletRequest)request);
    	
    	System.out.println("필터");
		chain.doFilter(wrapper, response);
	}

    @Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
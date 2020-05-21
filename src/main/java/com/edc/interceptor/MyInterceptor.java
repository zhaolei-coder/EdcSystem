package com.edc.interceptor;

import com.edc.entity.Admin;
import com.edc.entity.Buyer;
import com.edc.entity.Seller;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MyInterceptor implements HandlerInterceptor {
	private List<String> list;

	public void setList(List<String> list) {
		this.list = list;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
		String uri = request.getRequestURI();
		String name = request.getParameter("userName");
		String inputCode = request.getParameter("inputCode");
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		Seller seller = (Seller) request.getSession().getAttribute("seller");
		Buyer buyer = (Buyer) request.getSession().getAttribute("prev");
		if (buyer != null) {
			return true;
		}
		if (seller != null) {
			return true;
		}
		if (name != null) {
			return true;
		}
		if (admin != null) {
			return true;
		}
		if (inputCode != null) {
			return true;
		}
		for (String s : list) {
			if (uri.endsWith(s)) {
				return true;
			}
		}

		response.sendRedirect("login.do");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object o, Exception e) throws Exception {

	}
}

package com.hotel.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.po.AdminUser;

public class AdminLoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp,
			Object arg2) throws Exception {
		
		String url=req.getRequestURI();
		if(url.indexOf("login")>=0){
			return true;
		}
		AdminUser adminUser=(AdminUser) req.getSession().getAttribute("adminUser");
		if(adminUser!=null){
			return true;
		}
		
		//resp.sendRedirect("/WEB-INF/views/admin/login.jsp");
		//resp.sendRedirect(req.getContextPath()+"/admin/initLogin");
		req.getRequestDispatcher("/WEB-INF/views/admin/login.jsp").forward(req, resp);
		return false;
	}

}

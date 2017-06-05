package com.hotel.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.po.User;

public class UserLoginInterceptor implements HandlerInterceptor{

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
		String[] pass=new String[]{"initPay"};
		String url=req.getRequestURI();
		User user=(User) req.getSession().getAttribute("user");
		for (String s:pass) {
			if(url.indexOf(s)>=0){
				if(user==null){
					req.getRequestDispatcher("/WEB-INF/views/index/loginIndex.jsp").forward(req, resp);
					return false;
				}else{
					return true;
				}
				
			}
		}
		
		
		return true;
	}

}

package cn.javavi.blog.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.javavi.blog.po.User;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(" LoginInterceptor...preHandle");
		String url=request.getRequestURI();
		if(url.indexOf("admin")>=0) {
			if(url.indexOf("login.")>=0)
				return true;
				else 
				{
					HttpSession session = request.getSession();
					User user =(User) session.getAttribute("loginUser");
					if(user==null)
					{
						request.getRequestDispatcher("/WEB-INF/page/admin/login.jsp").forward(request, response);
						return false;
					}
						
				}
		}
			
		return true;

		
	}
	
	@Override
	public  void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
		
		System.out.println("LoginInterceptor...postHandle");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
		
		System.out.println("LoginInterceptor...afterCompletion");
	}
}

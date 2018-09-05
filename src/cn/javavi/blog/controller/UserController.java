package cn.javavi.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import cn.javavi.blog.po.User;
import cn.javavi.blog.service.UserService;


@Controller
@RequestMapping("/admin")
public class UserController {
	
	
		
		@Autowired
		private UserService userService;
		
		@RequestMapping("/loginTest.action")
		public String loginTest( Model model,String id,String password)throws Exception {
			// TODO Auto-generated method stub
			
			if(StringUtils.isEmpty(id)||StringUtils.isEmpty(password))
				return "admin/login";
			
			User user=userService.findUserById(id);
			
			model.addAttribute(user);
			
			if(password.equals(user.getPassword()))
				return "admin/index";
			else
				return "admin/login";
			
			
			
			
		}
		
		@RequestMapping("/index.action")
		public String index() {
			
			return "admin/index";
		}
		
		@RequestMapping("/login.action")
		public String login() {
			
			return "admin/login";
		}
		
		@RequestMapping("/logout.action")
		public String logout(HttpSession session) {
			
			session.removeAttribute("loginUser");
			return "admin/login";
		}
		
		
		
		@RequestMapping("/login.json")
		@ResponseBody
		public String loginTest(HttpSession session ,HttpServletRequest request)throws Exception {
			// TODO Auto-generated method stub
			
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			
			
			if(StringUtils.isEmpty(id)||StringUtils.isEmpty(password))
			return "999";
			
				
			
			User user=userService.findUserById(id);
			
			
			if(!password.equals(user.getPassword()))
			return "111";
			
				session.setAttribute("loginUser", user);
				return "0";
		
				
			
			
			
			
		}
		
		

}

package cn.javavi.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.javavi.blog.po.Type;
import cn.javavi.blog.service.TypeService;



@Controller
@RequestMapping("/admin")
public class TypeController {
	
	
		
		@Autowired
		private TypeService typeService;
		
		@RequestMapping("/typeList.action")
		public String loginTest( Model model,String id,String password)throws Exception {
			// TODO Auto-generated method stub
			
			
			List<Type> typeList= typeService.findTypeList();
			
			model.addAttribute(typeList);
			
			return "admin/typeList";
			
			
			
			
		}
		
		
		@RequestMapping("/typeSave.json")
		@ResponseBody
		public String typeSave(HttpServletRequest request,String[] idArr,String[] nameArr,String[] sortArr)throws Exception {
			
			
			typeService.typeSave(idArr,nameArr,sortArr);
			
			
			
			return "0";
		}
		
		@RequestMapping("/typeDelete.json")
		@ResponseBody
		public String typeDelete(HttpServletRequest request,String[] idCheckArr)throws Exception {
			
			
			typeService.deleteType(idCheckArr);
			
			
			
			return "0";
		}
		
		

}

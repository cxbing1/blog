package cn.javavi.blog.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.javavi.blog.json.Result;
import cn.javavi.blog.po.Article;
import cn.javavi.blog.po.AtQueryVo;
import cn.javavi.blog.po.Type;
import cn.javavi.blog.service.ArticleService;
import cn.javavi.blog.service.TypeService;




@Controller
@RequestMapping("/portal")
public class PortalController {
	
	
		
		@Autowired
		private ArticleService articleService;
		@Autowired
		private TypeService typeService;
		
		@RequestMapping("/articleList.action")
		public String articList( Model model,
				@RequestParam(value="pageNum", defaultValue="1") int pageNum,
				@RequestParam(value="pageSize", defaultValue="5") int pageSize,
				String title,String typeId,String startDate,String endDate)throws Exception {
			// TODO Auto-generated method stub
			
			
			List<Type> typeList = typeService.findTypeList();
			
			Map<String,String> param =  new HashMap<String,String>();
			param.put("title",title);
			param.put("typeId", typeId);
			param.put("startDate", startDate);
			param.put("endDate", endDate);
			param.put("order", "1");
			
			PageHelper.startPage(pageNum, pageSize);
			List<AtQueryVo> searchQueryVoList = articleService.searchQueryVoList(param);
		//	List<AtQueryVo> atQueryVoList= articleService.findAtQueryVoList();
			PageInfo<AtQueryVo> pageInfo = new PageInfo<>(searchQueryVoList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("typeList", typeList);
			model.addAttribute("param", param);
			
			param.put("order", "3");
			List<AtQueryVo> articleByView = articleService.searchQueryVoList(param);
			model.addAttribute("articleByView", articleByView);
			
			return "portal/articleList";
			
			
			
			}
		
		@RequestMapping("/index.action")
		public String index( Model model)throws Exception {
			// TODO Auto-generated method stub
			
			
			List<Type> typeList = typeService.findTypeList();
			model.addAttribute("typeList", typeList);
			
			Map<String,String> param = new HashMap<String,String>();
			String order = "1";
			param.put("order", order);
			
			List<AtQueryVo> atQueryVoList = articleService.searchQueryVoList(param);
		//	List<AtQueryVo> atQueryVoList= articleService.findAtQueryVoList();
			
			model.addAttribute("atQueryVoList", atQueryVoList);
			
			
			
			return "portal/index";
			
			
			
			}
		
		
		@RequestMapping("/articleContent.action")
		public String articleContent( Model model,String id)throws Exception {
			// TODO Auto-generated method stub
			
			Article article = articleService.findArticleById(id);

			article.setViewCount(article.getViewCount()+1);
			articleService.updateArticle(article);
			
			AtQueryVo atQueryVo = articleService.findAtQueryVoById(id);
			
			model.addAttribute("atQueryVo", atQueryVo);
			
			
			Map<String,String> param =  new HashMap<String,String>();
			param.put("order", "3");
			List<AtQueryVo> articleByView = articleService.searchQueryVoList(param);
			model.addAttribute("articleByView", articleByView);
			
			return "portal/articleContent";
			
			
			
			}
		
		@RequestMapping("/aboutMe.action")
		public String aboutMe()throws Exception {
			// TODO Auto-generated method stub
				
			
			return "portal/aboutMe";
			
			
			
			}
		
				
		
		
		

}

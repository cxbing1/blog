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
@RequestMapping("/admin")
public class ArticleController {
	
	
		
		@Autowired
		private ArticleService articleService;
		@Autowired
		private TypeService typeService;
		
		@RequestMapping("/articleList.action")
		public String articleList( Model model,
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
			
			return "admin/articleList";
			
			
			
			
		}
		
		@RequestMapping("/recycleBin.action")
		public String recycleBin(Model model)throws Exception {
			
			List<Article> articleRecycleList =articleService.findArticleRecycle(); 
			model.addAttribute("articleRecycleList",articleRecycleList);
			return "admin/recycleBin";
			
		}
		
		@RequestMapping("/editArticle.action")
		public String editArticle( Model model,String id)throws Exception {
			// TODO Auto-generated method stub
			
			List<Type> typeList= typeService.findTypeList();
			if(!StringUtils.isEmpty(id))
			{
				Article article =articleService.findArticleById(id);
				
				model.addAttribute(article);
			}
			model.addAttribute(typeList);
			
			return "admin/editArticle";
			
			
			
			
		}
		
		
		@RequestMapping("/upload.json")
		@ResponseBody
		public Result imageUpload(MultipartFile file)throws Exception {
			
			String originalFilename=file.getOriginalFilename();
			if(file!=null&&originalFilename!=null&&originalFilename.length()>0) {
				
				String pic_path="E:\\upload\\";
				//原始名称
				
				
				//新图片名称
				String newFileName=UUID.randomUUID()+originalFilename;
				
				//新图片
				File newFile =new File(pic_path+newFileName);
				
				file.transferTo(newFile);
				
				return Result.success().add("imgUrl",newFileName);
			}
			
			
				
				return Result.error("图片为空");
				
		}
		
		@RequestMapping("/articleSave.json")
		@ResponseBody
		public Result articleSave(Article article) {
			
			String id=article.getId();
			if(StringUtils.isEmpty(id) ){
				//新增文章
					articleService.insertArticle(article);
					
			}
			
			
			else {
				//更新文章
				articleService.updateArticle(article);
			}
			
			return Result.success();
			
			
			
		}
		
		@RequestMapping("/articleDelete.json")
		@ResponseBody
		public Result articleDelete(String[] idArr) {
			
			
			
			articleService.batchDeleteArticle(idArr);
			
			Result result =Result.success();
			result.setMessage("成功删除！");
			
			return result;
			
			
			
		}
		
		@RequestMapping("/articleRecycle.json")
		@ResponseBody
		public Result articleRecycle(String[] idArr) {
						
			articleService.articleRecycle(idArr);
			
			Result result =Result.success();
			result.setMessage("成功删除至回收站！");
			
			return result;	
			
		}
		
		@RequestMapping("/articleRecovery.json")
		@ResponseBody
		public Result articleRecovery(String[] idArr) {
						
			articleService.articleRecovery(idArr);
			
			Result result =Result.success();
			result.setMessage("成功还原！");
			
			return result;		
			
		}
		
		
		
		@RequestMapping("/articleSearch.action")
		
		public String articleSearch(String title,Model model) {
						
			List<AtQueryVo> atQueryVoList=articleService.articleSearch(title);
			
			model.addAttribute(atQueryVoList);
			
			return "admin/articleList";	
			
		}
		
		
		
		
		

}

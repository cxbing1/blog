package cn.javavi.blog.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import cn.javavi.blog.mapper.ArticleMapper;
import cn.javavi.blog.mapper.AtQueryVoMapper;
import cn.javavi.blog.mapper.TypeMapper;
import cn.javavi.blog.po.Article;
import cn.javavi.blog.po.AtQueryVo;
import cn.javavi.blog.po.Type;
import cn.javavi.blog.service.ArticleService;
import cn.javavi.blog.service.TypeService;


public class ArticleServiceImpl implements ArticleService{

	@Autowired
	private ArticleMapper articleMapper;
	
	@Autowired
	private AtQueryVoMapper atQueryVoMapper;
	

	@Override
	public List<Article> findArticleList() {
		// TODO Auto-generated method stub
		
		List<Article> articleList=articleMapper.findArticleList();
		return articleList ;
	}

	@Override
	public Article findArticleById(String id) {
		// TODO Auto-generated method stub
		
		Article article = articleMapper.findArticleById(id);
		return article;
	}

	@Override
	public void insertArticle(Article article) {
		// TODO Auto-generated method stub
		articleMapper.insertArticle(article);
		
	}

	@Override
	public List<AtQueryVo> findAtQueryVoList() {
		// TODO Auto-generated method stub
		List<AtQueryVo> atQueryList =atQueryVoMapper.findArticleList();
		return atQueryList;
	}

	@Override
	public void updateArticle(Article article) {
		// TODO Auto-generated method stub
		
		articleMapper.updateArticle(article);
		
	}

	@Override
	public void batchDeleteArticle(String[] idArr) {
		// TODO Auto-generated method stub
		for(int i=0;i<idArr.length;i++)
			articleMapper.deleteArticle(idArr[i]);
		
	}

	@Override
	public List<Article> findArticleRecycle() {
		// TODO Auto-generated method stub
		List<Article> articleRecycle=articleMapper.findArticleRecycle();
		return articleRecycle;
	}

	@Override
	public void articleRecycle(String[] idArr) {
		// TODO Auto-generated method stub
		for(int i=0;i<idArr.length;i++) {					
			articleMapper.updateArticleRecycle(idArr[i]);
		}
		
	}

	@Override
	public void articleRecovery(String[] idArr) {
		// TODO Auto-generated method stub
		for(int i=0;i<idArr.length;i++)
			articleMapper.updateArticleRecovery(idArr[i]);
	}

	@Override
	public List<AtQueryVo> articleSearch(String title) {
		// TODO Auto-generated method stub
		
		List<AtQueryVo> atQueryVoList = atQueryVoMapper.findArticleByTitle(title);
		return null;
	}

	@Override
	public List<AtQueryVo> searchQueryVoList(Map<String, String> param) {
		// TODO Auto-generated method stub
		List<AtQueryVo> searchQueryVoList = atQueryVoMapper.searchQueryVoList(param);
		return searchQueryVoList;
	}

	@Override
	public AtQueryVo findAtQueryVoById(String id) {
		// TODO Auto-generated method stub
		
		AtQueryVo atQueryVo = atQueryVoMapper.findAtQueryVoById(id);
		return atQueryVo;
	}
	
	

	
	

	
	
	

}

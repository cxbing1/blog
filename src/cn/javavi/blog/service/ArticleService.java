package cn.javavi.blog.service;

import java.util.List;
import java.util.Map;

import cn.javavi.blog.po.Article;
import cn.javavi.blog.po.AtQueryVo;




public interface ArticleService {
	
	
	public List<Article> findArticleList();

	public Article findArticleById(String id);

	public void insertArticle(Article article);
	
	public List<AtQueryVo> findAtQueryVoList();

	public void updateArticle(Article article);

	public void batchDeleteArticle(String[] idArr);

	public List<Article> findArticleRecycle();

	public void articleRecycle(String[] idArr);
	
	public void articleRecovery(String[] idArr);

	public List<AtQueryVo> articleSearch(String title);

	public List<AtQueryVo> searchQueryVoList(Map<String, String> param);

	public AtQueryVo findAtQueryVoById(String id);

	
	
		
		

}

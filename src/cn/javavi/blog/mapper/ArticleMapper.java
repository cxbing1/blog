package cn.javavi.blog.mapper;

import java.util.List;

import cn.javavi.blog.po.Article;




public interface ArticleMapper {
	
	public List<Article> findArticleList();

	public Article findArticleById(String id);

	public void insertArticle(Article article);
	public void updateArticle(Article article);

	public void deleteArticle(String id);

	public List<Article> findArticleRecycle();
	
	public void updateArticleRecycle(String id);
	
	public void updateArticleRecovery(String id);

	//public void updateType(Type type);

	//public Type findTypeById(String id);

	//public void insertType(Type type);


	//public void deleteType(String id);

	

}

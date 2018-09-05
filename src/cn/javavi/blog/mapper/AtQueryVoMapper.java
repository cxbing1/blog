package cn.javavi.blog.mapper;

import java.util.List;
import java.util.Map;

import cn.javavi.blog.po.Article;
import cn.javavi.blog.po.AtQueryVo;




public interface AtQueryVoMapper {
	
	public List<AtQueryVo> findArticleList();

	public List<AtQueryVo> findArticleByTitle(String title);

	public List<AtQueryVo> searchQueryVoList(Map<String, String> param);

	public AtQueryVo findAtQueryVoById(String id);


	//public void updateType(Type type);

	//public Type findTypeById(String id);

	//public void insertType(Type type);


	//public void deleteType(String id);

	

}

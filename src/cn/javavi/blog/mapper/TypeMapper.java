package cn.javavi.blog.mapper;

import java.util.List;

import cn.javavi.blog.po.Type;


public interface TypeMapper {
	
	public List<Type> findTypeList();

	public void updateType(Type type);

	public Type findTypeById(String id);

	public void insertType(Type type);


	public void deleteType(String id);

	

}

package cn.javavi.blog.service;

import java.util.List;

import cn.javavi.blog.po.Type;
import cn.javavi.blog.po.User;


public interface TypeService {
	
	
	public List<Type> findTypeList();

	public void typeSave(String[] idArr, String[] nameArr, String[] sortArr);


	public void deleteType(String[] idCheckArr);
		
		

}

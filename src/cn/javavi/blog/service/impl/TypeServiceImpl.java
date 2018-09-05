package cn.javavi.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import cn.javavi.blog.mapper.TypeMapper;
import cn.javavi.blog.po.Type;
import cn.javavi.blog.service.TypeService;


public class TypeServiceImpl implements TypeService{

	@Autowired
	private TypeMapper typeMapper;

	@Override
	public List<Type> findTypeList() {
		// TODO Auto-generated method stub
		
		List<Type> typeList=typeMapper.findTypeList();
		return typeList;
	}

	@Override
	public void typeSave(String[] idArr, String[] nameArr, String[] sortArr) {
		
		for(int i=0;i<idArr.length;i++)
		{
			//if(StringUtils.isEmpty(idArr[i]))
				
			
			Type type=new Type();
			
			type.setName(nameArr[i]);
			type.setSort(sortArr[i]);
			
			if(idArr[i].equals("on"))
				typeMapper.insertType(type);
			else {
				type.setId(idArr[i]);
				typeMapper.updateType(type);
			}
			
		}	
			
		
	}

	@Override
	public void deleteType(String[] idCheckArr) {
		// TODO Auto-generated method stub
		for(int i=0;i<idCheckArr.length;i++)
			typeMapper.deleteType(idCheckArr[i]);
		
	}
	
	

}

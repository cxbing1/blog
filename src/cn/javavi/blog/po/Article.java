package cn.javavi.blog.po;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Article {
	
	private String id;
	private String title;
	private String cover;
	private Date creatTime;
	private Date updateTime;
	private String typeId;
	private String contentText;
	private String content;
	private int status;
	private int viewCount;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getContentText() {
		return contentText;
	}
	public void setContentText(String contentText) {
		this.contentText = contentText;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	
	public String getDate() {
		SimpleDateFormat bartDateFormat = new SimpleDateFormat
  				("yyyy-MM-dd");
		return bartDateFormat.format(creatTime);
	}
	
	public String getCreatDate() {
		SimpleDateFormat bartDateFormat = new SimpleDateFormat
  				("yyyy-MM-dd HH:mm:SS");
		return bartDateFormat.format(creatTime);
	}
	
	public String getUpdateDate() {
		SimpleDateFormat bartDateFormat = new SimpleDateFormat
  				("yyyy-MM-dd HH:mm:SS");
		return bartDateFormat.format(updateTime);
	}
	
	

}

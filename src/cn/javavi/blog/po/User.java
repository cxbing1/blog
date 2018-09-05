package cn.javavi.blog.po;

public class User {

	private String number;
	private String name;
	private String password;
	private int hisnum;
	
	
	public User() {
		
	}
	public User(String number, String name, String password, int hisnum) {
		
		this.number = number;
		this.name = name;
		this.password = password;
		this.hisnum = hisnum;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getHisnum() {
		return hisnum;
	}
	public void setHisnum(int hisnum) {
		this.hisnum = hisnum;
	}
	@Override
	public String toString() {
		return "User [number=" + number + ", name=" + name + ", password=" + password + ", hisnum=" + hisnum + "]";
	}
	
	
}

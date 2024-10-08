package my.model;

import java.util.Date;

public class Cuser {
	private String CuserId;
	private String password;
	private String name;
	private int year;
	private int month;
	private int day;
	private int phonenum;
	private String sex;
	private Date loginTime;
	
	public Cuser() {}


	public String getCuserId() {
		return CuserId;
	}

	public void setCuserId(String cuserId) {
		CuserId = cuserId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(int phonenum) {
		this.phonenum = phonenum;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public Date getLoginTime() {
		return loginTime;
	}


	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	
	
	
	
	
}

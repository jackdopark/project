package com.project.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("memberDetail")
public class MemberDetailDTO {
	private int mno;
	private Date pchange;
	private Date lastLogin;
	private int dormant;
	private String recommender;
	
	public MemberDetailDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public Date getPchange() {
		return pchange;
	}
	public void setPchange(Date pchange) {
		this.pchange = pchange;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public int getDormant() {
		return dormant;
	}
	public void setDormant(int dormant) {
		this.dormant = dormant;
	}
	public String getRecommender() {
		return recommender;
	}
	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}

	@Override
	public String toString() {
		return "MemberDetailDTO [mno=" + mno + ", pchange=" + pchange + ", lastLogin=" + lastLogin + ", dormant="
				+ dormant + ", recommender=" + recommender + "]";
	}
	
	
	
}

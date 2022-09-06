package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("vip")
public class MemberVipDTO {
	private int vno;
	private String vname;
	public MemberVipDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getVno() {
		return vno;
	}
	public void setVno(int vno) {
		this.vno = vno;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	@Override
	public String toString() {
		return "VipDTO [vno=" + vno + ", vname=" + vname + "]";
	}
}

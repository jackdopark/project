package com.project.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.MemberDTO;
import com.project.mapper.MemberMapper;

@Service
public class MemberService {
	private MemberMapper mapper;
	
	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}

	public MemberDTO login(String id, String pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		return mapper.login(map);
	}

	public int register(String id, String pwd, String name, Date birth, String tel, String address) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("birth", birth);
		map.put("tel", tel);
		map.put("address", address);
		
		return mapper.register(map);
	}

	public MemberDTO updateMemberView(String id) {
		return mapper.updateMemberView(id);
	}

	public int updateMember(String id, String address, Date birth, String tel) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("birth", birth);
		map.put("tel", tel);
		map.put("address", address);
		return mapper.updateMember(map);
	}
	
	public int updatePwd(String id, String pwd, String pwd2) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("pwd2", pwd2);
		
		return mapper.updatePwd(map);
	}

	public String findAccount(String id, String name, String tel, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("tel", tel);
		map.put("status", status);
		
		return mapper.findAccount(map);
	}

	public int findChangePwd(String id, String pwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		return mapper.findChangePwd(map);
	}

}

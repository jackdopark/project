package com;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.MemberDTO;
import com.project.service.MemberService;

@Controller
public class MainController {
	private MemberService memberService;

	public MainController(MemberService memberService) {
		super();
		this.memberService = memberService;
	}
	
	@RequestMapping("/")
	public String main() {
		
		return "index";
	}
	
	@RequestMapping("login")
	public String loginView() {
		return "login";
	}
	
	@RequestMapping("login.do")
	public String login(String id, String pwd, HttpSession session) {
		MemberDTO dto = memberService.login(id, pwd);
		if (dto != null) {
			session.setAttribute("login", true);
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", dto.getName());
			session.setAttribute("mno", dto.getMno());
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "login";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("register")
	public String registerView() {
		return "register";
	}
	
	@RequestMapping("register.do")
	public void register(String id, String pwd, String name, String address, @RequestParam(value="birth", defaultValue = "1")String birth, String tel, HttpServletResponse res) throws IOException {
		int result = memberService.register(id,pwd,name,Date.valueOf(birth),tel,address);
		res.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("memberInfo")
	public String memberInfo() {
		return "member_info";
	}
		
	@RequestMapping("updateMember")
	public String updateMemberView(HttpSession session, Model model) {
		MemberDTO dto = memberService.updateMemberView((String)session.getAttribute("id"));

		String add[] = dto.getAddress().split("&&");
		System.out.println(add[0]);
		System.out.println(add[1]);
		System.out.println(add[2]);
		model.addAttribute("postno",add[0]);
		model.addAttribute("address1",add[1]);
		model.addAttribute("address2",add[2]);
		model.addAttribute("dto",dto);
		return "update_member";
	}
	
	@RequestMapping("updateMember.do")
	public void updateMember(String id, String address, String birth, String tel, HttpServletResponse res) throws IOException {
		int result = memberService.updateMember(id, address, Date.valueOf(birth), tel);
		res.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("updatePwd")
	public String updatePwdView() {
		return "update_pwd";
	}
	
	@RequestMapping("updatePwd.do")
	public void updatePwd(HttpSession session, String pwd, String pwd2, HttpServletResponse res) throws IOException {
		int result = memberService.updatePwd((String)session.getAttribute("id"), pwd, pwd2);
		res.getWriter().write(String.valueOf(result));
	}
	
	@RequestMapping("findAccount")
	public String findAccountView() {return "find_account";}
	
	@RequestMapping("findAccount.do")
	public void findAccount(HttpServletResponse res, String id, String name, String tel, String status) throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		JSONObject obj = new JSONObject();
		String fid = memberService.findAccount(id, name, tel, status);
		int result = fid != null ? 1 : 0;
		obj.put("result", result);
		obj.put("id",fid);
		res.getWriter().print(obj);
		
	}
}

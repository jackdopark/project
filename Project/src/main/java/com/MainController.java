package com;

import java.io.IOException;
import java.sql.Date;

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

	// 메인페이지
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("index", "index");
		return "index";
	}

	//기본-----------------------------------------------------------
	// 로그인페이지
	@RequestMapping("login")
	public String loginView() {
		return "login";
	}

	// 로그인
	@RequestMapping("login.do")
	public String login(String id, String pwd, HttpSession session) {
		MemberDTO dto = memberService.login(id, pwd);
		if (dto != null) {
			session.setAttribute("login", true);
			dto.setPwd(null);
			session.setAttribute("loginDTO", dto);
			session.setAttribute("id", id);
			return "redirect:/";
		} else {
			session.setAttribute("login", false);
			return "login";
		}
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.removeAttribute("dto");
		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 페이지
	@RequestMapping("register")
	public String registerView() {
		return "register";
	}

	// 회원가입
	@RequestMapping("register.do")
	public void register(String id, String pwd, String name, String address,
			@RequestParam(value = "birth", defaultValue = "1") String birth, String tel, HttpServletResponse res)
			throws IOException {
		int result = memberService.register(id, pwd, name, Date.valueOf(birth), tel, address);
		res.getWriter().write(String.valueOf(result));
	}

	// 아이디,비밀번호 찾기페이지
	@RequestMapping("findAccount")
	public String findAccountView() {
		return "find_account";
	}

	// 아이디 찾기(비밀번호는 ID정보만 보내기)
	@RequestMapping("findAccount.do")
	public void findAccount(HttpServletResponse res, String id, String name, String tel, String status)
			throws IOException {
		res.setContentType("text/html; charset=UTF-8");
		JSONObject obj = new JSONObject();
		String fid = memberService.findAccount(id, name, tel, status);
		int result = fid != null ? 1 : 0;
		obj.put("result", result);
		obj.put("id", fid);
		res.getWriter().print(obj);

	}

	// 비밀번호찾기 > 변경하기
	@RequestMapping("findChangePwd.do")
	public void findChangePwd(String id2, String pwd, HttpServletResponse res) throws IOException {
		int result = memberService.findChangePwd(id2, pwd);
		res.getWriter().write(String.valueOf(result));

	}

	//멤버-----------------------------------------------------------
	// 회원정보페이지
	@RequestMapping("memberInfo")
	public String memberInfo() {
		//마이페이지 들어갈 때
		//장바구니 정보
		//주문목록/배송정보
		//등급정보 - 현재등급 - 다음 등급까지 얼마나 남았는지
		//문의내역 정보
		
		return "member_info";
	}

	// 회원정보 수정 페이지
	@RequestMapping("updateMember")
	public String updateMemberView(HttpSession session, Model model) {
		MemberDTO dto = memberService.updateMemberView((String) session.getAttribute("id"));

		String add[] = dto.getAddress().split("&&");
		model.addAttribute("postno", add[0]);
		model.addAttribute("address1", add[1]);
		model.addAttribute("address2", add[2]);
		model.addAttribute("dto", dto);
		return "update_member";
	}

	// 회원정보 수정
	@RequestMapping("updateMember.do")
	public void updateMember(String id, String address, String birth, String tel, HttpServletResponse res)
			throws IOException {
		int result = memberService.updateMember(id, address, Date.valueOf(birth), tel);
		res.getWriter().write(String.valueOf(result));
	}

	// 비밀번호 수정 페이지
	@RequestMapping("updatePwd")
	public String updatePwdView() {
		return "update_pwd";
	}

	// 비밀번호 수정
	@RequestMapping("updatePwd.do")
	public void updatePwd(HttpSession session, String pwd, String pwd2, HttpServletResponse res) throws IOException {
		int result = memberService.updatePwd((String) session.getAttribute("id"), pwd, pwd2);
		res.getWriter().write(String.valueOf(result));
	}
	
	//쇼핑-----------------------------------------------------------

}

package com.gd.safari.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IMemberService;
import com.gd.safari.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccountController {
	@Autowired private IMemberService memberService;
	
	// 로그인 페이지 이동
	@GetMapping("/account/login")
	public String login() { 
		log.debug(TeamColor.CSH + this.getClass() + " 로그인 페이지");
		return "account/login";
	}
	
	// 로그인 액션
	@PostMapping("/account/login")
	public String login(HttpSession session, Model model, Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 로그인 액션");
		// 서비스 호출
		Member loginMember = memberService.getMemberByLogin(member);
		// 세션에 담기
		session.setAttribute("login", loginMember);
		// 로그인 실패
		if(loginMember == null) {
			log.debug(TeamColor.CSH + "로그인 실패");
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Login Fail");
			return "account/login";
		}
		
		return "redirect:/safari/index";
	}
	
	// 로그아웃 액션
	@GetMapping("/safari/logout")
	public String logout(HttpSession session) { 
		log.debug(TeamColor.CSH + this.getClass() + " 로그아웃 액션");
		// 세션 무효화
		session.invalidate();
		
		return "redirect:/account/login";
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/account/register")
	public String register() {
		log.debug(TeamColor.CSH + this.getClass() + " 회원가입 페이지");
		return "account/register";
	}
	
	// 회원가입 액션
	@PostMapping("/account/register")
	public String register(Model model, Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 회원가입 액션");
		// 인증번호 넣기
		member.setCertified(certified_key());
		// 디버깅
		log.debug(TeamColor.CSH + member);
		// 서비스 호출
		int row = memberService.addMember(member);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "회원가입 성공");
		} else {
			log.debug(TeamColor.CSH + "회원가입 실패");
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Insert Account Fail");
			return "account/login";
		}
		
		return "redirect:/account/login";
	}
	
	// 중복된 이메일 검사
	@PostMapping("/account/duplicateEmail")
	public @ResponseBody String duplicateEmail(@RequestParam (value = "memberEmail") String memberEmail) {
		log.debug(TeamColor.CSH + this.getClass() + " 중복된 이메일 검사");
		// 디버깅
		log.debug(TeamColor.CSH + memberEmail);
		
		// 리턴받을 변수 초기화
		// 리턴값 boolean - true (email 사용가능)
		boolean emailAvailable = false;
		// json으로 만들 변수 초기화
		String jsonStr = "";
		
		// 메서드의 결과에 따라 json 분기
		if(emailAvailable) { // 성공
			jsonStr = "memberEmail ok";
		} else {
			jsonStr = "not ok";
		}
		
		return jsonStr;
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/account/recover-password")
	public String recoverPassword() {
		log.debug(TeamColor.CSH + this.getClass() + " 비밀번호 찾기 페이지");
		return "account/recover-password";
	}
	
	// 계정잠금해제 페이지 이동
	@GetMapping("/lock/unlock-user")
	public String unlockUser() {
		log.debug(TeamColor.CSH + this.getClass() + " 계정잠금해제 페이지");
		return "account/unlock-user";
	}
	
	// 계정삭제(탈퇴) 페이지 이동
	@GetMapping("/safari/delete-account")
	public String deleteAccount() {
		log.debug(TeamColor.CSH + this.getClass() + " 계정삭제(탈퇴) 페이지");
		return "account/delete-account";
	}
	
	// 계정삭제(탈퇴) 액션
	@PostMapping("/safari/delete-account")
	public String deleteAccount(Model model, Member member) {
		log.debug(TeamColor.CSH + this.getClass() + " 계정삭제(탈퇴) 액션");
		
		// 디버깅
		log.debug(TeamColor.CSH + member);
		// 서비스 호출
		int row = memberService.modifyActiveByDeleteAccount(member);
		
		// 서비스메서드의 리턴값이 1이라면 성공
		if(row == 1) {
			log.debug(TeamColor.CSH + "계정삭제(탈퇴) 성공");
		} else {
			log.debug(TeamColor.CSH + "계정삭제(탈퇴) 실패");
			// 모델에 에러메세지 담기
			model.addAttribute("errorMsg", "Delete Account Fail");
			return "account/delete-account";
		}
		
		return "redirect:/safari/logout";
	}
	
	// 인증번호 생성
    private String certified_key() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = random.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < 10);
		return sb.toString();
	}
}

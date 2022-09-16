package com.gd.safari.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.Member;

@Mapper
public interface IMemberMapper {
	// 회원가입
	int insertMember(Member member);
	// 중복 아이디 확인
	String selectMemberEmailByDuplicate(String memberEmail);
	// 유효한 이메일 검사 (탈퇴회원 제외)	
	String selectMemberEmailByCheck(String memberEmail);
	// 로그인
	Member selectMemberByLogin(Member member);
	// 비밀번호 찾기 (랜덤비밀번호를 이메일로 전송해준 뒤 비밀번호 변경)
	int updateMemberPwByRecoverPw(Member member);
	// 계정 활성화 (active 값을 Y로 변경 - N일 경우만! X일 경우는 탈퇴된 계정이라 활성화되지 않음)
	int updateActiveByUnlockUser(Member member);
	// 탈퇴 (active 값을 X로 변경)
	int updateActiveByDeleteAccount(Member member);
}

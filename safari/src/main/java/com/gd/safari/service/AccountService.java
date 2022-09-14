package com.gd.safari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.safari.mapper.IMemberMapper;
import com.gd.safari.vo.Member;

@Service
@Transactional
public class AccountService implements IAccountService {
	@Autowired private IMemberMapper memberMapper;
	
	// 회원가입
	@Override
	public int addMember(Member member) {
		return memberMapper.insertMember(member);
	}

	@Override
	public Member getMemberByLogin(Member member) {
		return memberMapper.selectMemberByLogin(member);
	}
}

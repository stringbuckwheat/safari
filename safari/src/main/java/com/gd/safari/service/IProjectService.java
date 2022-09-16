package com.gd.safari.service;

import java.util.Map;

public interface IProjectService {
	// project 메인 페이지를 띄우기 위해 필요한 정보 제공 메소드
	// 전체 프로젝트 리스트, 워크스페이스 멤버 리스트, 프로젝트 그룹리스트
	Map<String, Object> getProjectListByWorkspace(int workNo);
	
	// project 추가 메소드
	void addProject(Map<String, Object> map);
	
	// 한 프로젝트의 정보를 가져오는 메소드
	// 수정 폼을 띄울 때 사용
	Map<String, Object> getProjectDetailByProjectNo(int projectNo);

}
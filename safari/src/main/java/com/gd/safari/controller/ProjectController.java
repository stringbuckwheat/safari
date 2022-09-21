package com.gd.safari.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.safari.commons.TeamColor;
import com.gd.safari.service.IProjectGroupService;
import com.gd.safari.service.IProjectService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProjectController {
	@Autowired
	private IProjectService projectService;
	@Autowired
	private IProjectGroupService projectGroupService;
	
	// 전체 프로젝트 개관, 프로젝트 추가 페이지
	@GetMapping("/safari/project")
	public String project(Model model, HttpSession session, @RequestParam Map<String, Object> paramMap) {
		// paramMap: section(프로젝트 정렬 값), projectGroupNo(프로젝트 그룹 리스트)
		log.debug(TeamColor.CSK + "paramMap: " + paramMap);
		log.debug(TeamColor.CSK + "paramMap.keyset: " + paramMap.keySet());

		// 세션의 workNo, workspaceNo를 paramMap에 넣기
		paramMap.put("workNo", session.getAttribute("workNo"));
		paramMap.put("workMemberNo", session.getAttribute("workMemberNo"));
		
		// jsp에서 띄울 타이틀
		String title = "전체 프로젝트"; // section 파라미터가 null인 경우 프로젝트 리스트
		
		// TODO title 로직 다시 고민
		if(paramMap.get("section") != null) {
			// section 파라미터의 값에 따라 title 값 변경
			String section = (String) paramMap.get("section");
			if("my".equals(section)) {
				title = "내가 속한 프로젝트";
			} else if("bookmark".equals(section)) {
				title = "중요 프로젝트";
			} else if("keep".equals(section)) {
				title = "보관된 프로젝트";
			}
		}
		
		if(paramMap.get("projectGroupNo") != null) {
			title = "프로젝트 그룹 리스트";
		}
		
		if(paramMap.get("search") != null) {
			title = paramMap.get("search") + "의 검색 결과";
		}
		
		// MyBatis 동적쿼리로 section
		Map<String, Object> map = projectService.getProjectListByWorkspace(paramMap);

		// 전체 프로젝트 리스트, 워크스페이스 멤버 리스트, 프로젝트 그룹리스트
		model.addAttribute("projectList", map.get("projectList"));
		model.addAttribute("workspaceMemberList", map.get("workspaceMemberList"));
		model.addAttribute("projectGroupList", map.get("projectGroupList"));
		model.addAttribute("workMemberNo", (int)session.getAttribute("workMemberNo")); // 프로젝트 생성자가 프로젝트 멤버로 바로 삽입되게 하기 위함
		model.addAttribute("title", title);
		model.addAttribute("manager", map.get("manager"));
		
		return "project/project";
	}
	
	// 프로젝트 추가
	@PostMapping("/safari/project")
	public String project(HttpSession session, @RequestParam Map<String, Object> map) {
		log.debug(TeamColor.CSK + "프로젝트 추가");
		
		// 워크스페이스 페이지에서 세션에 담은 workspaceNo와 projManagerNo를 받아온다
		int workNo = (Integer)session.getAttribute("workNo"); // mapper 메소드의 파라미터로 사용
		int projManagerNo = (int)session.getAttribute("workMemberNo"); // 프로젝트 생성자가 관리자로 등록되게 할 목적으로 사용
		map.put("workNo", workNo);
		map.put("projManagerNo", projManagerNo);
		
		log.debug(TeamColor.CSK + map);
		// log.debug(TeamColor.CSK + map.keySet()); // workNo, projectName, projectAuth, projectMemberList
		
		// TODO 리턴값 고민 필요
		projectService.addProject(map);
		
		return "redirect:/safari/project";
	}
	
	// 개별 프로젝트 요약 페이지
	@GetMapping("/safari/projectSummary")
	public String projectSummary() {
		return "project/projectSummary";
	}
	
	@GetMapping("/safari/modifyProject")
	public String modifyProject(Model model, HttpSession session, int projectNo) {
		log.debug(TeamColor.CSK + "프로젝트 수정 폼");
		log.debug(TeamColor.CSK + "projectNo: " + projectNo);
		
		// 워크스페이스 페이지에서 세션에 담은 workspaceNo를 받아온다
		int workNo = (int)session.getAttribute("workNo");
		
		// 프로젝트 VO, 프로젝트 멤버리스트<ProjectMember>를 반환
		Map<String, Object> map = projectService.getProjectDetailByProjectNo(workNo, projectNo);
		
		// 모델에 넣기
		model.addAttribute("project", map.get("project"));
		model.addAttribute("projectMemberList", map.get("projectMemberList"));
		
		return "project/modifyProject";
	}
	
	@PostMapping("/safari/modifyProject")
	public String modifyProject(@RequestParam Map<String, Object> map) {
		log.debug(TeamColor.CSK + "프로젝트 수정");
		log.debug(TeamColor.CSK + "파라미터 map: " + map);
		// {projectName=야호, projectExpl=야호야호 신나는 파프, projectAuth=N, projectStart=2022-09-17, projectDeadline=2022-09-30, projectEnd=, projectMemberList=14,15}
		// projectName=야호, projectExpl=, projectAuth=N, projectStart=, projectDeadline=, projectEnd=, projectMemberList=
		
		// 프로젝트와 프로젝트 멤버를 수정하는 메소드
		projectService.modifyProject(map);
		
		return "redirect:/safari/project";
	}
	
	// 삭제 메소드가 들어올 자리
	
	
	// Project Group 매핑
	// 프로젝트 그룹 추가
	@PostMapping("/safari/projectGroup")
	public String projectGroup(@RequestParam String projectGroupName) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 추가");
		log.debug(TeamColor.CSK + projectGroupName);
		
		projectGroupService.addProjectGroup(projectGroupName);

		return "redirect:/safari/project";
	}
	
	// 프로젝트 그룹 수정 폼 띄우기
	@GetMapping("/safari/modifyProjectGroup")
	public String modifyProjectGroup(HttpSession session, Model model, @RequestParam int projectGroupNo) {
		log.debug(TeamColor.CSK + "@GetMapping addProjToProjGroup");
		log.debug(TeamColor.CSK + "projectGroupNo" + projectGroupNo);
		
		int workNo = (int)session.getAttribute("workNo");
		
		Map<String, Object> map = projectGroupService.getAllProjectByProjectGroupNo(workNo, projectGroupNo);
		
		model.addAttribute("projectList", map.get("projectList"));
		model.addAttribute("projectGroup", map.get("projectGroup"));
		
		return "project/modifyProjectGroup";
	}
	
	// 프로젝트 그룹 정보 수정 및 그룹에 프로젝트 삽입/삭제
	@PostMapping("/safari/modifyProjectGroup")
	public String modifyProjectGroup(@RequestParam Map<String, Object> map) {
		log.debug(TeamColor.CSK + "@PostMapping addProjToProjGroup" + map);
		
		projectGroupService.modifyProjectGroup(map);
		
		return "redirect:/safari/project"; // TODO 프로젝트 그룹 선택된 페이지로 보내기 
	}
	
	@GetMapping("/safari/deleteProjectGroup")
	public String deleteProjectGroup(@RequestParam int projectGroupNo) {
		log.debug(TeamColor.CSK + "프로젝트 그룹 삭제");
		
		projectGroupService.deleteProjectGroup(projectGroupNo);
		
		return "redirect:/safari/project";

	}
}

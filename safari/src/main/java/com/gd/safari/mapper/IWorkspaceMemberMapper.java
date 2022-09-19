package com.gd.safari.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.safari.vo.WorkspaceMember;

@Mapper
public interface IWorkspaceMemberMapper {

	int insertWorkspaceCreater(WorkspaceMember workspaceMember); // 관리자 워크스페이스 멤버추가
	int insertWorkspaceMember(WorkspaceMember workspaceMember);
	List<WorkspaceMember> selectWorkspaceMemberList(int workNo);
	int deleteWorkspaceMember(int workNo);
	Map<String,Object> selectWorkspaceMemberOne(int workMemberNo);
	int selectWorkspaceMemberNo(WorkspaceMember workspaceMember);
}

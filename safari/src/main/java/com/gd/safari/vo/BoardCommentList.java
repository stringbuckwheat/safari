package com.gd.safari.vo;

import lombok.Data;

@Data
public class BoardCommentList {
	private int boardCmtNo;			// 보드 댓글 번호(PK)
	private String boardCmtContent; // 보드 댓글 내용
	private String boardCmtWriter;	// 보드 댓글 작성자
	private String createDate;		// 생성일
	private String updateDate;		// 수정일
	private int boardNo;			// 보드 번호(FK)
	private String cmtFilename;		// 프로필 이미지 파일이름
	private String cmtFileExt;		// 프로필 이미지 확장자
	private String cmtWorkMemberName;// 작성자이름
}

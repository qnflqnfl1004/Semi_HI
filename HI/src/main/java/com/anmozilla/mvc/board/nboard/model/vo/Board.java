package com.anmozilla.mvc.board.nboard.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int no;	// NOTICE_NO 
	
	private int rowNum;	// RNUM
	
	private int writerNo; // 게시글 작성자 회원번호 MEM_NO
	
	private String writerId;	// MEM_ID
	
	private String title;	// NOTICE_TITLE
	
	private String content;	// NOTICE_CONTENT
	
	private String status;	// 상태값 NOTICE_STATUS
	
	private List<Reply> replies;
	
	private Date createDate;		// NOTICE_DATE
	
}
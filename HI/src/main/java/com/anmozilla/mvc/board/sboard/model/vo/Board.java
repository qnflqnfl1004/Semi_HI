package com.anmozilla.mvc.board.sboard.model.vo;

import java.sql.Date;

import com.anmozilla.mvc.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	private int sNo;
	
	//member 객체
	private Member member;

	private Date sWriteDate;
	
	private String sTitle;
	
	private String sContent;
	
	private Date sDate;
	
	private Date sDueDate;
	
	private String sMember;
	
	private String sPeriod;
	
	private String sContact;
	
	private String sLevel;
	
	private String sStatus;
	
	// 언어 객체
	private Language language;
	
	// 테스트 객체
	private Test test;
}

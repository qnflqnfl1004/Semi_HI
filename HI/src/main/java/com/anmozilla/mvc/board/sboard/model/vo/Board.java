package com.anmozilla.mvc.board.sboard.model.vo;


import java.util.Date;

import com.anmozilla.mvc.member.model.vo.Member;
import com.anmozilla.mvc.board.sboard.model.vo.Test;
import com.anmozilla.mvc.board.sboard.model.vo.Language;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {

	private int sNo;
	
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
	
	private Language language;
	
	private Test test;
}

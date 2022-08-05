package com.anmozilla.mvc.admin.Qboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {

	private int no;
	
	private int rowNum;
	
	private String reason;
	
	private String writerId;
	
	private String title;
	
	private String content;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private String status;
	
	private String as;
	
	private Date createDate;
	
	private String email;
}

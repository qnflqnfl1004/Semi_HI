package com.anmozilla.mvc.board.Qboard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qboard {
	private int no;
	
	private String reason;
	
	private String writerId;
	
	private String title;
	
	private String email;
	
	private String content;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	
}

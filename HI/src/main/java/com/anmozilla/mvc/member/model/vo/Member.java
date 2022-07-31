package com.anmozilla.mvc.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int no;
	
	private String id;
	
	private String nickName;
	
	private String password;
	
	private String name;
	
	private String phone;
	
	private int warning;
	
	private String email;
	
	private String img;
	
	private String role;
	
	private String status;

}

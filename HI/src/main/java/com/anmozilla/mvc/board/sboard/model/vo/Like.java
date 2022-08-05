package com.anmozilla.mvc.board.sboard.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Like {
	private int likeNo; // 찜 게시물 번호
	
	private int userNo; // 회원 번호
	
	private int studyNo; // 게시글 번호
	
}

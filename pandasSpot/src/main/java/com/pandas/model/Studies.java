package com.pandas.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Studies {
	
	private int Study_idx; //번호
	private String Study_content; //내용
	private String Study_photo; //사진
	private int Study_likes; //좋아요
	private Date Created_at; //날짜
	private String Mem_id; //작성자
	
	public Studies(int study_idx ,String study_content, String study_photo, String mem_id) {
		super();
		this.Study_idx = study_idx;
		this.Study_content = study_content;
		this.Study_photo = study_photo;
		this.Mem_id = mem_id;
	}
	public Studies(String study_content, String study_photo, String mem_id) {
		super();
		this.Study_content = study_content;
		this.Study_photo = study_photo;
		this.Mem_id = mem_id;
	}
}

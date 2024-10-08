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
	
	private int Study_idx;
	private String Study_content;
	private String Study_photo;
	private int Study_likes;
	private Date Created_at;
	private String Mem_id;
	
	public Studies(String study_content, String study_photo, String mem_id) {
		super();
		Study_content = study_content;
		Study_photo = study_photo;
		Mem_id = mem_id;
	}
}

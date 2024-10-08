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

}

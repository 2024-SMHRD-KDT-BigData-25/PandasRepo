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

public class Records {
	
	private int Record_idx;
	private String Record_tag;
	private String Record_files;
	private String Record_likes;
	private Date Create_at;
	private String Mem_id;

}

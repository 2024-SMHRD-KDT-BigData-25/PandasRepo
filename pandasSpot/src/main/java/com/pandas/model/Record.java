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

public class Record {
	
	private int record_idx;
	private String record_tag;
	private String record_files;
	private String record_likes;
	private Date create_ad;
	private String Mem_id;

}

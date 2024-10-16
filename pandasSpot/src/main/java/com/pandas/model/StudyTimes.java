package com.pandas.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class StudyTimes {
	private String mem_id;
	private String study_time="0:0:0";
	public StudyTimes(String mem_id) {
		super();
		this.mem_id = mem_id;
	}
	
	
}

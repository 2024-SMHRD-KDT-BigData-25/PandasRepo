package com.pandas.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 공부 일기 
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Diaries {

    // 일기 인덱스 
    private Double diary_idx;

    // 글 제목 
    private String diary_title;

    // 글 내용 
    private String diary_content;

    // 글 작성일자 
    private String created_at;

    // 글 작성자 
    private String mem_id;

	public Diaries(String diary_title, String diary_content, String mem_id) {
		super();
		this.diary_title = diary_title;
		this.diary_content = diary_content;
		this.mem_id = mem_id;
	}

	public Diaries(String diary_title, String diary_content, String created_at, String mem_id) {
		super();
		this.diary_title = diary_title;
		this.diary_content = diary_content;
		this.created_at = created_at;
		this.mem_id = mem_id;
	}
    
    
    
    
    
    
}
package com.pandas.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//질의 게시판 
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Questions {

    // 질의 인덱스 
    private int q_idx;

    // 질의 제목 
    private String q_title;

    // 질의 내용 
    private String q_content;

    // 질의 사진 
    private String q_file;

    // 작성 일자 
    private String created_at;

    // 질의 작성자 
    private String mem_id;

    // 출처 문제집 
    private String q_workbook;

	public Questions(String q_title, String q_content, String q_file, String created_at, String mem_id,
			String q_workbook) {
		super();
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_file = q_file;
		this.created_at = created_at;
		this.mem_id = mem_id;
		this.q_workbook = q_workbook;
	}

	public Questions(String q_title, String q_content, String q_file, String mem_id, String q_workbook) {
		super();
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_file = q_file;
		this.mem_id = mem_id;
		this.q_workbook = q_workbook;
	}

	public Questions(int q_idx, String q_title, String q_content, String q_file, String q_workbook) {
		super();
		this.q_idx = q_idx;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_file = q_file;
		this.q_workbook = q_workbook;
	}
	
	
    
    
    
    

}
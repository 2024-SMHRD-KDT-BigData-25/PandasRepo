package com.pandas.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//커뮤니티 게시판 
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Communities {

    // 글 인덱스 
    private int comm_idx;

    // 글 제목 
    private String comm_title;

    // 글 내용 
    private String comm_content;

    // 글 첨부파일 
    private String comm_file;

    // 글 작성일자 
    private String created_at;

    // 글 조회수 
    private Integer comm_views;

    // 글 좋아요수 
    private Integer comm_likes;

    // 글 작성자 
    private String mem_id;

	public Communities(String comm_title, String comm_content, String comm_file, int comm_idx) {
		super();
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_file = comm_file;
		this.comm_idx = comm_idx;
	}

	public Communities(String comm_title, String comm_content, String comm_file, String created_at, String mem_id) {
		super();
		this.comm_title = comm_title;
		this.comm_content = comm_content;
		this.comm_file = comm_file;
		this.created_at = created_at;
		this.mem_id = mem_id;
	}
	
	
    
    
    
    
    
}
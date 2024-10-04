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
    private Double comm_idx;

    // 글 제목 
    private String comm_title;

    // 글 내용 
    private String comm_content;

    // 글 첨부파일 
    private String comm_file;

    // 글 작성일자 
    private Date created_at;

    // 글 조회수 
    private Integer comm_views;

    // 글 좋아요수 
    private Integer comm_likes;

    // 글 작성자 
    private String mem_id;
}
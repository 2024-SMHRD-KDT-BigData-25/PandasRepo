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
    private Date created_at;

    // 글 작성자 
    private String mem_id;
}
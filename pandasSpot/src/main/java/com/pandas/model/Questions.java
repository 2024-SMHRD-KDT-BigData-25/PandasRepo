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
    private Double q_idx;

    // 질의 제목 
    private String q_title;

    // 질의 내용 
    private String q_content;

    // 질의 사진 
    private String q_file;

    // 작성 일자 
    private Date created_at;

    // 질의 작성자 
    private String mem_id;

    // 출처 문제집 
    private String q_workbook;

}
package com.pandas.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 학교정보
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Schools {

    // 학교 인덱스 
    private Double school_idx;

    // 학교 명 
    private String school_name;

    // 학교 유형 
    private Integer school_type;

    // 학교 지역 
    private String school_region;
}
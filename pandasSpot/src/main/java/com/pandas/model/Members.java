package com.pandas.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
// 회원 
public class Members {

    // 아이디 
    private String mem_id;

    // 비밀번호 
    private String mem_pw;

    // 이름 
    private String mem_name;

    // 닉네임 
    private String mem_nick;

    // 생년월일 
    private String mem_birthdate;

    // 학교 인덱스 
    private Double mem_school;
    private String mem_school_name;

    // 프로필사진 
    private String mem_profile_img;

    // 가입일자 
    private Date joined_at;

	public Members(String mem_id, String mem_pw, String mem_name, String mem_nick, String mem_birthdate,
			Double mem_school, String mem_profile_img) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_nick = mem_nick;
		this.mem_birthdate = mem_birthdate;
		this.mem_school = mem_school;
		this.mem_profile_img = mem_profile_img;
	}

	public Members(String mem_id, String mem_pw) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
	}

	public Members(String mem_id) {
		super();
		this.mem_id = mem_id;
	}

	public Members(String mem_id, String mem_pw, String mem_name, String mem_nick, String mem_birthdate,
			Double mem_school, String mem_profile_img, Date joined_at) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_nick = mem_nick;
		this.mem_birthdate = mem_birthdate;
		this.mem_school = mem_school;
		this.mem_profile_img = mem_profile_img;
		this.joined_at = joined_at;
	}
	
	
}
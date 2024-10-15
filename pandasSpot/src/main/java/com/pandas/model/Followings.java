package com.pandas.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
//팔로잉 
public class Followings {

 // 팔로잉 인덱스 
 private Double follow_idx;

 // 팔로워 
 private String follower_id;

 // 팔로위 
 private String following_id;

 // 팔로우 날짜 
 private String followed_at;

public Followings(String follower_id, String following_id) {
	super();
	this.follower_id = follower_id;
	this.following_id = following_id;
}

}
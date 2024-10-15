// 커뮤니티 게시판 댓글 
package com.pandas.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CommComments {

    // 댓글 인덱스 
    private int cmt_idx;

    // 원글 인덱스 
    private int comm_idx;

    // 댓글 내용 
    private String cmt_content;

    // 댓글 작성일자 
    private String created_at;

    // 댓글 좋아요수 
    private Integer cmt_likes;

    // 댓글 작성자 
    private String mem_id;

	public CommComments(int comm_idx, String cmt_content, String mem_id) {
		super();
		this.comm_idx = comm_idx;
		this.cmt_content = cmt_content;
		this.mem_id = mem_id;
	}
    
    
}
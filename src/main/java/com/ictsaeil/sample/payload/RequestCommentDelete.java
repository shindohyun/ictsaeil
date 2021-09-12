package com.ictsaeil.sample.payload;

public class RequestCommentDelete {
	int commentOwnerIdx;
	int commentIdx;
	
	public int getCommentOwnerIdx() {
		return commentOwnerIdx;
	}
	public void setCommentOwnerIdx(int commentOwnerIdx) {
		this.commentOwnerIdx = commentOwnerIdx;
	}
	public int getCommentIdx() {
		return commentIdx;
	}
	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}
}

package edu.kh.mind.member.model.vo;

public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private int reviewStarPoint;
	private int professionNo;
	private int memberNo;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	
	public int getReviewStarPoint() {
		return reviewStarPoint;
	}

	public void setReviewStarPoint(int reviewStarPoint) {
		this.reviewStarPoint = reviewStarPoint;
	}

	public int getProfessionNo() {
		return professionNo;
	}

	public void setProfessionNo(int professionNo) {
		this.professionNo = professionNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewStarPoint="
				+ reviewStarPoint + ", professionNo=" + professionNo + ", memberNo=" + memberNo + "]";
	}
	
}

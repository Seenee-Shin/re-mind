package edu.kh.mind.member.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private int reviewStarPoint;
	private int professionNo;
	private int memberNo;
	private Date reviewDate;
	private int reservationNo;
	
	private String counselCategoryNm;
	
	
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
	

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	

	public String getCounselCategoryNm() {
		return counselCategoryNm;
	}

	public void setCounselCategoryNm(String counselCategoryNm) {
		this.counselCategoryNm = counselCategoryNm;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewStarPoint="
				+ reviewStarPoint + ", professionNo=" + professionNo + ", memberNo=" + memberNo + ", reviewDate="
				+ reviewDate + ", reservationNo=" + reservationNo + ", counselCategoryNm=" + counselCategoryNm + "]";
	}
	
}

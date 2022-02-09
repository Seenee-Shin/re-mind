package edu.kh.mind.pro.model.vo;

import java.sql.Date;

public class Reservation {
	
	private int reservationNo;
	private Date reservationEnrollDate;
	private int reservationEnrollTime;
	private int reservationStatusCode; // 1:예약신청, 2:예약결정, 3:예약취소, 4:상담완료
	private String reservationCancel;
	private int counselCategoryNo;
	private int reservationPayNo;
	
	private String counselCategoryNm;
	private int PayNo;

	private int memberNo;
	private int professionNo;
	private int statusCode;

	public Reservation() {
	}

	public int getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public Date getReservationEnrollDate() {
		return reservationEnrollDate;
	}

	public void setReservationEnrollDate(Date reservationEnrollDate) {
		this.reservationEnrollDate = reservationEnrollDate;
	}

	public int getReservationEnrollTime() {
		return reservationEnrollTime;
	}

	public void setReservationEnrollTime(int reservationEnrollTime) {
		this.reservationEnrollTime = reservationEnrollTime;
	}

	public int getReservationStatusCode() {
		return reservationStatusCode;
	}

	public void setReservationStatusCode(int reservationStatusCode) {
		this.reservationStatusCode = reservationStatusCode;
	}

	public String getReservationCancel() {
		return reservationCancel;
	}

	public void setReservationCancel(String reservationCancel) {
		this.reservationCancel = reservationCancel;
	}

	public int getCounselCategoryNo() {
		return counselCategoryNo;
	}

	public void setCounselCategoryNo(int counselCategoryNo) {
		this.counselCategoryNo = counselCategoryNo;
	}

	public int getReservationPayNo() {
		return reservationPayNo;
	}

	public void setReservationPayNo(int reservationPayNo) {
		this.reservationPayNo = reservationPayNo;
	}

	public String getCounselCategoryNm() {
		return counselCategoryNm;
	}

	public void setCounselCategoryNm(String counselCategoryNm) {
		this.counselCategoryNm = counselCategoryNm;
	}
	
	public int getPayNo() {
		return PayNo;
	}

	public void setPayNo(int payNo) {
		PayNo = payNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getProfessionNo() {
		return professionNo;
	}

	public void setProfessionNo(int professionNo) {
		this.professionNo = professionNo;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	@Override
	public String toString() {
		return "Reservation{" +
				"reservationNo=" + reservationNo +
				", reservationEnrollDate=" + reservationEnrollDate +
				", reservationEnrollTime=" + reservationEnrollTime +
				", reservationStatusCode=" + reservationStatusCode +
				", reservationCancel='" + reservationCancel + '\'' +
				", counselCategoryNo=" + counselCategoryNo +
				", reservationPayNo=" + reservationPayNo +
				", counselCategoryNm='" + counselCategoryNm + '\'' +
				", PayNo=" + PayNo +
				", memberNo=" + memberNo +
				", professionNo=" + professionNo +
				", statusCode=" + statusCode +
				'}';
	}
}

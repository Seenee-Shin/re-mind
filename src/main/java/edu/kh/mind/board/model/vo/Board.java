package edu.kh.mind.board.model.vo;

import java.util.List;


public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;

	private String createDate;
	private String modifyDate;
	
	private int replyCheckCode;
	private int scrapCheckCode;
	private int anonCheckCode;
	private int empathyCheckCode;
	
	private int readCount;
	private int memberNo;
	private int memberFn;
	private int professionNo;
	private int professionName;
	private int statusCode;
	private int boardCategoryCode;
	private int boardCategoryName;
	private int worryCategoryCode;
	private int worryCategoryName;
	
	private List<Image> imgList;
	private List<Empathy> emList;

	private String worryEmpathyArray;
	private String worryCntArray;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getReplyCheckCode() {
		return replyCheckCode;
	}

	public void setReplyCheckCode(int replyCheckCode) {
		this.replyCheckCode = replyCheckCode;
	}

	public int getScrapCheckCode() {
		return scrapCheckCode;
	}

	public void setScrapCheckCode(int scrapCheckCode) {
		this.scrapCheckCode = scrapCheckCode;
	}

	public int getAnonCheckCode() {
		return anonCheckCode;
	}

	public void setAnonCheckCode(int anonCheckCode) {
		this.anonCheckCode = anonCheckCode;
	}

	public int getEmpathyCheckCode() {
		return empathyCheckCode;
	}

	public void setEmpathyCheckCode(int empathyCheckCode) {
		this.empathyCheckCode = empathyCheckCode;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
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

	public int getBoardCategoryCode() {
		return boardCategoryCode;
	}

	public void setBoardCategoryCode(int boardCategoryCode) {
		this.boardCategoryCode = boardCategoryCode;
	}

	public int getWorryCategoryCode() {
		return worryCategoryCode;
	}

	public void setWorryCategoryCode(int worryCategoryCode) {
		this.worryCategoryCode = worryCategoryCode;
	}

	public int getMemberFn() {
		return memberFn;
	}

	public void setMemberFn(int memberFn) {
		this.memberFn = memberFn;
	}

	public int getProfessionName() {
		return professionName;
	}

	public void setProfessionName(int professionName) {
		this.professionName = professionName;
	}

	public int getBoardCategoryName() {
		return boardCategoryName;
	}

	public void setBoardCategoryName(int boardCategoryName) {
		this.boardCategoryName = boardCategoryName;
	}

	public int getWorryCategoryName() {
		return worryCategoryName;
	}

	public void setWorryCategoryName(int worryCategoryName) {
		this.worryCategoryName = worryCategoryName;
	}

	public List<Image> getImgList() {
		return imgList;
	}

	public void setImgList(List<Image> imgList) {
		this.imgList = imgList;
	}

	public List<Empathy> getEmList() {
		return emList;
	}

	public void setEmList(List<Empathy> emList) {
		this.emList = emList;
	}

	public String getWorryEmpathyArray() {
		return worryEmpathyArray;
	}

	public void setWorryEmpathyArray(String worryEmpathyArray) {
		this.worryEmpathyArray = worryEmpathyArray;
	}

	public String getWorryCntArray() {
		return worryCntArray;
	}

	public void setWorryCntArray(String worryCntArray) {
		this.worryCntArray = worryCntArray;
	}

	@Override
	public String toString() {
		return "Board{" +
				"boardNo=" + boardNo +
				", boardTitle='" + boardTitle + '\'' +
				", boardContent='" + boardContent + '\'' +
				", createDate='" + createDate + '\'' +
				", modifyDate='" + modifyDate + '\'' +
				", replyCheckCode=" + replyCheckCode +
				", scrapCheckCode=" + scrapCheckCode +
				", anonCheckCode=" + anonCheckCode +
				", empathyCheckCode=" + empathyCheckCode +
				", readCount=" + readCount +
				", memberNo=" + memberNo +
				", memberFn=" + memberFn +
				", professionNo=" + professionNo +
				", professionName=" + professionName +
				", statusCode=" + statusCode +
				", boardCategoryCode=" + boardCategoryCode +
				", boardCategoryName=" + boardCategoryName +
				", worryCategoryCode=" + worryCategoryCode +
				", worryCategoryName=" + worryCategoryName +
				", imgList=" + imgList +
				", emList=" + emList +
				", worryEmpathyArray='" + worryEmpathyArray + '\'' +
				", worryCntArray='" + worryCntArray + '\'' +
				'}';
	}
}

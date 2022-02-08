package edu.kh.mind.board.model.vo;

public class Reply {
    private int replyNo;
    private String replyContent;
    private String replyCreateDate;
    private String replyModifyDate;
    private int replyStatusCode;
    private int replyNestedCode;
    private int boardNo;
    private int memberNo;
    private int professionNo;
    private int parentReplyNo;

    private String boardTitle;
    private String boardCategoryName;
    private String memberFn;

    public int getReplyNo() {
        return replyNo;
    }

    public void setReplyNo(int replyNo) {
        this.replyNo = replyNo;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public String getReplyCreateDate() {
        return replyCreateDate;
    }

    public void setReplyCreateDate(String replyCreateDate) {
        this.replyCreateDate = replyCreateDate;
    }

    public String getReplyModifyDate() {
        return replyModifyDate;
    }

    public void setReplyModifyDate(String replyModifyDate) {
        this.replyModifyDate = replyModifyDate;
    }

    public int getReplyStatusCode() {
        return replyStatusCode;
    }

    public void setReplyStatusCode(int replyStatusCode) {
        this.replyStatusCode = replyStatusCode;
    }

    public int getReplyNestedCode() {
        return replyNestedCode;
    }

    public void setReplyNestedCode(int replyNestedCode) {
        this.replyNestedCode = replyNestedCode;
    }

    public int getBoardNo() {
        return boardNo;
    }

    public void setBoardNo(int boardNo) {
        this.boardNo = boardNo;
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

    public int getParentReplyNo() {
        return parentReplyNo;
    }

    public void setParentReplyNo(int parentReplyNo) {
        this.parentReplyNo = parentReplyNo;
    }

    public String getBoardTitle() {
        return boardTitle;
    }

    public void setBoardTitle(String boardTitle) {
        this.boardTitle = boardTitle;
    }

    public String getBoardCategoryName() {
        return boardCategoryName;
    }

    public void setBoardCategoryName(String boardCategoryName) {
        this.boardCategoryName = boardCategoryName;
    }

    public String getMemberFn() {
        return memberFn;
    }

    public void setMemberFn(String memberFn) {
        this.memberFn = memberFn;
    }





}

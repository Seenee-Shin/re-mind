package edu.kh.mind.member.model.vo;



public class ChatMessage {
	private int chatMessageNo;
	private String message;
	private String createDate;
	private int professionNo;
	private int memberNo;
	private int chattingNo;

	public ChatMessage() {
	}

	public int getChatMessageNo() {
		return chatMessageNo;
	}

	public void setChatMessageNo(int chatMessageNo) {
		this.chatMessageNo = chatMessageNo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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

	public int getChattingNo() {
		return chattingNo;
	}

	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}

	@Override
	public String toString() {
		return "ChatMessage{" +
				"chatMessageNo=" + chatMessageNo +
				", message='" + message + '\'' +
				", createDate='" + createDate + '\'' +
				", professionNo=" + professionNo +
				", memberNo=" + memberNo +
				", chattingNo=" + chattingNo +
				'}';
	}
}

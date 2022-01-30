package edu.kh.mind.member.model.vo;

public class ChatJoin {

    private int chatNo;
    private String chatEnrollDate;
    private int chatStatusCode;
    private int reservationNo;

    private int memberNo;
    private int professionNo;

    public ChatJoin() {
    }

    public int getChatNo() {
        return chatNo;
    }

    public void setChatNo(int chatNo) {
        this.chatNo = chatNo;
    }

    public String getChatEnrollDate() {
        return chatEnrollDate;
    }

    public void setChatEnrollDate(String chatEnrollDate) {
        this.chatEnrollDate = chatEnrollDate;
    }

    public int getChatStatusCode() {
        return chatStatusCode;
    }

    public void setChatStatusCode(int chatStatusCode) {
        this.chatStatusCode = chatStatusCode;
    }

    public int getReservationNo() {
        return reservationNo;
    }

    public void setReservationNo(int reservationNo) {
        this.reservationNo = reservationNo;
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

    @Override
    public String toString() {
        return "ChatJoin{" +
                "chatNo=" + chatNo +
                ", chatEnrollDate='" + chatEnrollDate + '\'' +
                ", chatStatusCode=" + chatStatusCode +
                ", reservationNo=" + reservationNo +
                ", memberNo=" + memberNo +
                ", professionNo=" + professionNo +
                '}';
    }
}

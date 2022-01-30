package edu.kh.mind.member.model.vo;

import java.util.Date;

public class Profession {
    private int professionNo;
    private String professionId;
    private String professionPw;
    private String professionName;
    private String professionPhone;
    private Date professionEnrollDate;
    private String professionGender;
    private String professionPrice;
    private int remarks;
    private int statusCode;

    public Profession(){}

    public int getProfessionNo() {
        return professionNo;
    }

    public String getProfessionId() {
        return professionId;
    }

    public String getProfessionPw() {
        return professionPw;
    }

    public String getProfessionName() {
        return professionName;
    }

    public String getProfessionPhone() {
        return professionPhone;
    }

    public Date getProfessionEnrollDate() {
        return professionEnrollDate;
    }

    public String getProfessionGender() {
        return professionGender;
    }

    public String getProfessionPrice() {
        return professionPrice;
    }

    public int getRemarks() {
        return remarks;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public void setProfessionNo(int professionNo) {
        this.professionNo = professionNo;
    }

    public void setProfessionId(String professionId) {
        this.professionId = professionId;
    }

    public void setProfessionPw(String professionPw) {
        this.professionPw = professionPw;
    }

    public void setProfessionName(String professionName) {
        this.professionName = professionName;
    }

    public void setProfessionPhone(String professionPhone) {
        this.professionPhone = professionPhone;
    }

    public void setProfessionEnrollDate(Date professionEnrollDate) {
        this.professionEnrollDate = professionEnrollDate;
    }

    public void setProfessionGender(String professionGender) {
        this.professionGender = professionGender;
    }

    public void setProfessionPrice(String professionPrice) {
        this.professionPrice = professionPrice;
    }

    public void setRemarks(int remarks) {
        this.remarks = remarks;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }
}

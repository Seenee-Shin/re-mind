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
    private String professionBirth;
    private String professionAuthKey;
    private int authStatus;
    private String remarks;
    private int statusCode;
    private String worryName;

    public Profession(){}

    public void setWorryName(String worryName) {
        this.worryName = worryName;
    }

    public String getWorryName() {
        return worryName;
    }



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


    public String getRemarks() {
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



    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

	public String getProfessionBirth() {
		return professionBirth;
	}

	public void setProfessionBirth(String professionBirth) {
		this.professionBirth = professionBirth;
	}

	public String getProfessionAuthKey() {
		return professionAuthKey;
	}

	public void setProfessionAuthKey(String professionAuthKey) {
		this.professionAuthKey = professionAuthKey;
	}

	public int getAuthStatus() {
		return authStatus;
	}

	public void setAuthStatus(int authstatus) {
		this.authStatus = authstatus;
	}

    @Override
    public String toString() {
        return "Profession{" +
                "professionNo=" + professionNo +
                ", professionId='" + professionId + '\'' +
                ", professionPw='" + professionPw + '\'' +
                ", professionName='" + professionName + '\'' +
                ", professionPhone='" + professionPhone + '\'' +
                ", professionEnrollDate=" + professionEnrollDate +
                ", professionGender='" + professionGender + '\'' +
                ", professionBirth='" + professionBirth + '\'' +
                ", professionAuthKey='" + professionAuthKey + '\'' +
                ", authStatus=" + authStatus +
                ", remarks='" + remarks + '\'' +
                ", statusCode=" + statusCode +
                ", worryName='" + worryName + '\'' +
                '}';
    }
}

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



    public void setRemarks(int remarks) {
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
}

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
    private String remarks;
    private int statusCode;
    private String professionBirth;
    private String professionAuthKey;
    private String authStatus;
    private String professionMajor;
    private String professionIntro;
    private String professionStory;
    private String professionTag;
    private String counselCategoryCode;
    private String counselPrice;
    private String imagePath;

    public Profession(){}

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getImagePath() {
        return imagePath;
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

    public void setProfessionBirth(String professionBirth) {
        this.professionBirth = professionBirth;
    }

    public void setProfessionAuthKey(String professionAuthKey) {
        this.professionAuthKey = professionAuthKey;
    }

    public void setAuthStatus(String authStatus) {
        this.authStatus = authStatus;
    }

    public void setProfessionMajor(String professionMajor) {
        this.professionMajor = professionMajor;
    }

    public void setProfessionIntro(String professionIntro) {
        this.professionIntro = professionIntro;
    }

    public void setProfessionStory(String professionStory) {
        this.professionStory = professionStory;
    }

    public void setProfessionTag(String professionTag) {
        this.professionTag = professionTag;
    }

    public void setCounselCategoryCode(String counselCategoryCode) {
        this.counselCategoryCode = counselCategoryCode;
    }

    public void setCounselPrice(String counselPrice) {
        this.counselPrice = counselPrice;
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

    public String getProfessionBirth() {
        return professionBirth;
    }

    public String getProfessionAuthKey() {
        return professionAuthKey;
    }

    public String getAuthStatus() {
        return authStatus;
    }

    public String getProfessionMajor() {
        return professionMajor;
    }

    public String getProfessionIntro() {
        return professionIntro;
    }

    public String getProfessionStory() {
        return professionStory;
    }

    public String getProfessionTag() {
        return professionTag;
    }

    public String getCounselCategoryCode() {
        return counselCategoryCode;
    }

    public String getCounselPrice() {
        return counselPrice;
    }
}

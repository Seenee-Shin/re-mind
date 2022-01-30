package edu.kh.mind.member.model.vo;

public class ProfessionInformation {
    private int professionNo;
    private String professionUniversity;
    private String professionDepartment;
    private String professionMajor;

    public ProfessionInformation(){}

    public void setProfessionNo(int professionNo) {
        this.professionNo = professionNo;
    }

    public void setProfessionUniversity(String professionUniversity) {
        this.professionUniversity = professionUniversity;
    }

    public void setProfessionDepartment(String professionDepartment) {
        this.professionDepartment = professionDepartment;
    }

    public void setProfessionMajor(String professionMajor) {
        this.professionMajor = professionMajor;
    }

    public int getProfessionNo() {
        return professionNo;
    }

    public String getProfessionUniversity() {
        return professionUniversity;
    }

    public String getProfessionDepartment() {
        return professionDepartment;
    }

    public String getProfessionMajor() {
        return professionMajor;
    }
}

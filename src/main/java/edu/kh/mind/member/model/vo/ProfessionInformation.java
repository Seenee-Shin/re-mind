package edu.kh.mind.member.model.vo;

public class ProfessionInformation {
    private int professionNo;
    private String professionUniversity;
    private String professionDepartment;
    private String professionMajor;
    private String professionIntro;
    private String professionStory;
    private String professionCarrer;
    

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

	public String getProfessionIntro() {
		return professionIntro;
	}

	public void setProfessionIntro(String professionIntro) {
		this.professionIntro = professionIntro;
	}

	public String getProfessionStory() {
		return professionStory;
	}

	public void setProfessionStory(String professionStory) {
		this.professionStory = professionStory;
	}

	public String getProfessionCarrer() {
		return professionCarrer;
	}

	public void setProfessionCarrer(String professionCarrer) {
		this.professionCarrer = professionCarrer;
	}
}

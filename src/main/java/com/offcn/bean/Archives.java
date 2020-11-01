package com.offcn.bean;

public class Archives {
    
    private Integer aid;
    private String school;
    private String degree;
    private String specialty;
    private String politicc;
    private String email;
    private String nation;
    private String emergencyper;
    private String emergencytel;
    private Integer emp_fk;

    //从档案到员工，单向一对一
    private Employee employee;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getPoliticc() {
        return politicc;
    }

    public void setPoliticc(String politicc) {
        this.politicc = politicc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getEmergencyper() {
        return emergencyper;
    }

    public void setEmergencyper(String emergencyper) {
        this.emergencyper = emergencyper;
    }

    public String getEmergencytel() {
        return emergencytel;
    }

    public void setEmergencytel(String emergencytel) {
        this.emergencytel = emergencytel;
    }

    public Integer getEmp_fk() {
        return emp_fk;
    }

    public void setEmp_fk(Integer emp_fk) {
        this.emp_fk = emp_fk;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "Archives{" +
                "aid=" + aid +
                ", school='" + school + '\'' +
                ", degree='" + degree + '\'' +
                ", specialty='" + specialty + '\'' +
                ", politicc='" + politicc + '\'' +
                ", email='" + email + '\'' +
                ", nation='" + nation + '\'' +
                ", emergencyper='" + emergencyper + '\'' +
                ", emergencytel='" + emergencytel + '\'' +
                ", emp_fk=" + emp_fk +
                ", employee=" + employee +
                '}';
    }
}

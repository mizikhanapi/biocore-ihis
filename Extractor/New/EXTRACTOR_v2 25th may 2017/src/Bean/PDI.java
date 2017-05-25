/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author shay
 */
public class PDI {
    private String pmiNo,
            patientName,
            newIc,
            oldIC,
            idType[],
            idNo,
            sex[],
            dob,
            race[],
            maritalStatus[],
            religion[],
            nationality[],
            address1,
            address2,
            address3,
            town[],
            district[],
            state[],
            country[],
            postcode[],
            homePhone,
            officePhone,
            mobilePhone,
            email;

    public String getPmiNo() {
        return pmiNo;
    }

    public void setPmiNo(String pmiNo) {
        this.pmiNo = pmiNo;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getNewIc() {
        return newIc;
    }

    public void setNewIc(String newIc) {
        this.newIc = newIc;
    }

    public String getOldIC() {
        return oldIC;
    }

    public void setOldIC(String oldIC) {
        this.oldIC = oldIC;
    }

    public String[] getIdType() {
        return idType;
    }

    public void setIdType(String[] idType) {
        this.idType = idType;
    }

    public String getIdNo() {
        return idNo;
    }

    public void setIdNo(String idNo) {
        this.idNo = idNo;
    }

    public String[] getSex() {
        return sex;
    }

    public void setSex(String[] sex) {
        this.sex = sex;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String[] getRace() {
        return race;
    }

    public void setRace(String[] race) {
        this.race = race;
    }

    public String[] getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String[] maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String[] getReligion() {
        return religion;
    }

    public void setReligion(String[] religion) {
        this.religion = religion;
    }

    public String[] getNationality() {
        return nationality;
    }

    public void setNationality(String[] nationality) {
        this.nationality = nationality;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public String[] getTown() {
        return town;
    }

    public void setTown(String[] town) {
        this.town = town;
    }

    public String[] getDistrict() {
        return district;
    }

    public void setDistrict(String[] district) {
        this.district = district;
    }

    public String[] getState() {
        return state;
    }

    public void setState(String[] state) {
        this.state = state;
    }

    public String[] getCountry() {
        return country;
    }

    public void setCountry(String[] country) {
        this.country = country;
    }

    public String[] getPostcode() {
        return postcode;
    }

    public void setPostcode(String[] postcode) {
        this.postcode = postcode;
    }

    public String getHomePhone() {
        return homePhone;
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }

    public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}

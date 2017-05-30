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
public class ARQ {
    private String PMI_no;
    private String HFCFrom_Cd;
    private String Episode_Date;
    private String Encounter_Date;
    private String Doctor_Id;
    private String Doctor_Name;
    
    private String appTyCod;
    private String appTyDesc;
    private String appDate;
    private String locationCod;
    private String locationDesc;
    private String comment;
    private String status;
    
    //subcomponent for discipineTo
    private String discipCode;
    private String discipDesc;
    private String discipCodeScheme;
    
    //subcomponetn for subdisciplineTo
    private String subDiscipCode;
    private String subDiscipDesc;
    private String subDiscipCodeScheme;
    
    //subcomponent for hfcTo
    private String hfcCodeTo;
    private String hfcDescTo;
    private String hfcToCodeScheme;

    public String getPMI_no() {
        return PMI_no;
    }

    public void setPMI_no(String PMI_no) {
        this.PMI_no = PMI_no;
    }

    public String getHFCFrom_Cd() {
        return HFCFrom_Cd;
    }

    public void setHFCFrom_Cd(String HFCFrom_Cd) {
        this.HFCFrom_Cd = HFCFrom_Cd;
    }

    public String getEpisode_Date() {
        return Episode_Date;
    }

    public void setEpisode_Date(String Episode_Date) {
        this.Episode_Date = Episode_Date;
    }

    public String getEncounter_Date() {
        return Encounter_Date;
    }

    public void setEncounter_Date(String Encounter_Date) {
        this.Encounter_Date = Encounter_Date;
    }

    public String getDoctor_Id() {
        return Doctor_Id;
    }

    public void setDoctor_Id(String Doctor_Id) {
        this.Doctor_Id = Doctor_Id;
    }

    public String getDoctor_Name() {
        return Doctor_Name;
    }

    public void setDoctor_Name(String Doctor_Name) {
        this.Doctor_Name = Doctor_Name;
    }

    public String getAppTyCod() {
        return appTyCod;
    }

    public void setAppTyCod(String appTyCod) {
        this.appTyCod = appTyCod;
    }

    public String getAppTyDesc() {
        return appTyDesc;
    }

    public void setAppTyDesc(String appTyDesc) {
        this.appTyDesc = appTyDesc;
    }

    public String getAppDate() {
        return appDate;
    }

    public void setAppDate(String appDate) {
        this.appDate = appDate;
    }

    public String getLocationCod() {
        return locationCod;
    }

    public void setLocationCod(String locationCod) {
        this.locationCod = locationCod;
    }

    public String getLocationDesc() {
        return locationDesc;
    }

    public void setLocationDesc(String locationDesc) {
        this.locationDesc = locationDesc;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDiscipCode() {
        return discipCode;
    }

    public void setDiscipCode(String discipCode) {
        this.discipCode = discipCode;
    }

    public String getDiscipDesc() {
        return discipDesc;
    }

    public void setDiscipDesc(String discipDesc) {
        this.discipDesc = discipDesc;
    }

    public String getDiscipCodeScheme() {
        return discipCodeScheme;
    }

    public void setDiscipCodeScheme(String discipCodeScheme) {
        this.discipCodeScheme = discipCodeScheme;
    }

    public String getSubDiscipCode() {
        return subDiscipCode;
    }

    public void setSubDiscipCode(String subDiscipCode) {
        this.subDiscipCode = subDiscipCode;
    }

    public String getSubDiscipDesc() {
        return subDiscipDesc;
    }

    public void setSubDiscipDesc(String subDiscipDesc) {
        this.subDiscipDesc = subDiscipDesc;
    }

    public String getSubDiscipCodeScheme() {
        return subDiscipCodeScheme;
    }

    public void setSubDiscipCodeScheme(String subDiscipCodeScheme) {
        this.subDiscipCodeScheme = subDiscipCodeScheme;
    }

    public String getHfcCodeTo() {
        return hfcCodeTo;
    }

    public void setHfcCodeTo(String hfcCodeTo) {
        this.hfcCodeTo = hfcCodeTo;
    }

    public String getHfcDescTo() {
        return hfcDescTo;
    }

    public void setHfcDescTo(String hfcDescTo) {
        this.hfcDescTo = hfcDescTo;
    }

    public String getHfcToCodeScheme() {
        return hfcToCodeScheme;
    }

    public void setHfcToCodeScheme(String hfcToCodeScheme) {
        this.hfcToCodeScheme = hfcToCodeScheme;
    }
    
}

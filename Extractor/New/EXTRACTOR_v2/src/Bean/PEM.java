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
public class PEM {

    private String PMI_no;
    private String HFC_Cd;
    private String Episode_Date;
    private String Encounter_Date;
    private String Doctor_Id;
    private String Doctor_Name;

    private String signSystem;
    private String signSystemDescription;
    private String signCd;
    private String signDesc;
    private String signCondition;
    private String comment;
    private String answerCode;
    private String awnswerDesc;
    private String txnDate;
    private String status;
    private String discipline;
    private String subdiscipline;

    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    public String getSubdiscipline() {
        return subdiscipline;
    }

    public void setSubdiscipline(String subdiscipline) {
        this.subdiscipline = subdiscipline;
    }

    public String getPMI_no() {
        return PMI_no;
    }

    public void setPMI_no(String PMI_no) {
        this.PMI_no = PMI_no;
    }

    public String getHFC_Cd() {
        return HFC_Cd;
    }

    public void setHFC_Cd(String HFC_Cd) {
        this.HFC_Cd = HFC_Cd;
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

    public String getSignSystem() {
        return signSystem;
    }

    public void setSignSystem(String signSystem) {
        this.signSystem = signSystem;
    }

    public String getSignSystemDescription() {
        return signSystemDescription;
    }

    public void setSignSystemDescription(String signSystemDescription) {
        this.signSystemDescription = signSystemDescription;
    }

    public String getSignCd() {
        return signCd;
    }

    public void setSignCd(String signCd) {
        this.signCd = signCd;
    }

    public String getSignDesc() {
        return signDesc;
    }

    public void setSignDesc(String signDesc) {
        this.signDesc = signDesc;
    }

    public String getSignCondition() {
        return signCondition;
    }

    public void setSignCondition(String signCondition) {
        this.signCondition = signCondition;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAnswerCode() {
        return answerCode;
    }

    public void setAnswerCode(String answerCode) {
        this.answerCode = answerCode;
    }

    public String getTxnDate() {
        return txnDate;
    }

    public void setTxnDate(String txnDate) {
        this.txnDate = txnDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAwnswerDesc() {
        return awnswerDesc;
    }

    public void setAwnswerDesc(String awnswerDesc) {
        this.awnswerDesc = awnswerDesc;
    }

}

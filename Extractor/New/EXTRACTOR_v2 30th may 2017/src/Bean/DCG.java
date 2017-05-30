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
public class DCG {
    private String episodeDate; 
    
    //mesage details..
    private String encounterDate;
    private String hfcCd;
    private String hfcName;
    private String patientCategory;
    private String consultingDoctorID;
    private String consultingDoctorName;
    private String attainDoctorID;
    private String attainDoctorName;
    private String dischargeDateTime;
    private String dischargeDisposition;
    private String comment;
    private String messageType;
    
    //message type such as DTO,LIR,VTS and so on..
    private String dischargeSummary;
    
    
    
    
    
    public String getEpisodeDate() {
        return episodeDate;
    }

    public void setEpisodeDate(String date) {
        this.episodeDate = date;
    }

    public String getEncounterDate() {
        return encounterDate;
    }

    public void setEncounterDate(String encounterDate) {
        this.encounterDate = encounterDate;
    }

    public String getDischargeSummary() {
        return dischargeSummary;
    }

    public void setDischargeSummary(String dischargeSummary) {
        this.dischargeSummary = dischargeSummary;
    }
    
     public String getHfcCd() {
        return hfcCd;
    }

    public void setHfcCd(String hfcCd) {
        this.hfcCd = hfcCd;
    }

    public String getHfcName() {
        return hfcName;
    }

    public void setHfcName(String hfcName) {
        this.hfcName = hfcName;
    }

    public String getPatientCategory() {
        return patientCategory;
    }

    public void setPatientCategory(String patientCategory) {
        this.patientCategory = patientCategory;
    }

    public String getConsultingDoctorID() {
        return consultingDoctorID;
    }

    public void setConsultingDoctorID(String consultingDoctorID) {
        this.consultingDoctorID = consultingDoctorID;
    }

    public String getConsultingDoctorName() {
        return consultingDoctorName;
    }

    public void setConsultingDoctorName(String consultingDoctorName) {
        this.consultingDoctorName = consultingDoctorName;
    }

    public String getAttainDoctorID() {
        return attainDoctorID;
    }

    public void setAttainDoctorID(String attainDoctorID) {
        this.attainDoctorID = attainDoctorID;
    }

    public String getAttainDoctorName() {
        return attainDoctorName;
    }

    public void setAttainDoctorName(String attainDoctorName) {
        this.attainDoctorName = attainDoctorName;
    }

    public String getDischargeDateTime() {
        return dischargeDateTime;
    }

    public void setDischargeDateTime(String dischargeDateTime) {
        this.dischargeDateTime = dischargeDateTime;
    }

    public String getDischargeDisposition() {
        return dischargeDisposition;
    }

    public void setDischargeDisposition(String dischargeDisposition) {
        this.dischargeDisposition = dischargeDisposition;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }
    
}

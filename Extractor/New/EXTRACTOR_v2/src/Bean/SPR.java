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
public class SPR {

    private String PMI_no;
    private String HFC_Cd;
    private String Episode_Date;
    private String Encounter_Date;
    private String Doctor_Id;
    private String Doctor_Name;

    private String procedurecd;
    private String procedureDesc;
    private String nameOfCodingSystem;
    private String actualProcedureTimeDate;
    private String actualProcedureMinutes;
    private String assocDiagnosisCD;
    private String actualSurgeonId;
    private String actualSurgeonName;
    private String actualLocationCode;
    private String actualLocationName;
    private String surgeonNotes;
    private String receivingHFCcd;
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

    public String getProcedurecd() {
        return procedurecd;
    }

    public void setProcedurecd(String procedurecd) {
        this.procedurecd = procedurecd;
    }

    public String getProcedureDesc() {
        return procedureDesc;
    }

    public void setProcedureDesc(String procedureDesc) {
        this.procedureDesc = procedureDesc;
    }

    public String getNameOfCodingSystem() {
        return nameOfCodingSystem;
    }

    public void setNameOfCodingSystem(String nameOfCodingSystem) {
        this.nameOfCodingSystem = nameOfCodingSystem;
    }

    public String getActualProcedureTimeDate() {
        return actualProcedureTimeDate;
    }

    public void setActualProcedureTimeDate(String actualProcedureTimeDate) {
        this.actualProcedureTimeDate = actualProcedureTimeDate;
    }

    public String getActualProcedureMinutes() {
        return actualProcedureMinutes;
    }

    public void setActualProcedureMinutes(String actualProcedureMinutes) {
        this.actualProcedureMinutes = actualProcedureMinutes;
    }

    public String getAssocDiagnosisCD() {
        return assocDiagnosisCD;
    }

    public void setAssocDiagnosisCD(String assocDiagnosisCD) {
        this.assocDiagnosisCD = assocDiagnosisCD;
    }

    public String getActualSurgeonId() {
        return actualSurgeonId;
    }

    public void setActualSurgeonId(String actualSurgeonId) {
        this.actualSurgeonId = actualSurgeonId;
    }

    public String getActualSurgeonName() {
        return actualSurgeonName;
    }

    public void setActualSurgeonName(String actualSurgeonName) {
        this.actualSurgeonName = actualSurgeonName;
    }

    public String getActualLocationCode() {
        return actualLocationCode;
    }

    public void setActualLocationCode(String actualLocationCode) {
        this.actualLocationCode = actualLocationCode;
    }

    public String getActualLocationName() {
        return actualLocationName;
    }

    public void setActualLocationName(String actualLocationName) {
        this.actualLocationName = actualLocationName;
    }

    public String getSurgeonNotes() {
        return surgeonNotes;
    }

    public void setSurgeonNotes(String surgeonNotes) {
        this.surgeonNotes = surgeonNotes;
    }

    public String getReceivingHFCcd() {
        return receivingHFCcd;
    }

    public void setReceivingHFCcd(String receivingHFCcd) {
        this.receivingHFCcd = receivingHFCcd;
    }

}

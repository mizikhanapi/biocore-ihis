/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author umarmukhtar
 */
public class Calling_system_bean {
    
    private String cs_id;
    private String cs_hfc_cd;
    private String cs_discipline;
    private String cs_sub_discipline;
    private String cs_pmi_no;
    private String cs_patient_name;
    private String cs_queue_no;
    private String cs_queue_name;
    private String cs_datetime;
    private int cs_callingtime;

    public String getCs_id() {
        return cs_id;
    }

    public void setCs_id(String cs_id) {
        this.cs_id = cs_id;
    }

    public String getCs_hfc_cd() {
        return cs_hfc_cd;
    }

    public void setCs_hfc_cd(String cs_hfc_cd) {
        this.cs_hfc_cd = cs_hfc_cd;
    }

    public String getCs_discipline() {
        return cs_discipline;
    }

    public void setCs_discipline(String cs_discipline) {
        this.cs_discipline = cs_discipline;
    }

    public String getCs_sub_discipline() {
        return cs_sub_discipline;
    }

    public void setCs_sub_discipline(String cs_sub_discipline) {
        this.cs_sub_discipline = cs_sub_discipline;
    }

    public String getCs_patient_name() {
        return cs_patient_name;
    }

    public void setCs_patient_name(String cs_patient_name) {
        this.cs_patient_name = cs_patient_name;
    }

    public String getCs_queue_no() {
        return cs_queue_no;
    }

    public void setCs_queue_no(String cs_queue_no) {
        this.cs_queue_no = cs_queue_no;
    }

    public String getCs_queue_name() {
        return cs_queue_name;
    }

    public void setCs_queue_name(String cs_queue_name) {
        this.cs_queue_name = cs_queue_name;
    }

    public String getCs_datetime() {
        return cs_datetime;
    }

    public void setCs_datetime(String cs_datetime) {
        this.cs_datetime = cs_datetime;
    }

    public String getCs_pmi_no() {
        return cs_pmi_no;
    }

    public void setCs_pmi_no(String cs_pmi_no) {
        this.cs_pmi_no = cs_pmi_no;
    }

    public int getCs_callingtime() {
        return cs_callingtime;
    }

    public void setCs_callingtime(int cs_callingtime) {
        this.cs_callingtime = cs_callingtime;
    }
}

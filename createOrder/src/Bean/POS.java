package Bean;

public class POS {
    
    private String pmi_no;
    private String hfc_cd;
    private String episode_date;
    private String encounter_date;
    private String procedure_cd;
    private String procedure_name;
    private String procedure_outcome;
    private String comment;
    private String doctor_id;
    private String doctor_name;

    public String getPmi_no() {
        return pmi_no;
    }

    public void setPmi_no(String pmi_no) {
        this.pmi_no = pmi_no;
    }

    public String getHfc_cd() {
        return hfc_cd;
    }

    public void setHfc_cd(String hfc_cd) {
        this.hfc_cd = hfc_cd;
    }

    public String getEpisode_date() {
        return episode_date;
    }

    public void setEpisode_date(String episode_date) {
        this.episode_date = episode_date;
    }

    public String getEncounter_date() {
        return encounter_date;
    }

    public void setEncounter_date(String encounter_date) {
        this.encounter_date = encounter_date;
    }

    public String getProcedure_cd() {
        return procedure_cd;
    }

    public void setProcedure_cd(String procedure_cd) {
        this.procedure_cd = procedure_cd;
    }

    public String getProcedure_name() {
        return procedure_name;
    }

    public void setProcedure_name(String procedure_name) {
        this.procedure_name = procedure_name;
    }

    public String getProcedure_outcome() {
        return procedure_outcome;
    }

    public void setProcedure_outcome(String procedure_outcome) {
        this.procedure_outcome = procedure_outcome;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(String doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

}

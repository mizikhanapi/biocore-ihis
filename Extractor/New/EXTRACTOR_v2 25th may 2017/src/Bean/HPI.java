package Bean;

public class HPI {

    private String PMI_no;
    private String Episode_date;
    private String Notes;
    private String Encounter_Date;
    private String hfc_cd;
    private String Doctor_ID;
    private String Doctor_Name;

    public String getNotes() {
        return Notes;
    }

    public void setNotes(String Notes) {
        this.Notes = Notes;
    }

    public String getPMI_no() {
        return PMI_no;
    }

    public void setPMI_no(String PMI_no) {
        this.PMI_no = PMI_no;
    }

    public String getEpisode_date() {
        return Episode_date;
    }

    public void setEpisode_date(String Episode_date) {
        this.Episode_date = Episode_date;
    }

    public String getEncounter_Date() {
        return Encounter_Date;
    }

    public void setEncounter_Date(String Encounter_Date) {
        this.Encounter_Date = Encounter_Date;
    }

    public String getHfc_cd() {
        return hfc_cd;
    }

    public void setHfc_cd(String hfc_cd) {
        this.hfc_cd = hfc_cd;
    }

    public String getDoctor_ID() {
        return Doctor_ID;
    }

    public void setDoctor_ID(String Doctor_ID) {
        this.Doctor_ID = Doctor_ID;
    }

    public String getDoctor_Name() {
        return Doctor_Name;
    }

    public void setDoctor_Name(String Doctor_Name) {
        this.Doctor_Name = Doctor_Name;
    }
    
}

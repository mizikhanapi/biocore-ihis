package order_tables;

import Config_Pack.Config;
import java.util.ArrayList;
import main.RMIConnector;

public class get_ehr_central_data {
    
    private String pmi_no;
    private String PERSON_ID_NO;
    private String PERSON_STATUS;
    private String LOCATION_CODE;
    private String Central_Code;
    private String Centre_Code;
    private String national_id_no;
    private String txndata;
    private String status_1;
    
    public boolean getQuery(){

              RMIConnector rc = new RMIConnector();
       
        String sql2 = "SELECT "
                + "ec.central_code, " //0
                + "ec.pmi_no, " //1
                + "ec.c_txndate, " //2
                + "ec.c_txndata, " //3
                + "ec.status_1, " //4
                + "ssi.national_id_no," //5
                + "ssi.person_id_no," //6
                + "ssi.person_status," //7
                + "ssi.location_code " //8
                + "FROM emedica.ehr_central ec, emedica.pms_patient_biodata ppb "
                + "LEFT JOIN emedica.special_integration_information ssi "
                + "ON ppb.new_ic_no = ssi.national_id_no "
                + "WHERE ec.pmi_no = ppb.pmi_no "
                + "AND ec.status_1 = '0'"; // select undischarge patient (1)
        
             ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql2);
             for (int j = 0; j < data2.size(); j++) {
             try{
                 
             this.pmi_no = data2.get(j).get(1);
             this.national_id_no =  data2.get(j).get(5);
             this.PERSON_ID_NO = data2.get(j).get(6);
             this.PERSON_STATUS = data2.get(j).get(7);
             this.LOCATION_CODE = data2.get(j).get(8);
             this.Centre_Code = data2.get(j).get(8);
             this.Central_Code = data2.get(j).get(0);
             this.txndata = data2.get(j).get(3);
             this.status_1 = data2.get(j).get(4);
             
             }catch(Exception e){
                   System.out.println(e.getStackTrace());
             }
             
             }
             return true;
    }

    public String getPmi_no() {
        return pmi_no;
        
    }

    public String getPERSON_ID_NO() {
        return PERSON_ID_NO;
    }

    public String getPERSON_STATUS() {
        return PERSON_STATUS;
    }

    public String getLOCATION_CODE() {
        return LOCATION_CODE;
    }

    public String getCentral_Code() {
        return Central_Code;
    }

    public String getCentre_Code() {
        return Centre_Code;
    }

    public String getNational_id_no() {
        return national_id_no;
    }

    public String getTxndata() {
        return txndata;
    }
    
      public String getStatus_1() {
        return status_1;
    }

    public void setStatus_1(String status_1) {
        this.status_1 = status_1;
    }
    
    
    

    public static void main(String[] a){
//    
//    
    get_ehr_central_data t = new get_ehr_central_data();
    t.getQuery();
    System.out.println(t.getPmi_no());
    }

    
}

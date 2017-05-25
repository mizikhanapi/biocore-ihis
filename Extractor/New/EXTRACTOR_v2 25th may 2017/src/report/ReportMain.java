package report;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Bean.CCN;
import Bean.DGS;
import Bean.DTO;
import Process.MainRetrieval;
import java.util.ArrayList;
import main.RMIConnector;
import Config_Pack.Config;
/**
 *
 * @author ASUS
 */
public class ReportMain {
    
    public void view() {

        RMIConnector rc = new RMIConnector();

        String sql1 = "Select sii.NATIONAL_ID_NO, sii.PERSON_ID_NO, sii.PERSON_STATUS, sii.LOCATION_CODE, ppb.* "
                + "from PMS_PATIENT_BIODATA ppb, special_integration_information sii "
                + "WHERE ppb.NEW_IC_NO = sii.NATIONAL_ID_NO";
        ArrayList<ArrayList<String>> data1 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql1);
        
       
        for (int i = 0; i < data1.size(); i++) {
            String PMI_no = data1.get(i).get(4);
            String NATIONAL_ID_NO = data1.get(i).get(0);
            String PERSON_ID_NO = data1.get(i).get(1);
            String PERSON_STATUS = data1.get(i).get(2);
            String LOCATION_CODE = data1.get(i).get(3);
                 
                
            
            String sql2 = "SELECT * FROM EHR_CENTRAL "
                    + "WHERE PMI_NO = '" + PMI_no + "'";
                    
            ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql2);
            
            


            System.out.println("Patient " + PMI_no + ": " + data2.size());

            for (int j = 0; j < data2.size(); j++) {

                String episode = data2.get(j).get(2);
                String txndata1 = data2.get(j).get(3);

                MainRetrieval mr = new MainRetrieval();
                mr.startProcess(txndata1);

                // CCN
                String dataCCN[][] = mr.getData("CCN");
                int rowsCCN = mr.getRowNums();

                // DGS
                String dataDGS[][] = mr.getData("DGS");
                int rowsDGS = mr.getRowNums();

                // DTO
                String dataDTO[][] = mr.getData("DTO");
                int rowsDTO = mr.getRowNums();
                
                
                
                
          

                System.out.println("Episode " + episode + "\nCCN:" + rowsCCN + " DGS:" + rowsDGS + " DTO:" + rowsDTO);
                
                
                
                 

                if (rowsCCN > 0) {

                    ArrayList<CCN> ccnBeans = new ArrayList<CCN>();
                    for (int k = 0; k < rowsCCN; k++) {

                        CCN ccnBean = new CCN();
                        ccnBean.setEpisode_date(dataCCN[k][0]);
                        ccnBean.setPMI_no(PMI_no);
                        ccnBean.setEncounter_Date(dataCCN[k][15]);
                        ccnBean.setHfc_cd(dataCCN[k][16]);
                        ccnBean.setTxnDate(dataCCN[k][13]);
                        ccnBean.setSymptom_Name(dataCCN[k][2]);
                        ccnBean.setSymptom_Code(dataCCN[k][1]);

                        String query1 = "insert into lhr_signs (PMI_no, Episode_date, Signs_code, Signs_desc,  txnDate,  encounterdate, hfc_cd,NATIONAL_ID_NO ,PERSON_ID_NO,PERSON_STATUS,LOCATION_CODE)"
                                + "values ('" + ccnBean.getPMI_no() + "',"
                                + "'" + ccnBean.getEpisode_date() + "',"
                                + "'" + ccnBean.getSymptom_Code() + "',"
                                + "'" + ccnBean.getSymptom_Name() + "',"
                                + "'" + ccnBean.getTxnDate() + "',"
                                + "'" + ccnBean.getEncounter_Date() + "',"
                                + "'" + ccnBean.getHfc_cd() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + LOCATION_CODE + "')";

                        boolean status = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query1);
                        System.out.println("query:" + query1);
                        System.out.println("status:" + status);

                        ccnBeans.add(ccnBean);
                    }

                }

                if (rowsDGS > 0) {

                    ArrayList<DGS> dgsBr = new ArrayList<DGS>();
                    for (int n = 0; n < rowsDGS; n++) {

                        DGS dgsB = new DGS();
                        dgsB.setEpisode_Date(dataDGS[n][0]);
                        dgsB.setPMI_no(PMI_no);
                        dgsB.setDiagnosis_Type(dataDGS[n][1]);
                        dgsB.setDiagnosis_Cd(dataDGS[n][7]);
                        dgsB.setDiagnosis_Desc(dataDGS[n][8]);
                        dgsB.setTxn_Date(dataDGS[n][20]);
                        dgsB.setEncounter_Date(dataDGS[n][22]);
                        dgsB.setHFC(dataDGS[n][23]);

                        String query2 = "insert into lhr_diagnosis (PMI_no, Episode_date, diagnosis, diagnosisCd, diagnosisDesc, txnDate, encounterdate, hfc_cd,NATIONAL_ID_NO ,PERSON_ID_NO,PERSON_STATUS,LOCATION_CODE )"
                                + "values ('" + dgsB.getPMI_no() + "',"
                                + "'" + dgsB.getEpisode_Date() + "',"
                                + "'" + dgsB.getDiagnosis_Type() + "',"
                                + "'" + dgsB.getDiagnosis_Cd() + "',"
                                + "'" + dgsB.getDiagnosis_Desc() + "',"
                                + "'" + dgsB.getTxn_Date() + "',"
                                + "'" + dgsB.getEncounter_Date() + "',"
                                + "'" + dgsB.getHFC() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + LOCATION_CODE + "')";
                        
                        boolean stat = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query2);
                        System.out.println("stat:" + stat);
                        System.out.println("query:" + query2);

                        dgsBr.add(dgsB);
                    }

                }

                if (rowsDTO > 0) {

                    ArrayList<DTO> dtoBrs = new ArrayList<DTO>();
                    for (int m = 0; m < rowsDGS; m++) {

                        DTO dtoC = new DTO();
                        dtoC.setEpisode_Date(dataDTO[m][0]);                            
                        dtoC.setProblem_Code(dataDTO[m][1]); 
                        dtoC.setProblem_Name(dataDTO[m][2]);                             
                        dtoC.setRequested_Drug_Code(dataDTO[m][4]);
                        dtoC.setDrug_Name(dataDTO[m][5]);
                        dtoC.setProduct_Name(dataDTO[m][5]);                            
                        dtoC.setRequested_Drug_Form_Code(dataDTO[m][7]);
                        dtoC.setRequested_Drug_Form_Desc(dataDTO[m][8]);
                        dtoC.setRequested_Drug_Route_Code_066(dataDTO[m][10]);
                        dtoC.setRequested_Drug_Route_Code_Detail_Reference_Code(dataDTO[m][11]);
                        dtoC.setRequested_Drug_Route_Code_Description(dataDTO[m][12]); // = drug_route_desc
                        dtoC.setRequested_Drug_Frequency_Code(dataDTO[m][13]);
                        dtoC.setRequested_Drug_Frequency_Form_Desc(dataDTO[m][14]);
                        dtoC.setRequested_Drug_Frequency_Unit(dataDTO[m][16]);
                        dtoC.setRequested_Dosage(dataDTO[m][17]);
                            if(dataDTO[m][18] != null && !dataDTO[m][18].isEmpty()) {
                                dtoC.setRequested_Drug_Strength(dataDTO[m][18]);
                            }else{
                                dtoC.setRequested_Drug_Strength("0");
                            }
                        dtoC.setRequested_UOM_Code_025(dataDTO[m][19]);
                        dtoC.setRequested_UOM_Code_Detail_Reference_Code(dataDTO[m][20]);       
                        dtoC.setRequested_UOM_Code_Description(dataDTO[m][21]);                                
                            if(dataDTO[m][22] != null && !dataDTO[m][22].isEmpty()) {
                                dtoC.setRequested_Duration(dataDTO[m][22]);
                            }else{
                                dtoC.setRequested_Duration("0");
                            }      
                        dtoC.setRequested_Quantity(dataDTO[m][23]);
                        dtoC.setStart_Date(dataDTO[m][0]);
                        dtoC.setEnd_Date(dataDTO[m][0]);     

                        String query3 = "insert into lhr_medication "
                                    + "(hfc_cd, "
                                    + "episode_date, "                                    
                                    + "pmi_no, "   
                                    + "encounter_date, "                                    
                                    + "drug_cd, "
                                    + "problem_cd, "
                                    + "drug_name, " // = drug desc
                                    + "product_name, "
                                    + "drug_form, " // drug form code
                                    + "drug_form_desc, "
                                    + "drug_route_code, "                                    
                                    + "drug_route_desc, " // = Description
                                    + "drug_freq_code, "
                                    + "drug_freq_desc, "
                                    + "drug_freq_unit, "
                                    + "drug_dosage, "
                                    + "drug_strength, "
                                    + "drug_uom, "
                                    + "duration, "
                                    + "quantity, "
                                    + "start_date, "
                                    + "end_date, "
                                    //+ "doctor_id, "
                                    //+ "doctor_name, "    
                                    + "PERSON_ID_NO, "                                    
                                    + "NATIONAL_ID_NO, "
                                    + "PERSON_STATUS, "
                                    + "centre_code )"
                                    + "values ('" +dtoC.getHFC() + "',"
                                    + "'" + dtoC.getEpisode_Date() + "',"  
                                    + "'" + dtoC.getPMI_No() + "',"  
                                    + "'" + dtoC.getEncounter_Date() + "',"                                      
                                    + "'" + dtoC.getRequested_Drug_Code() + "',"
                                    + "'" + dtoC.getProblem_Code() + "',"                                    
                                    + "'" + dtoC.getDrug_Name() + "'," // drug name
                                    + "'" + dtoC.getProduct_Name() + "',"                                    
                                    + "'" + dtoC.getRequested_Drug_Form_Code() + "',"
                                    + "'" + dtoC.getRequested_Drug_Form_Desc() + "',"
                                    + "'" + dtoC.getRequested_Drug_Route_Code_Detail_Reference_Code() + "',"
                                    + "'" + dtoC.getRequested_Drug_Route_Code_Description() + "',"
                                    + "'" + dtoC.getRequested_Drug_Frequency_Code() + "',"
                                    + "'" + dtoC.getRequested_Drug_Frequency_Form_Desc() + "',"
                                    + "'" + dtoC.getRequested_Drug_Frequency_Unit() + "',"
                                    + "'" + dtoC.getRequested_Dosage() + "',"
                                    + "'" + dtoC.getRequested_Drug_Strength() + "',"
                                    + "'" + dtoC.getRequested_UOM_Code_Detail_Reference_Code() + "',"
                                    + "'" + dtoC.getRequested_Duration() + "',"
                                    + "'" + dtoC.getRequested_Quantity() + "',"  
                                    + "'" + dtoC.getStart_Date() + "',"   
                                    + "'" + dtoC.getEnd_Date() + "',"                                       
                                    + "'" + NATIONAL_ID_NO + "',"
                                    + "'" + PERSON_ID_NO + "',"
                                    + "'" + PERSON_STATUS + "',"
                                    + "'" + LOCATION_CODE + "')";

                        boolean stt = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query3);
                        System.out.println("status dto:" + stt);
                        System.out.println("sql dto   :" + query3);

                        dtoBrs.add(dtoC);
                    }

                }

            }

        }

    }

}

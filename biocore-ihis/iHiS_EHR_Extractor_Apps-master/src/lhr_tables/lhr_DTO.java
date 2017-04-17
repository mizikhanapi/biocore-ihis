package lhr_tables;

import Bean.DTO;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_DTO {

    public void M_DTO() {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dto_lhr_medication = true;

        get_ehr_central_data t = new get_ehr_central_data();
        t.getQuery();

        System.out.println("record #" + " " + t.getCentral_Code());

        MainRetrieval mr = new MainRetrieval();
        mr.startProcess(t.getTxndata());

        // DTO
        String dataDTO[][] = mr.getData("DTO");
        int rowsDTO = mr.getRowNums();

        if (rowsDTO > 0) {

            ArrayList<DTO> dtoBrs = new ArrayList<DTO>();
            for (int m = 0; m < rowsDTO; m++) {

                try {

                    System.out.println("dto #" + (m + 1));

                    DTO dtoC = new DTO();
                    dtoC.setPMI_No(t.getPmi_no());
                    dtoC.setHFC(dataDTO[m][0]);

                    dtoC.setEncounter_Date(dataDTO[m][0]);

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
                    if (dataDTO[m][18] != null && !dataDTO[m][18].isEmpty()) {
                        dtoC.setRequested_Drug_Strength(dataDTO[m][18]);
                    } else {
                        dtoC.setRequested_Drug_Strength("0");
                    }
                    dtoC.setRequested_UOM_Code_025(dataDTO[m][19]);
                    dtoC.setRequested_UOM_Code_Detail_Reference_Code(dataDTO[m][20]);
                    dtoC.setRequested_UOM_Code_Description(dataDTO[m][21]);
                    if (dataDTO[m][22] != null && !dataDTO[m][22].isEmpty()) {
                        dtoC.setRequested_Duration(dataDTO[m][22]);
                    } else {
                        dtoC.setRequested_Duration("0");
                    }
                    dtoC.setRequested_Quantity(dataDTO[m][23]);
                    dtoC.setStart_Date(dataDTO[m][0]);
                    dtoC.setEnd_Date(dataDTO[m][0]);
                    // dtoC.setDoctor_ID(dataDTO[m][23]);
                    // dtoC.setDoctor_Name(dataDTO[m][23]);

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
                            + "values ('" + dtoC.getHFC() + "',"
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
                            + "'" + t.getNational_id_no() + "',"
                            + "'" + t.getPERSON_ID_NO() + "',"
                            + "'" + t.getPERSON_STATUS() + "',"
                            + "'" + t.getCentre_Code() + "')";

                    status_dto_lhr_medication = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query3);
                    ////System.out.println("status dto : " + stt);
                    // //System.out.println("sql dto : " + query3);

                    if (status_dto_lhr_medication == true) {
                        //System.out.println("Failed to insert data into lhr_medication (DTO) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                        //System.out.println("Query for DGS: " + query3);
                        //total_fail_insert++;
                        System.out.println("Done.");
                    }else{
                           System.out.println("Done.");
                    }

                    dtoBrs.add(dtoC);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            update_ehr_central u = new update_ehr_central();
            u.update_status();

        }

    }

}

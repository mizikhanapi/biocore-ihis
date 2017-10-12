package lhr_tables;

import Bean.DTO;
import Bean.ERRCOUNT;
import Bean.MSH;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.DTO2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_DTO {

    public void M_DTO(Vector<DTO2> dto2,get_ehr_central_data t,MSH msh) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dto_lhr_medication = true;


        System.out.println("record #" + " " + t.getCentral_Code());


        // DTO
        int rowsDTO = dto2.size();

        if (rowsDTO > 0) {

            ArrayList<DTO> dtoBrs = new ArrayList<DTO>();
            for (int m = 0; m < rowsDTO; m++) {

                try {

                    System.out.println("dto #" + (m + 1));

                    DTO dtoC = new DTO();
                    ArrayList<ArrayList<String>> alDto = dto2.get(m).getValue();
                    dtoC.setPMI_No(t.getPmi_no());
                    
                    dtoC.setHFC(t.getLOCATION_CODE());
//                    dtoC.setEncounter_Date();
//                    dtoC.setEpisode_Date(dataDTO[m][0]);
                    dtoC.setProblem_Code(alDto.get(1).get(0));
                    dtoC.setProblem_Name(alDto.get(1).get(1));
                    dtoC.setRequested_Drug_Code(alDto.get(2).get(0));
                    dtoC.setDrug_Name(alDto.get(2).get(1));
//                    dtoC.setProduct_Name(dataDTO[m][5]);
                    dtoC.setRequested_Drug_Form_Code(alDto.get(3).get(0));
                    dtoC.setRequested_Drug_Form_Desc(alDto.get(3).get(1));
                    dtoC.setRequested_Drug_Route_Code_066(alDto.get(4).get(0));
                    dtoC.setRequested_Drug_Route_Code_Detail_Reference_Code(alDto.get(4).get(1));
                    dtoC.setRequested_Drug_Route_Code_Description(alDto.get(4).get(2)); // = drug_route_desc
                    dtoC.setRequested_Drug_Frequency_Code(alDto.get(5).get(0));
                    dtoC.setRequested_Drug_Frequency_Form_Desc(alDto.get(5).get(1));
                    dtoC.setRequested_Drug_Frequency_Unit(alDto.get(6).get(0));
                    dtoC.setRequested_Dosage(alDto.get(7).get(0));
                    if (alDto.get(8).get(0) != null && !alDto.get(8).get(0).isEmpty()) {
                        dtoC.setRequested_Drug_Strength(alDto.get(8).get(0));
                    } else {
                        dtoC.setRequested_Drug_Strength("0");
                    }
                    dtoC.setRequested_UOM_Code_025(alDto.get(9).get(0));
                    dtoC.setRequested_UOM_Code_Detail_Reference_Code(alDto.get(9).get(1));
                    dtoC.setRequested_UOM_Code_Description(alDto.get(9).get(2));
                    if (alDto.get(10).get(0) != null && !alDto.get(10).get(0).isEmpty()) {
                        dtoC.setRequested_Duration(alDto.get(10).get(0));
                    } else {
                        dtoC.setRequested_Duration("0");
                    }
                    dtoC.setRequested_Quantity(alDto.get(11).get(0));
                    
                    if (t.getNational_id_no().isEmpty() || t.getNational_id_no().equals("")) {
                            t.setNational_id_no("PUBLIC HOSPITAL");
                        }

                        if (t.getPERSON_STATUS().isEmpty() || t.getPERSON_STATUS().equals("")) {
                            t.setPERSON_STATUS("PUBLIC HOSPITAL");
                        }

                        if (t.getPERSON_ID_NO().isEmpty() || t.getPERSON_ID_NO().equals("")) {
                            t.setPERSON_ID_NO("PUBLIC HOSPITAL");
                        }

                        if (t.getCentre_Code().isEmpty() || t.getCentre_Code().equals("")) {
                            t.setCentre_Code("PUBLIC HOSPITAL");
                        }
//                    dtoC.setStart_Date(dataDTO[m][0]);
//                    dtoC.setEnd_Date(dataDTO[m][0]);
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
//                            + "start_date, "
//                            + "end_date, "
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
//                            + "'" + dtoC.getStart_Date() + "',"
//                            + "'" + dtoC.getEnd_Date() + "',"
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
                        System.out.println("Done extract dto");
                    }else{
                           System.out.println("false extract dto");
                           System.out.println("query dto: "+query3);
                           ERRCOUNT.plusOne();
                           ERRCOUNT.msgErr("DTO|");
                    }

                    dtoBrs.add(dtoC);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }

    }

}

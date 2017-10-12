/*
 * Copyright 2017 shay.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package lhr_tables;

import Bean.ERRCOUNT;
import Bean.MSH;
import Bean.PEM;
import Config_Pack.Config;
import bean.PEM2;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

/**
 *
 * @author shay
 */
public class lhr_PEM {
        public boolean M_PEM(Vector<PEM2>pem2, get_ehr_central_data t,MSH msh){

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_imu_lhr_pem = true;

        int rowsIMU = pem2.size();
        if (rowsIMU > 0) {
            
            ArrayList<PEM> pemBr = new ArrayList<PEM>();
            for (int n = 0; n < rowsIMU; n++) {
                PEM pemB = new PEM();
                ArrayList<ArrayList<String>> alPem = pem2.get(n).getValue();
                pemB.setPMI_no(t.getPmi_no());
                pemB.setHFC_Cd(alPem.get(2).get(11));
                pemB.setEpisode_Date(alPem.get(1).get(0));
                pemB.setEncounter_Date(alPem.get(2).get(10));
                pemB.setSignSystem(alPem.get(2).get(0));
                pemB.setSignSystemDescription(alPem.get(2).get(1));
                pemB.setSignCd(alPem.get(2).get(2));
                pemB.setSignDesc(alPem.get(2).get(3));
                pemB.setSignCondition(alPem.get(2).get(4));
                pemB.setComment(alPem.get(2).get(5));
                pemB.setAnswerCode(alPem.get(2).get(6));
                pemB.setAwnswerDesc(alPem.get(2).get(7));
                pemB.setTxnDate(t.getTxndate());
                pemB.setStatus("0");
                pemB.setDoctor_Id(alPem.get(2).get(12));
                pemB.setDoctor_Name(alPem.get(2).get(13));
                String query_imu_lhr_pem = "insert into lhr_physical_examination ("
                        + "PMI_no, "
                        + "hfc_cd, "
                        + "episode_date, "
                        + "encounter_date, "
                        + "signSystem, " //insert icd10 code
                        + "signSystemDesc,"
                        + "signCd,"
                        + "signDesc, "
                        + "signCondition, "
                        + "comment, "
                        + "answerCd, "
                        + "answerDesc, "
                        + "txnDate, "
                        + "status, "
                        + "doctorId, "
                        + "doctorName,"
                        + "discipline_cd,"
                        + "subdiscipline_cd,"
                        + "created_by,"
                        + "created_date)"
                        + "values ('"+pemB.getPMI_no()+"',"
                        + "'"+pemB.getHFC_Cd()+"',"
                        + "'"+pemB.getEpisode_Date()+"',"
                        + "'"+pemB.getEncounter_Date()+"',"
                        + "'"+pemB.getSignSystem()+"',"
                        + "'"+pemB.getSignSystemDescription()+"',"
                        + "'"+pemB.getSignCd()+"',"
                        + "'"+pemB.getSignDesc()+"',"
                        + "'"+pemB.getSignCondition()+"',"
                        + "'"+pemB.getComment()+"',"
                        + "'"+pemB.getAnswerCode()+"',"
                        + "'"+pemB.getAwnswerDesc()+"',"
                        + "'"+pemB.getTxnDate()+"',"
                        + "'"+pemB.getStatus()+"',"
                        + "'"+pemB.getDoctor_Id()+"',"
                        + "'"+pemB.getDoctor_Name()+"',"
                        + "'"+msh.getSendingFacilityDis()+"',"
                        + "'"+msh.getSendingFacilitySubDis()+"',"
                        + "'"+pemB.getDoctor_Id()+"',"
                        + "'"+msh.getDateTime()+"')";
                status_imu_lhr_pem = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_imu_lhr_pem);
                
                if (status_imu_lhr_pem == false) {
                    System.out.println("Query for PEM: " + query_imu_lhr_pem);
                    System.out.println("false extract PEM");
                    total_fail_insert++;
                    ERRCOUNT.plusOne();
                    ERRCOUNT.msgErr("PEM|");
                } else {
                    System.out.println("done extract PEM");
                }
                pemBr.add(pemB);
            }

        }

        return true;

    }
}

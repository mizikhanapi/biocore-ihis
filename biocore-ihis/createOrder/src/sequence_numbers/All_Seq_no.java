/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sequence_numbers;

import Config_Pack.Config;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;
/**
 *
 * @author shay
 */
public class All_Seq_no {
    private String OMSNo = "";
    private String zero = "";
    private String num = "";
    private String seqId = "";
    private String seqNo = "";
    RMIConnector rc = new RMIConnector();
    Date date = new Date();
    DateFormat dateFormatID = new SimpleDateFormat("yyyy");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat ordID = new SimpleDateFormat("yyMMddhhmmss");
    DateFormat ordID2 = new SimpleDateFormat("yyMMdd");
    DateFormat newfuckinglatestcurrentdateformatever =  new SimpleDateFormat("yyyyMMddhhmmssSSS");
    String dateForID = dateFormatID.format(date);
    String ordNum = newfuckinglatestcurrentdateformatever.format(date);

    public void genSeq(String hfc, String discipline, String subDiscipline,String module){
        String sql2 = "SELECT module_name,last_seq_no,year_seq,hfc_cd FROM oms_last_seq_no where module_name = '"+module+"' and hfc_cd ='" + hfc + "' and year(year_seq)='" + dateForID + "' and discipline_cd='"+discipline+"' and subdiscipline_cd ='"+subDiscipline+"' FOR UPDATE;";
        ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql2);
        if(data2.size() > 0){
            for(int i =0;i<data2.size();i++){
                seqId = data2.get(0).get(0);
                seqNo = data2.get(0).get(1);
                int seq = Integer.parseInt(seqNo);
                int currSeq = seq + 1;
                String currentSeq = Integer.toString(currSeq);
                
                //Generate ALL ORDER no
                int length = (int) Math.log10(currSeq) + 1;
                zero = "0";
                num = currentSeq;
                int count;
                for (count = length; count < 10; count++) {
                    num = zero + num;
                }
                OMSNo = seqId + ordNum;
                //UPDATE SEQUENCE NUMBER
                String updateRISNoSequence = "UPDATE oms_last_seq_no SET last_seq_no = '" + currentSeq + "' WHERE module_name = '"+module+"' and hfc_cd ='" + hfc + "' and year(year_seq)='" + dateForID + "' and discipline_cd='"+discipline+"' and subdiscipline_cd ='"+subDiscipline+"'; ";

                boolean isUpdateRISNoSequence = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, updateRISNoSequence);
                
            }
        }else{
            String sql3 = "INSERT INTO oms_last_seq_no(hfc_cd,discipline_cd,subdiscipline_cd,module_name,year_seq,last_seq_no,status,created_by,created_date) VALUES('"+hfc+"','"+discipline+"','"+subDiscipline+"','"+module+"','"+dateFormat.format(date)+"','1','1','CREATE ORDER APPS','"+dateFormat.format(date)+"');";
            boolean isInsertSequence = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql3);
            if(isInsertSequence){
                int currSeq=1;
                int length = (int) Math.log10(currSeq) + 1;
                zero = "0";
                seqId = module;
                String currentSeq = Integer.toString(currSeq);
                num = currentSeq;
                int count;
                for (count = length; count < 10; count++) {
                    num = zero + num;
                }
                OMSNo = seqId + ordNum;
            }
        }
    }
    
    public String getSeq(){
        System.out.println("ORDER ID: "+OMSNo);
       return OMSNo;
    }
}

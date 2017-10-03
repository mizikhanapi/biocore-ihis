/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnG_helper;

/**
 *
 * @author -D-
 */
import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

public class ProgressNote {
    
    RMIConnector rmi = new RMIConnector();
    Conn con = new Conn();
    
    public ArrayList<ArrayList<String>> getProgressNote (String datas,String view){
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData []  = datas.split("\\|",-1);
        String pmino, hfc;
        pmino = splittedData[0];
        hfc = splittedData[1];
        String episode_date = splittedData[2];
        String encounter_date = splittedData[3];
        if(view.equals("all")){
            String sql = "SELECT episode_date,encounter_date,`Clinical_Notes` FROM lhr_ong_progress_notes WHERE pmi_no = '" + pmino + "' AND hfc_cd = '" + hfc + "' ORDER BY encounter_date DESC;";
            data = con.getData(sql);
        }

        return data;
    }
    
    public Boolean addProgressNote(String datas){
        Boolean state = false;
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|",-1);
        String pmiNo = splittedData[0];
        String hfc_cd = splittedData[1];
        String episode_date = splittedData[2];
        String encounter_date = splittedData[3];
        String note = splittedData[4];
        String sql = "INSERT INTO emedica.lhr_ong_progress_notes (pmi_no, hfc_cd, episode_date, encounter_date, `Clinical_Notes`) \n" +
                "	VALUES ('"+pmiNo+"', '"+hfc_cd+"', '"+episode_date+"', '"+encounter_date+"', '"+note+"')";
        state = rmi.setQuerySQL(con.HOST, con.PORT, sql);
        return state;
    }
    
    public Boolean updateProgressNote(String datas){
        Boolean state = false;
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmiNo = splittedData[0];
        String hfc_cd = splittedData[1];
        String episode_date = splittedData[2];
        String encounter_date = splittedData[3];
        String note = splittedData[4];
        String sql = "UPDATE emedica.lhr_ong_progress_notes SET `Clinical_Notes` = '"+note+"' WHERE pmi_no = '"+pmiNo+"' AND hfc_cd = '"+hfc_cd+"' AND episode_date = '"+episode_date+"' AND encounter_date = '"+encounter_date+"';";
        
        state = rmi.setQuerySQL(con.HOST, con.PORT, sql);
        return state;
    }
    
    public Boolean deleteProgressNote(String datas){
        Boolean state = false;
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmiNo = splittedData[0];
        String hfc_cd = splittedData[1];
        String episode_date = splittedData[2];
        String encounter_date = splittedData[3];
        String sql = "DELETE FROM emedica.lhr_ong_progress_notes WHERE pmi_no = '"+pmiNo+"' AND hfc_cd = '"+hfc_cd+"' AND episode_date = '"+episode_date+"' AND encounter_date = '"+encounter_date+"';";
        state = rmi.setQuerySQL(con.HOST, con.PORT, sql);
        return state;
    }
    
    
}

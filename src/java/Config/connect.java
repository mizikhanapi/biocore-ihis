package Config;

import java.util.ArrayList;
import main.RMIConnector;


public class connect {
     public final static String HOST = "10.73.32.200";
    public final static int PORT = 1098;
    
    public static ArrayList<ArrayList<String>> getData(String query) 
    {
        RMIConnector rmic = new RMIConnector();

//        String host_db = Config.url_server;
        String host_db = connect.HOST;
        
        ArrayList<ArrayList<String>> data = rmic.getQuerySQL(host_db, connect.PORT, query);
        
        return data;
    }
     public static void main(String[] args){
         
        System.out.println("Fetching data...");
         //connectDB.getData("select * from lab_request_parent");
         
         ArrayList<ArrayList<String>> testData = connect.getData("select user_id from adm_users where user_id = 'DR007'");
        
         System.out.println("Done fetching data...");
         System.out.println("Data: "+ testData.get(0).get(0));
     }
}


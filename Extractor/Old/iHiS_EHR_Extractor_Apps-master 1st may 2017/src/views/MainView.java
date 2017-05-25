/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import Config_Pack.Config;
import controller.Thread1;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author umarmukhtar
 */
public class MainView {
    
    public static void main(String[] args) throws IOException {
        
//        String host = "ecss.utem.edu.my";
        File file = new File("c:/ipcall.txt");
        FileReader fileReader = new FileReader(file);
        BufferedReader  bufferReader = new BufferedReader(fileReader);
        
                        String sCurrentLine = "";
                        String host = "";
                        int port = 1999;
			while ((sCurrentLine = bufferReader.readLine()) != null) {
                            char firstLatter = sCurrentLine.charAt(0);
                            if(firstLatter != '#'){
                                String Line[] = sCurrentLine.split(":");
                                try{
                                    if(Line[0] == "hostserver" || Line[0].equals("hostserver")){
                                        host = Line[1];
                                        Config.ipAddressServer = host;
                                        //System.out.println(host);
                                    }
                                    else if(Line[0] == "hostport" || Line[0].equals("hostport")){
                                          port = Integer.parseInt(Line[1]);
                                          //System.out.println(port);
                                          Config.portServer = port;
                                    }
                                
                                }catch(Exception e){
                                   e.getMessage();
                                }

        
    }
                        }
        
        try {
            host = args[0];
        } catch (Exception e) {
        }
        
        try {
            port = Integer.parseInt(args[1]);
        } catch (Exception e) {
        }
        
        Thread1 t1 = new Thread1(host, port);
        Thread run1 = new Thread(t1);
        run1.start();
    }
}

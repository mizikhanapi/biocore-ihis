/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import helpers.J;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;
import oms.rmi.server.Message;

/**
 *
 * @author End User
 */
public class Queue {
    public Vector getQueueList() throws Exception {

        Vector<Vector<String>> QueueVector = new Vector<Vector<String>>();

        try {
            
            Registry myRegistry = LocateRegistry.getRegistry(DBConn.getHost(), DBConn.getPort_rmi());

            Message impl = (Message) myRegistry.lookup("myMessage");

            //QueueVector = impl.getQueueCallingSystem();
            
        } catch (Exception e) {
            
            J.o("Network Error", "Network Error!\nPlease check with your administrator ..", 0);
            e.printStackTrace();
        }

        return QueueVector;
    }
}

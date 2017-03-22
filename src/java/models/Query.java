/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import bean.Calling_system_bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author umarmukhtar
 */
public class Query {
    
    public boolean setQuery(String query) {
        boolean status = false;
        
        DBConn dbconn = new DBConn();
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            conn = dbconn.getConn();
            ps = conn.prepareStatement(query);
            ps.execute();
            status = true;
        } catch (Exception e) {
            status = false;
            System.out.println("Error #3: "+e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
                System.out.println("Closed");
            } catch (Exception e1) {
                System.out.println("Error #4: "+e1.getMessage());
            }
        }
        
        return status;
    }
    
    public ArrayList<ArrayList<String>> getQuery(String query) {
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        
        DBConn dbconn = new DBConn();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = dbconn.getConn();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {

                ArrayList<String> d = new ArrayList<String>();
                
                try {
                    for (int i = 0; ; i++) {
                        d.add(rs.getString(i+1));
                    }
                } catch (Exception e) {
                }

                data.add(d);
            }
            System.out.println("Opened");
        } catch (Exception e) {
            System.out.println("Error #1: "+e.getMessage());
            data.removeAll(data);
            data = new ArrayList<ArrayList<String>>();
        } finally {
            try {
                if (ps != null) ps.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
                System.out.println("Closed");
            } catch (Exception e1) {
                System.out.println("Error #2: "+e1.getMessage());
            }
        }
        
        return data;
    }
    
    public ArrayList<Calling_system_bean> getQueryCallingSystem(String query) {
        
        ArrayList<Calling_system_bean> data = new ArrayList<Calling_system_bean>();
        
        DBConn dbconn = new DBConn();
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = dbconn.getConn();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {

                Calling_system_bean csb = new Calling_system_bean();
                csb.setCs_id(rs.getString("cs_id"));
                csb.setCs_hfc_cd(rs.getString("cs_hfc_cd"));
                csb.setCs_discipline(rs.getString("cs_discipline"));
                csb.setCs_sub_discipline(rs.getString("cs_sub_discipline"));
                csb.setCs_pmi_no(rs.getString("cs_pmi_no"));
                csb.setCs_patient_name(rs.getString("cs_patient_name"));
                csb.setCs_queue_no(rs.getString("cs_queue_no"));
                csb.setCs_queue_name(rs.getString("cs_queue_name"));
                csb.setCs_datetime(rs.getString("cs_datetime"));
                csb.setCs_callingtime(rs.getInt("cs_callingtime"));

                data.add(csb);
            }
            System.out.println("Opened");
        } catch (Exception e) {
            System.out.println("Error #1: "+e.getMessage());
            data.removeAll(data);
            data = new ArrayList<Calling_system_bean>();
        } finally {
            try {
                if (ps != null) ps.close();
                if (rs != null) rs.close();
                if (conn != null) conn.close();
                System.out.println("Closed");
            } catch (Exception e1) {
                System.out.println("Error #2: "+e1.getMessage());
            }
        }
        
        return data;
    }
}

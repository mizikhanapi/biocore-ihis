<%-- 
    Document   : requestNewOrder_insert
    Created on : Jun 15, 2017, 5:39:58 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String creator = (String) session.getAttribute("USER_ID");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String orderNo = request.getParameter("orderNo");
    String proCode = request.getParameter("proCode");
    String comment = request.getParameter("instruction");
    String epDate = request.getParameter("epDate");
    String proName = request.getParameter("proName");
        
    Conn con = new Conn();
    
    String query ="Select procedure_cd from pos_order_detail where hfc_cd='"+hfc_cd+"' and order_no='"+orderNo+"' and procedure_cd='"+proCode+"' limit 1;";
    ArrayList<ArrayList<String>> duplicate = con.getData(query);
    
    if(duplicate.size()>0){
        out.print("duplicate");
    }
    else{
        RMIConnector rmi = new RMIConnector();
        query ="Insert into pos_order_detail(order_no, hfc_cd, episode_date, encounter_date, procedure_cd,comment, doctor_id, order_status, txn_date, procedure_name) "
                + "values('"+orderNo+"', '"+hfc_cd+"', '"+epDate+"', now(), '"+proCode+"', '"+comment+"', '"+creator+"', '0', now(), '"+proName+"')";
        
        boolean insert = rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        if(insert){
            out.print("success");
        }
        else{
            out.print("fail");
        }
    }
%>
<%-- 
    Document   : requestNewOrder_insert
    Created on : Apr 25, 2017, 5:34:15 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String creator =(String) session.getAttribute("USER_ID");
    
    String orderNo = request.getParameter("orderNo");
    String bsCode = request.getParameter("bsCode");
    String modCode = request.getParameter("modCode");
    String proCode = request.getParameter("proCode");
    String instruction = request.getParameter("instruction");
    
    String sqlCheck = "Select order_no from ris_order_detail "
            + "where order_no = '"+orderNo+"' AND modality_cd = '"+modCode+"' AND body_system_cd = '"+bsCode+"' AND procedure_cd = '"+proCode+"' LIMIT 1";
    
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size()>0){
        out.print("duplicate");
        
    }else{
        RMIConnector rmic = new RMIConnector();
        String query = "Insert into ris_order_detail(order_no, modality_cd, body_system_cd, procedure_cd, episode_date, encounter_date, requestor_comments, order_status, created_by, created_date, txn_date) "
                + "values('"+orderNo+"', '"+modCode+"', '"+bsCode+"', '"+proCode+"', now(), now(), '"+instruction+"', '0', '"+creator+"', now(), now());";
    
        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isInsert){
            out.print("success");
        }else{
            out.print("fail");
        }
    
    }
%>

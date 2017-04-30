<%-- 
    Document   : verify_result
    Created on : May 1, 2017, 5:32:36 AM
    Author     : user
--%>

<%@page import="RIS_helper.Order_Master"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String verifier = (String) session.getAttribute("USER_ID");
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    //String process = request.getParameter("process");
    String orderNo = request.getParameter("orderNo");
    String bsCode = request.getParameter("bsCode");
    String modCode = request.getParameter("modCode");
    String proCode = request.getParameter("proCode");
    String comment = request.getParameter("comment");
    
    boolean isSuccess = false;
    
    String query = "Update ris_result_detail set filler_comments = '"+comment+"', result_status = '2', verify_by = '"+verifier+"', verify_date = now() "
            + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "'";
    
    isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isSuccess){
    
        query = "Update ris_order_detail set filler_comments = '"+comment+"', order_status = '2', verify_by = '"+verifier+"', verify_date = now() "
            + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "'";
        isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    }
    
    if(isSuccess){
        Order_Master om = new Order_Master(orderNo);
        om.updateOrderMasterStatus();
        out.print("success");    
    
    }else{
        out.print("fail");
    }
%>

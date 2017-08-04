<%-- 
    Document   : procedure_update
    Created on : May 10, 2017, 7:05:24 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String status = request.getParameter("status");
    String buy = request.getParameter("buy");
    String sell = request.getParameter("sell");
    
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    try{
        String query = "Update cis_procedure set procedure_name = '"+name+"', status = '"+status+"', selling_price='"+sell+"', buying_price='"+buy+"' "
            + "Where procedure_cd = '"+code+"' and hfc_cd = '"+hfc_cd+"' ";
        boolean isUpdate = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

        if(isUpdate){
            out.print("success");
        }else{
            out.print("fail");
        }
    }catch(Exception e){
        System.out.println("CIS procedure update: ");
        e.printStackTrace();
        response.sendError(response.SC_EXPECTATION_FAILED);
    }
    
    
    

%>



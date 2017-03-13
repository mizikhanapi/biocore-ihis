<%@page import="dBConn.Conn"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    
    if (request != null && request.getContentType() != null) {
        int number = Integer.parseInt(request.getParameter("Total"));
        String C_date = request.getParameter("C_date");
        String C_time = request.getParameter("C_time");
        String pmi = request.getParameter("Pmi");
        String patient_name = request.getParameter("patient_name");
        
        String orderno1 = request.getParameter("Order_no");
        String[] Specimen = request.getParameterValues("Specimen[]");
        String status = "Order";
        //int test = Integer.parseInt(number);
    
        RMIConnector rmic = new RMIConnector();
        Conn conn = new Conn();
        String sqlRow = "SELECT COUNT(specimen_no) AS rowcount FROM lis_specimen";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlRow);
        ArrayList<ArrayList<String>> q1 = conn.getData(sqlRow);
       
        for(int i=0;i<number;i++)
        {
            
           
            String hfc_code = "SELECT hfc_cd FROM lis_order_master WHERE pmi_no='"+pmi+"' AND order_no='"+orderno1+"'";
            rmic.setQuerySQL(conn.HOST, conn.PORT, hfc_code);
            ArrayList<ArrayList<String>> q2 = conn.getData(hfc_code);
            
            String sqlInsert = "INSERT INTO lis_specimen(specimen_no,order_no,pmi_no,hfc_cd,item_cd,Collection_date,Collection_time,Status_specimen,patient_name) VALUES ('"+q1.get(0).get(0)+"','"+orderno1+"','"+pmi+"','"+q2.get(0).get(0)+"','"+Specimen[i]+"','"+C_date+"','"+C_time+"','"+status+"','"+patient_name+"')";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        }
        
        
}
    
    
    
    
    
   
    

%>
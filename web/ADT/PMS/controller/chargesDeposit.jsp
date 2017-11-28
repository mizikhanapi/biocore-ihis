<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Conn conn = new Conn();

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    //String disb = request.getParameter("Dis");->null
    String wnamecode = request.getParameter("wnamecode");
    String WardTypeb = request.getParameter("WardType");
    String EliSource = request.getParameter("EliSource");
    String EliTy = request.getParameter("EliTy");
    
/* 
    charge type:
    001 -> Deposit
    */

  
        String resultEliSrc = "select  charges_fees from wis_hospital_charges  "
                + "where charges_type = '001' and  ward_class_code ='" + WardTypeb + "' and  hfc_cd ='" + hfc + "' AND ward_id='"+wnamecode+"' AND eligibility_sources_cd='"+EliSource+"' AND eligibility_type_cd='"+EliTy+"';";
        ArrayList<ArrayList<String>> dataEliSrc = conn.getData(resultEliSrc);
        
        if(dataEliSrc.size()>0){
            out.print(dataEliSrc.get(0).get(0));
        }
        else{
            out.print("0.00");
        }
        
%>



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

    String disb = request.getParameter("Dis");
    String wnamecode = request.getParameter("wnamecode");
    String WardTypeb = request.getParameter("WardType");
    String EliSource = request.getParameter("EliSource");
    String EliTy = request.getParameter("EliTy");
    String total = "";
//eligibility_source_cd ='" + EliSource + "'

  
        String resultEliSrc = "select  charges_fees from wis_hospital_charges  where charges_type = '001' and  ward_class_code ='" + WardTypeb + "' and  hfc_cd ='" + hfc + "' AND ward_id='"+wnamecode+"' ";
        ArrayList<ArrayList<String>> dataEliSrc = conn.getData(resultEliSrc);
        
        for (int E = 0; E < dataEliSrc.size(); E++) {
            String t = dataEliSrc.get(E).get(0);
            total = t;
        }
        out.print(total);
%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    String updateEliSrc_cd = request.getParameter("updateEliSrc_cd");
    String updateEliTy_cd = request.getParameter("updateEliTy_cd");
    String updateChargeType_cd = request.getParameter("updateChargeType_cd");
   out.print(updateEliSrc_cd);
      out.print(updateEliTy_cd);

         out.print(updateChargeType_cd);


    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    String sql = "DELETE FROM wis_hospital_charges WHERE charges_type = '" + updateChargeType_cd + "' and eligibility_type_cd = '"+updateEliTy_cd+"' and eligibility_sources_cd = '"+updateEliSrc_cd+"'";
//   ward_class_code = '" + id + "' AND hfc_cd = '" + hfc + "' 

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>

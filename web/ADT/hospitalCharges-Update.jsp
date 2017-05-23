
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

    String updateEliSrc_cd, updateEliTy_cd, updateChargeType_cd, updateChargeFees, updatewname_cd, updatewclass_cd;
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String sub = request.getParameter("sub");
    String createdBy = request.getParameter("createdBy");

    updateEliSrc_cd = request.getParameter("updateEliSrc_cd");
    updateEliTy_cd = request.getParameter("updateEliTy_cd");
    updateChargeType_cd = request.getParameter("updateChargeType_cd");
    updatewclass_cd = request.getParameter("updatewclass_cd");
    updatewname_cd = request.getParameter("updatewname_cd");

    updateChargeFees = request.getParameter("updateChargeFees");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE wis_hospital_charges SET charges_fees = '" + updateChargeFees + "'"
            + " WHERE ward_class_code = '" + updatewclass_cd + "' AND ward_id = '" + updatewname_cd + "' AND eligibility_sources_cd = '" + updateEliSrc_cd + "' AND  eligibility_type_cd = '" + updateEliTy_cd + "' AND hfc_cd = '" + hfc + "'AND subdiscipline_cd = '" + sub + "' AND  discipline_cd = '" + dis + "' AND charges_type = '" + updateChargeType_cd + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
        //out.print(sqlUpdate);
    }

%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String eliSrc, eliTy, ChargeType, ChargeFees;
    String hfc = request.getParameter("hfc");
    String dis = "";
    String sub = "";

    String wname = request.getParameter("wname");
    String wclass = request.getParameter("wclass");

    String createdBy = request.getParameter("createdBy");

    eliSrc = request.getParameter("eliSrc");
    eliTy = request.getParameter("EliTy");
    ChargeType = request.getParameter("ChargeType");
    ChargeFees = request.getParameter("ChargeFees");
    

    String sqlCheck = "SELECT charges_type FROM wis_hospital_charges WHERE charges_type = '" + ChargeType + "' and "
            + "eligibility_sources_cd = '" + eliSrc + "'   and eligibility_type_cd = '" + eliTy + "' and  ward_class_code = '" + wclass + "' and ward_id = '" + wname + "' and hfc_cd='"+hfc+"' LIMIT 1 ";
    int duplicateSize = conn.getData(sqlCheck).size();
//
    if (duplicateSize > 0) {
        out.print("Duplicate");
    } else {
        
        sqlCheck ="Select discipline_cd, subdiscipline_cd from wis_ward_name where ward_id='"+wname+"' and hfc_cd='"+hfc+"' limit 1;";
        ArrayList<ArrayList<String>> dataDis = conn.getData(sqlCheck);
        if(dataDis.size()>0){
            dis = dataDis.get(0).get(0);
            sub = dataDis.get(0).get(1);
        }

        String sqlInsert = "INSERT INTO wis_hospital_charges (ward_class_code, ward_id, eligibility_sources_cd, hfc_cd, eligibility_type_cd, discipline_cd, charges_type, subdiscipline_cd, charges_fees,"
                + " created_by, created_date) "
                + "VALUES ('" + wclass + "','" + wname + "','" + eliSrc + "','" + hfc + "','" + eliTy + "','" + dis + "','" + ChargeType + "','" + sub + "',"
                + "'" + ChargeFees + "','" + createdBy + "', now() )";
        //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }


%>
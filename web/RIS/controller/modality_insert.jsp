<%-- 
    Document   : modality_insert
    Created on : Apr 3, 2017, 5:37:24 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String MOD_hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String creator = session.getAttribute("USER_ID").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdiscipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String mod_cd = request.getParameter("mod_code");
    String mod_name = request.getParameter("mod_name");
    String status = request.getParameter("status");

    Conn conn = new Conn();

    String sqlCheck = "Select modality_cd from ris_modality where modality_cd = '" + mod_cd + "' AND hfc_cd = '" + MOD_hfc + "' limit 1";

    ArrayList<ArrayList<String>> dataDuplicate = conn.getData(sqlCheck);

    if (dataDuplicate.size() > 0) {
        out.print("Sorry, the modality code "+mod_cd+" is already used. Please enter different code.");

    } else {
        RMIConnector rmic = new RMIConnector();

        String query = "Insert into ris_modality(hfc_cd, modality_cd, modality_name, discipline_cd, subdiscipline_cd, created_by, created_date, status) "
                + "values('" + MOD_hfc + "', '" + mod_cd + "', '" + mod_name + "', '" + discipline + "', '" + subdiscipline + "', '" + creator + "', now(), '" + status + "')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, query);

        if (isInsert) {
            out.print("success");
        } else {
            out.print("fail");
        }

    }


%>

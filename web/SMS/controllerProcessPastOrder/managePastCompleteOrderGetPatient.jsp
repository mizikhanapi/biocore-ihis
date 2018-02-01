<%-- 
    Document   : managePastCompleteOrderGetPatient
    Created on : Feb 1, 2018, 7:32:39 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String pmiNo = request.getParameter("customerID");

    Conn con = new Conn();
    //                          0                   1                                                   2                           3                               4                       5
    String query = "SELECT aus.NEW_ICNO, IFNULL(DATE_FORMAT(aus.birth_date, '%d/%m/%Y'),'-'), IFNULL(aus.SEX_CODE,'-'), IFNULL(aus.OCCUPATION_CODE,'-') "
            + " FROM adm_users aus "
            // where condition
            + "WHERE aus.USER_ID = '" + pmiNo + "' ;";

    ArrayList<ArrayList<String>> dataPat = con.getData(query);

    out.print(query);

    JSONObject json = new JSONObject();
    json.put("valid", false);

    if (dataPat.size() > 0) {

        json.put("valid", true);

        json.put("IC", dataPat.get(0).get(0));
        json.put("dob", dataPat.get(0).get(1));

    }

    out.print(json.toString());
%>
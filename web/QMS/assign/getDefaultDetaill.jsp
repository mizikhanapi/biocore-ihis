<%-- 
    Document   : getDefaultDetaill
    Created on : Jul 23, 2017, 6:42:33 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String HFC_CODE = request.getParameter("HFC_CODE");
    String DISCIPLINE_CODE = request.getParameter("DISCIPLINE_CODE");
    String SUB_DISCIPLINE_CODE = request.getParameter("SUB_DISCIPLINE_CODE");

    String searchProblem = "SELECT hf.hfc_name, d.discipline_name, sd.subdiscipline_name  "
            + "FROM adm_health_facility hf  "
            + "INNER JOIN adm_discipline d ON hf.hfc_cd = d.discipline_hfc_cd  "
            + "INNER JOIN adm_subdiscipline sd ON d.discipline_cd = sd.discipline_cd  "
            + "WHERE hf.hfc_cd = '"+HFC_CODE+"' "
            + "AND d.discipline_cd = '"+DISCIPLINE_CODE+"' "
            + "AND sd.subdiscipline_cd = '"+SUB_DISCIPLINE_CODE+"'  "
            + "GROUP BY hf.hfc_cd ;";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>                           


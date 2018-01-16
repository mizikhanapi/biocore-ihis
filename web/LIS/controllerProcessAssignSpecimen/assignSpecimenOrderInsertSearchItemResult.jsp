<%-- 
    Document   : assignSpecimenOrderInsertSearchItemResult
    Created on : Jan 15, 2018, 11:38:06 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String id = request.getParameter("id");

    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    Conn conn = new Conn();

    //id.toLowerCase();
    //                               0          1                   2                       3                       4                   5                         
    String searchProblem = "SELECT item_cd, item_name, IFNULL(spe_source,'-'), IFNULL(spe_container,'-'), IFNULL(volume,'-'), IFNULL(special_inst,'-') "
            //            FROM CONDITION        
            + " FROM lis_item_detail "
            //            WHERE CONDITION        
            + " where item_cd = '" + id + "' "
            + " AND hfc_cd = '" + HEALTH_FACILITY_CODE + "'  ";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>                           

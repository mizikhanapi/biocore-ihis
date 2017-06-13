<%-- 
    Document   : search_procedure
    Created on : Jun 13, 2017, 6:02:16 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String key = request.getParameter("key");
    
    Conn con = new Conn();
    String query ="select ifnull(cp2.`PROCEDURE_2_CD`, ifnull(cp1.`PROCEDURE_1_CD`, cp.`PROCEDURE_CD`)) as code, "
            + "cp.`PROCEDURE_NAME`, ifnull(cp1.`PROCEDURE_1_NAME`, ''), ifnull(cp2.`PROCEDURE_2_NAME`, '') "
            + "from cis_procedure cp "
            + "left join cis_procedure_1 cp1 on cp1.`PROCEDURE_CD` = cp.`PROCEDURE_CD` and cp1.hfc_cd = cp.hfc_cd "
            + "left join cis_procedure_2 cp2 on cp2.`PROCEDURE_1_CD` = cp1.`PROCEDURE_1_CD` and cp2.hfc_cd = cp1.hfc_cd "
            + "where cp.hfc_cd = '99_iHIS_99' and "
            + "(concat(cp2.`PROCEDURE_2_CD`, '|', cp2.procedure_2_name) like '%1%' "
            + "or concat(cp1.`PROCEDURE_1_CD`, '|', cp1.procedure_1_name)  like '%1%' "
            + "or concat(cp1.`PROCEDURE_1_CD`, '|', cp.procedure_name) like '%1%');";
    
    ArrayList<ArrayList<String>> dataPom = con.getData(query);
    
%>

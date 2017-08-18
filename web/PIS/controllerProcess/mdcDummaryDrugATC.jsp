<%-- 
    Document   : mdcDummaryDrugATC
    Created on : May 4, 2017, 10:37:24 PM
    Author     : Shammugam
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String superUserHFC = "99_iHIS_99";
    String superUserDIS = "BIT1010";

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>
<div class="thumbnail">
    <h4 style="padding-top: 0px; padding-bottom: 30px;">ATC Medicine's List That Should Be Cloned To Avoid Conflict With Drug Codes</h4>
    <hr class="pemisah" />
    <div style="height: 200px; overflow: auto; margin-top:-30px; padding-top: 30px;">    
        <table class="table table-striped"  width="30%" style="margin-bottom: 0px; margin-top:-30px;">
            <thead>
                <tr >
                    <th style="color: #999; font-weight: 500;" > ATC Drug Code</th>
                    <th style="color: #999; font-weight: 500;" > ATC Drug Description </th>
                </tr>
            </thead>
            <tbody>

                <%
                    String sqlMDCStock = "SELECT UD_ATC_Code,UD_ATC_Desc FROM pis_atc WHERE hfc_cd = '" + superUserHFC + "' "
                            + " AND UD_ATC_Code IN (SELECT DISTINCT(UD_ATC_CODE) FROM pis_mdc2 WHERE hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "')"
                            + " AND UD_ATC_Code NOT IN (SELECT UD_ATC_Code FROM pis_atc WHERE hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "');";
                    ArrayList<ArrayList<String>> dataMDCStock = conn.getData(sqlMDCStock);

                    int sizeStock = dataMDCStock.size();
                    for (int i = 0; i < sizeStock; i++) {


                %>
                <tr >
                    <td style="font-weight: bolder;" align="center"><%= dataMDCStock.get(i).get(0)%></td>
                    <td style="font-weight: bolder;" align="center"><%= dataMDCStock.get(i).get(1)%></td>
                </tr>
                <%

                    }
                %>
            </tbody>
        </table>
    </div>
    <div style="position: absolute; color: #999; top: 65px; right: 30px; font-weight: 500; text-transform: uppercase">Total Medicine : <%= sizeStock%></div>
</div>

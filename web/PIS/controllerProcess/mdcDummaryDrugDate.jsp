<%-- 
    Document   : mdcDummaryDrugDate
    Created on : Apr 28, 2017, 12:55:39 PM
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
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>
<div class="thumbnail">
    <h4 style="padding-top: 0px; padding-bottom: 30px;">Medicine's List That Will Expire (Less Than 150 Days)</h4>
    <hr class="pemisah" />
    <div style="height: 200px; overflow: auto; margin-top:-30px; padding-top: 30px;">    
        <table class="table table-striped"  width="30%" style="margin-bottom: 0px; margin-top:-30px;">
            <thead>
                <tr >
                    <th style="color: #999; font-weight: 500;" >Drug Name</th>
                    <th style="color: #999; font-weight: 500;" >Expire Date</th>
                    <th style="color: #999; font-weight: 500;" >Expire In (Days)</th>
                </tr>
            </thead>
            <tbody>

                <%
                    String sqlMDCDate = "SELECT ud_mdc_code,d_trade_name,DATE_FORMAT(DATE(d_exp_date),'%d/%m/%Y'),DATEDIFF(DATE_FORMAT(DATE(d_exp_date),'%Y-%m-%d'),CURDATE()) FROM pis_mdc2 "
                            + " WHERE DATEDIFF(DATE(d_exp_date),CURDATE()) < 150 AND hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";
                    ArrayList<ArrayList<String>> dataMDCDate = conn.getData(sqlMDCDate);

                    int sizeDate = dataMDCDate.size();
                    
                    for (int i = 0; i < sizeDate; i++) {

                        int dateValue = Integer.parseInt(dataMDCDate.get(i).get(3).toString());

                        if (dateValue < 0) {
                            dateValue = 0;
                        }

                %>
                <tr >
                    
                    <!-- First TD -->
                    <td style="font-weight: bolder;" align="center"><%= dataMDCDate.get(i).get(1)%> [<%= dataMDCDate.get(i).get(0)%>]</td>
                                       
                    <!-- Second TD -->
                    <td style="font-weight: bolder;" align="center"><%= dataMDCDate.get(i).get(2)%></td>
                                        
                    <!-- Third TD -->
                    <%    if (dateValue < 151 && dateValue > 30) {%>
                    <td style="color:#FFD700;font-weight: bolder;" align="center"><%= dateValue%></td>
                    <% } else if (dateValue < 31) {%>
                    <td style="color:red;font-weight: bolder;" align="center"><%= dateValue%></td>
                    <% }   %>

                </tr>
                <%

                    }
                %>
            </tbody>
        </table>
    </div>
    <div style="position: absolute; color: #999; top: 65px; right: 30px; font-weight: 500; text-transform: uppercase">Total Medicine : <%= sizeDate%></div>
</div>

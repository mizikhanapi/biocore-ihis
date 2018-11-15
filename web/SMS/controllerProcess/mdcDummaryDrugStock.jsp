<%-- 
    Document   : mdcDummaryDrugStock
    Created on : Apr 28, 2017, 12:55:23 PM
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
    <h4 style="padding-top: 0px; padding-bottom: 30px;">Medicine's List With Limited Stock (Less Than Reorder Level)</h4>
    <hr class="pemisah" />
    <div style="height: 200px; overflow: auto; margin-top:-30px; padding-top: 30px;">    
        <table class="table table-striped"  width="30%" style="margin-bottom: 0px; margin-top:-30px;">
            <thead>
                <tr >
                    <th style="color: #999; font-weight: 500;" > Drug Name</th>
                    <th style="color: #999; font-weight: 500;" > Reorder Level</th>
                    <th style="color: #999; font-weight: 500;" > Minimum Level</th>
                    <th style="color: #999; font-weight: 500;" > Drug Stock </th>
                </tr>
            </thead>
            <tbody>

                <%
                    String sqlMDCStock = "SELECT ud_mdc_code,d_trade_name,d_stock_qty,d_minimum_stock_level,d_reorder_stock_level FROM pis_mdc2 "
                            + "WHERE d_stock_qty < d_reorder_stock_level AND hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";

                    ArrayList<ArrayList<String>> dataMDCStock = conn.getData(sqlMDCStock);

                    int sizeStock = dataMDCStock.size();

                    for (int i = 0; i < sizeStock; i++) {

                        int stockValue = Integer.parseInt(dataMDCStock.get(i).get(2).toString());
                        int minimumValue = Integer.parseInt(dataMDCStock.get(i).get(3).toString());
                        int reorderValue = Integer.parseInt(dataMDCStock.get(i).get(4).toString());

                %>
                <tr >

                    <!-- First TD -->
                    <td style="font-weight: bolder;" align="center"><%= dataMDCStock.get(i).get(1)%> [<%= dataMDCStock.get(i).get(0)%>]</td>

                    <!-- Second TD -->
                    <td style="font-weight: bolder;" align="center"><%= reorderValue%></td>

                    <!-- Third TD -->
                    <td style="font-weight: bolder;" align="center"><%= minimumValue%></td>

                    <!-- Fourth TD -->
                    <%    if (stockValue < reorderValue && stockValue > minimumValue) {%>
                    <td style="color:#FFD700;font-weight: bolder;" align="center"><%= stockValue%></td>
                    <% } else if (stockValue < minimumValue) {%>
                    <td style="color:red;font-weight: bolder;" align="center"><%= stockValue%></td>
                    <% }   %>

                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <div style="position: absolute; color: #999; top: 65px; right: 30px; font-weight: 500; text-transform: uppercase">Total Medicine : <%= sizeStock%></div>
</div>

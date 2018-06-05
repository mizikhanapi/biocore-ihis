<%-- 
    Document   : stockItemSummaryItemStock
    Created on : Dec 12, 2017, 5:13:21 PM
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
    <h4 style="padding-top: 0px; padding-bottom: 30px;">Item's List With Limited Stock In the Warehouse (UNITS)</h4>
    <hr class="pemisah" />
    <div style="height: 200px; overflow: auto; margin-top:-30px; padding-top: 30px;">    
        <table class="table table-striped"  width="30%" style="margin-bottom: 0px; margin-top:-30px;">
            <thead>
                <tr >
                    <th style="color: #999; font-weight: 500;" > Item Name</th>
                    <th style="color: #999; font-weight: 500;" > Reorder Level</th>
                    <th style="color: #999; font-weight: 500;" > Minimum Level</th>
                    <th style="color: #999; font-weight: 500;" > Item Stock </th>
                </tr>
            </thead>
            <tbody>

                <%
                    String sqlSTOCKITEMReorder = "SELECT item_cd,item_name,IFNULL(physical_stock,'0'),IFNULL(min_stock,'0'),IFNULL(reorder_level,'0') "
                            + " FROM stk_stock_item "
                            + " WHERE physical_stock < reorder_level "
                            + " AND hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";

                    ArrayList<ArrayList<String>> dataSTOCKITEMReorder = conn.getData(sqlSTOCKITEMReorder);

                    int sizeSTOCKITEMReorder = dataSTOCKITEMReorder.size();

                    for (int i = 0; i < sizeSTOCKITEMReorder; i++) {

                        int stockValue = Integer.parseInt(dataSTOCKITEMReorder.get(i).get(2).toString());
                        int minimumValue = Integer.parseInt(dataSTOCKITEMReorder.get(i).get(3).toString());
                        int reorderValue = Integer.parseInt(dataSTOCKITEMReorder.get(i).get(4).toString());

                %>
                <tr >

                    <!-- First TD -->
                    <td style="font-weight: bolder;" align="center"><%= dataSTOCKITEMReorder.get(i).get(1)%> [<%= dataSTOCKITEMReorder.get(i).get(0)%>]</td>

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
    <div style="position: absolute; color: #999; top: 65px; right: 30px; font-weight: 500; text-transform: uppercase">Total Items : <%= sizeSTOCKITEMReorder%></div>
</div>


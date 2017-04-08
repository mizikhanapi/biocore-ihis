<%-- 
    Document   : listWard
    Created on : 08-Apr-2017, 15:47:08
    Author     : shay
--%>


<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Conn conn3 = new Conn();
String hfcTY = session.getAttribute("HEALTH_FACILITY_CODE").toString();
%>
<select id="WardClass" name="selectbasic" class="form-control">
                                        <option value="null" selected="" disabled="">Select Ward Class</option>
                                        <option value="-">-</option>


                                        <%
                                            String sql1 = "SELECT  ward_class_name FROM wis_ward_class WHERE hfc_cd ="+hfcTY+";";
                                            ArrayList<ArrayList<String>> dataClass1 = conn3.getData(sql1);

                                            int size4 = dataClass1.size();

                                            for (int i = 0; i < size4; i++) {
                                        %>
                                        <option value="<%= dataClass1.get(i).get(0)%>"><%= dataClass1.get(i).get(0)%> </option>
                                        <%
                                            }
                                        %>


</select>
<%-- 
    Document   : page_table
    Created on : Feb 8, 2017, 10:26:47 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String module_cd = request.getParameter("module_cd");
    String page_cd = request.getParameter("page_cd");
    String module_name = request.getParameter("module_name");
    String page_name = request.getParameter("page_name");

    if (page_cd == null) {

        out.print("<h4><mark class='text-warning'>Please select the page first in previous tab.</mark></h4>");
        return;
    }

%>
<h4>
    <span class="text-nowrap">Module: <b>(<%=module_cd%>) <%=module_name%></b></span>, &nbsp; <span class="text-nowrap">Page: <b>(<%=page_cd%>) <%=page_name%></b></span>
</h4>
<table  id="THE_menuTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Menu Code</th>
            <th>Menu Name</th>
            <th>Level</th>
            <th>Type</th>
            <th>Parent Code</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>

        <% //                      0           1           2       3           4       5
            String sql = "SELECT menu_cd, menu_name, menu_level, `type`, parent_cd, status "
                    + "FROM adm_menu "
                    + "WHERE module_cd='" + module_cd + "' and page_cd='" + page_cd + "';";

            ArrayList<ArrayList<String>> dataModule = conn.getData(sql);

            int size = dataModule.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr>

            <td><%= dataModule.get(i).get(0)%></td> <!-- code -->   
            <td><%= dataModule.get(i).get(1)%></td> <!-- name  --> 
            <td><%= dataModule.get(i).get(2)%></td> <!-- level  --> 
            <td><%= dataModule.get(i).get(3)%></td> <!-- type  --> 
            <td><%= dataModule.get(i).get(4)%></td> <!-- parent  --> 
            <td style="width: 5%"><%if (dataModule.get(i).get(5).equals("0")) {
                    out.print("Active");
                } else {
                    out.print("Inactive");
                } %></td> <!--status --> 

            <td style="width: 5% ">
                <input id="MENU_hidden" type="hidden" value="<%=String.join("|", dataModule.get(i))%>">
                <!-- Update Part Start -->
                <a id="MENU_btnUpdateModal" style="cursor: pointer" title="Update menu"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                <!-- Delete Button Start -->
                <a id="MENU_btnDelete" class="testing" style="cursor: pointer" title="Delete menu"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
                <!-- Delete Button End -->
            </td>    
        </tr>



        <%
            }
        %>

    </tbody>
</table>




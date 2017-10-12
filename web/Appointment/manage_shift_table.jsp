<%-- 
    Document   : master_lookup_main
    Created on : Jan 25, 2017, 4:11:22 PM
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Formatter.FormatTarikh"%>
<%
     Conn Conn = new Conn();
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String hfc_name = (String) session.getAttribute("HFC_NAME");
        String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
        String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
                    ///     0           1           2        3          4               5       6       
    String sql = "select shift_cd, shift_name, start_time,end_time,shift_duration,start_date,end_date,status from pms_shift where hfc_cd = '"+hfc+"' AND discipline_cd = '"+discipline+"' AND subdiscipline_cd = '"+subdiscipline+"'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);


%>

<!-- Add Part Start -->
<!-- Add Button Start -->

<!-- Add Button End -->

<table  id="manage_shift_table"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Shift Code</th>
    <th>Shift Name</th>
    <th>Start Time</th>
    <th>End Time</th>
    <th>Duration</th>
    <th>Start Date</th>
    <th>End Date</th>
    <th>Status</th>
    <th>Action</th>
</thead>
<tbody>
    <%
        if(data.size() > 0){
            for(int i = 0; i< data.size(); i++){
                     String dateFrom = FormatTarikh.formatDate(data.get(i).get(5), "yyyy-MM-dd", "dd-MM-yyyy");
                         String dateTo = FormatTarikh.formatDate(data.get(i).get(6), "yyyy-MM-dd", "dd-MM-yyyy");
           %>
            <tr>
                <td id="shift_code_e"><%out.print(data.get(i).get(0));%></td>
                <td id="shift_name_e"><%out.print(data.get(i).get(1));%></td>
                <td id="start_time_e"><%out.print(data.get(i).get(2));%></td>
                <td id="end_time_e"><%out.print(data.get(i).get(3));%></td>
                <td id="duration_e"><%out.print(data.get(i).get(4));%></td>
                <td id="start_date_e"><%out.print(dateFrom);%></td>
                <td id="end_date_e"><%out.print(dateTo);%></td>
                <td id="status_e"><%out.print(data.get(i).get(7));%></td>
                <td> 
                    <a id="MSHIFT_btnUpdate" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                     <a id="MSHIFT_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
                </td>
            </tr>
            <%
                }
        }        
        %>
</tbody>
</table>


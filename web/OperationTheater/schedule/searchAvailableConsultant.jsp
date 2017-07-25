<%-- 
    Document   : searchAvailableConsultant
    Created on : Jul 25, 2017, 1:54:07 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String dateFrom = request.getParameter("dateFrom");
    String dateTo = request.getParameter("dateTo");
    
    //"dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms"
    dateFrom = DateFormatter.formatDate(dateFrom, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
    dateTo = DateFormatter.formatDate(dateTo, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
    
    //                          0        1  
    String sqlBS = "SELECT user_id, user_name from adm_users "
            + "where health_facility_code='"+hfc_cd+"' and status='0' and user_name is not null and user_id not in "
            + "( "
            + "select consultant_id from opt_order_detail d "
            + "join opt_order_master m on m.hfc_to='"+hfc_cd+"' and d.order_no=m.order_no and (m.order_status not in ('3', '2')) "
            + "where (d.order_status not in ('2', '3')) and (('"+dateFrom+"' between d.startDateTime and d.endDateTime) or ('"+dateTo+"' between d.startDateTime and d.endDateTime) "
            + "or (d.`startDateTime` between '"+dateFrom+"' and '"+dateTo+"') or (d.`endDateTime` between '"+dateFrom+"' and '"+dateTo+"') ) "
            + ");";
    
    //((d.`startDateTime` between '"+dateFrom+"' and '"+dateTo+"') or (d.`endDateTime` between '"+dateFrom+"' and '"+dateTo+"')) 
    //('"+dateFrom+"' between d.startDateTime and d.endDateTime) or ('"+dateTo+"' between d.startDateTime and d.endDateTime)

    ArrayList<ArrayList<String>> dataCAT = conn.getData(sqlBS);
    
    if(dataCAT.size()<1){
        out.print("<h3>Sorry, no consultant available. Try picking different time.</h3>");
    }
    else{

%>

<table id="THE_availableConsultantTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="display: none">Hidden</th>    
    <th>User ID</th>
    <th>Name</th>
<!--    <th style="width: 5%">Update</th>
    <th style="width: 5%">Delete</th>-->
</thead>

<tbody>
    <%  
        
        for (int i = 0; i < dataCAT.size(); i++) {
           
        
    %>
    <tr>
<td style="display:none" id="SCH_hidden_column"><%= String.join("|", dataCAT.get(i))%></td>
<td><%= dataCAT.get(i).get(0)%></td>
<td><%= dataCAT.get(i).get(1)%></td>

<!--<td>
    <a id="SCH_btnView" style="cursor: pointer"><i class="fa fa-arrow-circle-right" aria-hidden="true" style="display: inline-block;color: #4d90fe;"></i></a>
</td>
<td>
    <a id="SCH_btnModalUpdate" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td>
    <a id="SCH_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>-->
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_availableConsultantTable').DataTable();
    });


    
</script>
<%
    }//end else
%>

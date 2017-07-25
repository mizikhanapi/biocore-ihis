<%-- 
    Document   : table
    Created on : Jul 20, 2017, 3:59:20 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                          0               1         2
    String sqlBS = "SELECT category_cd, category_name, status FROM opt_procedure_category where hfc_cd='"+hfc_cd+"' order by category_cd asc;";

    ArrayList<ArrayList<String>> dataCAT = conn.getData(sqlBS);

%>

<table id="THE_categoryTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="display: none">Hidden</th>    
    <th>Category Code</th>
    <th>Category Name</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">View Procedure</th>
    <th style="width: 5%">Update</th>
    <th style="width: 5%">Delete</th>
</thead>

<tbody>
    <%  
        String status ="";
        for (int i = 0; i < dataCAT.size(); i++) {
            if(dataCAT.get(i).get(2).equalsIgnoreCase("0")){
                status = "Active";
            }
            else{
                status = "Inactive";
            }
        
    %>
    <tr>
<td style="display:none" id="CAT_hidden_column"><%= String.join("|", dataCAT.get(i))%></td>
<td><%= dataCAT.get(i).get(0)%></td>
<td><%= dataCAT.get(i).get(1)%></td>
<td><%= status%>
</td>
<td>
    <a id="CAT_btnView" style="cursor: pointer"><i class="fa fa-arrow-circle-right" aria-hidden="true" style="display: inline-block;color: #4d90fe;"></i></a>
</td>
<td>
    <a id="CAT_btnModalUpdate" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td>
    <a id="CAT_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_categoryTable').DataTable();
    });


    
</script>

<%-- 
    Document   : table
    Created on : Jul 20, 2017, 6:24:20 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String category_cd = request.getParameter("code");
    String category_name = request.getParameter("name");
    
    try{
        //                          0                   1                            2              3           4               5               6
    String sqlBS = "SELECT p.procedure_cd, p.`procedure_shortName`, p.`procedure_longName`, p.quantity, p.buying_price, p.selling_price, p.status " 
            +"FROM opt_procedure p "
            +"join opt_procedure_category c on c.category_cd=p.category_cd and c.hfc_cd=p.hfc_cd "
            + "where p.category_cd='"+category_cd+"' and p.hfc_cd='"+hfc_cd+"';";

    ArrayList<ArrayList<String>> dataPRO = conn.getData(sqlBS);

%>

<table id="THE_procedureTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="display: none">Hidden</th>    
    <th>Procedure Code</th>
    <th>Procedure Name</th>
    <th>Buying Price(RM)</th>
    <th>Selling Price(RM)</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">Update</th>
    <th style="width: 5%">Delete</th>
</thead>

<tbody>
    <%  
        String status ="";
        for (int i = 0; i < dataPRO.size(); i++) {
            if(dataPRO.get(i).get(6).equalsIgnoreCase("0")){
                status = "Active";
            }
            else{
                status = "Inactive";
            }
        
    %>
    <tr>
<td style="display:none" id="PRO_hidden_column"><%= String.join("|", dataPRO.get(i))%></td>
<td><%= dataPRO.get(i).get(0)%></td>
<td><%= dataPRO.get(i).get(1)%></td>
<td><%= dataPRO.get(i).get(4)%></td>
<td><%= dataPRO.get(i).get(5)%></td>
<td><%= status%>
</td>
<td>
    <a id="PRO_btnModalUpdate" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td>
    <a id="PRO_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }// end for loop


%>
</tbody>

</table>

<%
    if(dataPRO.size()>0){

%>
<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_procedureTable').DataTable({
            deferRender: true
        });
    });


    
</script>
<%
    
    }// end if
    else{
    
%>
<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_procedureTable').DataTable({
            deferRender: true,
            searching: false,
            language: {
              emptyTable: "No procedure under this category. Please select other category."
            }
        });
    });


    
</script>
<%
    
    }//end else
%>

<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_procedureTable').DataTable();
    });


    
</script>
<%
    }
    catch(Exception e){
        e.printStackTrace();
    }
    
%>



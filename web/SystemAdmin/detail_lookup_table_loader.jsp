<%-- 
    Document   : detail_lookup_table_loader
    Created on : Mar 8, 2017, 11:06:12 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String masterCode = request.getParameter("masterCode");

    Conn conn = new Conn();
    String sql = " SELECT lm.master_reference_code, ld.detail_reference_code, ld.description, IFNULL(ld.status, ''), lm.description, ifnull(ld.priority_indicator, '0'), ifnull(DATE_FORMAT(ld.start_date,'%d/%m/%Y'), ''), ifnull(DATE_FORMAT(ld.end_date,'%d/%m/%Y'), '')"
            + " FROM adm_lookup_detail ld join adm_lookup_master lm using (master_reference_code) "
            + "WHERE master_reference_code = '"+masterCode+"' AND ld.hfc_cd = '"+hfc_cd+"'";
    ArrayList<ArrayList<String>> dataDetail = conn.getData(sql);

    int size = dataDetail.size();
    for (int i = 0; i < size; i++) {
%>

<tr style="text-align: left;">
<input id="DLT_hidden" type="hidden" value="<%=String.join("|", dataDetail.get(i))%>">
<td style="width: 10% "><%= dataDetail.get(i).get(0)%></td> <!--master code  -->   
<td style="width: 10% "><%= dataDetail.get(i).get(4)%></td> <!--master name  --> 
<td><%= dataDetail.get(i).get(1)%></td> <!--detail code  --> 
<td><%= dataDetail.get(i).get(2)%></td> <!--detail name  --> 
<td><%= dataDetail.get(i).get(5)%></td> <!--priority  --> 
<td><%= dataDetail.get(i).get(6)%></td> <!--start Date  --> 
<td><%= dataDetail.get(i).get(7)%></td> <!--end date  --> 
<td><%if (dataDetail.get(i).get(3).equals("1")) {
        out.print("Inactive");
    } else {
        out.print("Active");
    } %></td> <!--status 3 --> 

<td style="width: 5% ">

    <!-- Update Part Start -->
    <a id="DLT_btnUpdate" data-toggle="modal" data-target="#DLT_detail2_" style="cursor: pointer"><i data-toggle="tooltip" data-placement="left" title="Update code" class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Delete Button Start -->&nbsp;&nbsp;&nbsp;
    <a id="DLT_deleteButton_" class="testing" style="cursor: pointer"><i data-toggle="tooltip" data-placement="right" title="Delete code" class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>



<%
    }

if(size > 0){
%>

<script type="text/javascript">
     $('#THE_detailTable').DataTable({
        deferRender: true
     });

</script>

<%

}else{
%>
<script type="text/javascript">
     $('#THE_detailTable').DataTable({
        deferRender: true,
        searching: false
     });

</script>


<%

}
%>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
      }); 
</script>

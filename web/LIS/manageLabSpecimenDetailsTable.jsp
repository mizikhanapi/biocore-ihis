<%-- 
    Document   : manageLabSpecimenDetailsTable
    Created on : Jan 15, 2018, 7:13:39 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();
    String specimenNo = request.getParameter("specimenNo");
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    NumberFormat formatter = new DecimalFormat("#0.00");
    NumberFormat formatterInt = new DecimalFormat("#0");
    //                                  0             1                 2               3                       4                   5                  6                   7
    String orderList = "SELECT lissd.txt_date, lissd.specimen_no, lissd.item_cd, lissd.collection_date, lissd.collection_time, lissd.comment, lissd.specimen_status, lissd.approval, "
            //         8                         9                          10                          11                
            + " lisid.item_name, IFNULL(lisid.spe_source,''), IFNULL(lisid.spe_container,''), IFNULL(lisid.volume,'')  "
            // FROM DETAIL TABLE
            + " FROM lis_specimen_detail lissd "
            // LEFT JOIN ITEM TABLE
            + " LEFT JOIN lis_item_detail lisid ON (lissd.item_cd = lisid.item_cd)  "
            // WHERE CONDITION
            + " WHERE lissd.specimen_no = '" + specimenNo + "' AND (lissd.specimen_status = 'Newly Assigned Specimen') "
            + " AND lisid.hfc_cd = '" + HEALTH_FACILITY_CODE + "' ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientSpecimenDetailsListTable">
    <thead>
    <th style="text-align: left;">Check</th>
    <th style="text-align: left;">Item Code</th>
    <th style="text-align: left;">Item Name</th>
    <th style="text-align: left;">Specimen Source</th>
    <th style="text-align: left;">Specimen Container</th>
    <th style="text-align: left;">Volume</th>
    <th style="text-align: left;">Requester Comment</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {


    %>

    <tr style="text-align: center;" >
<input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<td align="center"><input type="checkbox" id="labSpecimenChecked" checked></td> <!-- Checked -->
<td data-status="pagado" data-toggle="modal" data-id="1"  align="center" ><%= dataOrderList.get(i).get(2)%></td> <!-- Code -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(8)%></td> <!-- Name -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(9)%></td> <!--  S Source -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(10)%></td> <!--  S Container -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(11)%></td> <!--  Volume -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(5)%></td> <!--  Comment -->

</tr>
<%
    }// end for loop
%>

</tbody>
</table>



<%-- 
    Document   : manageLabVerifyDetailsTable
    Created on : Jan 16, 2018, 3:06:07 AM
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
            //         8                         9                          10                          11                12                                    13
            + " lisid.item_name, IFNULL(lisid.spe_source,''), IFNULL(lisid.spe_container,''), IFNULL(lisid.volume,''), IFNULL(lissd.result_no,''), IFNULL(lisrt.verification,'') "
            // FROM DETAIL TABLE
            + " FROM lis_specimen_detail lissd "
            // LEFT JOIN ITEM TABLE
            + " LEFT JOIN lis_item_detail lisid ON (lissd.item_cd = lisid.item_cd)  "
            // LEFT JOIN ITEM TABLE
            + " LEFT JOIN lis_result lisrt ON (lissd.result_no = lisrt.result_no)  "
            // WHERE CONDITION
            + " WHERE lissd.specimen_no = '" + specimenNo + "' AND (lissd.specimen_status = 'Approved') "
            + " AND lisid.hfc_cd = '" + HEALTH_FACILITY_CODE + "' ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientSpecimenDetailsListTable">
    <thead>
        <!--    <th style="text-align: left;">Check</th>-->
    <th style="text-align: left;">Item Code</th>
    <th style="text-align: left;">Item Name</th>
    <th style="text-align: left;">Specimen Source</th>
    <th style="text-align: left;">Specimen Container</th>
    <th style="text-align: left;">Volume</th>
    <th style="text-align: left;">Requester Comment</th>
    <th style="text-align: center;">Action</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {

            String resultNo = dataOrderList.get(i).get(12);
            String resultStatus = dataOrderList.get(i).get(13);
            String addDisabled = "disabled";
            String verifyDisabled = "disabled";

            if (resultNo.trim().isEmpty()) {
                verifyDisabled = "disabled";
                addDisabled = "";
            }

            if (resultStatus.trim().equalsIgnoreCase("Waiting For Approval")) {
                addDisabled = "disabled";
                verifyDisabled = "";
            }


    %>

    <tr style="text-align: center;" >
<input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<!--<td align="center"><input type="checkbox" id="labSpecimenChecked" checked></td>  Checked -->
<td data-status="pagado" data-toggle="modal" data-id="1"  align="center" ><%= dataOrderList.get(i).get(2)%></td> <!-- Code -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(8)%></td> <!-- Name -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(9)%></td> <!--  S Source -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(10)%></td> <!--  S Container -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(11)%></td> <!--  Volume -->
<td  data-status="pagado" data-toggle="modal" data-id="1"  align="center"><%= dataOrderList.get(i).get(5)%></td> <!--  Comment -->
<td  align="center">
    <button class="btn btn-primary " type="button" id="btnVerifySpecimenEnterResult" data-toggle="modal" data-id="1" data-target="#addSpecimenResult" <%out.print(addDisabled);%>><i class="fa fa-database fa-lg"></i>&nbsp; Enter Result &nbsp;</button>
    &nbsp;
    <button class="btn btn-success " type="button" id="btnVerifySpecimenVerifyResult" data-toggle="modal" data-id="1" data-target="#verifySpecimenResult" <%out.print(verifyDisabled);%>><i class="fa fa-check-square-o fa-lg"></i>&nbsp; Verify Result &nbsp;</button>
</td> <!--  Action -->

</tr>
<%
    }// end for loop
%>

</tbody>
</table>



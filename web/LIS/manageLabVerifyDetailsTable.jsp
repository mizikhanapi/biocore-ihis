<%-- 
    Document   : manageLabVerifyDetailsTable
    Created on : Jan 16, 2018, 3:06:07 AM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
    String user = session.getAttribute("USER_ID").toString();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdis = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String hfcori = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disori = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdisori = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
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
    
String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    String dis_names = "";
    String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfc + "' and discipline_cd = '"+dis+"' order by discipline_name desc";
        ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query);
        for (int x = 0; x < mysqldis_name.size(); x++) {
            dis_names += mysqldis_name.get(x).get(0) + "|" + mysqldis_name.get(x).get(1);
            if (x < mysqldis_name.size() - 1) {
                dis_names += "^";
            }
        }


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

    <tr style="text-align: left;" >
<input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<!--<td align="center"><input type="checkbox" id="labSpecimenChecked" checked></td>  Checked -->
<td data-status="pagado" data-toggle="modal" data-id="1" ><%= dataOrderList.get(i).get(2)%></td> <!-- Code -->
<td  data-status="pagado" data-toggle="modal" data-id="1" ><%= dataOrderList.get(i).get(8)%></td> <!-- Name -->
<td  data-status="pagado" data-toggle="modal" data-id="1" ><%= dataOrderList.get(i).get(9)%></td> <!--  S Source -->
<td  data-status="pagado" data-toggle="modal" data-id="1" ><%= dataOrderList.get(i).get(10)%></td> <!--  S Container -->
<td  data-status="pagado" data-toggle="modal" data-id="1" ><%= dataOrderList.get(i).get(11)%></td> <!--  Volume -->
<td  data-status="pagado" data-toggle="modal" data-id="1" ><%= dataOrderList.get(i).get(5)%></td> <!--  Comment -->
<td style="width: 150px">
    <button class="btn btn-default" type="button" title="Prepare Item" id="MOD_btnPrepare" data-toggle="modal" data-target="#POSorderNewStockOrder"><i data-toggle="tooltip" data-placement="left" title="Prepare Item" class="fa fa-list-ol fa-lg" aria-hidden="true" ></i></button>
    <button class="btn btn-default" type="button" title="Enter Result" id="btnVerifySpecimenEnterResult" data-toggle="modal" data-target="#addSpecimenResult" <%out.print(addDisabled);%>><i data-toggle="tooltip" data-placement="left" title="Enter Result" class="fa fa-database fa-lg"></i></button>
    <button class="btn btn-default" type="button" title="Verify Result"  id="btnVerifySpecimenVerifyResult" data-toggle="modal" data-target="#verifySpecimenResult" <%out.print(verifyDisabled);%>><i data-toggle="tooltip" data-placement="right" title="Verify Result" class="fa fa-check-square-o fa-lg"></i></button>
</td> <!--  Action -->

</tr>
<%
    }// end for loop
%>

</tbody>
</table>



<%-- 
    Document   : distributeReportMasterTable
    Created on : 09-Nov-2018, 11:03:57
    Author     : Shay
--%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();

    String discipline = request.getParameter("patientType");
    String startdate = request.getParameter("startDate");
    String enddate = request.getParameter("endDate");
    String hfc = request.getParameter("hfc");
    String whereClause = "";
    ArrayList<ArrayList<String>> data;
    if (!discipline.equalsIgnoreCase("all")) {
        whereClause = " AND stkdis.hfc_cd = '" + hfc + "' AND stkdis.ordering_discipline_cd = '" + discipline + "' ";
    } else {
        whereClause = " AND stkdis.hfc_cd = '" + hfc + "' ";
    }
    //                                  0             1                               2                          3                4                 5         6
    String sqlquery = "SELECT stkdis.customer_id,stkdis.order_no,DATE_FORMAT(stkdis.txt_date, '%d/%m/%Y'),stkdis.item_amt,stkdis.quantity,stkdis.location,stkdis.hfc_cd,"
            //                 7            8                          9                  10                               11
            + "stkdis.discipline_cd,stkdis.subdiscipline_cd,stkdis.ordering_hfc_cd,stkdis.ordering_discipline_cd,stkdis.ordering_subdiscipline_cd,"
            //     12              13               14                 15             16
            + "stkdis.status,stkdis.created_by,stkdis.created_date,ahf.hfc_name,ad.discipline_name "
            + "FROM stk_distribition_master stkdis "
            + "JOIN adm_health_facility ahf ON ahf.hfc_cd = stkdis.hfc_cd "
            + "JOIN adm_discipline ad ON ad.discipline_hfc_cd = stkdis.hfc_cd AND ad.discipline_cd = stkdis.ordering_discipline_cd "
            + " WHERE cast(stkdis.txt_date as date) BETWEEN '" + startdate + "' AND '" + enddate + "'"
            + whereClause + " "
            + "ORDER BY stkdis.txt_date desc ;";

    data = conn.getData(sqlquery);
    if (data.size() > 0) { %>
<table  id="UTemPTLReport"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead >
    <th style="text-align: left;">Order No.</th>
    <th style="text-align: left;">Order Date</th>
    <th style="text-align: left;">Location</th>
    <th style="text-align: left;">Action</th>
</thead>
<tbody>


    <% for (int i = 0; i < data.size(); i++) {
        String joinRow = "";
                ArrayList<String> medicalInforow = data.get(i);
                for(int x = 0; x < medicalInforow.size(); x++){
                     joinRow = String.join("|", medicalInforow.get(x));
                }
    %>
    <tr style="text-align: left;">

    <td id="orderno"><%= medicalInforow.get(1)%></td> <!-- Order No -->
    <td><%= medicalInforow.get(2)%><input id="dataRISOrderListhidden" type="hidden" value="<%=joinRow%>"></td>
    <td style="font-weight: 500;"><%= medicalInforow.get(15)+"|"+medicalInforow.get(16)%></td> <!-- Name -->
    <td><button class="btn btn-default" id="btnPrint" data-toggle="modal" data-target="#disdetail"><i class="fa fa-print fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;"></i>   Print</button></td>
    </tr>
    <%    }
} else {

}

%>
</tbody>
</table>
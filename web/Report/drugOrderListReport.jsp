<%-- 
    Document   : drugOrderListReport
    Created on : Feb 20, 2017, 9:34:55 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../assets/header.html"%>

<hr class="pemisah" />
<table id="drugListTable" class="table table-filter table-striped table-bordered margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>
        <tr>
            <th> No </th>
            <th> Drug Code </th>
            <th> Description</th>
            <th> Price (RM)</th>
            <th> Total Patient </th>
            <th> Total Usage </th>
            <th> Total Amount (RM) </th>
        </tr>
    </thead>
    <tbody>
        <%        String sql = "";
            sql = "select count(m.drug_cd),count(distinct(m.pmi_no)),m.drug_cd,m.drug_name,pmd2.`D_SELL_PRICE` from lhr_medication m, pis_mdc2 pmd2 where m.drug_cd = pmd2.`UD_MDC_CODE` and m.episode_date between '" + startDate + "' and '" + endDate + "' group by m.drug_cd";

            ArrayList<ArrayList<String>> ps = conn.getData(sql);
            List empdetails = new LinkedList();
            JSONObject responseObj = new JSONObject();
            JSONObject empObj = null;
            int size = ps.size();
            float totalUsage = 0f;
            float grandAmount = 0f;
            for (int i = 0; i < size; i++) {

                String drug_name = ps.get(i).get(4);
                String drug_usage = ps.get(i).get(0);
                float drug = Float.parseFloat(drug_usage);
                String total_patient = ps.get(i).get(1);
                float totPatient = Float.parseFloat(total_patient);
                String price = ps.get(i).get(4);
                float pri = Float.parseFloat(price);
                float total_amt = drug * totPatient * pri;

                totalUsage += drug;
                grandAmount += total_amt;

                //                empObj = new JSONObject();
                //                empObj.put("drug_name", drug_name);
                //                empObj.put("total_amount", total_amt);
                //                empdetails.add(empObj);
                //
                //                responseObj.put("empdetails", empdetails);
                //                out.print(responseObj.toString());
        %>

        <tr>
            <td>
                <%= i + 1%>
            </td>
            <td>
                <%= ps.get(i).get(2)%> 
            </td>
            <td>
                <%= ps.get(i).get(3)%>
                <input type="hidden" id="drug_name" value="<%= ps.get(i).get(3)%>">
            </td>
            <td>
                <%= ps.get(i).get(4)%>
            </td>

            <td>
                <%= ps.get(i).get(1)%>
            </td>

            <td>
                <%= ps.get(i).get(0)%>
            </td>

            <td>
                <%= total_amt%>
            </td>

        </tr>
 


<%
    }
    String strGrand = String.format("%.02f", grandAmount);
%>
   </tbody>
</table>
<div class="row" id="data">
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">

        <div class="col-md-3">
        </div>
        <div class="col-md-3">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Quantity</label>
                <div class="col-md-4">
                    <input id="reportYearlyTotalQuantity" name="reportYearlyTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%=totalUsage%>" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="reportYearlyGrandTotal" name="reportYearlyGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%= strGrand%>" readonly>
                </div>
            </div>

        </div>
    </form>
</div>
<script>

    $(document).ready(function () {
        $('#drugListTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf', 'print'
            ]
        });

    });
</script>
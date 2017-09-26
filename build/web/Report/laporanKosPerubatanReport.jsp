<%-- 
    Document   : laporanKosPerubatanReport
    Created on : Feb 24, 2017, 9:14:18 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr/>
<div class="row">
    <div class="col-md-12">
        <div class="thumbnail">
            <%
                Conn conn = new Conn();
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                //out.print(startDate);

                String sql = "SELECT pms_patient_biodata.`PMI_NO` AS pms_patient_biodata_PMI_NO, pms_patient_biodata.`NEW_IC_NO` AS pms_patient_biodata_NEW_IC_NO,pms_patient_biodata.`ID_NO` AS pms_patient_biodata_ID_NO,pms_patient_biodata.`OLD_IC_NO` AS pms_patient_biodata_OLD_IC_NO,far_customer_ledger.`customer_id` AS far_customer_ledger_customer_id,far_customer_ledger.`txn_date` AS far_customer_ledger_txn_date,far_customer_ledger.`bill_amt` AS far_customer_ledger_bill_amt,far_customer_ledger.`bill_desc` AS far_customer_ledger_bill_desc FROM `far_customer_ledger` far_customer_ledger INNER JOIN `pms_patient_biodata` pms_patient_biodata ON far_customer_ledger.`customer_id` = pms_patient_biodata.`PMI_NO` WHERE far_customer_ledger.`txn_date` BETWEEN '" + startDate + "' AND '" + endDate + "'";
                //AND diagnosis.`HFC_Cd`='"+my_1_hfc_cd+"'
                ArrayList<ArrayList<String>> cost = conn.getData(sql);
            %>
            
            <div class="pull-right"><input name="b_print" id="b_print" type="button" class="btn btn-success" value=" Print "></div><br>
            <table id="costTable">
                <thead>
                <th style="width: 5%;">No.</th>
                <th style="width: 15%;">Date Visit</th>
                <th >IC No.</th>
                <th style="width: 25%;">Name</th>	
                <th style="">Cost (RM)</th>                
                </thead>
                <tfoot>
                    <tr>
                        <th colspan="4" style="text-align:right"></th>
                        <th></th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        int size = cost.size();
                        for (int i = 0; i < size; i++) {
                    %>
                    <tr>
                        <td id="No"><%= i + 1%></td>
                        <td id="DateTime"><%= cost.get(i).get(5)%></td>
                        <td id="icNo"><%= cost.get(i).get(1)%></td>
                        <td id="Name"><%= cost.get(i).get(7)%></td>
                        <td id="cost"><%= cost.get(i).get(6)%></td>


                    </tr>

                    <%
                        }
                    %> 
                </tbody>
            </table>


        </div>
    </div>
</div>

<script>

    $(document).ready(function () {


        $('#costTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf', 'print',
                
            ]

           
        });

        $('#b_print').click(function () {
            printReport();
        });

        function printReport() {
            var divElements = $('#PrintCost').html();
            var popupWin = window.open('', '_blank', 'width=1200,height=500');
            popupWin.document.open();
            popupWin.document.write('<html><body onload="window.print()">' + divElements + '</html>');
            popupWin.document.close();
        }

    });

</script>


<div id="PrintCost" style="display: none">
  

    <table id="costTable">
        <thead>
        <th style="width: 5%;">No.</th>
        <th style="width: 15%;">Date and Time</th>
        <th style="width: 25%;">Name</th>			 
        <th >Pmi No.</th>
        <th >IC No.</th>
        <th style="">Cost (RM)</th>                
        </thead>
        <tfoot>
            <tr>
                <th colspan="5" style="text-align:right">
                    <%
                    String Total = "SELECT SUM(far_customer_ledger.`bill_amt`) FROM `far_customer_ledger` far_customer_ledger INNER JOIN `pms_patient_biodata` pms_patient_biodata ON far_customer_ledger.`customer_id` = pms_patient_biodata.`PMI_NO`WHERE far_customer_ledger.`txn_date` BETWEEN '" + startDate + "' AND '" + endDate + "'";
                    ArrayList<ArrayList<String>> total = conn.getData(Total);
                    %>
                    Total: <%=total.get(0).get(0)%></th>
                <th></th>
            </tr>
        </tfoot>
        <tbody>
            <%
                ArrayList<ArrayList<String>> cost1 = conn.getData(sql);
                int size1 = cost1.size();
                for (int i = 0; i < size1; i++) {
            %>
            <tr>
                <td id="No"><%= i + 1%></td>
                <td id="DateTime"><%= cost1.get(i).get(5)%></td>
                <td id="Name"><%= cost1.get(i).get(7)%></td>
                <td id="pmino"><%= cost1.get(i).get(0)%></td>
                <td id="icNo"><%= cost1.get(i).get(1)%></td>
                <td id="cost"><%= cost1.get(i).get(6)%></td>


            </tr>

            <%
                }
            %> 
        </tbody>
    </table>
</div>
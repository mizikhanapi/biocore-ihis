<%-- 
    Document   : BillTo
    Created on : Apr 25, 2017, 11:51:10 AM
    Author     : Raziff
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String textSearch = request.getParameter("textSearch");
    //String idcat = request.getParameter("idcat");
    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String last_nine = current_user.substring(current_user.length() - 1);
%>

<table  id="BillTo"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: center; width: 8%;">Order No.</th>
    <th style="text-align: center; width: 10%;">PMI No.</th>
    <th style="text-align: center; width: 10%;">IC No.</th>
    <th style="text-align: center; width: 40%;">Name</th>
    <th style="text-align: center; width: 12%;">Order Date</th>
    <th style="text-align: center;">Health Facility Code</th>
    <th style="text-align: center;">Doctor's Name</th>
    <th style="text-align: center;">Action</th>
</thead>
<tbody>


    <%
        //String whereClause = "";

        //if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
           // whereClause = "lis_order_master.hfc_cd = '"+hfc_cd+"' ";
        //}

        String sql = "SELECT lis_order_master.pmi_no,lis_order_master.order_no,lis_order_master.hfc_cd,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,lis_order_master.order_by,lis_order_master.hfc_from,lis_order_master.hfc_to,lis_order_master.order_status,lis_order_master.diagnosis_cd,lis_order_master.created_by,lis_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE lis_order_master.order_status='0' AND pms_patient_biodata.NEW_IC_NO = '"+textSearch+"' AND lis_order_master.hfc_cd = '"+hfc_cd+"'";
                //+ whereClause + "";

        ArrayList<ArrayList<String>> dataRISOrderList = conn.getData(sql);

        int size = dataRISOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToRISOrderDetailsTButton" style="text-align: center;">
<input id="dataRISOrderListhidden" type="hidden" value="<%=String.join("|", dataRISOrderList.get(i))%>">
<td><%= dataRISOrderList.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataRISOrderList.get(i).get(0)%></td> <!-- PMI No -->
<td><%= dataRISOrderList.get(i).get(14)%></td> <!-- IC No -->
<td><%= dataRISOrderList.get(i).get(13)%></td> <!-- Name -->
<td><%= dataRISOrderList.get(i).get(5)%></td> <!-- Order Date -->
<td><%= dataRISOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
<td><%= dataRISOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
<td><input type="checkbox" id="checkBill" name="checkBill" value="<%= dataRISOrderList.get(i).get(1)%>"></td> <!-- Doctor's Name -->
</tr>
<%
    }
%>
</tbody>
</table>

<div>
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">
        <div class="row">
            <div class="col-md-2">
                <input id="dispenseFarBillNo" name="dispenseFarBillNo" type="hidden" class="form-control input-md" maxlength="50" readonly="" value="1253000000019325042017">
            </div>

            <div class="col-md-4">
                <input id="dispenseTotalQuantity" name="dispenseTotalQuantity" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly="" value="0">
                <input id="dispenseTotalQuantityChecked" name="dispenseTotalQuantityChecked" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly="" value="0">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="margin-bottom: 20px;">
                <div class="col-md-6">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Total Order</label>
                        <div class="col-md-5">
                            <input id="dispenseTotalOrder" name="dispenseTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly="">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Total Order Final</label>
                        <div class="col-md-5">
                            <input id="dispenseTotalOrderChecked" name="dispenseTotalOrderChecked" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly="">
                        </div>
                    </div>

                </div>

                <div class="col-md-6">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Grand Total (RM)</label>
                        <div class="col-md-5">
                            <input id="dispenseGrandTotal" name="dispenseGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly="">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Grand Total Final (RM)</label>
                        <div class="col-md-5">
                            <input id="dispenseGrandTotalChecked" name="dispenseGrandTotalChecked" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly="">
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>
<div class="text-center" id="patientOrderDispenseButtonDiv"> 
    <button class="btn btn-success " type="button" id="btnOrderDispense" name="btnOrderDispense" disabled=""> <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Dispense &nbsp;</button>
    <button class="btn btn-primary " type="button" id="btnOrderDispensePrescribe" name="btnOrderDispensePrescribe"> <i class="fa fa-print fa-lg"></i>&nbsp; Generate Label &nbsp;</button>
    <button class="btn btn-default " type="button" id="btnClearOrderDetailDispense" name="btnClearOrderDetailDispense"> <i class="fa fa-ban fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>
<script>

    $("#back").click(function () {
            window.location.replace("ManageTest.jsp");
        });
        
   
</script>
<script>
        w3IncludeHTML();
        $(document).ready(function () {
            
            //var item_cd = $("#item_cd").val();
            
            //$("#viewTA").load("viewTA.jsp");
           
                      
                     
                        
                        $("#btn_update").click(function () {
                           var healthCentre = $("#healthCentre").val(); 
                           var pmi = $("#pmi").val();
                           var specimen_no = $("#specimen_no").val();
                           
                           $.ajax({
                                url: "tAcceptSpecimen.jsp",
                                type: "post",
                                data: {
                                    healthCentre: healthCentre,
                                    pmi: pmi,
                                    specimen_no: specimen_no
                                },
                                timeout: 10000,
                                success: function(data) {
                                     alert("Specimen Accept succesfully");
                                        
                                         //$("#basicModal").hide();
                                         //$(".modal-backdrop").hide();
                                     
                                },
                            });
                            
                        });
                    });
       

    </script>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        $('#BillTo').DataTable({
            language: {
                emptyTable: "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
    });

</script>

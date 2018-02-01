<%-- 
    Document   : assignSpecimen
    Created on : Feb 9, 2017, 4:57:14 PM
    Author     : user
--%>
<%@page import="java.util.Calendar"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Conn conn = new Conn();
    String[] itemCD;
    String pmi2 = request.getParameter("pmino");
    String orderno1 = request.getParameter("order_no");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
        <%@include file="../assets/header.html"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  

    </head>
    <body>
        <form enctype="multipart/form-data" method="get" action="">

            <div class="container-fluid">
                <div class="row">
                    <!-- menu side -->		
                    <%@include file = "libraries/sideMenus.jsp" %>
                    <!-- menu side -->

                    <div class="main" style="background: #f2f4f8;">
                        <!-- menu top -->
                        <%@include file = "libraries/topMenus.html" %>
                        <!-- menu top -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="thumbnail">
                                    <h4 class="col-md-12">Recieve Order</h4>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <address>

                                                <p>
                                                    Specimen No: 
                                                    <span class="p-label">
                                                        <%                            try {

                                                                int year = Calendar.getInstance().get(Calendar.YEAR);
                                                                String test = "SELECT CONCAT('SPE',LPAD(SUBSTRING(COALESCE(MAX(specimen_no),'SPE000'),4,4)+1,4,'0'))FROM lis_specimen";
                                                                ArrayList<ArrayList<String>> q4 = conn.getData(test);

                                                                out.print(q4.get(0).get(0));
                                                            } catch (Exception e) {
                                                                //error handling code
                                                            }

                                                            //String generate = "SELECT RIGHT ('0000'+ CAST (@Number AS varchar), 4)";

                                                        %>
                                                    </span>
                                                </p>
                                                <p>
                                                </p>
                                            </address>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <address>
                                                <p>
                                                    Collection Date:
                                                    <span class="p-label">
                                                        <%= new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%><input type='text' name='Collection_date' id="C_date" value='<%= new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>' style='display:none;'>
                                                        
                                                    </span>

                                                </p>
                                                <p>
                                                    Collection Time: 
                                                    <span class="p-label">
                                                        <%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%><input type='text' name='Collection_time' id="C_time" value='<%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%>' style='display:none;'>
                                                    </span>
                                                </p>
                                            </address>
                                        </div>
                                    </div>
                                    <hr/>
                                    <table id="orderRecieve"  class="table table-striped table-bordered" cellspacing="0" width="100%">

                                        <thead>
                                            <tr>
                                                <th class="col-sm-1">Item Name</th>
                                                <th class="col-sm-1">Container Information</th>
                                                <th class="col-sm-1">Specimen Source</th>
                                                <th class="col-sm-1">Order Date</th>	
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                                                itemCD = request.getParameterValues("chkSpecimen");
                                                out.println("<input type='text' name='pmi' value='" + pmi2 + "' id='pmi' style='display:none;'>");
                                                out.println("<input type='text' name='order_no' value='" + orderno1 + "' id='order_no'  style='display:none;'>");
                                                int count = 0;
                                                if (itemCD != null) {
                                                    for (int j = 0; j < itemCD.length; j++) {
                                                        out.println("<input type='text' name='specimen" + j + "' value='" + itemCD[j] + "' id='specimen" + j + "' style='display:none;'>");

                                                        count++;
                                                        String sqlPatientApp = "SELECT LID.item_cd,LID.item_name,LID.spe_container,LOD.created_date,LOM.hfc_cd,LOM.pmi_no,LOM.patient_name,LOD.spe_source FROM lis_order_detail LOD LEFT JOIN lis_item_detail LID ON LID.item_cd = LOD.item_cd LEFT JOIN lis_order_master LOM ON LOD.order_no = LOM.order_no WHERE LOD.item_cd = '" + itemCD[j] + "' AND LOD.order_no = '" + orderno1 + "' AND LID.hfc_cd = '"+hfc_cd+"' GROUP BY LOD.item_cd";
                                                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

                                                        if (dataPatientApp.size() > 0) {
                                                            for (int i = 0; i < dataPatientApp.size(); i++) {%>

                                            <tr>
                                                <td><%=dataPatientApp.get(i).get(1)%><input type="text" value="<%=dataPatientApp.get(i).get(0)%>" id="item_cd<%=i%>" name="item_cd<%=i%>" style=" display: none;"></td>
                                                <td><%=dataPatientApp.get(i).get(2)%></td>
                                                <td><%=dataPatientApp.get(i).get(7)%></td>
                                                <td><%=dataPatientApp.get(i).get(3)%><input type="text" id="patient_name" name="patient_name" value="<%=dataPatientApp.get(i).get(6)%>" style=" display: none;"> </td>

                                            </tr>
                                            <%
                                                            }
                                                        }

                                                    }
                                                    out.println("<input type='text' name='TotalOptions' value='" + count + "' id='TotalOptions' style='display:none;'>");
                                                } else {
                                                    out.println("none");
                                                }

                                            %>

                                        </tbody>
                                    </table>
                                    <div class="text-right">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="assign">Submit</button> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>


            </div> 
        </form>
        <script type="text/javascript" charset="utf-8">
            function openPage(pageURL) {
                window.location = pageURL;
            }

            $("#assign").click(function () {
                var sure = confirm("Are you sure to assign the specimen?");
                if (sure == true)
                {
                    var pmi = $("#pmi").val();
                    var order_no = $("#order_no").val();
                    var C_date = $("#C_date").val();
                    var C_time = $("#C_time").val();
                    var specimen = [];
                    var TotalOptions = $("#TotalOptions").val();
                    var patient_name = $("#patient_name").val();

                    for (var i = 0; i < TotalOptions; i++)
                    {
                        specimen.push($("#specimen" + i).val());
                    }
                    $.ajax({
                        type: "POST",
                        url: "tSpecimenInsert.jsp",
                        data: {
                            Pmi: pmi,
                            Order_no: order_no,
                            "Specimen[]": specimen,
                            patient_name: patient_name,
                            C_date: C_date,
                            C_time: C_time,
                            Total: TotalOptions}

                    });
                    //alert(specimen[0] + " " + pmi + " " + order_no + " " + C_date + " " + C_time + " " + TotalOptions + " " + patient_name);
                    window.location.replace("Order_list");
                }
            });
        </script>
        <script>
            w3IncludeHTML();

            $(document).ready(function () {
                //$("#WardOccupancy").load("WardOccupancy.jsp");
                //$("#RecieveOderTable").load("RecieveOder-Table.jsp");


                $("#headerindex").load("libraries/header.html");
                $("#topmenuindex").load("libraries/topMenus.html");
                $("#sidemenus").load("libraries/sideMenus.jsp");
                //                $("#WardOccupancyTable").load("WardOccupancy-Table.jsp");

            });

        </script>
    </body>
</html>
<%-- 
    Document   : view_order
    Created on : Nov 24, 2016, 12:24:01 PM
    Author     : Ahmed
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                <%                                                    Conn conn = new Conn();
                                    String pmi = request.getParameter("pmi");
                                    String specimen_no1 = request.getParameter("specimen_no");
                                    String query1 = "SELECT pb.`PMI_NO`, pb.`NEW_IC_NO`, pb.`PATIENT_NAME`,ls.order_no,ls.specimen_no,ls.`Collection_date`,ls.`Collection_time`,lom.order_date FROM pms_patient_biodata pb,lis_specimen ls,lis_order_master lom WHERE pb.`PMI_NO` = ls.pmi_no AND ls.pmi_no =lom.pmi_no AND pb.`PMI_NO` = '" + pmi + "' AND ls.specimen_no = '" + specimen_no1 + "' GROUP BY(ls.specimen_no)";
                                    ArrayList<ArrayList<String>> q2 = conn.getData(query1);

                                %>  
                                <h3 style="margin: 0px;">Receive Specimen</h3>
                                <hr class="pemisah" />
                                <div class="row">

                                    <%if (q2.size() > 0) {
                                            for (int i = 0; i < q2.size(); i++) {
                                                String datetime = q2.get(i).get(7);
                                                String[] parts = datetime.split(" ");
                                    %> 

                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <address>
                                            <p>
                                                Name: 
                                                <span class="p-label"><%=q2.get(i).get(2)%></span>
                                            </p>
                                            <p>
                                                PMI No:
                                                <span class="p-label"><%=q2.get(i).get(0)%></span>
                                            </p>
                                            <p>
                                                IC No: 
                                                <span class="p-label"><%=q2.get(i).get(1)%></span>
                                            </p>
                                            

                                        </address>  
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <address>
                                            <p>
                                                Order No: 
                                                <span class="p-label"><%=q2.get(i).get(3)%><input type="text" name="order_no" id="order_no" value="<%=q2.get(i).get(3)%>" style="display: none;"></span>
                                            </p>
                                            <p>
                                                Order Date: 
                                                <span class="p-label"><%=parts[0]%></span>
                                            </p>
                                            <p>
                                                Order Time: 
                                                <span class="p-label"><%=parts[1]%></span>
                                            </p>
                                        </address>  
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <p>
                                            Specimen No: 
                                            <span class="p-label"><%=q2.get(i).get(4)%></span>
                                        </p>

                                        <p>
                                            Collection Date: 
                                            <span class="p-label"><%=q2.get(i).get(5)%></span>
                                        </p>
                                        <p>
                                            Collection Time: 
                                            <span class="p-label"><%=q2.get(i).get(6)%></span>
                                        </p>

                                    </div>          
                                    <%
                                            }
                                        }
                                    %>
                                </div>         
                                <hr>

                                <h4 class="headerTitle">Order Item</h4>
                                <div id='viewVODpage' >
                                    <div class="table-guling margin-bottom-10px" style="overflow-x: auto;">
                                    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%" style="margin-bottom: 5px;">
                                        <%
                                            String pmi2 = request.getParameter("pmi");
                                            String specimen_no = request.getParameter("specimen_no");

                                            String query4 = "SELECT ls.specimen_no,lod.item_cd, lod.item_name, lod.spe_container, lod.volume, lod.spe_source, lod.requestor_comments FROM lis_order_detail lod,lis_specimen ls WHERE ls.item_cd = lod.item_cd AND ls.specimen_no = '" + specimen_no + "' AND ls.pmi_no='" + pmi2 + "' GROUP BY(lod.item_cd)";
                                            ArrayList<ArrayList<String>> q4 = conn.getData(query4);
                                        %>
                                        <input type="text" id="pmi" value="<%=pmi2%>" style="display: none;"><input type="text" id="specimen_no" value="<%=specimen_no%>" style="display: none;">
                                        <thead>
                                            <tr>
                                                <th class="col-sm-1">Item Code</th>
                                                <th class="col-sm-1">Item Name</th>
                                                <th class="col-sm-1">Specimen Container</th>
                                                <th class="col-sm-1">Volume</th>
                                                <th class="col-sm-1">Specimen Source</th>
                                                <th class="col-sm-1">Requestor Comment</th>
                                            </tr>
                                        </thead>
                                        <tbody>


                                            <%if (q4.size() > 0) {
                                                    for (int i = 0; i < q4.size(); i++) {%> 
                                            <tr>    
                                                <td><%=q4.get(i).get(1)%><input type="text" name="itemCode" id="itemCode" value="<%=q4.get(i).get(1)%>" style="display: none;"></td>
                                                <td><%=q4.get(i).get(2)%></td>
                                                <td><%=q4.get(i).get(3)%></td>
                                                <td><%=q4.get(i).get(4)%></td>
                                                <td><%=q4.get(i).get(5)%></td>
                                                <td><%=q4.get(i).get(6)%></td>
                                                <%
                                                        }
                                                    }
                                                %>


                                            </tr>

                                        </tbody>
                                    </table>
                                    </div>
                                    <div class="row">
                                        <div class=" pull-left col-md-6">
                                            <button type="button" class="btn btn-default" id="back">Back</button>
                                            &nbsp;
                                            <button type="button" class="btn btn-default" id="reject" data-toggle="modal" data-target="#reject_form">Reject Specimen</button>

                                            <div class="modal fade" id="reject_form" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times fa-lg"></i></button>
                                                            <h3 class="modal-title" id="myModalLabel">Reject Specimen</h3>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1"> Reason to reject: <span style="display: none;"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></span> </label>
                                                                <textarea name="career[message]" class="form-control" id="fcomment" placeholder="Write your reason" ></textarea>
                                                            </div> 
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                            <button type="submit" class="btn btn-primary" id="sub_reject">Submit</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <button type="button" class="btn btn-default" id="cancelReceive">Cancel Receive</button>
                                            
                                        </div>
                                        <div class="text-right col-md-6">
                                            Send specimen to&nbsp;
                                            <select name="healthCentre" id="healthCentre">
                                                <option value="">Select Healthcare</option>
                                                <option value="Sample Lab 1">Sample Lab 1</option>
                                                <option value="Sample Lab 2">Sample Lab 2</option>
                                                <option value="Sample Lab 3">Sample Lab 3</option>
                                            </select>
                                            &nbsp;
                                            <button type="button" class="btn btn-primary" id="sendAccept">Send</button>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" charset="utf-8">

        $(document).ready(function () {
            $('#orderRecieve').DataTable();
        });
    </script>
    <script>
        w3IncludeHTML();
        $(document).ready(function () {
            $("#back").click(function () {
                window.location.replace("Receive_Specimen");
            });

            $("#sub_reject").click(function () {
                var fcomment = $("#fcomment").val();
                var pmi = $("#pmi").val();
                var specimen_no = $("#specimen_no").val();
                var order_no = $("#order_no").val();
                var itemCode = $("#itemCode").val();

                $.ajax({
                    url: "tRejectSpecimen.jsp",
                    type: "post",
                    data: {
                        fcomment: fcomment,
                        order_no: order_no,
                        itemCode: itemCode,
                        pmi: pmi,
                        specimen_no: specimen_no
                    },
                    timeout: 10000,
                    success: function (data) {
                        alert("Specimen reject succesfully");
                        window.location.replace("Receive_Specimen");
                        $("#basicModal").hide();
                        $(".modal-backdrop").hide();

                    },
                });

            });

            $("#cancelReceive").click(function () {
                var fcomment = $("#fcomment").val();
                var pmi = $("#pmi").val();
                var specimen_no = $("#specimen_no").val();
                var order_no = $("#order_no").val();
                var itemCode = $("#itemCode").val();

                var answer = confirm("Are you sure you want to continue");
                if (answer == true)
                {
                    $.ajax({
                        url: "tcancelReceive.jsp",
                        type: "post",
                        data: {
                            itemCode: itemCode,
                            specimen_no: specimen_no
                        },
                        timeout: 10000,
                        success: function (data) {
                            alert("Cancel Receive succesfully");
                            window.location.replace("Receive_Specimen");
                            $("#basicModal").hide();
                            $(".modal-backdrop").hide();

                        },
                    });
                }
            });

            $("#sendAccept").click(function () {
                var healthCentre = $("#healthCentre").val();
                var pmi = $("#pmi").val();
                var specimen_no = $("#specimen_no").val();
                var order_no = $("#order_no").val();
                var itemCode = $("#itemCode").val();
                if (healthCentre == "")
                {
                    bootbox.alert("Make sure you select the Health Lab Centre.")
                } else {
                    $.ajax({
                        url: "tAcceptSpecimen.jsp",
                        type: "post",
                        data: {
                            healthCentre: healthCentre,
                            pmi: pmi,
                            order_no: order_no,
                            itemCode: itemCode,
                            specimen_no: specimen_no
                        },
                        timeout: 10000,
                        success: function (data) {
                            bootbox.alert("Specimen Accept succesfully");
                            window.location.replace("Receive_Specimen");
                            $("#basicModal").hide();
                            $(".modal-backdrop").hide();

                        },
                    });
                }
            });
        });
        $(document).ready(function () {

            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#sidemenus").load("libraries/sideMenus.jsp");
        });

    </script>
</html>


<%-- 
    Document   : view_order
    Created on : Nov 24, 2016, 12:24:01 PM
    Author     : Ahmed
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order</title>
        <%@include file="Header.jsp"%>

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

        <form enctype="multipart/form-data" method="get">
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
                                    <h3 style="margin: 0px;">Verify Test Result</h3>
                                    <hr class="pemisah" />
                                    <h3>
                                        <%
                                            String item_cd = request.getParameter("item_cd");
                                            session.setAttribute("item_cd", item_cd);

                                            String pmi1 = request.getParameter("pmi");
                                            session.setAttribute("pmi1", pmi1);

                                            String specimen_no1 = request.getParameter("specimen_no");
                                            session.setAttribute("specimen_no1", specimen_no1);

                                            Conn conn = new Conn();

                                            String query4 = "SELECT ls.order_no, lod.item_name,lod.order_date FROM lis_order_detail lod,lis_specimen ls,lis_order_master lom WHERE lod.item_cd = ls.item_cd AND lod.order_no = lom.order_no AND ls.item_cd='" + item_cd + "' AND ls.specimen_no = '" + specimen_no1 + "'";
                                            ArrayList<ArrayList<String>> q4 = conn.getData(query4);

                                            out.println("Test Name: <span style='font-weight: 300'>" + q4.get(0).get(1) + "</span>");

                                            session.setAttribute("order_no", q4.get(0).get(0));
                                            session.setAttribute("item_name", q4.get(0).get(1));
                                            session.setAttribute("order_date", q4.get(0).get(2));

                                        %>
                                    </h3>
                                    <h3>Item Code: <span style="font-weight: 300;"><%=item_cd%></span></h3>

                                    <input type="text" id="pmi" value="<%=pmi1%>" style=" display: none;">
                                    <input type="text" id="specimen_no" value="<%=specimen_no1%>" style=" display: none;">
                                    <input type="text" id="item_cd" value="<%=item_cd%>" style=" display: none;">
                                    <input type="text" id="order_no" value="<%=q4.get(0).get(0)%>" style=" display: none;">
                                    <input type="text" id="order_no" value="<%=q4.get(0).get(2)%>" style=" display: none;">      
                                    <div id="viewVR" class="margin-top-30px"></div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <hr/>
                                            <button type="button" name="back" id="back" class="btn btn-default" data-dismiss="modal" onclick="openPage('VerifySpecimen.jsp?pmi=<%=pmi1%> &specimen_no=<%=specimen_no1%>')">Back</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" charset="utf-8">

            $(document).ready(function () {
                $("#viewVR").load("viewVR.jsp");
                $('#orderRecieve').DataTable();
                $('#PMIbday').datepicker({dateFormat: 'yy-mm-dd', changeMonth: true, changeYear: true});

            });


        </script>
        <script>
            w3IncludeHTML();
            $(document).ready(function () {
                $("#back").click(function () {
                    var specimen_no = $("#specimen_no").val();
                    var pmi = $("#pmi").val();
                    window.location.replace("VerifySpecimen.jsp?pmi=" + pmi + " &specimen_no=" + specimen_no);
                });

                $("#btn_add").click(function () {
                    var specimen_no = $("#specimen_no").val();
                    var pmi = $("#pmi").val();
                    var item_cd = $("#item_cd").val();
                    var testName = $("#testName").val();
                    var Result = $("#Result").val();
                    var Remark = $("#Remark").val();
                    //alert(specimen_no+"  "+pmi+" "+item_cd+" "+testName+" "+Result+" "+Remark);
                    $.ajax({
                        url: "tAssignResult.jsp",
                        type: "post",
                        data: {
                            specimen_no: specimen_no,
                            pmi: pmi,
                            item_cd: item_cd,
                            testName: testName,
                            Result: Result,
                            Remark: Remark
                        },
                        timeout: 10000,
                        success: function (data) {
                            bootbox.alert("Specimen Accept succesfully");
                            $("#viewTA").load("viewTA.jsp");

                        },
                    });

                    //$(".modal-backdrop").hide();

                });

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
                        success: function (data) {
                            bootbox.alert("Specimen Accept succesfully");
                            window.location.reload();
                            $("#basicModal").hide();
                            $(".modal-backdrop").hide();

                        },
                    });

                });
            });
            $(document).ready(function () {

                $("#headerindex").load("libraries/header.html");
                $("#topmenuindex").load("libraries/topMenus.html");
                $("#sidemenus").load("libraries/sideMenus.jsp");
            });

        </script>
    </form>
</body>
</html>

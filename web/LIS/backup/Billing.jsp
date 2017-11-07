
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
        <title>LIS | Billing</title>
        <%@include file="../assets/header.html"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>


        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.buttons.min.js" type="text/javascript"></script>
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
                                    <h3 style="margin: 0px;">Post to Bill</h3>
                                    <hr class="pemisah" />

                                    <div class="form-horizontal">
                                        <!-- Select Basic -->
                                        <div class="form-group"> 
                                            <label class="col-md-4 control-label" for="textinput">ID Type</label>
                                            <div class="col-md-4">
                                                <select id="orderType" name="orderType" class="form-control" required="">
                                                    <option selected="" disabled="" value="-"> Please select ID type</option>
                                                    <!--                    <option value="pmino">PMI No</option>
                                                                        <option value="icnew">IC No (NEW)</option>
                                                                        <option value="icold">IC No (OLD)</option>-->
                                                    <!--<option value="matricno">Matric No</option>
                                                    <option value="staffno">Staff No</option>-->

                                                    <option value="002">IC No. (NEW)</option>

                                                    <option value="003">IC No. (OLD)</option>

                                                    <option value="004">Order No.</option>

                                                    <option value="005">Date</option>

                                                </select>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group" id="ic" style="display: none;">

                                            <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control input-md" id="idIC" name="idIC" placeholder="ID" >
                                            </div>


                                        </div>
                                        <div class="form-group" id="order_noText" style="display: none;">

                                            <label class="col-md-4 control-label" for="textinput">Order No.</label>
                                            <div class="col-md-4">
                                                <input type="text" class="form-control input-md" id="order_no" name="order_no" placeholder="Order No.">
                                            </div>

                                        </div>

                                        <div class="form-group form-inline" id="date" style="display: none;">
                                            <label class="col-md-4 control-label" for="textinput">From</label>
                                            <div class="form-group">
                                                <div class="col-md-2">
                                                    <input type="text" id="DateFrom" class="form-control input-md Datepicker" placeholder="YYYY-MM-DD">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-1 control-label" for="textinput">To</label>
                                                <div class="col-md-2">
                                                    <input type="text" id="DateTo" class="form-control input-md Datepicker" placeholder="YYYY-MM-DD">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="text-center">
                                            <button class="btn btn-primary" type="button" id="searchOrder" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>

                                            <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
                                        </div>

                                        <hr class="pemisah">
                                        <div id="viewBill"></div>

                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <script>
                w3IncludeHTML();
                $(document).ready(function () {

                    $(function () {
                        $("#DateFrom").datepicker({
                            dateFormat: 'yy-mm-dd',
                            yearRange: '1999:c+1',
                            changeMonth: true,
                            changeYear: true,
                            minDate: new Date(1999, 10 - 1, 25),
                            maxDate: '+30Y',
                        });

                        $("#DateTo").datepicker({
                            dateFormat: 'yy-mm-dd',
                            yearRange: '1999:c+1',
                            changeMonth: true,
                            changeYear: true,
                            minDate: new Date(1999, 10 - 1, 25),
                            maxDate: '+30Y',
                        });
                    });


                    $('#orderType').on('change', function () {
                        if (this.value == '002' || this.value == '003')
                        {
                            $("#ic").show();
                            $("#order_noText").hide();
                            document.getElementById("order_no").value = "";
                            $("#date").hide();
                            document.getElementById("DateFrom").value = "";
                            document.getElementById("DateTo").value = "";
                        } else if (this.value == '004')
                        {
                            $("#order_noText").show();
                            $("#ic").hide();
                            document.getElementById("idIC").value = "";
                            $("#date").hide();
                            document.getElementById("DateFrom").value = "";
                            document.getElementById("DateTo").value = "";
                        } else if (this.value == '005')
                        {
                            $("#date").show();
                            $("#ic").hide();
                            document.getElementById("idIC").value = "";
                            $("#order_noText").hide();
                            document.getElementById("order_no").value = "";
                        }
                    });


                    $("#searchOrder").click(function () {
                        var orderType = $("#orderType").val();
                        if (orderType == '002' || orderType == '003')
                        {
                            var ic = $("#idIC").val();
                            var order_no = "";
                            var DateFrom = "";
                            var DateTo = "";
                        } else if (orderType == '004')
                        {
                            var order_no = $("#order_no").val();
                            var ic = "";
                            var DateFrom = "";
                            var DateTo = "";
                        } else if (orderType == '005')
                        {
                            //var DateFrom = new Date($('#DateFrom').val());
                            var DateFrom1 = $("#DateFrom").datepicker("getDate");
                            var DateFrom = $.datepicker.formatDate("yy-mm-dd", DateFrom1);
                            var DateTo1 = $("#DateTo").datepicker("getDate");
                            var DateTo = $.datepicker.formatDate("yy-mm-dd", DateTo1);
                            var order_no = "";
                            var ic = "";
                        }
                        var data = {
                            ic: ic,
                            order_no: order_no,
                            DateFrom: DateFrom,
                            DateTo: DateTo
                        };

                        $.ajax({
                            url: "BillTo.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (orderDetail) {
                                $("#viewBill").val(orderDetail.trim());
                                //$('#dataItem').html(returnDataItem);
                                //$('#dataItem').trigger('contentchanged');
                                //console.log(orderDetail.trim());
                                //console.log($("#viewBill").val());
                                $('#viewBill').html(orderDetail);
                                $('#viewBill').trigger('contentchanged');


                            },
                            error: function (err) {
                                alert("Error update!");
                            }
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

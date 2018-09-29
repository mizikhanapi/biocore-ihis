<%-- 
    Document   : laporanKosPerubatan
    Created on : Feb 24, 2017, 9:11:25 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/bootbox.min.js"></script>
        <script src="../assets/js/jquery-ui.js"></script>
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <link rel="stylesheet" href="../assets/css/jquery-ui.css">
<!--        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
        
        <!--<link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>-->
        <link href="../assets/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/mystyles.css" rel="stylesheet" type="text/css"/>
        <!--<link href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>-->
        <%@include file = "../assets/header.html" %>

        <title>Drug Order List and Total Amount</title>
    </head>
    <body>
        <!-- side bar -->
        <%@ include file ="libraries/reportSideMenus.jsp" %>
        <!-- side bar -->
        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->

            <div class="container-fluid">
                <div class="row">      

                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h2 style="margin: 0px;"> Laporan Kos Perubatan </h2>
                            <hr class="pemisah" />
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Start Date</label>
                                    <div class="col-md-4">
                                        <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="col-md-4 control-label" for="textinput">To</label>
                                    <div class="col-md-4">
                                        <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly>
                                    </div>
                                </div>
                            </div>
                            <hr/>

                            <div class="text-right" >
                                <button type="reset" id="PrintReset" class="btn btn-link" data-dismiss="modal" role="button" >Clear</button>
                                <button type="submit" class="btn btn-success" role="button" id="printLaporanKosPerubatan">Generate Report</button>
                            </div>
                        </div>
                    </div>

                </div>
                <div id="cost">

                </div>

            </div>

        </div>



            <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
            <script src="../assets/js/dataTables.buttons.min.js"></script>
            <script src="../assets/js/buttons.flash.min.js"></script>
            <script src="../assets/js/buttons.colVis.min.js"></script>
            <script src="../assets/js/jszip.min.js"></script>
            <script src="../assets/js/pdfmake.min.js"></script>
            <script src="../assets/js/vfs_fonts.js"></script>
            <script src="../assets/js/buttons.html5.min.js"></script>
            <script src="../assets/js/buttons.print.min.js" type="text/javascript" language="javascript"></script>
            <script src="../assets/js/create_destroy_loading.js" type="text/javascript" language="javascript"></script>
        
        <script>

            $(document).ready(function () {

                $("#startDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'
                });
                $("#endDate").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'
                });
                $('#printLaporanKosPerubatan').on('click', function () {

                    if ($('#startDate').val() === "" || $('#endDate').val() === " ") {
                        //if the id/ic input is empty
                        alert('Please choose date to prooceed');
                    } else {

                        var startDate = document.getElementById("startDate").value;
                        var endDate = document.getElementById("endDate").value;
                        //alert(startDate+" / "+startDate);
                        createScreenLoading();
                        $.ajax({
                            async: true,
                            type: "POST",
                            url: "laporanKosPerubatanReport.jsp",
                            data: {'startDate': startDate, 'endDate': endDate},
                            timeout: 10000,
                            success: function (list) {
                                $('#cost').html(list);
                            },
                            error: function (xhr, status, error) {
                                var err = eval("(" + xhr.responseText + ")");
                                bootbox.alert(err.Message);
                            }
                        });
                    }
                });
                
                $('#PrintReset').on('click', function () {

                    $('#startDate').val('');
                    $('#endDate').val('');
                    $('#cost').html('');

                });
            });

        </script>
    </body>
</html>
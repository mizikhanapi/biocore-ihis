<%-- 
    Document   : drugOrderList
    Created on : Feb 20, 2017, 7:27:50 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <%@include file = "../assets/header.html" %>

        <title>Total Drug Cost</title>
    </head>
    <body>

        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->

            <!-- side bar -->
            <%@ include file ="libraries/reportSideMenus.jsp" %>
            <!-- side bar -->
        </div>

        <div class="container">
            <div class="row">      

                <div class="col-md-12">
                    <div class="thumbnail">
                        <h2 style="text-align: center">Laporan Kedatangan Jumlah Pesakit</h2>
                        </br>

                        </br></br>

                        <div class="form-group">
                            <label style="text-align: center" class="col-md-6 control-label" for="textinput">Discpline/Jabatan</label>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <select class="form-control" name="disType" id="disType">
                                        <option value="0" id="0" >Please select</option>
                                        <option value="outpatient">Outpatient</option>
                                        <option value="inpatient">Inpatient</option>
                                        <option value="all">All</option>


                                    </select>
                                </div>
                            </div>
                        </div>

                        </br></br>
                        <div class="form-group">
                            <label style="text-align: center" class="col-md-6 control-label" for="textinput">Start Date</label>
                            <div class="col-md-6">
                                <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="" readonly>
                            </div>
                        </div>

                        </br></br>
                        <div class="form-group">
                            <label style="text-align: center" class="col-md-6 control-label" for="textinput">To</label>
                            <div class="col-md-6">
                                <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="" readonly>
                            </div>
                        </div>

                        </br></br>
                        <div class="text-center">
                            <button class="btn btn-primary" type="button" id="btnlistData" name="btnlistData"><i class="fa fa-search fa-lg"></i>&nbsp; List Data</button>

                            <button class="btn btn-primary" type="button" id="btnstatistics" name="btnstatistics"><i class="fa fa-search fa-lg"></i>&nbsp; Statistics</button>

                            <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div id="listData">
                </div>
            </div>
    </body>
</html>

<script>



    $("#startDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
    });
    $("#endDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
    });
    $('#btnlistData').on('click', function () {

        $.ajax({
            async: true,
            type: "POST",
            url: "listData.jsp",
            data: {'disType': disType, 'startDate': startDate, 'endDate': endDate},
            timeout: 10000,
            success: function (list) {

                //split the data into an array

                //function when the value that returned either empty/null or has value.
                //customize this part only
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                $('#listData').html(list);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                bootbox.alert(err.Message);
            }
        });

//            var startDate = document.getElementById("startDate").value;
//            var endDate = document.getElementById("endDate").value;
//
//            console.log(startDate);
//            console.log(endDate);
//
//            window.open("drugOrderListReport.jsp?startDate=" + startDate + "&endDate=" + endDate);

    });

    $('#btnstatistics').on('click', function () {
        
        window.open("chart.jsp");

//        var startDate = document.getElementById("startDate").value;
//        var endDate = document.getElementById("endDate").value;
//        var disType = document.getElementById("disType").value;
//
//        console.log(startDate);
//        console.log(endDate);
//
//        window.open("laporanKedatanganJumlahPesakitLuarReport.jsp?startDate=" + startDate + "&endDate=" + endDate + "&disType=" + disType);

    });

//    $(document).ready(function () {
//
//        $("#listData").load("listData.jsp");
//    });

</script>

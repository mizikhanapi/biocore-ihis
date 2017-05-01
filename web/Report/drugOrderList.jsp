<%-- 
    Document   : drugOrderList
    Created on : Feb 20, 2017, 7:27:50 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <%@include file = "../assets/header.html" %>

        <title>Total Drug Cost</title>
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
                            <h3 style="margin: 0px;">Total Drug Cost</h3>
                            <hr class="pemisah"/>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Start Date</label>
                                    <div class="col-md-4">
                                        <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">To</label>
                                    <div class="col-md-4">
                                        <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <div class="text-right">
                                <button type="reset" id="PrintReset" class="btn btn-link" data-dismiss="modal" role="button" >Cancel</button>
                                <button type="submit" class="btn btn-success" role="button" id="printDrugOrder">Generate Report</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </body>
</html>

<script>

    $(document).ready(function () {

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
        $('#printDrugOrder').on('click', function () {

            var startDate = document.getElementById("startDate").value;
            var endDate = document.getElementById("endDate").value;

            console.log(startDate);
            console.log(endDate);

            window.open("drugOrderListReport.jsp?startDate=" + startDate + "&endDate=" + endDate);

        });
    });
</script>

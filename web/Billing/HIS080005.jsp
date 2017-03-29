<%-- 
    Document   : report
    Created on : Dec 24, 2016, 6:17:44 PM
    Author     : Mike Ho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <%@include file = "includes/header.jsp" %>
    <body onload="yearList()">
        <div class="container-fluid">
            <div class="row">      
                <%@include file = "includes/sideMenus.jsp" %>
                <!-- main -->		

                <div class="main" style="background: #f2f4f8;">

                    <%@include file = "includes/topMenu.html" %>
                    <div class="row">
                        <!--body-->
                        <div class="col-md-12">
                            <div id="message"></div>
                            <div id="reportDetails" class="thumbnail">
                                <h4>Report</h4>
                                <hr/>
                                <div class="form-horizontal" >

                                    <div class="form-group" >
                                        <label class="col-md-4 control-label">Patient IC No.</label>
                                        <div class="col-md-4" style="margin-bottom: 10px">
                                            <input id="ic" type="text" class="form-control" placeholder="IC No.">
                                        </div>
                                    </div>

                                    <div class="form-group" >
                                        <label class="col-md-4 control-label">Year</label>
                                        <div class="col-md-4" style="margin-bottom: 10px">
                                            <select id="year" class="form-control"></select>
                                        </div>
                                    </div>

                                    <div class="form-group" >
                                        <label class="col-md-4 control-label">Month</label>
                                        <div class="col-md-4" style="margin-bottom: 10px">
                                            <select id="month" class="form-control">
                                                <option value="0" selected="true">All Month</option>
                                                <option value="1">January</option>
                                                <option value="2">February</option>
                                                <option value="3">March</option>
                                                <option value="4">April</option>
                                                <option value="5">May</option>
                                                <option value="6">June</option>
                                                <option value="7">July</option>
                                                <option value="8">August</option>
                                                <option value="9">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="text-center" style="margin-bottom: 10px">
                                        <button id="yearlyStatement" class="btn btn-info" >Customer Yearly Account Statement</button>
                                        <button id="detailsStatement" class="btn btn-info" >Customer Details Account Statement</button>
                                        <button id="yearEndReport" class="btn btn-info" >Year End Processing Report</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file = "includes/message.html" %>    
        <!--js-->
        <script src="assets/js/dateformat.js" type="text/javascript"></script>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script type="text/javascript">
        function yearList() {
            var year = new Date().getFullYear();
            var select = document.getElementById("year");
            for (var i = year - 7; i <= year; ++i) {
                var option = document.createElement('option');
                option.text = option.value = i;
                select.add(option, 0);
            }
            $('#year').val(year);
        }

        var contextPath = '<%=request.getContextPath()%>';

        $(document).ready(function () {
            $('#ic').keypress(function (event) {
                if ((event.which != 46 || $(this).val().indexOf('.') != 1) && (event.which < 48 || event.which > 57) && event.which != 8) {
                    event.preventDefault();
                }
            });

            $('#yearlyStatement').click(function () {
                var ic = document.getElementById('ic').value;
                var year = document.getElementById('year').value;
                var month = document.getElementById('month').value;
                if (month.length !== 2) {
                    month = "0" + month;
                    ;
                }

                if (ic === "") {
                    document.getElementById('messageHeader').innerHTML = "Warning!";
                    document.getElementById('messageContent').innerHTML = "Please fill in patient IC No.";
                    $("#alertMessage").modal();
                } else {
                    $.ajax({
                        url: "validateRecord.jsp",
                        type: "post",
                        data: {
                            ic: ic
                        },
                        timeout: 10000,
                        success: function (data) {
                            var d = data.split("|");
                            if (d[1] == '1') {

                                var url = contextPath + "/PdfServlet?";
                                url += "&action=" + "yearlyStatement";
                                url += "&ic=" + ic;
                                url += "&year=" + year;
                                url += "&month=" + month;

                                var win = window.open(url, '_blank');
                                win.focus();

                            } else {
                                document.getElementById('messageHeader').innerHTML = "Failed!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                            }
                        },
                        error: function (err) {
                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "An error occur.\nPlease try again later.";
                            $("#alertMessage").modal();
                        }
                    });
                }
            });

            $('#detailsStatement').click(function () {
                var ic = document.getElementById('ic').value;
                var year = document.getElementById('year').value;
                var month = document.getElementById('month').value;

                if (month.length !== 2) {
                    month = "0" + month;
                }

                if (ic === "") {
                    document.getElementById('messageHeader').innerHTML = "Warning!";
                    document.getElementById('messageContent').innerHTML = "Please fill in patient IC No.";
                    $("#alertMessage").modal();
                } else {
                    $.ajax({
                        url: "validateRecord.jsp",
                        type: "post",
                        data: {
                            ic: ic
                        },
                        timeout: 10000,
                        success: function (data) {
                            var d = data.split("|");
                            if (d[1] == '1') {

                                var url = contextPath + "/PdfServlet?";
                                url += "&action=" + "detailsStatement";
                                url += "&ic=" + ic;
                                url += "&year=" + year;
                                url += "&month=" + month;

                                var win = window.open(url, '_blank');
                                win.focus();

                            } else {
                                document.getElementById('messageHeader').innerHTML = "Failed!";
                                document.getElementById('messageContent').innerHTML = d[2];
                                $("#alertMessage").modal();
                            }
                        },
                        error: function (err) {
                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "An error occur.\nPlease try again later.";
                            $("#alertMessage").modal();
                        }
                    });
                }
            });

            $('#yearEndReport').click(function () {
                var year = document.getElementById('year').value;

                $.ajax({
                    url: "validateYEP.jsp",
                    type: "post",
                    data: {
                        action: 'yearEndReport'
                    },
                    timeout: 10000,
                    success: function (data) {
                        var d = data.split("|");
                        if (d[1] == '1') {
                            var url = contextPath + "/PdfServlet?";
                            url += "&action=" + "yearEndReport";
                            var win = window.open(url, '_blank');
                            win.focus();
                        } else {
                            document.getElementById('messageHeader').innerHTML = "Failed!";
                            document.getElementById('messageContent').innerHTML = "Failed to create report";
                            $("#alertMessage").modal();
                        }
                    },
                    error: function (err) {
                        document.getElementById('messageHeader').innerHTML = "Error!";
                        document.getElementById('messageContent').innerHTML = "An error occur.\nPlease try again later.";
                        $("#alertMessage").modal();
                    }
                });
            });
        });
        </script>
    </body>
</html>
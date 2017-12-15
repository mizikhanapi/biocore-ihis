<%-- 
    Document   : ICD10Main
    Created on : Feb 19, 2017, 10:08:10 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/mystyles.css" rel="stylesheet" type="text/css"/>
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
                            <h3 style="margin: 0px;"> ICD10 Report </h3>

                            <hr class="pemisah" />

                            <div class="form-inline" style="text-align: center;">
                                <div class="form-group">
                                    <label for="exampleInputName2">Start Date</label>
                                    <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly >
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail2">to</label>
                                    <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly >
                                </div>

                            </div>
                            <br/>
                            <div style="width:50%; margin: auto; text-align: center;">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label" for="textinput">Diagnosis list by discipline: </label>
                                        <div class="col-md-3">

                                            <select class="form-control" name="disp" id="disp">
                                                <option value="All">All</option>
                                                <%  Conn conn = new Conn();
                                                    String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                                                    String sql = "SELECT DISTINCT Centre_Code FROM lhr_diagnosis WHERE HFC_Cd = '" + my_1_hfc_cd + "' ";
                                                    ArrayList<ArrayList<String>> ICD10 = conn.getData(sql);
                                                    int size = ICD10.size();
                                                    for (int i = 0; i < size; i++) {
                                                %>
                                                <option value="<%= ICD10.get(i).get(0)%>"><%= ICD10.get(i).get(0)%></option>

                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" class="btn btn-success" role="button" id="printICD10" style="margin-bottom: 15px;" >Generate Report</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="ICD10">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootbox.min.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="../assets/js/create_destroy_loading.js" type="text/javascript"></script>

        <!--        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->

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
                $('#printICD10').on('click', function () {
                    if ($('#startDate').val() === "" || $('#endDate').val() === " ") {
                        //if the id/ic input is empty
                        alert('Please choose date to prooceed');
                    } else {
                        var startDate = document.getElementById("startDate").value;
                        var endDate = document.getElementById("endDate").value;
                        var disp = document.getElementById("disp").value;
                        //alert(disc+" / "+startDate+" / "+startDate);
                        createScreenLoading();
                        $.ajax({
                            type: "POST",
                            url: "ICD10Report.jsp",
                            data: {'startDate': startDate, 'endDate': endDate, 'disp': disp},
                            timeout: 60000,
                            success: function (list) {
                                $('#ICD10').html(list);
                            },
                            error: function (xhr, status, error) {
                                bootbox.alert("Oops! "+error);
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }
                        });
                        //            var disiplinType = document.getElementByID("disiplinType").value;
                        //                console.log(startDate);
                        //                console.log(endDate);
                        ////            console.log(disiplinType);
                        //
                        //                window.open("ICD10Report.jsp?startDate=" + startDate + "&endDate=" + endDate);
                    }
                });
            });
        </script>
    </body>
</html>
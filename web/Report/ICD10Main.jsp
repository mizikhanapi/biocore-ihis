<%-- 
    Document   : ICD10Main
    Created on : Feb 19, 2017, 10:08:10 PM
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
        
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <title>ICD10</title>
        <%@include file = "../assets/header.html" %>
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
                            <h3 style="margin: 0px;"> ICD 10 </h3>
                            <hr class="pemisah" />

                            <!--                        <div class="form-group">
                                                        <label style="text-align: center" class="col-md-6 control-label" for="textinput">Discipline:</label>
                            
                            
                                                        <div class="form-group">
                                                            <div class="col-md-6">
                                                                <select class="form-control" name="disiplinType" id="disiplinType">
                                                                    <option value="0" id="0" >Please Select</option>
                                                                    <option value="inpatient" id="allergy" >Inpatient</option>
                                                                    <option value="outpatient" id="complaint" >Outpatient</option>
                                                                </select>
                            
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </br></br></br>-->
                            <div class="form-inline" style="text-align: center;">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Start Date:</label>
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
                            
                            <div class="text-right">
                                    <button type="clear" id="PrintReset" class="btn btn-link " data-dismiss="modal" role="button" >Cancel</button>
                                    <button type="submit" class="btn btn-success" role="button" id="printICD10">Generate Report</button>
                            </div>
                            <br>
                            <div id="ICD10">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js" type="text/javascript" language="javascript"></script>
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
        $('#printICD10').on('click', function () {
            if ($('#startDate').val() === "" || $('#endDate').val() === " ") {
                //if the id/ic input is empty
                alert('Please choose date to prooceed');
            } else {

                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;
                //alert(startDate+" / "+startDate);
                $.ajax({
                async: true,
                type: "POST",
                url: "ICD10Report.jsp",
                data: {'startDate': startDate, 'endDate': endDate},
                timeout: 10000,
                success: function (list) {


                    $('#ICD10').html(list);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
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





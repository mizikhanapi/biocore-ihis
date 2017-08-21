<%-- 
    Document   : mcMain2
    Created on : Augt,15 2017, 3:16:21 PM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<%    //Config.getBase_url(request);
    //Config.getFile_url(session);
    Conn conn = new Conn();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Patient Medical Report</title>


        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <%@include file="../assets/header.html"%>
<link rel="stylesheet" type="text/css" media="print" href="../assets/css/bootstrap.min.css">
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
                            <h3 style="margin: 0px;">Print Medical Report</h3>
                            <hr class="pemisah"/>
                            <div id="SearchPatientdiv">
                            </div>

                            <div id="mcTableDivision">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
            <div>
                <%@ include file ="medicalModal.jsp" %>
            </div>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>


        <script>
            function printReport2(divID1)
                {
                    var popupWin = window.open('', '_blank', 'width=1080,height=768');
                    popupWin.document.open();
                    popupWin.document.write('<html><body onload="window.print()">' + divID1 +'</body></html>');
                    popupWin.document.close();
                }
            
            $(document).ready(function () {
                $("#SearchPatientdiv").load("searchMedicalReport.jsp");
                $("#mcTableDivision").on('click','#outpatientProblem #btnPrintmedicalHistory',function(){
                
                var b = $("#mcTableDivision #outpatientProblem #medicalHistorydivision").html();
                var a = $("#mcTableDivision #patientDemographic").html();
                var c = $("#mcTableDivision #outpatientProblem #commentModal #patientmedicalcomments").val();
                var x = a+"<br/><br/>"+b+"<br/><p><strong>Comment : </strong></p>"+c;
                $("#basicModalMedical #test").html(x);
            });
               
            });
            $("#basicModalMedical #b_print2").on('click',function(){
                var div = $("#basicModalMedical #allDiv").html();
                printReport2(div);
            });
        </script>
    </body>
</html>
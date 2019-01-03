<%-- 
    Document   : HIS050001
    Created on : Jan 13, 2018, 12:53:16 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%    Config.getFile_url(session);
    Config.getBase_url(request);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/labHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                                <h3 style="margin: 0px;">Lab Patient List Order</h3>
                                <hr class="pemisah" />

                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    ORDER LIST
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    ORDER DETAIL
                                                </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">

                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="lisLabRequestOrderMasterMain">
                                                </div>
                                                <br>
                                                <div id="lisLabRequestOrderMasterContent">
                                                    <table class="table table-filter table-striped table-bordered" style="width: 100%">
                                                        <thead>
                                                        <th style="text-align: left;">Order No.</th>
                                                        <th style="text-align: left;">PMI No.</th>
                                                        <th style="text-align: left;">Name</th>
                                                        <th style="text-align: left;">Order Date</th>
                                                        <th style="text-align: left;">Doctor's Name</th>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="5" align="center">Please Select Correct Filter And Press Refresh Button</td>
                                                            </tr> 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="lisLabRequestOrderDetailContent">
                                                </div>
                                                <%@include file="manageLabOrderModal.jsp" %>
                                            </div>

                                            <%@include file = "patientOrderListModal.jsp" %>

                                        </div>
                                    </div>
                                </div>
                                <!-- Tab Menu -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		
        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/labFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $(document).ready(function () {

            $('#LISPageOne').addClass('active');


//                $('<div class="loading">Loading</div>').appendTo('body');

                // Load LIST Page
                $("#lisLabRequestOrderMasterMain").load("manageLabOrderMasterMain.jsp");
                //$("#lisLabRequestOrderMasterContent").load("manageLabOrderMasterTable.jsp");

                // Load Detail Page
                $("#lisLabRequestOrderDetailContent").load("manageLabOrderDetaillBasicInfo.jsp");


                // Queue Validator Start
                !function validateForNewPatient() {

                    $.ajax({
                        url: "queue/queueValidatorForNew.jsp",
                        type: "get",
                        timeout: 10000,
                        success: function (datas) {

                            var dataPaient = datas.trim();

                            if (dataPaient === "Got") {

                                alertify.set('notifier', 'position', 'bottom-right');
                                alertify.notify(' <i class="fa fa-info-circle"></i>&nbsp; You Have A New Patient in The Queue', 'info_message', 5);

                            }

                        },
                        error: function (err) {
                        }

                    });

                    setTimeout(validateForNewPatient, 30000);

                }();
                // Queue Validator End

            });


        </script>

    </body>

</html>
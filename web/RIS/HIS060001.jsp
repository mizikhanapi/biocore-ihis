<%-- 
    Document   : HIS060001
    Created on : Mar 28, 2017, 12:18:51 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
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

    Conn conn = new Conn();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | RIS</title>
        <!-- header -->
        <%@include file = "libraries/radiologyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/radiologySideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/radiologyTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab" onclick="location.reload()">
                                                    ORDER LIST</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    ORDER DETAIL</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="risOrderMain">

                                                </div>
                                                <div id="risOrderListContent" class="table-guling">
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
                                                <div id="risOrderDetailContent" class="table-guling">

                                                </div>
                                                <%@include file="order_modal/requestNewOrder_modal.jsp" %>
                                                <%@include file="order_modal/setExamDate_modal.jsp" %>
                                                <%@include file="order_modal/prepareResult_modal.jsp" %>
                                                <%@include file = "patientOrderListModal.jsp" %>
                                                <%@include file="../POM/procedure_modal/procedure_prepare_item.jsp" %>

                                            </div>

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
        <%@include file = "libraries/radiologyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>

        <script>

                                                    $('<div class="loading">&nbsp;</div>').appendTo('body');


                                                    $("#risOrderMain").load("risManageOrderMaster_main.jsp");
                                                    //$("#risOrderListContent").load("risManageOrderListTable.jsp");
                                                    $("#risOrderDetailContent").load("risManageOrderListBasicInfoNew.jsp");

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
                                                                    alertify.error('You Have A New Patient in The Queue !!!!!!');

                                                                }

                                                            },
                                                            error: function (err) {
                                                            }

                                                        });

                                                        setTimeout(validateForNewPatient, 30000);

                                                    }();
                                                    // Queue Validator End

        </script>

    </body>

</html>
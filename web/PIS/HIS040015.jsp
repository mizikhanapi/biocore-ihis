<%-- 
    Document   : HIS040015
    Created on : Oct 29, 2018, 10:17:55 PM
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
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/pharmacySideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/pharmacyTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">

                                <h3>SCREENING DRUG ORDER</h3>

                                <hr/>
                                
                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    DRUG ORDER LIST</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    DRUG ORDER DETAIL</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">

                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="patientScreenListMain">
                                                </div>
                                                <div id="patientScreenListContent">
                                                </div>

                                            </div>

                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="patientScreenDetailContent">
                                                </div>

                                            </div>

                                            <%@include file = "patientScreenListModal.jsp" %>
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
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $('<div class="loading">Loading</div>').appendTo('body');

            $("#patientScreenListMain").load("patientScreenListMain.jsp");
            $("#patientScreenListContent").load("patientScreenListTable.jsp");
            $("#patientScreenDetailContent").load("patientScreenListBasicInfo.jsp");


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
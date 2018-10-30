<%-- 
    Document   : patientOrderList
    Created on : Feb 6, 2017, 4:33:22 PM
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

    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

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

                                                <div id="patientOrderListMain">

                                                </div>
                                                <div id="patientOrderListContent">

                                                </div>
                                            </div>

                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="patientOrderDetailContent">

                                                </div>
                                            </div>


                                            <%//@include file = "patientOrderListModal.jsp" %>

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


        <!-- Dispense Start -->
        <div class="modal fade" id="dispenseOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Dispense Summary</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->
                        <form class="form-horizontal" id="addForm">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-8">
                                    <input id="dispenseOrderNo" name="dispenseOrderNo" type="text" placeholder="Order No" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Total Order</label>
                                <div class="col-md-8">
                                    <input id="dispenseTotalOrder" name="dispenseTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Grand Total (RM)</label>
                                <div class="col-md-8">
                                    <input id="dispenseGrandTotal" name="dispenseGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                        </form>
                        <!-- content goes here -->
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="dispenseOrderMButton">Dispense</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Dispense End -->     


        <!-- Loading Start -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Processing Transaction</h4>
                    </div>
                    <div class="modal-body" align="center">
                        <b> Your request is being processed... Please wait... </b>
                    </div>
                    <div class="modal-footer center-block">
                        <i class='fa fa-spinner fa-spin fa-2x'></i>    
                    </div>
                </div>
            </div>
        </div>
        <!-- Loading End -->


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $('<div class="loading">Loading</div>').appendTo('body');

          //  $("#patientOrderListMain").load("patientOrderListMain.jsp");
          //  $("#patientOrderListContent").load("patientOrderListTable.jsp");
          //  $("#patientOrderDetailContent").load("patientOrderListBasicInfoNew.jsp");


        </script>

    </body>

</html>
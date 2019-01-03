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

                                <h3 style="margin: 0px;">Dispense Drug Order</h3>
                                <hr class="pemisah" />

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

                                                <div id="patientDispenseListMain">
                                                </div>
                                                <br>
                                                <div id="patientDispenseListContent">
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

                                                <div id="patientDispenseDetailContent">
                                                </div>

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


        <!-- Update Dispense Start -->
        <div class="modal fade" id="updateOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title" id="lineModalLabel">Update Order Detail</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->
                        <form class="form-horizontal" id="addForm" autocomplete="off">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-8">
                                    <input id="updateOrderNo" name="updateOrderNo" type="text" placeholder="Order No" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Code</label>
                                <div class="col-md-8">
                                    <input id="updateDrugCode" name="updateDrugCode" type="text" placeholder="Drug Code" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateStockQuantity" name="updateStockQuantity" type="text" placeholder="Ordered Drug Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ordered Drug Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateOrderedDrugQuantity" name="updateOrderedDrugQuantity" type="text" placeholder="Ordered Drug Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Supplied Drug Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateSuppliedDrugQuantity" name="updateSuppliedDrugQuantity" type="number" placeholder="Supplied Drug Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Dispensed Drug Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateDispensedDrugQuantity" name="updateDispensedDrugQuantity" type="number" placeholder="Dispensed Drug Quantity" class="form-control input-md" maxlength="50" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <input id="updateOrderComment" name="updateOrderComment" type="text" placeholder="Type your comment here" class="form-control input-md" maxlength="200" required>
                                </div>
                            </div>


                            <!-- Select input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Status</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="tstatus" id="updatestatus">
                                        <option value="New" selected="selected">-- Select Order Status --</option>
                                        <option value="Partial" >Partial</option>
                                        <option value="Complete Partial" >Complete Partial</option>
                                        <option value="Full Complete" >Full Complete</option>
                                        <option value="Full" >Full</option>
                                    </select>
                                </div>
                            </div>


                        </form>
                        <!-- content goes here -->
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-primary btn-block btn-lg" role="button" id="updateOrderMButton">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Update Dispense End -->                    

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
                                <button type="submit" class="btn btn-primary btn-block btn-lg" role="button" id="dispenseOrderMButton">Dispense</button>
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

            $('#PISPage2').addClass('active');

            $("#patientDispenseListMain").load("patientDispenseListMain.jsp");
            //$("#patientDispenseListContent").load("patientDispenseListTable.jsp");
            $("#patientDispenseDetailContent").load("patientDispenseListBasicInfo.jsp");


        </script>

    </body>

</html>
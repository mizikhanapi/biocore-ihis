<%-- 
    Document   : manageStockQuantityModal
    Created on : Dec 11, 2017, 8:58:19 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<!-- Modal Add Invoice Start -->
<div class="modal fade" id="invoiceAddOrderModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="invoiceAddOrderDetailTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="invoiceAddOrderDetailForm">

                    <div class="row">

                        <br>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Search Item To Be Added &nbsp; *</label>
                            <div class="col-md-6">
                                <input id="invoiceAddItemSearchInput" type="text" class="form-control" placeholder="Please Search Item Information" maxlength="100" >
                                <div id="invoiceAddItemSearchResult" class="search-drop">
                                    <!--for search area-->
                                </div>
                            </div>
                        </div>

                        <hr>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Item Code &nbsp; *</label>
                            <div class="col-md-6">
                                <input id="invoiceAddCode" type="text" class="form-control" disabled>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Item Name &nbsp; *</label>
                            <div class="col-md-6">
                                <input id="invoiceAddName" type="text" class="form-control" maxlength="100" disabled>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Item Price &nbsp; *</label>
                            <div class="col-md-6">
                                <input id="invoiceAddPrice" type="text" class="form-control" disabled>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Item Stock Quantity &nbsp; *</label>
                            <div class="col-md-6">
                                <input id="invoiceAddPriceStockQty" type="text" class="form-control" disabled>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Item Quantity To be Added &nbsp; *</label>
                            <div class="col-md-6">
                                <input id="invoiceAddPriceNewQty" type="number" class="form-control" placeholder="Please Insert Drug Quantity" maxlength="7">
                            </div>
                        </div>

                    </div>
                </form>
                <!-- content goes here -->

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="invoiceAddOrderDetail_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group" id="invoiceAddOrderDetail_btnClear_or_btnDelete_div">
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Invoice End -->


<!-- Modal View Invoice Start -->
<div class="modal fade" id="invoiceViewOrderModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" align="center"> Invoice Details </h2>
            </div>
            <div class="modal-body">
                <br><br>

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">
                    <div class="row">

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Invoice No.</label>
                                <div class="col-md-7">
                                    <input id="invoiceViewOrderNo" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Supplier Name</label>
                                <div class="col-md-7">
                                    <input id="invoiceViewOrderSupplierName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Invoice Date</label>
                                <div class="col-md-7">
                                    <input id="invoiceViewOrderDate" name="patientnic" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                            <!--Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Total Amount (RM)</label>
                                <div class="col-md-7">
                                    <input id="invoiceViewOrderTotalAmount" name="patientGender" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                        </div>

                    </div>
                </form>
                <!-- content goes here -->

                <hr/>

                <br><br>

                <h4 align="center">
                    <b>INVOICE ITEM DETAILS</b>
                </h4>
                <br>
                <div id="deleveryOrderInvoiceDetailsTableDiv" class="form-group table-guling">
                    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="invoiceViewOrderDetailsTable">
                        <thead>
                        <th>Item Code</th>
                        <th>Item Name</th>
                        <th>Item Amount (RM)</th>
                        <th>Item Quantity (PRICE/UNIT)</th>
                        <th>Created By</th>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>

            </div>
            <div class="modal-footer">
                <div class="btn-group" role="group">
                    <button type="reset" id="invoiceViewOrderCloseBtn" class="btn btn-success btn-block btn-lg" data-dismiss="modal" role="button"><i class="fa fa-times-circle-o" aria-hidden="true"></i>&nbsp;&nbsp;Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal View Invoice End -->

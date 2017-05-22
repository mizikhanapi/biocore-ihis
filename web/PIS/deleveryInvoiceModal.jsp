<%-- 
    Document   : deleveryInvoiceModal
    Created on : May 22, 2017, 5:55:24 PM
    Author     : Shammugam
--%>


<!-- Modal Invoice Start -->
<div class="modal fade" id="deleveryInvoiceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
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
                                    <input id="deleveryInvoiceNo" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Supplier Name</label>
                                <div class="col-md-7">
                                    <input id="deleveryInvoiceSupplierName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Invoice Date</label>
                                <div class="col-md-7">
                                    <input id="deleveryInvoiceDate" name="patientnic" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                            <!--Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Total Amount (RM)</label>
                                <div class="col-md-7">
                                    <input id="deleveryInvoiceTotalAmount" name="patientGender" type="text" readonly placeholder="" class="form-control input-md">
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
                    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="deleveryOrderInvoiceDetailsTable">
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
                    <button type="reset" id="deleveryOrderInvoiceCloseBtn" class="btn btn-success btn-block btn-lg" data-dismiss="modal" role="button"><i class="fa fa-times-circle-o" aria-hidden="true"></i>&nbsp;&nbsp;Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Invoice End -->
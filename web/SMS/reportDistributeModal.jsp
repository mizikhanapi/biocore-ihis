<%-- 
    Document   : reportDistributeModal
    Created on : 09-Nov-2018, 23:12:18
    Author     : Shay
--%>

<!-- Add Modal Start -->
<div class="modal fade" id="disdetail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:63%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Detail Stock Distribution</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->

                <form class="form-horizontal" id="addStockOrderForm" autocomplete="off">

                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <h4>Distribute Stock Details</h4>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group hidden">
                                <label class="col-md-3 control-label" for="textinput">Order No</label>
                                <div class="col-md-4">
                                    <input id="requestorName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group hidden">
                                <label class="col-md-3 control-label" for="textinput">Order By</label>
                                <div class="col-md-4">
                                    <input id="requestorName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>
                            <div class="form-group hidden">
                                <label class="col-md-3 control-label " for="textinput">Location</label>
                                <div class="col-md-4">
                                    <input id="requestorLocation" name="requestorLocation" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="thumbnail">
                        <div id="tbldetailmodal">
                            <table  id="distributedetailreporttable"  class="table table-striped table-bordered" cellspacing="0" width="50%">
                                <thead >
                                <th style="text-align: left;">Order No</th>
                                <th style="text-align: left;">Txn Date</th>
                                <th style="text-align: left;">Item Code</th>
                                <th style="text-align: left;">Item Name</th>
                                <th style="text-align: left;">Quantity</th>
                                <th style="text-align: left;">Amount (RM)</th>
                                <th style="text-align: left;">Item Type</th>
                                <th style="text-align: left;">Discipline</th>
                                <th style="text-align: left;">Subdiscipline</th>
                                <th style="text-align: left;">Ordering Discipline</th>
                                <th style="text-align: left;">Ordering Subdiscipline</th>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                        </div>
                        
                    </div>

                </form>
                <!-- content goes here -->

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="orderStockAddButton">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="orderStockResetButton" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->    

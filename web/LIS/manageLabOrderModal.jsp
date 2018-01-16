<%-- 
    Document   : manageLabOrderModal
    Created on : Jan 13, 2018, 10:13:55 AM
    Author     : Shammugam
--%>


<!-- Loading Start -->
<div class="modal fade" id="myLoadingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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


<!-- Add Modal Start -->
<div class="modal fade" id="addLabRequestModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:63%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Stock Order</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->

                <form class="form-horizontal" id="addLabRequestModalForm" autocomplete="off">

                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <h4>Order Details</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Order ID</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestDetailsID" name="orderStockDetailsID" type="text" placeholder="Drug Order ID"  class="form-control input-md" readonly>
                                </div>
                            </div> 
                            <hr>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Order Date</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestDetailsDate" name="orderStockDetailsDate" type="text" placeholder="Drug Order Date"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <h4>Choose Stock Item</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Search Laboratory Item *</label>
                                <div class="col-md-6">
                                    <input id="orderLabRequestDetailsSearchItemInput" name="orderDrugSearchInput" type="text" placeholder="Search Laboratory Item"  class="form-control input-md">
                                    <div id="orderLabRequestDetailsSearchItemInputDisplayResult" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Code</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestItemDisplayItemCode" name="orderStockItemDisplayItemCode" type="text" placeholder="Item Code"  class="form-control input-md" readonly>
                                </div>
                            </div>                           
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Name</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestItemDisplayItemName" name="orderStockItemDisplayItemName" type="text" placeholder="Item Name" class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Specimen Source</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestItemDisplayItemSpeSource" name="orderStockItemDisplayItemName" type="text" placeholder="Specimen Source" class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Specimen Container</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestItemDisplayItemSpeContainer" name="orderStockItemDisplayItemName" type="text" placeholder="Specimen Source" class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Volume</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestItemDisplayItemVolume" name="orderStockItemDisplayItemName" type="text" placeholder="Volume" class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Special Instruction</label>
                                <div class="col-md-8">
                                    <input id="orderLabRequestItemDisplayItemSpecialIntruct" name="orderStockItemDisplayItemName" type="text" placeholder="Special Instruction" class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <textarea id="orderLabRequestItemInputComment" class="form-control" rows="5" placeholder="Please Insert Comment" maxlength="200"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="orderLabRequestAddButton">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="orderLabRequestResetButton" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->    


<!-- Update Modal Start -->
<div class="modal fade" id="updateLabRequestOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:35%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Lab Request Details</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <form class="form-horizontal" id="addForm" autocomplete="off">

                    <div class="row">

                        <div class="col-md-10">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-8">
                                    <input id="updateLabRequestOrderNo" type="text" placeholder="Order No" class="form-control input-md" disabled>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Code</label>
                                <div class="col-md-8">
                                    <input id="updateLabRequestOrderCode" type="text" placeholder="Item Code" class="form-control input-md" disabled>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Name</label>
                                <div class="col-md-8">
                                    <input id="updateLabRequestOrderName" type="text" placeholder="Item Name" class="form-control input-md" disabled>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <textarea id="updateLabRequestOrderComment" class="form-control input-md" rows="4" placeholder="Please Insert Comment" maxlength="200"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateLabRequestOrderMButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-danger btn-block btn-lg" role="button" id="deleteLabRequestOrderMButton" >Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Modal End -->  
<%-- 
    Document   : distrubuteStockOrderModal
    Created on : Dec 8, 2017, 10:10:16 AM
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
<div class="modal fade" id="addStockOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:63%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Stock Order</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->

                <form class="form-horizontal" id="addStockOrderForm" autocomplete="off">

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
                                    <input id="orderStockDetailsID" name="orderStockDetailsID" type="text" placeholder="Drug Order ID"  class="form-control input-md" readonly>
                                </div>
                            </div> 
                            <hr>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Order Date</label>
                                <div class="col-md-8">
                                    <input id="orderStockDetailsDate" name="orderStockDetailsDate" type="text" placeholder="Drug Order Date"  class="form-control input-md" readonly>
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
                                <label class="col-md-4 control-label" for="textinput">Search Stock Item *</label>
                                <div class="col-md-6">
                                    <input id="orderStockDetailsSearchItemInput" name="orderDrugSearchInput" type="text" placeholder="Search Stock Item"  class="form-control input-md">
                                    <div id="orderStockDetailsSearchItemInputDisplayResult" class="search-drop"></div>
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
                                    <input id="orderStockItemDisplayItemCode" name="orderStockItemDisplayItemCode" type="text" placeholder="Item Code"  class="form-control input-md" readonly>
                                </div>
                            </div>                           
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Name</label>
                                <div class="col-md-8">
                                    <input id="orderStockItemDisplayItemName" name="orderStockItemDisplayItemName" type="text" placeholder="Item Name" class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="orderStockItemDisplayItemStockQuantity" name="orderStockItemDisplayItemStackQuantity" type="text" placeholder="Stock Quantity"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Price</label>
                                <div class="col-md-8">
                                    <input id="orderStockItemDisplayItemPrice" name="orderStockItemDisplayItemPrice" type="text" placeholder="Stock Quantity"  class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order Quantity *</label>
                                <div class="col-md-8">
                                    <input id="orderStockItemInputQuantity" name="orderStockItemInputQuantity" type="number" placeholder="Please Insert Order Quantity" class="form-control input-md" min="1" maxlength="7">
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <textarea id="orderStockItemInputComment" class="form-control" rows="5" placeholder="Please Insert Comment" maxlength="200"></textarea>
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


<!-- Update Modal Start -->
<div class="modal fade" id="updateStockOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Stock Order Detail</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm" autocomplete="off">


                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-5">
                                    <input id="updateStockOrderNo" name="updateOrderNo" type="text" placeholder="Order No" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Code</label>
                                <div class="col-md-8">
                                    <input id="updateStockOrderCode" name="updateDrugCode" type="text" placeholder="Item Code" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateStockOrderStockQuantity" name="updateStockQuantity" type="text" placeholder="Stock Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ordered Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateStockOrderOrderedQuantity" name="updateOrderedDrugQuantity" type="text" placeholder="Ordered Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Released Quantity</label>
                                <div class="col-md-8">
                                    <input id="updateStockOrderReleasedQuantity" name="updateSuppliedDrugQuantity" type="number" placeholder="Released Quantity" class="form-control input-md" maxlength="50" readonly>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Quantity To Release</label>
                                <div class="col-md-8">
                                    <input id="updateStockOrderQtyToReleaseQuantity" name="updateDispensedDrugQuantity" type="number" placeholder="Quantity To Release" class="form-control input-md" maxlength="50" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <textarea id="updateStockOrderComment" class="form-control" rows="4" placeholder="Please Insert Comment" maxlength="200"></textarea>
                                </div>
                            </div>


                            <!-- Select input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Status</label>
                                <div class="col-md-8">
                                    <select class="form-control" name="tstatus" id="updateStockOrderStatus">
                                        <option value="New" selected="selected">-- Select Order Status --</option>
                                        <option value="Partial" >Partial</option>
                                        <option value="Complete Partial" >Complete Partial</option>>
                                        <option value="Full" >Full</option>
                                    </select>
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateStockOrderMButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-danger btn-block btn-lg" role="button" id="deleteStockOrderMButton" >Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Modal End -->  
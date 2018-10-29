<%-- 
    Document   : procedure_prepare_item
    Created on : Oct 19, 2018, 2:34:05 PM
    Author     : shay
--%>

<div class="modal fade" id="POSorderNewStockOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:63%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="orderNewStockOrderModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->

                <form class="form-horizontal" id="orderNewStockOrderModalFrom" autocomplete="off">

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
                                <label class="col-md-4 control-label" for="textinput">Item Type *</label>
                                <div class="col-md-6">
                                    <select id="orderNewStockOrderItemType" class="form-control input-md">
                                        <option value="drug">Drug Items</option>
                                        <option value="other" >Others</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Search Stock Item *</label>
                                <div class="col-md-6">
                                    <input id="orderNewStockOrderSearchItemInput" name="orderDrugSearchInput" type="text" placeholder="Search Stock Item"  class="form-control input-md">
                                    <div id="orderNewStockOrderSearchItemInputDisplayResult" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr/>

                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <h4>Item Information</h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Code</label>
                                <div class="col-md-8">
                                    <input id="orderNewStockOrderItemDisplayItemCode" name="orderStockItemDisplayItemCode" type="text" placeholder="Item Code"  class="form-control input-md" readonly>
                                    <input type="hidden" id="disciplineStock">
                                    <input type="hidden" id="subdisciplineStock">
                                    <input type="hidden" id="disciplineStockOrdering">
                                    <input type="hidden" id="subdisciplineStockOrdering">
                                    <input type="hidden" id="stockitemtype">
                                </div>
                            </div>                           
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Name</label>
                                <div class="col-md-8">
                                    <input id="orderNewStockOrderItemDisplayItemName" name="orderStockItemDisplayItemName" type="text" placeholder="Item Name" class="form-control input-md" readonly>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="orderNewStockOrderItemDisplayItemStockQuantity" name="orderStockItemDisplayItemStackQuantity" type="text" placeholder="Stock Quantity"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Price</label>
                                <div class="col-md-8">
                                    <input id="orderNewStockOrderItemDisplayItemPrice" name="orderStockItemDisplayItemPrice" type="text" placeholder="Item Price"  class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr/>
                    <br>

                    <div class="row">
                        <div class="col-md-12">
                            <h4>Order Information</h4>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order Quantity *</label>
                                <div class="col-md-8">
                                    <input id="orderNewStockOrderItemInputQuantity" name="orderStockItemInputQuantity" type="number" placeholder="Please Insert Order Quantity" class="form-control input-md" min="1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
<!--                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <textarea id="orderNewStockOrderItemInputComment" class="form-control" rows="2" placeholder="Please Insert Comment" maxlength="200"></textarea>
                                </div>
                            </div>-->
                        </div>
                    </div>


                </form>
                <!-- content goes here -->

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="orderNewStockOrderItem_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group" id="orderNewStockOrderItem_btnCancel_or_btnDelete_div">

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%-- 
    Document   : manageStockCodeItemModal
    Created on : Nov 14, 2017, 10:06:12 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String hfcNameSupplier = session.getAttribute("HFC_NAME").toString();
%>


<!-- Add Button End -->
<div class="modal fade" id="stockItemModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="stockItemModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="stockItemForm">

                    <div class="row">


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Category Code *</label>
                                <div class="col-md-7">
                                    <input id="stockItemCatCode" name="freqCode" type="text" placeholder="Search Stock Category Code" class="form-control input-md" maxlength="30" required>
                                    <div id="stockItemCatCodeSearch" class="search-drop">
                                        <!--for search area-->
                                    </div>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Code *</label>
                                <div class="col-md-7">
                                    <input id="stockItemCode" name="freqCode" type="text" placeholder="Insert Stock Item Code" class="form-control input-md" maxlength="30" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Name *</label>
                                <div class="col-md-7">
                                    <input id="stockItemName" name="freqCode" type="text" placeholder="Insert Stock Item Name" class="form-control input-md" maxlength="100" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Barcode *</label>
                                <div class="col-md-7">
                                    <input id="stockItemBarcode" name="freqCode" type="text" placeholder="Insert Stock Item Barcode" class="form-control input-md" maxlength="30" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item OUM *</label>
                                <div class="col-md-7">
                                    <input id="stockItemOUM" name="freqCode" type="text" placeholder="Insert Stock Item OUM" class="form-control input-md" maxlength="30" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Supplier *</label>
                                <div class="col-md-7">
                                    <input id="stockItemsSupplierCD" name="freqCode" type="text" placeholder="Search Stock Item Supplier" class="form-control input-md" maxlength="30" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Serial No. *</label>
                                <div class="col-md-7">
                                    <input id="stockItemSerialNo" name="freqCode" type="text" placeholder="Insert Stock Item Serial No." class="form-control input-md" maxlength="30" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Item Brand *</label>
                                <div class="col-md-7">
                                    <input id="stockItemBrand" name="freqCode" type="text" placeholder="Insert Stock Item Brand" class="form-control input-md" maxlength="10" required>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-4">


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Location *</label>
                                <div class="col-md-7">
                                    <input id="stockItemLocation" name="freqCode" type="text" placeholder="Insert Stock Item Location" class="form-control input-md" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Currency *</label>
                                <div class="col-md-7">
                                    <input id="stockItemCurrency" name="freqCode" type="text" placeholder="Insert Stock Item Currency" class="form-control input-md" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Selling Price *</label>
                                <div class="col-md-7">
                                    <input id="stockItemSellingPrice" name="freqCode" type="text" placeholder="Insert Stock Item Selling Price" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Purchase Price *</label>
                                <div class="col-md-7">
                                    <input id="stockItemPurchasePrice" name="freqCode" type="text" placeholder="Insert Stock Item Purchase Price" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Wholesale Price *</label>
                                <div class="col-md-7">
                                    <input id="stockItemWholesalePrice" name="freqCode" type="text" placeholder="Insert Stock Item  Wholesale Price" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Tax *</label>
                                <div class="col-md-7">
                                    <input id="stockItemTax" name="freqCode" type="text" placeholder="Insert Stock Item Tax" class="form-control input-md decimalNumbersOnly" maxlength="5" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Min Stock *</label>
                                <div class="col-md-7">
                                    <input id="stockItemMinStock" name="freqCode" type="text" placeholder="Insert Stock Item Min Stock" class="form-control input-md singleNumbersOnly" maxlength="7" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Float Stock *</label>
                                <div class="col-md-7">
                                    <input id="stockItemFloatStock" name="freqCode" type="text" placeholder="Insert Stock Item Float Stock" class="form-control input-md singleNumbersOnly" maxlength="7" required>
                                </div>
                            </div>


                        </div>

                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Physical Stock *</label>
                                <div class="col-md-7">
                                    <input id="stockItemPhysicalStock" name="freqCode" type="text" placeholder="Insert Stock Item Physical Stock" class="form-control input-md singleNumbersOnly" maxlength="7" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Reorder Level *</label>
                                <div class="col-md-7">
                                    <input id="stockItemReorderLevel" name="freqCode" type="text" placeholder="Insert Stock Item Reorder Level" class="form-control input-md singleNumbersOnly" maxlength="7" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Std Material Cost *</label>
                                <div class="col-md-7">
                                    <input id="stockItemStdMaterialCost" name="freqCode" type="text" placeholder="Insert Stock Item Std Material Cost" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Std Labor Cost *</label>
                                <div class="col-md-7">
                                    <input id="stockItemStdLaborCost" name="freqCode" type="text" placeholder="Insert Stock Item Std Labor Cost" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Std Expenses *</label>
                                <div class="col-md-7">
                                    <input id="stockItemStdExpenses" name="freqCode" type="text" placeholder="Insert Stock Item Std Expenses" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Condition *</label>
                                <div class="col-md-7">
                                    <input id="stockItemCondition" name="freqCode" type="text" placeholder="Insert Stock Item Condition" class="form-control input-md" maxlength="30" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Grade *</label>
                                <div class="col-md-7">
                                    <input id="stockItemGrade" name="freqCode" type="text" placeholder="Insert Stock Item Grade" class="form-control input-md" maxlength="10" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-5 control-label" for="selectbasic">Status *</label>
                                <div class="col-md-7">
                                    <select id="stockItemStatus" name="freqStatus" class="form-control">
                                        <option value="1" selected>Active</option>
                                        <option value="0">Inactive</option>     
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
                    <div class="btn-group" role="group" id="stockItem_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="stockItemReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Supplier End -->
<!-- Add Part End -->
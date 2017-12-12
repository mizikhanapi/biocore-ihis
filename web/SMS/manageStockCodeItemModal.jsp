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
                                <label class="col-md-5 control-label" for="textinput">Barcode</label>
                                <div class="col-md-7">
                                    <input id="stockItemBarcode" name="freqCode" type="text" placeholder="Insert Stock Item Barcode" class="form-control input-md" maxlength="30">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="selectbasic">OUM *</label>
                                <div class="col-md-7">
                                    <select id="stockItemOUM" name="addD_QTYT" class="form-control">
                                        <option value="">Please Select OUM</option>
                                        <%
                                            String sql1 = "SELECT Master_Reference_code,Detail_Reference_code, Description "
                                                    + "FROM adm_lookup_detail where Master_Reference_code = '0025' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDUOM = conn.getData(sql1);

                                            int size1 = listOfDUOM.size();

                                            for (int i = 0;
                                                    i < size1;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfDUOM.get(i).get(2)%>"><%= listOfDUOM.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Supplier</label>
                                <div class="col-md-7">
                                    <select id="stockItemsSupplierCD" name="supplierDetails" class="form-control" >
                                        <option value="">Please Select Supplier</option>
                                        <%
                                            String sqlSupp = "SELECT vendor_id,vendor_name FROM fap_vendor where hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDClass = conn.getData(sqlSupp);

                                            int size8 = listOfDClass.size();

                                            for (int i = 0; i < size8; i++) {
                                        %>
                                        <option value="<%= listOfDClass.get(i).get(0)%>"><%= listOfDClass.get(i).get(1)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Serial No.</label>
                                <div class="col-md-7">
                                    <input id="stockItemSerialNo" name="freqCode" type="text" placeholder="Insert Stock Item Serial No." class="form-control input-md" maxlength="30">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="selectbasic">Brand</label>
                                <div class="col-md-7">
                                    <select id="stockItemBrand" name="addD_QTYT" class="form-control">
                                        <option value="">Please Select Brand</option>
                                        <%
                                            String sql2 = "SELECT Master_Reference_code,Detail_Reference_code, Description "
                                                    + "FROM adm_lookup_detail where Master_Reference_code = '0126' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfBrand = conn.getData(sql2);

                                            int size2 = listOfBrand.size();

                                            for (int i = 0;
                                                    i < size2;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfBrand.get(i).get(2)%>"><%= listOfBrand.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                        </div>

                        <div class="col-md-4">


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Location</label>
                                <div class="col-md-7">
                                    <input id="stockItemLocation" name="freqCode" type="text" placeholder="Insert Stock Item Location" class="form-control input-md" maxlength="10">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="selectbasic">Currency</label>
                                <div class="col-md-7">
                                    <select id="stockItemCurrency" name="addD_QTYT" class="form-control">
                                        <option value="">Please Select Currency</option>
                                        <%
                                            String sql3 = "SELECT Master_Reference_code,Detail_Reference_code, Description "
                                                    + "FROM adm_lookup_detail where Master_Reference_code = '0099' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfCur = conn.getData(sql3);

                                            int size3 = listOfCur.size();

                                            for (int i = 0;
                                                    i < size3;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfCur.get(i).get(2)%>"><%= listOfCur.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Selling Price *</label>
                                <div class="col-md-7">
                                    <input id="stockItemSellingPrice" name="freqCode" type="text" placeholder="Insert Stock Item Selling Price" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Purchase Price *</label>
                                <div class="col-md-7">
                                    <input id="stockItemPurchasePrice" name="freqCode" type="text" placeholder="Insert Stock Item Purchase Price" class="form-control input-md decimalNumbersOnly" maxlength="10" required>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Wholesale Price</label>
                                <div class="col-md-7">
                                    <input id="stockItemWholesalePrice" name="freqCode" type="text" placeholder="Insert Stock Item  Wholesale Price" class="form-control input-md decimalNumbersOnly" maxlength="10" >
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Tax</label>
                                <div class="col-md-7">
                                    <input id="stockItemTax" name="freqCode" type="text" placeholder="Insert Stock Item Tax" class="form-control input-md decimalNumbersOnly" maxlength="5" >
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
                                <label class="col-md-5 control-label" for="textinput">Item Float Stock</label>
                                <div class="col-md-7">
                                    <input id="stockItemFloatStock" name="freqCode" type="text" placeholder="Insert Stock Item Float Stock" class="form-control input-md singleNumbersOnly" maxlength="7">
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
                                <label class="col-md-5 control-label" for="textinput">Item Std Material Cost</label>
                                <div class="col-md-7">
                                    <input id="stockItemStdMaterialCost" name="freqCode" type="text" placeholder="Insert Stock Item Std Material Cost" class="form-control input-md decimalNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Std Labor Cost</label>
                                <div class="col-md-7">
                                    <input id="stockItemStdLaborCost" name="freqCode" type="text" placeholder="Insert Stock Item Std Labor Cost" class="form-control input-md decimalNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="textinput">Item Std Expenses</label>
                                <div class="col-md-7">
                                    <input id="stockItemStdExpenses" name="freqCode" type="text" placeholder="Insert Stock Item Std Expenses" class="form-control input-md decimalNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="selectbasic">Condition</label>
                                <div class="col-md-7">
                                    <select id="stockItemCondition" name="addD_QTYT" class="form-control">
                                        <option value="">Please Select Condition</option>
                                        <%
                                            String sql4 = "SELECT Master_Reference_code,Detail_Reference_code, Description "
                                                    + "FROM adm_lookup_detail where Master_Reference_code = '0128' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfCon = conn.getData(sql4);

                                            int size4 = listOfCon.size();

                                            for (int i = 0;
                                                    i < size4;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfCon.get(i).get(2)%>"><%= listOfCon.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-5 control-label" for="selectbasic">Grade</label>
                                <div class="col-md-7">
                                    <select id="stockItemGrade" name="addD_QTYT" class="form-control">
                                        <option value="">Please Select Grade</option>
                                        <%
                                            String sql5 = "SELECT Master_Reference_code,Detail_Reference_code, Description "
                                                    + "FROM adm_lookup_detail where Master_Reference_code = '0127' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfGra = conn.getData(sql5);

                                            int size5 = listOfGra.size();

                                            for (int i = 0;
                                                    i < size5;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfGra.get(i).get(2)%>"><%= listOfGra.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
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


<!-- Summary Modal Start -->
<div class="modal fade" id="stockItemSummaryModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Inventory Summary</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">
                    <div class="row">
                        <div class="col-md-12">
                            <br>
                            <div id="stockItemStockSummary">
                            </div>
                            
                        </div>
                        <br>
                        <br>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="stockItem_btnSummaryClose" data-dismiss="modal"><i class=" fa fa-close"></i> Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Summary Modal End -->   
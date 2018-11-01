<%-- 
    Document   : patientScreenListModal
    Created on : Oct 30, 2018, 3:42:27 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%    Config.getFile_url(session);
    Config.getBase_url(request);

    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();

%>


<!-- Delete Start -->
<div class="modal fade" id="deleteScreenItem" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Order Detail</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Order No</label>
                        <div class="col-md-7">
                            <input id="deleteScreenOrderNo" type="text" placeholder="Order No" class="form-control input-md" maxlength="30" readonly disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Drug Code</label>
                        <div class="col-md-7">
                            <input id="deleteScreenDrugCode" type="text" placeholder="Drug Code" class="form-control input-md" maxlength="30" readonly disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Drug Name</label>
                        <div class="col-md-7">
                            <input id="deleteScreenDrugName" type="text" placeholder="Drug Code" class="form-control input-md" maxlength="200" readonly disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                        <div class="col-md-7">
                            <input id="deleteScreenStockQuantity" type="text" placeholder="Ordered Drug Quantity" class="form-control input-md" maxlength="50" readonly disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Ordered Drug Quantity</label>
                        <div class="col-md-7">
                            <input id="deleteScreenOrderedQuantity" type="text" placeholder="Ordered Drug Quantity" class="form-control input-md" maxlength="50" readonly disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Comment</label>
                        <div class="col-md-7">
                            <input id="deleteScreenComment" name="updateOrderComment" type="text" placeholder="Order Comment" class="form-control input-md" maxlength="200" readonly disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Quantity To Dispense</label>
                        <div class="col-md-7">
                            <input id="deleteScreenDispenseQuantity" name="deleteScreenDispenseQuantity" type="number" placeholder="Order Dispense Quantity" class="form-control input-md" maxlength="4">
                        </div>
                    </div>

                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="updateScreenMButton">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-danger btn-block btn-lg" role="button" id="deleteScreenMButton">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Delete End -->        


<!-- Add Modal Start -->
<div class="modal fade" id="addScreenItem" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:63%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Item</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->

                <form class="form-horizontal" id="addScreenItemForm" autocomplete="off">
                    <div class="row">
                        <div class="col-md-6">

                            <h4>Order Details</h4>
                            <hr/>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Order ID</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDetailsID" name="orderDrugDetailsID" type="text" placeholder="Drug Order ID"  class="form-control input-md" readonly>
                                </div>
                            </div> 
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Order Date</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDetailsDate" name="orderDrugDetailsDate" type="text" placeholder="Drug Order Date"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <br/>


                            <h4>Choose Drug</h4>
                            <hr/>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Search Drug *</label>
                                <div class="col-md-8">
                                    <input id="orderDrugSearchInput" name="orderDrugSearchInput" type="text" placeholder="Search Drug"  class="form-control input-md">
                                    <div id="orderDrugSearchInputDisplayResult" class="search-drop"></div>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Code</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayDrugCode" name="orderDrugDisplayDrugCode" type="text" placeholder="Drug Code"  class="form-control input-md" readonly>
                                </div>
                            </div>                           
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Trade Name</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayTradeName" name="orderDrugDisplayStockQuantity" type="text" placeholder="Drug Name" class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Route</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayRoute" name="orderDrugDisplayRoute" type="text" placeholder="Drug Route"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Form</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayForm" name="orderDrugDisplayForm" type="text" placeholder="Drug Form"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <br/>

                        </div>

                        <div class="col-md-6">
                            <br>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Strength</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayStrength" name="orderDrugDisplayStrength" type="text" placeholder="Drug Strength" class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Instruction</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayInstruction" name="orderDrugDisplayFrequency" type="text" placeholder="Instruction"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Cautionary</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayCautionary" name="orderDrugDisplayCautionary" type="text" placeholder="Cautionary"  class="form-control input-md" readonly>
                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity</label>
                                <div class="col-md-8">
                                    <input id="orderDrugDisplayStockQuantity" name="orderDrugDisplayStockQuantity" type="text" placeholder="Total Stock Quantity"  class="form-control input-md" readonly>
                                </div>
                            </div>

                            <br>

                            <h4>Order Information</h4>
                            <hr/>


                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dose *</label>
                                <div class="col-md-4">
                                    <input id="orderDrugInputDose" name="orderDrugInputDose" type="number" class="form-control input-md" placeholder="Insert Drug Dose" step="0.01" maxlength="50">
                                </div>
                                <div class="col-md-4">
                                    <select id="orderDrugInputDoseT" name="orderDrugInputDoseT" class="form-control">
                                        <option value="-">Select Dose</option>
                                        <%  String sql4 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail "
                                                    + " where Master_Reference_code = '0025' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDUOM = conn.getData(sql4);
                                            int size4 = listOfDUOM.size();
                                            for (int i = 0; i < size4; i++) {
                                        %>
                                        <option value="<%= listOfDUOM.get(i).get(2)%>"> <%= listOfDUOM.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Duration *</label>
                                <div class="col-md-4">
                                    <input id="orderDrugInputDuration" name="orderDrugInputDuration" type="number" class="form-control input-md" step="0.01" placeholder="Insert Drug Duration" maxlength="12">
                                </div>
                                <div class="col-md-4">
                                    <select id="orderDrugInputDurationT" name="orderDrugInputDurationT" class="form-control">
                                        <option value="-">Select Duration</option>
                                        <%
                                            String sql6 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail "
                                                    + " where Master_Reference_code = '0089' AND hfc_cd = '" + hfc + "'  ";
                                            ArrayList<ArrayList<String>> listOfDDura = conn.getData(sql6);
                                            int size6 = listOfDDura.size();
                                            for (int i = 0; i < size6; i++) {
                                        %>
                                        <option value="<%= listOfDDura.get(i).get(2)%>"> <%= listOfDDura.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Frequency *</label>
                                <div class="col-md-8">
                                    <select id="orderDrugInputFrequency" name="orderDrugInputFrequency" class="form-control">
                                        <option value="-">Select Frequency</option>
                                        <%
                                            String sql5 = "SELECT frequency_code,frequency_desc,frequency_value FROM pis_drug_frequency where hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";
                                            ArrayList<ArrayList<String>> listOfDFreq = conn.getData(sql5);
                                            int size5 = listOfDFreq.size();
                                            for (int i = 0; i < size5; i++) {
                                        %>
                                        <option value="<%= listOfDFreq.get(i).get(1)%>"><%= listOfDFreq.get(i).get(1)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order Quantity *</label>
                                <div class="col-md-8">
                                    <input id="orderDrugInputQuantity" name="orderDrugInputQuantity" type="number" placeholder="Insert Drug Quantity" class="form-control input-md" min="1" maxlength="7">
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Comment</label>
                                <div class="col-md-8">
                                    <input id="orderComment" name="orderComment" type="text" placeholder="Comment" class="form-control input-md" maxlength="200">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="screenDrugAddButton">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="screenDrugResetButton" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->    
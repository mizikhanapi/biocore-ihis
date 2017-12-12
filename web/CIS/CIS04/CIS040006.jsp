<%-- 
    Document   : CIS040006
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : -D-
--%>
<!--Modal add Procedure-->
<div class="modal fade" id="CIS040006" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Procedure Form</h3>
            </div>
            <div class="modal-header" style="padding: 0px;">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active" id="POS_NEW">
                            <a href="#procedureOrder1" data-toggle="tab">
                                New Procedure Order</a>
                        </li>
                        <li id="POS_History" >
                            <a href="#procedureOrder2" data-toggle="tab">
                                Procedure Order History</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="tabbable-panel">
                    <div class="tabbable-line">
                        <!-- tab content -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="procedureOrder1">
                                <div class="form-group">
                                    <input type="hidden" name="POS" id="codePOS" class="form-control input-lg" tabindex="4">
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Problem</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="hidden"  id="problemCodePOS" placeholder="">
                                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOEPOSProblemName" placeholder="(Optional) Search Problem Name..." tabindex="4">
                                                <div id="tCISOEPOSProblemNameLoading" ></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Procedure</label>
                                            <input class="form-control input-lg" type="hidden"  id="tCISOEPOS_0_ID">
                                            <input class="form-control input-lg" type="text" name="tCISOEPOSSearch"  id="tCISOEPOSSearch" placeholder="Search Procedure Name..." tabindex="4">
                                            <div id="tCISOEPOSSearchLoading" ></div>
                                            <!--                                    <input class="form-control input-lg" type="text" name="problem"  id="Problem18" placeholder="Search Procedure..." tabindex="4">-->
                                            <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailPOS" placeholder="">
                                            <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailPOS" placeholder="">
                                            <input class="form-control input-lg" type="hidden"  id="hfcIdPOS">
                                            <div id="match18"></div>
                                        </div>
                                        <div class="form-group" id="div_CIS_OE_POS_LVL1">
                                            <input class="form-control input-lg" type="hidden"  id="tCISOEPOS_1_ID">
                                            <input class="form-control input-lg" type="text" name="tCISOEPOSSearch"  id="tCISOEPOS1Search" placeholder="Search Procedure Name..." tabindex="4">
                                            <div id="tCISOEPOS1SearchLoading" ></div>
                                        </div>
                                        <div class="form-group"  id="div_CIS_OE_POS_LVL2">
                                            <input class="form-control input-lg" type="hidden"  id="tCISOEPOS_2_ID">
                                            <input class="form-control input-lg" type="text" name="tCISOEPOSSearch"  id="tCISOEPOS2Search" placeholder="Search Procedure Name..." tabindex="4">
                                            <div id="tCISOEPOS2SearchLoading" ></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Appointment</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text"  id="appointmentPOS" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Patient Condition</label>
                                            <div class="col-md-12">
                                                <select id="patientConditionPOScd" class="form-control input-lg">
                                                    <option disabled="">Please select condition..</option>
                                                    <%
                                                        if (dataPatientCondition.size() > 0) {
                                                            for (int i = 0; i < dataPatientCondition.size(); i++) {
                                                    %>
                                                    <option value="<%out.print(dataPatientCondition.get(i).get(0));%>"><%out.print(dataPatientCondition.get(i).get(1));%></option>
                                                    <%
                                                            }
                                                        }%>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Priority</label>
                                            <div class="col-md-12">
                                                <select id="priorityPOScd" class="form-control input-lg">
                                                    <option disabled="">Please select condition..</option>
                                                    <%
                                                        if (dataPriority.size() > 0) {
                                                            for (int i = 0; i < dataPriority.size(); i++) {
                                                    %>
                                                    <option value="<%out.print(dataPriority.get(i).get(0));%>"><%out.print(dataPriority.get(i).get(1));%></option>
                                                    <%
                                                            }
                                                        }%>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">

                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Comments</h4>
                                            <textarea type="text" name="display_name" id="tCIS_POSCommentArea" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <input class="form-control input-lg" type="hidden" name="procedure_cd" id="procedure_cd">
                                </div>
                                <div class="form-group">
                                    <input  type="hidden" name="ProCode" id="ProCode">
                                </div>

                                <div class="text-right" role="group">
                                    <button type="button" id="btnCIS_OE_POS_CANCEL" class="btn btn-link" role="button">Cancel</button>
                                    <button type="button" id="btnCIS_OE_POS_UPDATE" class="btn btn-default" role="button">Update</button>
                                    <button type="button" id="btnCIS_OE_POS_ADD" class="btn btn-primary " role="button">Add</button>
                                </div>
                                                        
                            </div>
                            <hr>
                            <div class="tab-pane" id="procedureOrder2">
                                <form class="form-horizontal" name="myForm" id="myForm">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Search drug by</label>
                                        <div class="col-md-4">
                                            <select id="selectCIS_OE_POS_SEARCH_TYPE" name="idType" class="form-control" required="">
                                                <option selected="" disabled="" value="-">View by</option>
                                                <option value="today">Today</option>
                                                <option value="previous">Previous Episode</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Order</label>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control input-md" id="tCIS_OE_POS_SEARCH_ORDER_ID" name="idInput" placeholder="Order ID">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-primary" type="button" id="btnCIS_OE_POS_SEARCH_ORDER" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>
                                        <button id="btnCIS_OE_POS_SEARCH_CLEAR" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
                                    </div>
                                </form>
                                <br/>
                                <div id="divCIS_OE_POS_OrderSearchResult"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered table-striped">
                    <thead id="tableOrderPOS">
                        <tr>
                            <td>Problem Name</td>
                            <td>Procedure Name</td>

                            <td>Comment</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableOrderDTO">

                    </tbody>
                </table>

            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_OE_POS_SUBMIT" role="button">Submit Orders</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End add Procedure-->

<script src="jsFunction/CIS040006.js?v=1" type="text/javascript"></script>
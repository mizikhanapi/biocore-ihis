<%-- 
    Document   : CIS040006
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : -D-
--%>
<!--Modal add Procedure-->
<div class="modal fade" id="CIS040011" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Surgical Procedure Order</h3>
            </div>
            <div class="modal-header" style="padding: 0px;">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active" id="POSSurgical_NEW">
                            <a href="#surgicalProcedure1" data-toggle="tab">
                                New Procedure Order</a>
                        </li>
                        <li id="POSSurgical_History" >
                            <a href="#surgicalProcedure2" data-toggle="tab">
                                Drug Procedure History</a>
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
                            <div class="tab-pane active" id="surgicalProcedure1">
                                <div class="form-group">
                                    <input type="hidden" name="POS" id="codePOS" class="form-control input-lg" tabindex="4">
                                </div>
                                <div class="row">                 
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Category</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="hidden"  id="tCISOESPOCategoryCode" placeholder="">
                                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOESPOCategoryName" placeholder="Search Surgical Category..." tabindex="4" data-search-by-word="true">
                                                
                                                <div id="tCISOESPOCategoryNameLoading" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Procedure</label>
                                            <input class="form-control input-lg" type="hidden"  id="tCISOESPOSearch_Code">
                                            <input class="form-control input-lg" type="text" name="tCISOESPOSearch"  id="tCISOESPOSearch" placeholder="Search Surgical Procedure..." tabindex="4" data-search-by-word="true">
                                            <div id="tCISOESPOSearchLoading" ></div>
                                            <!--                                    <input class="form-control input-lg" type="text" name="problem"  id="Problem18" placeholder="Search Procedure..." tabindex="4">-->
                                            <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailSPO" placeholder="">
                                            <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailSPO" placeholder="">
                                        </div>

                                    </div>
                                </div>
                                <div class="row">                 
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Consultant Name</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="hidden"  id="tCISOESPOConsultantCode" placeholder="">
                                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOESPOConsultantName" placeholder="Search Consultant..." tabindex="4" data-search-by-word="true">

                                                <div id="tCISOESPOConsultantNameLoading" ></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">OT Room</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="hidden"  id="tCISOESPOOTRoomCode" placeholder="">
                                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOESPOOTRoomName" placeholder="Search OT Room..." tabindex="4" data-search-by-word="true">

                                                <div id="tCISOESPOOTRoomNameLoading" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label class="col-md-6 control-label" for="textinput">Start Date</label>
                                                <label class="col-md-6 control-label" for="textinput">Start Time</label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="col-md-6">

                                                    <input class="form-control input-lg CIS-OE-SPO-DATE" type="text" name="problem"  id="tCISOESPOStartDate" placeholder="Date" tabindex="4" >

                                                </div>
                                                <div class="col-md-6">

                                                    <input class="form-control input-lg CIS-OE-SPO-TIME" type="text" name="problem"  id="tCISOESPOStartTime" placeholder="Time" tabindex="4" >

                                                </div>
                                            </div>
                                            

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label class="col-md-6 control-label" for="textinput">Expected End Date</label>
                                                <label class="col-md-6 control-label" for="textinput">End Time</label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="col-md-6">

                                                    <input class="form-control input-lg CIS-OE-SPO-DATE" type="text" name="problem"  id="tCISOESPOENDDate" placeholder="Date" tabindex="4" data-search-by-word="true">

                                                </div>
                                                <div class="col-md-6">

                                                    <input class="form-control input-lg CIS-OE-SPO-TIME" type="text" name="problem"  id="tCISOESPOEndTime" placeholder="Time" tabindex="4" data-search-by-word="true">

                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">

                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Comments</h4>
                                            <textarea type="text" name="display_name" id="tCIS_POSSurgicalCommentArea" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
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
                                    <button type="button" id="btnCIS_OE_POSSurgical_CANCEL" class="btn btn-link" role="button">Cancel</button>
                                    <button type="button" id="btnCIS_OE_POSSurgical_UPDATE" class="btn btn-default" role="button">Update</button>
                                    <button type="button" id="btnCIS_OE_POSSurgical_ADD" class="btn btn-primary " role="button">Add</button>
                                </div>
                                                        
                            </div>
                            <hr>
                            <div class="tab-pane" id="surgicalProcedure2">
                                <form class="form-horizontal" name="myForm" id="myForm">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Search drug by</label>
                                        <div class="col-md-4">
                                            <select id="selectCIS_OE_POSSurgical_SEARCH_TYPE" name="idType" class="form-control" required="">
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
                                            <input type="text" class="form-control input-md" id="tCIS_OE_POSSurgical_SEARCH_ORDER_ID" name="idInput" placeholder="Order ID">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-primary" type="button" id="btnCIS_OE_POSSurgical_SEARCH_ORDER" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>
                                        <button id="btnCIS_OE_POS_SEARCH_CLEAR" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
                                    </div>
                                </form>
                                <br/>
                                <div id="divCIS_OE_POSSurgical_OrderSearchResult"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                <table class="table table-bordered table-striped table-guling col-md-12" >
                    <thead id="tableOrderPOSSurgical">
                        <tr>
                           
                            <td class="col-md-2">Category</td>
                            <td class="col-md-2">Procedure</td>
                            <td class="col-md-2">OT Room</td>
                          
                            <td class="col-md-2">Start Date Time</td>
                            <td class="col-md-2">End Date Time</td>
                            <td class="col-md-2">Consultant</td>
                            <td class="col-md-2">Comment</td>
                            <td class="col-md-2">Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableOrderPOSSurgical">

                    </tbody>
                </table>

            </div> 
                </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_OE_POSSurgical_SUBMIT" role="button">Submit Orders</button>
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

<script src="jsFunction/CIS040011.js" type="text/javascript"></script>
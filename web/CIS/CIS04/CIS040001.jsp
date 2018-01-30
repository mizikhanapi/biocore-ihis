<%-- 
    Document   : CIS040002
    Created on : Feb 18, 2017, 12:06:44 PM
    Author     : -D-
--%>
<style>
    #CIS040001 { overflow-y:scroll }
</style>
<!--Modal add Drug Order-->
<div class="modal fade" id="CIS040001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Laboratory Request Form</h3>
            </div>
            <div class="modal-header" style="padding: 0px;">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active" id="LIO_NEW">
                            <a href="#laboratoryRequest1" data-toggle="tab">
                                New Laboratory Request</a>
                        </li>
                        <li id="LIO_History" >
                            <a href="#laboratoryRequest2" data-toggle="tab">
                                Laboratory Request History</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-body">

                <div class="tabbable-panel">
                    <div class="tabbable-line">
                        <!-- tab content -->
                        <div class="tab-content">
                            <!-- Tab 1 -->
                            <div class="tab-pane active" id="laboratoryRequest1">

                                <!-- content goes here -->

                                <div class="row">
                                    <h4 class="modal-title" style="font-weight: bold">Service Provider</h4>    
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Health Facility</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text"  id="tCISOELIOHFC" placeholder="Type to search..." data-relatives='#chained_relative' data-chained-relatives='true' data-search-by-word="true">
                                                <div id="tCISOELIOHFCSearchLoading" ></div>
                                                <!--                                                <input class="form-control input-lg" type="text"  id="hfcLOS" placeholder="">-->
                                                <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailLIO" placeholder="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailLIO" placeholder="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcIdLOS">
                                                <div id="matchHFCLOS" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <!-- content goes here -->
                                        <div class="form-group">
                                            <input type="hidden" name="POS" id="codeROS" class="form-control input-lg"  tabindex="4">
                                            <label class="col-md-6 control-label" for="textinput">Search Problem</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOELIOProblemName" placeholder="(Optional) Search Problem Name..." tabindex="4" data-search-by-word="true">
                                                <div id="tCISOELIOProblemNameLoading" ></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Laboratory Request</label>
                                            <div class="col-md-12">
                                                <input type="hidden" name="problemCodeLIO" id="problemCodeLIO" class="form-control input-lg"  tabindex="4">
                                                <input type="hidden" name="LOS" id="jsonId" class="form-control input-lg"  tabindex="4">
                                                <input type='text'
                                                       placeholder='Search Laboratory request...'
                                                       class='form-control input-lg flexdatalist'
                                                       id='tCISOELIOSearch' 
                                                       data-search-in='name'
                                                       data-visible-properties='["name","source"]'
                                                       data-selection-required='true'
                                                       data-min-length='1'
                                                       name='country_name_capital_continent' data-search-by-word="true">

                                                <div id="tCISOELIOSearchLoading" ></div>
                                                <input class="form-control input-lg" type="hidden" name="problem"  id="searchLOS" placeholder="Search Laboratory request..." tabindex="4" data-search-by-word="true">
                                                <input class="form-control input-lg" type="hidden" name="dtoCode"  id="codeLOS" placeholder="Drug Code..." tabindex="4" readonly="">
                                                <div id="matchLOS" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <h4 class="modal-title" style="font-weight: bold">Item Details </h4>    
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Analyte</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="pro" id="catLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Specimen Source</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="qty" id="sourceLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Specimen Container</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="d_strength" id="containerLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Volume Required</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="dose" id="volumeLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Special Instruction</label>
                                            <div class="col-md-12">
                                                <input type="text" name="display_name" id="spclLOS" class="form-control input-lg" placeholder="" tabindex="3" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr/>
                                <div class="row">

                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Appointment</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text"  id="appointmentLOS" placeholder="DD-MM-YYYY">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Patient Condition</label>
                                            <div class="col-md-12">
                                                <select id="patientConditionLOScd" class="form-control input-lg">
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
                                                <select id="priorityLOScd" class="form-control input-lg">
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
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Comments</label>
                                            <div class="col-md-12">
                                                <textarea type="text" name="display_name" id="commentLOS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-right" role="group">
                                    <button type="button" id="btnCIS_OE_LIO_CANCEL" class="btn btn-info" role="button">Cancel</button>
                                    <button type="button" id="btnCIS_OE_LIO_UPDATE" class="btn btn-default " role="button">Update</button>
                                    <button type="button" id="btnCIS_OE_LIO_ADD" class="btn btn-primary" role="button">Add</button>
                                </div>

                            </div>
                            <!-- Tab 1 -->    

                            <!-- Tab 2 -->
                            <div class="tab-pane" id="laboratoryRequest2">
                                <form class="form-horizontal" name="myForm" id="myForm">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Search order by</label>
                                        <div class="col-md-4">
                                            <select id="selectCIS_OE_LIO_SEARCH_TYPE" name="idType" class="form-control" required="">
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
                                            <input type="text" class="form-control input-md" id="tCIS_OE_LIO_SEARCH_ORDER_ID" name="idInput" placeholder="ID" >
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-primary" type="button" id="btnCIS_OE_LIO_SEARCH_ORDER" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>
                                        <button id="btnCIS_OE_LIO_SEARCH_CLEAR" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
                                    </div>
                                </form>
                                <br/>
                                <div id="divCIS_OE_LIO_OrderSearchResult"></div>
                            </div>
                            <!-- Tab 2 -->

                        </div>
                    </div>
                </div>

                <hr/>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>Test Name</td>
                            <td>S.Source</td>
                            <td>S.Container</td>
                            <td>Volume</td>
                            <td>Comment</td>
                            <td>A.Date</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableOrderLIO">

                    </tbody>
                </table>
            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_OE_LIO_SUBMIT" role="button">Submit Orders</button>
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

<div class="modal fade" id="CIS040001_RESULT" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Result Image</h3>
            </div>
            <div class="modal-body">
                <div class="form-group" id="">
                    <img src="" id="CIS040001_RESULT_IMG" alt="Exam Result" class="img-responsive" style="height: 100%; width: 100%">
                </div>

            </div>   
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!--End add Drug Order-->

<script src="jsFunction/CIS040001.js" type="text/javascript"></script>

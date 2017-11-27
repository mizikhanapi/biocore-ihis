<%-- 
    Document   : CIS040002
    Created on : Feb 18, 2017, 12:06:44 PM
    Author     : -D-
--%>
<!--Modal add Drug Order-->
<div class="modal fade" id="CIS040002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" >
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Drug Order Form</h3>
            </div>
            <div class="modal-header" style="padding: 0px;">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active" id="DTO_NEW">
                            <a href="#drugOrder1" data-toggle="tab">
                                New Drug Order</a>
                        </li>
                        <li id="DTO_History" >
                            <a href="#drugOrder2" data-toggle="tab">
                                Drug Order History</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-body">

                <div class="tabbable-panel">
                    <div class="tabbable-line">
                        <!-- tab content -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="drugOrder1">
                                <!-- content goes here -->
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Problem</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="hidden"  id="problemCodeDTO" placeholder="">
                                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOEDTOProblemName" placeholder="(Optional) Search Problem Name..." tabindex="4" data-search-by-word="true">
                                                <div id="tCISOEDTOProblemNameLoading" ></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Drug</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="problem"  id="tCISOEDTODrugName" placeholder="Search Drug Name..." tabindex="4" data-search-by-word="true">
                                                <div id="tCISOEDTODrugNameLoading" ></div>
                                                <input type="hidden" name="DTO" id="jsonId" class="form-control input-lg"  tabindex="4">
                                                <!--                                                <input class="form-control input-lg" type="text" name="problem"  id="tCIS_DTODrugName" placeholder="Type to search..." tabindex="4" data-search-by-word="true">-->
                                                <input class="form-control input-lg" type="hidden" name="dtoCode"  id="tCIS_DTODrugCode" placeholder="Drug Code..." tabindex="4" readonly="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcDTO" placeholder="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailDTO" placeholder="s">
                                                <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailDTO" placeholder="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcIdDTO">
                                                <div id="matchDTO" style="width: 100%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr/>

                                <div class="row">
                                    <h4 class="modal-title" style="font-weight: bold">Drug Details</h4>
                                </div>

                                <div class="row">
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Drug Form</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <div class="form-group">
                                            <input class="form-control input-lg" type="text" name="d_strength" id="tCIS_DTODrugForm" placeholder="" readonly="">

                                        </div>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Route</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <div class="form-group ">
                                            <input class="form-control input-lg" type="text" name="qty" id="tCIS_DTODrugRoute" placeholder="" readonly="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Cautionary</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <div class="form-group">
                                            <input class="form-control input-lg" type="text" name="cautionary" id="tCIS_DTODrugCaution" placeholder="" readonly="">
                                        </div>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Drug Frequency</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <div class="form-group">
                                            <input class="form-control input-lg" type="text" name="d_strength" id="tCIS_DTODrugFrequencyDetail" placeholder="" readonly="">
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <h4 class="modal-title" style="font-weight: bold">Order Drug Details</h4>
                                </div>
                                <div class="row">

                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Drug Strength</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <input class="form-control input-lg" type="text" name="dose" id="tCIS_DTODrugStrength" placeholder="" disabled="">
                                        </div>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <select name="site" id="tCIS_DTODrugStrengthUnit" class="form-control input-lg">
                                                <option disabled="">Unit</option>
                                                <option value="">-</option>
                                                <option value="ml">milliliter</option>
                                                <option value="mg">milligram</option>  

                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Dosage</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1 " style="padding: 0px;">
                                        <div class="form-group">
                                            <input class="form-control input-lg" type="number" name="dose" id="tCIS_DTODrugDose" step="0.01" placeholder="" >
                                            
                                        </div>
                                    </div>
                                    <div class="col-xs-1 col-sm-1 col-md-1"  style="padding: 0px;">
                                        <div class="form-group">
                                            
                                            <input class="form-control input-lg" type="text" name="dose" id="tCIS_DTODrugDoseType" placeholder="" disabled="">
                                        </div>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <select name="site" id="tCIS_DTODrugDoseUnit" class="form-control input-lg">
                                                <option disabled="">Unit</option>
                                                <option value="" >-</option>
                                                <option value="tab">tab</option>
                                                <option value="cap">cap</option>  

                                            </select>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Duration</h4>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-2 col-sm-2 col-md-2">
                                            <div class="form-group">
                                                <input class="form-control input-lg" type="number" name="durationDTO" id="tCIS_DTODrugDuration" placeholder=""  onchange="calculateQuantity()">
                                            </div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2 col-md-2">
                                            <div class="form-group">
                                                <select name="site" id="tCIS_DTODrugUnit" class="form-control input-lg" onchange="calculateQuantity()">
                                                    <option value="" disabled="">Duration</option>
                                                      <option >-</option>
                                                    <option value="Day">Day</option>
                                                    <option value="Week">Week</option>
                                                    <option value="Month">Month</option>     
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Drug Frequency</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <div class="form-group">
                                            <div id="divSelectDrugFrequency">
                                                
                                            </div>
<!--                                            <select name="site" id="tCIS_DTODrugFrequency" class="form-control input-lg">
                                                <option value="-" selected="">Select Here</option>
                                                <option value="Once">Once</option>
                                                <option value="In the morning">In the morning</option>
                                                <option value="At night">At night</option>
                                                <option value="Daily">Daily</option>
                                                <option value="Twice a day">Twice a day</option>
                                                <option value="3 times a day">3 times a day</option>
                                                <option value="4 times a day">4 times a day</option>
                                                <option value="2 hourly">2 hourly</option>
                                                <option value="4 hourly">4 hourly</option>
                                                <option value="6 hourly">6 hourly</option>
                                                <option value="8 hourly">8 hourly</option>
                                                <option value="Immediately">Immediately</option>
                                                <option value="As needed">As needed</option>     
                                            </select>-->
                                        </div>
                                    </div>
                                </div>

                                <div class="row">


                                    <!--                    <div class="col-xs-4 col-sm-4 col-md-4">
                                                            <div class="form-group">
                                                                <select name="inst" id="drugInstructionDTO" class="form-control input-lg">
                                                                    <option value="1" selected="" disabled="">Select Here</option>
                                                                    <option value="If required">If required</option>
                                                                    <option value="As directed">As directed</option>
                                                                    <option value="Before meats">Before meats</option>
                                                                    <option value="Every second day">Every second day</option>
                                                                    <option value="Left side">Left side</option>
                                                                    <option value="Right side">Right side</option>
                                                                    <option value="To both side">To both sides</option>
                                                                    <option value="Other">Other</option> 
                                                                </select>
                                                            </div>
                                                        </div>-->

                                </div>
                                <div class="row">
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Quantity</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <div class="form-group">
                                            <input class="form-control input-lg" type="number" name="dose" id="tCIS_DTOQuantity" placeholder="" >
                                        </div>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Remarks</h4>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                        <div class="form-group">
                                            <input class="form-control input-lg" type="text" name="tCIS_DTORemark" id="tCIS_DTORemark" placeholder="" >
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <h4 class="modal-title modalTextLabel">Comments</h4>
                                            <textarea type="text" name="display_name" id="tCIS_DTOCommentArea" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="text-right" role="group">
                                    <button type="button" id="btnCIS_OE_DTO_CANCEL" class="btn btn-link " role="button">Cancel</button>
                                    <button type="button" id="btnCIS_OE_DTO_UPDATE" class="btn btn-default" role="button">Update</button>
                                    <button type="button" id="btnCIS_OE_DTO_ADD" class="btn btn-primary" role="button">Add</button>
                                </div>

                            </div>
                            <div class="tab-pane" id="drugOrder2">
                                <form class="form-horizontal" name="myForm" id="myForm">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Search drug by</label>
                                        <div class="col-md-4">
                                            <select id="selectCIS_OE_DTO_SEARCH_TYPE" name="idType" class="form-control" required="">
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
                                            <input type="text" class="form-control input-md" id="tCIS_OE_DTO_SEARCH_ORDER_ID" name="idInput" placeholder="ID">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-primary" type="button" id="btnCIS_OE_DTO_SEARCH_ORDER" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>
                                        <button id="btnCIS_OE_DTO_SEARCH_CLEAR" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
                                    </div>
                                </form>
                                <div id="divCIS_OE_DTO_OrderSearchResult"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <hr/>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>D.Name</td>
                            <td>D.Strength</td>
                            <td>D.Frequency</td>
                            <td>D.Duration</td>
                            <td>Order Qty</td>
                            <td>Remark</td>
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
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_OE_DTO_SUBMIT" role="button">Submit</button>
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

<!--End add Drug Order-->
<!--
Modal update Drug Order
<div class="modal fade" id="update_CIS040002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%; height: 100%">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Drug Order</h3>
            </div>
            <div class="modal-body">
                 content goes here 
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Search Drug</label>
                            <div class="col-md-12">
                                <input type="hidden" name="DTO" id="jsonId" class="form-control input-lg"  tabindex="4">
                                <input class="form-control input-lg" type="text" name="problem"  id="tCIS_DTODrugName_update" placeholder="Type to search..." tabindex="4">
                                <input class="form-control input-lg" type="hidden" name="dtoCode"  id="tCIS_DTODrugCode_update" placeholder="Drug Code..." tabindex="4" readonly="">
                                <input class="form-control input-lg" type="hidden"  id="hfcDTO_update" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailDTO_update" placeholder="s">
                                <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailDTO_update" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="hfcIdDTO_update">
                                <div id="matchDTO" style="width: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr/>

                <div class="row">
                    <h4 class="modal-title" style="font-weight: bold">Drug Details</h4>
                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Drug Form</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="d_strength" id="tCIS_DTODrugForm_update" placeholder="" readonly="">

                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Route</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group ">
                            <input class="form-control input-lg" type="text" name="qty" id="tCIS_DTODrugRoute_update" placeholder="" readonly="">
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Cautionary</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="cautionary" id="tCIS_DTODrugCaution_update" placeholder="" readonly="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Drug Frequency</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="d_strength" id="tCIS_DTODrugFrequencyDetail_update" placeholder="" readonly="">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <h4 class="modal-title" style="font-weight: bold">Order Drug Details</h4>
                </div>
                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Drug Strength</h4>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="dose" id="tCIS_DTODrugStrength_update" placeholder="" >
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <select name="site" id="tCIS_DTODrugStrengthUnit_update" class="form-control input-lg">
                                <option value="" disabled="" >Unit</option>
                                <option value="ml">milliliter</option>
                                <option value="mg">milligram</option>  

                            </select>
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Dosage</h4>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="dose" id="tCIS_DTODrugDose_update" placeholder="" >
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <select name="site" id="tCIS_DTODrugDoseUnit_update" class="form-control input-lg">
                                <option value="" disabled="" >Unit</option>
                                <option value="tab">tab</option>
                                <option value="ml">ml</option>
                                <option value="cap">cap</option>  
                                <option value="mg">mg</option>  
                            </select>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Duration</h4>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group">
                                <input class="form-control input-lg" type="number" name="durationDTO" id="tCIS_DTODrugDuration_update" placeholder="" >
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group">
                                <select name="site" id="tCIS_DTODrugUnit_update" class="form-control input-lg">
                                    <option value="" disabled="" >Select Here</option>
                                    <option value="day">Day</option>
                                    <option value="week">Week</option>
                                    <option value="month">Month</option>     
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Drug Frequency</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <select name="site" id="tCIS_DTODrugFrequency_update" class="form-control input-lg">
                                <option value="1" selected="" disabled="">Select Here</option>
                                <option value="Once">Once</option>
                                <option value="In the morning">In the morning</option>
                                <option value="At night">At night</option>
                                <option value="Daily">Daily</option>
                                <option value="Twice a day">Twice a day</option>
                                <option value="3 times a day">3 times a day</option>
                                <option value="4 times a day">4 times a day</option>
                                <option value="2 hourly">2 hourly</option>
                                <option value="4 hourly">4 hourly</option>
                                <option value="6 hourly">6 hourly</option>
                                <option value="8 hourly">8 hourly</option>
                                <option value="Immediately">Immediately</option>
                                <option value="As needed">As needed</option>     
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">


                                        <div class="col-xs-4 col-sm-4 col-md-4">
                                            <div class="form-group">
                                                <select name="inst" id="drugInstructionDTO" class="form-control input-lg">
                                                    <option value="1" selected="" disabled="">Select Here</option>
                                                    <option value="If required">If required</option>
                                                    <option value="As directed">As directed</option>
                                                    <option value="Before meats">Before meats</option>
                                                    <option value="Every second day">Every second day</option>
                                                    <option value="Left side">Left side</option>
                                                    <option value="Right side">Right side</option>
                                                    <option value="To both side">To both sides</option>
                                                    <option value="Other">Other</option> 
                                                </select>
                                            </div>
                                        </div>

                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Quantity</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="number" name="dose" id="tCIS_DTOQuantity_update" placeholder="" >
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Remarks</h4>
                            <input class="form-control input-lg" type="text" name="tCIS_DTORemark" id="tCIS_DTORemark_update" placeholder="" >
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="tCIS_DTOComment_update" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnDTO" role="button">Update</button>
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
</div>-->
<script src="jsFunction/CIS040002.js" type="text/javascript"></script>
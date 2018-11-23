<%-- 
    Document   : fast-modal
    Created on : Nov 21, 2018, 2:36:09 AM
    Author     : user
--%>

<!-- Modal -->
<div class="modal fade" id="squarespaceModal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg" style="/* width:80%; */">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title" id="lineModalLabel">New Visit Notes</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="panel-group" id="accordion1">
                    <div class="panel panel-default">

                        <div class="panel-heading accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1,#accordion2,#accordion3" data-target="#collapseOne1" aria-expanded="false">
                            <h4 class="panel-title">Chief Complaint</h4>
                        </div>

                        <div id="collapseOne1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                            <div class="panel-body">
                                <form>
                                    <div class="form-group">
                                        <input type="hidden" name="ccn" id="codeCCN" class="form-control input-lg" value="CCN" tabindex="4">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Search From : </label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType" value="P">Personalised</label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType" value="CT" checked="">Common Term</label>
                                            <input class="form-control input-lg" type="hidden" name="tCISSUBCCNCodeType" id="tCISSUBCCNCodeType" value="CCN" tabindex="4" readonly="">

                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <label>Symptoms</label>
                                            <div class="form-group">
                                                <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearch" placeholder="Type to search Common Term..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <div id="tCISSubCCNHFCSearchLoading" ></div>
                                                <input class="form-control input-lg" type="hidden" name="problem"  id="problem" placeholder="Please Type Chief Complaint" tabindex="4">
                                                <div id="match50"></div>
                                            </div>
                                            <div class="form-group" style="">
                                                <input class="form-control input-lg" type="hidden" name="ccnCode" id="ccnCode" tabindex="4" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Duration</label>
                                            <div class="form-group">
                                                <input class="form-control input-lg" max="999" type="number" name="dur" id="duration" placeholder="0" autocomplete="off">
                                            </div>
                                        </div><div class="col-md-2">
                                            <label>Unit</label>
                                            <div class="form-group">
                                                <select name="lat" id="sdur" class="form-control input-lg" autocomplete="off">
                                                    <option value="" selected="">Select One</option>
                                                    <option value="Minutes">Minutes</option>
                                                    <option value="Hour">Hour</option>
                                                    <option value="Day">Day</option>
                                                    <option value="Week">Week</option>
                                                    <option value="Month">Month</option>
                                                    <option value="Year">Year</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Severity</label>
                                            <div class="form-group" id="Mild">
                                                <label class="radio-inline"><input type="radio" id="Mild" name="ccnradioseverity" value="Mild" checked>Mild</label>
                                                <label class="radio-inline"><input type="radio" id="Mild" name="ccnradioseverity" value="Moderate">Moderate</label>
                                                <label class="radio-inline"><input type="radio" id="Mild" name="ccnradioseverity" value="Severe">Severe</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Site</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="Site" name="ccnradiosite" value="Right" checked>Right</label>
                                                <label class="radio-inline"><input type="radio" id="Site" name="ccnradiosite" value="Left">Left</label>
                                            </div>
                                        </div>


                                        <div class="col-md-4">
                                            <label>Laterality</label><div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="Laterality" name="ccnradiolatera" value="Right" checked>Right</label>
                                                <label class="radio-inline"><input type="radio" id="Laterality" name="ccnradiolatera" value="Left">Left</label>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <textarea type="text" name="display_name" id="Comment" class="form-control input-lg" placeholder="Notes.." tabindex="3" autocomplete="off"></textarea> 
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="text-right"><button class="btn btn-primary" id="btnCISSubCCNAddPersonalised" style="padding-left: 10px;"><i class="fa fa-star" aria-hidden="true"></i>&nbsp; Add to personalized</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success" id="acceptBtn" role="button" autocomplete="off">Add Symtoms</button></div><br>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1,#accordion2,#accordion3" data-target="#collapseTwo1" aria-expanded="false">
                            <h4 class="panel-title">Check Vital</h4>

                        </div>
                        <div id="collapseTwo1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Height</label>
                                                <div class="form-group">

                                                    <input type="number" name="bmiHeight" id="bmiHeight" class="form-control input-lg BP-class" placeholder="0" tabindex="4" min="0" max="300" step="1">
                                                </div>
                                                <div class="form-group slider">
                                                    <div id="bmiHeightSlider" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"><span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 28.75%;"></span></div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <label>Weight</label>
                                                <div class="form-group">
                                                    <input type="number" name="bmiWeight" id="bmiWeight" class="form-control input-lg BP-class" placeholder="0" tabindex="4" min="0" max="300" step="1" autocomplete="off">
                                                </div>
                                                <div class="form-group slider">
                                                    <div id="bmiWeightSlider" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"><span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 40%;"></span></div>
                                                </div></div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <a class="btn btn-primary btn-block btn-lg calcBMI " id="calcBMI">Calculate BMI</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <h5>Calculated BMI</h5>
                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon2" style="
                                                  background-color: transparent;
                                                  border: none;
                                                  width: 140px;
                                                  ">Patient BMI is:</span>
                                            <input type="text" name="bmi" id="bmi" class="form-control input-lg " placeholder="0" tabindex="4" autocomplete="off">
                                        </div>

                                        <div class="input-group">
                                            <span class="input-group-addon" id="basic-addon2" style="
                                                  background-color: transparent;
                                                  border: none;
                                                  width: 140px;
                                                  ">Weight Status is:</span>
                                            <input type="text" name="bmiStatus" id="bmiStatus" class="form-control input-lg" placeholder="" tabindex="4" autocomplete="off">
                                        </div>

                                    </div>
                                </div>

                                <form role="form" id="BloodPressureForm">
                                    <input type="hidden" id="BPid">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h5>Blood Pressure</h5><div class="row">
                                                <div class="col-md-4">
                                                    <label>Systolic</label>
                                                    <div class="form-group">
                                                        <input type="number" name="sitS" id="sitS" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" min="0" max="300" step="1">
                                                    </div></div>
                                                <div class="col-md-4">
                                                    <label>Diastolic</label>
                                                    <div class="form-group">
                                                        <input type="number" name="sitD" id="sitD" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" min="0" max="300" step="1">
                                                    </div></div><div class="col-md-4">
                                                    <label>Pulse</label>
                                                    <div class="input-group">
                                                        <input type="number" name="sitP" id="sitP" class="form-control input-lg BP-class" placeholder="bpm" tabindex="4" min="0" max="300" step="1">

                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" type="button" id="btnCIS_O_VTS_BP_ACCEPT">ADD</button>
                                                        </span></div></div>
                                                <div class="col-md-3">
                                                    <label>&nbsp;</label>
                                                </div>
                                            </div>
                                        </div><div class="col-md-6">
                                            <h5>Respitatory Rate</h5><label> </label><div class="input-group">
                                                <input type="number" name="rrRate" id="rrRate" class="form-control input-lg rr-rate-input" placeholder="0" tabindex="4" min="0" max="300" step="1" autocomplete="off">

                                                <input type="hidden" id="RRid">

                                                <span class="input-group-addon" id="basic-addon2" style="
                                                      background-color: transparent;
                                                      border: none;
                                                      ">breaths / min</span><span class="input-group-btn">
                                                          <button class="btn btn-default" type="button" id="acceptRRBtn">ADD</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h5>Oxygen Saturation</h5><div class="input-group">
                                                <input type="number" min="0" max="99.9" step="0.1" name="OSat" id="OSat" class="form-control input-lg" placeholder="Oxygen Saturation" tabindex="4" autocomplete="off">
                                                <input type="hidden" name="idOS" id="idOS" class="form-control input-lg" tabindex="4">
                                                <span class="input-group-addon" id="basic-addon2" style="
                                                      background-color: transparent;
                                                      border: none;
                                                      ">%</span>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button" id="acceptOSBtn">ADD</button>
                                                </span>
                                            </div>
                                        </div><div class="col-md-6">
                                            <h5>Body Temperature °C</h5>

                                            <div class="input-group">
                                                <input type="number" id="BTemp" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" autocomplete="off">
                                                <input type="hidden" id="BTid" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" readonly="">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button" id="acceptBTBtn">ADD</button>
                                                </span>
                                            </div>
                                            <div class="form-group">
                                                <div id="slider" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"><div class="ui-slider-range ui-corner-all ui-widget-header ui-slider-range-min" style="width: 0%;"></div><span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;"></span></div>
                                            </div>
                                        </div>

                                    </div>





                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1,#accordion2,#accordion3" data-target="#collapseThree1" aria-expanded="false">
                            <h4 class="panel-title">Diagnosis</h4>
                        </div>
                        <div id="collapseThree1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                            <div class="panel-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Search From : </label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="P" >Personalised</label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="CT" checked="">Common Term</label>
                                            <input class="form-control input-lg" type="hidden" name="tCISSUBDGSCodeType"  id="tCISSUBDGSCodeType"  value="DGS" tabindex="4" readonly="">

                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <label>Search Diagnosis</label>
                                            <div class="form-group">
                                                <input type='text' id="tCISSubDGSSearch" placeholder='Type more than 3 character to search diagnosis...' class='form-control input-lg flexdatalist' data-min-length='1' name='country_name_suggestion' data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <input class="form-control input-lg" type="text"  id="tCISSubDGSSearchPersonalised" placeholder="Type to Search Diagnosis Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <div id="tCISSubDGSSearchLoading"></div>
                                                <input type="hidden" name="DGS" id="dgsCode" class="form-control input-lg"  tabindex="4">
                                                <input type="hidden" name="DGS" id="codeDGS" class="form-control input-lg" value="DGS" tabindex="4">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Diagnosis Date</label>
                                            <div class="form-group">
                                                <input class="form-control input-lg" type="text" name="date4" id="dateDGS" placeholder="DD/MM/YYYY" autocomplete="off"  placeholder="Diagnosis Date" readonly>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>Type</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="TypeDGS" name="TypeDGS" value="Final">Final</label>
                                                <label class="radio-inline"><input type="radio" id="TypeDGS" name="TypeDGS" value="Provision">Provision</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Severity</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="SeverityDGS" name="SeverityDGS" value="Mild">Mild</label>
                                                <label class="radio-inline"><input type="radio" id="SeverityDGS" name="SeverityDGS" value="Normal">Normal</label>
                                                <label class="radio-inline"><input type="radio" id="SeverityDGS" name="SeverityDGS" value="Acute">Acute</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Site</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="SiteDGS" name="SiteDGS" value="Right">Right</label>
                                                <label class="radio-inline"><input type="radio" id="SiteDGS" name="SiteDGS" value="Left">Left</label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Laterality</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="LateralityDGS" name="LateralityDGS" value="Right">Right</label>
                                                <label class="radio-inline"><input type="radio" id="LateralityDGS" name="LateralityDGS" value="Left">Left</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <textarea type="text" name="display_name" id="commentDGS" class="form-control input-lg" placeholder="Notes.." tabindex="3" autocomplete="off"></textarea> 
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="text-right">
                                    <button class="btn btn-primary" id="btnCISSubDGSAddPersonalised" style="padding-left: 10px;"><i class="fa fa-star" aria-hidden="true"></i>&nbsp; Add to personalized</button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-success" id="acceptBtnDGS" role="button" autocomplete="off">Add Symtoms</button>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="jsFunction/SearchClinicalTerm.js?v=1.1"></script>

<script src="jsFunction/CISF0101.js?v=1.4"></script>
<script src="jsFunction/CISF0202.js?v=1.4"></script>
<script src="jsFunction/CISF0303.js?v=1.4"></script>
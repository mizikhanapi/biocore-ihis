<%-- 
    Document   : fast-modal
    Created on : Nov 21, 2018, 2:36:09 AM
    Author     : user
--%>

<!-- Modal -->
<div class="modal fade" id="squarespaceModal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title" id="lineModalLabel">New Visit Notes</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="panel-group" id="accordion1">
                    <div class="panel panel-default">

                        <div class="panel-heading accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" data-target="#collapseOne1" aria-expanded="false" id="fastTrackAccordianMenuComplain" style="cursor: pointer;">
                            <h4 class="panel-title">Chief Complaint</h4>
                        </div>

                        <div id="collapseOne1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                            <div class="panel-body">

                                <form id="fastTrackChiefComplaintForm"> 
                                    <div class="form-group">
                                        <input type="hidden" name="ccn" id="codeCCN" class="form-control input-lg" value="CCN" tabindex="4">
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Search From : </label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType" value="P">Favourite Term</label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType" value="CT" checked="">All Term</label>
                                            <input class="form-control input-lg" type="hidden" name="tCISSUBCCNCodeType" id="tCISSUBCCNCodeType" value="CCN" tabindex="4" readonly="">

                                        </div>
                                    </div>                                   
                                    <hr>                                   
                                    <div class="row">
                                        <div class="col-md-8">
                                            <label>Symptoms</label>
                                            <div class="form-group">
                                                <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearch" placeholder="Type to search common term..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearchPersonalised" placeholder="Type to search favourite..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
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
                                                <label class="radio-inline"><input type="radio" id="Mild" name="ccnradioseverity" value="Mild">Mild</label>
                                                <label class="radio-inline"><input type="radio" id="Mild" name="ccnradioseverity" value="Moderate">Moderate</label>
                                                <label class="radio-inline"><input type="radio" id="Mild" name="ccnradioseverity" value="Severe">Severe</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Site</label>
                                            <div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="Site" name="ccnradiosite" value="Right">Right</label>
                                                <label class="radio-inline"><input type="radio" id="Site" name="ccnradiosite" value="Left">Left</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>Laterality</label><div class="form-group">
                                                <label class="radio-inline"><input type="radio" id="Laterality" name="ccnradiolatera" value="Right">Right</label>
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
                                <div class="text-right">
                                    <button class="btn btn-default" id="btnCISSubCCNAddPersonalised" style="padding-left: 10px;">
                                        <i class="fa fa-star" aria-hidden="true"></i>&nbsp; Add to personalized
                                    </button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-primary" id="acceptBtn" role="button">
                                        Add Symtoms
                                    </button>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="col-md-12" id="fastTrackChiefComplaintTableDIV" >
                                        <table class="table table-striped table-bordered" id="fastTrackChiefComplaintTable">
                                            <thead>
                                                <tr>
                                                    <th style="display: none;">JSON</th>
                                                    <th style="display: none;">Code</th>
                                                    <th>Symptoms</th>
                                                    <th>Duration</th>
                                                    <th>Severity</th>
                                                    <th>Site</th>
                                                    <th>Laterality</th>
                                                    <th>Notes</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id="fastTrackChiefComplaintTableIniialRecord">
                                                    <td colspan="7" align="center">Please Insert New Chief Complain</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" data-target="#collapseTwo1" aria-expanded="false" id="fastTrackAccordianMenuVital" style="cursor: pointer;">
                            <h4 class="panel-title">Check Vitals</h4>
                        </div>
                        <div id="collapseTwo1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                            <div class="panel-body">
                                <form id="fastTrackVitalSignForm"> 
                                    <div class="row">
                                        <div class="col-md-6">

                                            <div class="row">
                                                <div class="col-md-5">
                                                    <label>Height</label>
                                                    <div class="form-group">
                                                        <input type="number" name="bmiHeight" id="bmiHeight" class="form-control input-lg BP-class" placeholder="0" tabindex="4" min="0" max="300" step="1">
                                                    </div>
                                                    <div class="form-group slider">
                                                        <div id="bmiHeightSlider" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"><span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 28.75%;"></span></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <label>Weight</label>
                                                    <div class="form-group">
                                                        <input type="number" name="bmiWeight" id="bmiWeight" class="form-control input-lg BP-class" placeholder="0" tabindex="4" min="0" max="300" step="1" autocomplete="off">
                                                    </div>
                                                    <div class="form-group slider">
                                                        <div id="bmiWeightSlider" class="ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"><span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 40%;"></span></div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--                                            <div class="row">
                                                                                            <div class="col-md-12">
                                                                                                <a class="btn btn-primary btn-block calcBMI" id="calcBMI">Calculate BMI</a>
                                                                                            </div>
                                                                                        </div>-->
                                        </div>
                                        <div class="col-md-6">
                                            <h5>Calculated BMI</h5>
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;width: 140px;">
                                                    Patient BMI is:
                                                </span>
                                                <input type="text" name="bmi" id="bmi" class="form-control input-lg " placeholder="0" tabindex="4" autocomplete="off">
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;width: 140px;">
                                                    Weight Status is:
                                                </span>
                                                <input type="text" name="bmiStatus" id="bmiStatus" class="form-control input-lg" placeholder="" tabindex="4" autocomplete="off">
                                            </div>
                                            <div class="col-md-2 pull-right">
                                                <button type="button" class="btn btn-default"id="acceptOtherBtn" role="button" autocomplete="off">ADD</button>
                                            </div>
                                        </div>

                                        <div class="col-xs-2 col-sm-2 col-md-2 hidden">
                                            <div class="form-group">
                                                <h5>Head Circumference</h5></div>
                                        </div>
                                        <div class="col-xs-2 col-sm-2 col-md-2 hidden">
                                            <div class="form-group">

                                                <input type="number" name="headCir" id="headCir" class="form-control input-lg num-3-1" placeholder="cm" tabindex="4">
                                            </div>
                                        </div>
                                        <br>
                                    </div>

                                    <form role="form" id="BloodPressureForm">
                                        <input type="hidden" id="BPid">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row"></div>
                                                <h5>Blood Pressure</h5>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <label>Systolic</label>
                                                        <div class="form-group">
                                                            <input type="number" name="sitS" id="sitS" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" min="0" max="300" step="1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <label>Diastolic</label>
                                                        <div class="form-group">
                                                            <input type="number" name="sitD" id="sitD" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" min="0" max="300" step="1">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label>Pulse</label>
                                                        <div class="input-group">
                                                            <input type="number" name="sitP" id="sitP" class="form-control input-lg BP-class" placeholder="bpm" tabindex="4" min="0" max="300" step="1">
                                                            <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;">
                                                            </span>
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-default" type="button" id="btnCIS_O_VTS_BP_ACCEPT">ADD</button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h5>Respitatory Rate</h5>
                                                <div class="input-group">
                                                    <input type="number" name="rrRate" id="rrRate" class="form-control input-lg rr-rate-input" placeholder="0" tabindex="4" min="0" max="300" step="1" autocomplete="off">
                                                    <input type="hidden" id="RRid">
                                                    <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;">
                                                        breaths / min
                                                    </span>
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button" id="acceptRRBtn">ADD</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5>Oxygen Saturation</h5>
                                                <div class="input-group">
                                                    <input type="number" min="0" max="99.9" step="0.1" name="OSat" id="OSat" class="form-control input-lg" placeholder="Oxygen Saturation" tabindex="4" autocomplete="off">
                                                    <input type="hidden" name="idOS" id="idOS" class="form-control input-lg" tabindex="4">
                                                    <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;">
                                                        %
                                                    </span>
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button" id="acceptOSBtn">ADD</button>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <h5>Body Temperature °C</h5>
                                                <div class="input-group">
                                                    <input type="number" id="BTemp" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" autocomplete="off">
                                                    <input type="hidden" id="BTid" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" readonly="">
                                                    <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;">
                                                    </span>
                                                    <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;">
                                                    </span>
                                                    <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;">
                                                    </span>
                                                    <span class="input-group-addon" id="basic-addon2" style="background-color: transparent;border: none;">
                                                    </span>
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
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" data-target="#collapseThree1" aria-expanded="false" id="fastTrackAccordianMenuDiagnosis" style="cursor: pointer;">
                            <h4 class="panel-title">Diagnosis</h4>
                        </div>
                        <div id="collapseThree1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                            <div class="panel-body">
                                <form id="fastTrackDiagnosisForm">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label>Search From : </label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="P" >Favourite Term</label>
                                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType" value="CT" checked="">All Term</label>
                                            <input class="form-control input-lg" type="hidden" name="tCISSUBDGSCodeType"  id="tCISSUBDGSCodeType"  value="DGS" tabindex="4" readonly="">

                                        </div>
                                    </div>

                                    <hr>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <label>Search Diagnosis</label>
                                            <div class="form-group">
                                                <input type='text' id="tCISSubDGSSearch" placeholder='Type more than 3 character to search diagnosis...' class='form-control input-lg flexdatalist' data-min-length='1' name='country_name_suggestion' data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                                <input class="form-control input-lg" type="text"  id="tCISSubDGSSearchPersonalised" placeholder="Type to search favourite diagnosis..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
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
                                    <button class="btn btn-default" id="btnCISSubDGSAddPersonalised" style="padding-left: 10px;"><i class="fa fa-star" aria-hidden="true"></i>&nbsp; Add to personalized</button>
                                    &nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-primary" id="acceptBtnDGS" role="button">Add Diagnosis</button>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="col-md-12" id="fastTrackDiagnosisTableDIV" >
                                        <table class="table table-striped table-bordered" id="fastTrackDiagnosisTable">
                                            <thead>
                                                <tr>
                                                    <th style="display: none;">JSON</th>
                                                    <th style="display: none;">Code</th>
                                                    <th>Diagnosis</th>
                                                    <th>Type</th>
                                                    <th>Date</th>
                                                    <th>Severity</th>
                                                    <th>Site</th>
                                                    <th>Laterality</th>
                                                    <th>Notes</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id="fastTrackDiagnosisTableIniialRecord">
                                                    <td colspan="8" align="center">Please Insert New Diagnosis</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" id="fastTrackChiefComplaintAcceptComplains">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-block btn-lg" id="fastTrackChiefComplaintAcceptComplainsBtn" >Accept Symtoms</a>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer" id="fastTrackChiefComplaintAcceptDiagnosis">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-block btn-lg" id="fastTrackChiefComplaintAcceptDiagnosisBtn" >Accept Diagnosis</a>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- modal update complain-->
<div class="modal fade" id="update_CIS01000001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Chief Complaint Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <form>
                    <div class="form-group">
                        <input type="hidden" name="ccn" id="codeCCN" class="form-control input-lg" value="CCN" tabindex="4">
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Search From : </label>
                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType_update" value="P">Personalised</label>
                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType_update" value="CT" checked="">Common Term</label>
                            <input class="form-control input-lg" type="hidden" name="tCISSUBCodeType_update" id="tCISSUBCCNCodeType" value="CCN" tabindex="4" readonly="">

                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-8">
                            <label>Symptoms</label>
                            <div class="form-group">
                                <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearch_update" placeholder="Type to search Common Term..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearchPersonalised_update" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                <div id="tCISSubCCNHFCSearchLoading_update" ></div>
                                <input class="form-control input-lg" type="hidden" name="uproblem"  id="uproblem" placeholder="Please Type Chief Complaint" tabindex="4">
                                <div id="match50"></div>
                            </div>
                            <div class="form-group" style="">
                                <input class="form-control input-lg" type="hidden" name="uccnCode" id="uccnCode" tabindex="4" value="">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label>Duration</label>
                            <div class="form-group">
                                <input class="form-control input-lg" max="999" type="number" name="dur" id="uduration" placeholder="0" autocomplete="off">
                            </div>
                        </div><div class="col-md-2">
                            <label>Unit</label>
                            <div class="form-group">
                                <select name="lat" id="ssdur" class="form-control input-lg" autocomplete="off">
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
                                <label class="radio-inline"><input type="radio" id="uMild" name="uMild" value="Mild">Mild</label>
                                <label class="radio-inline"><input type="radio" id="uMild" name="uMild" value="Moderate">Moderate</label>
                                <label class="radio-inline"><input type="radio" id="uMild" name="uMild" value="Severe">Severe</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Site</label>
                            <div class="form-group">
                                <label class="radio-inline"><input type="radio" id="uSite" name="uSite" value="Right">Right</label>
                                <label class="radio-inline"><input type="radio" id="uSite" name="uSite" value="Left">Left</label>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <label>Laterality</label><div class="form-group">
                                <label class="radio-inline"><input type="radio" id="uLaterality" name="uLaterality" value="Right">Right</label>
                                <label class="radio-inline"><input type="radio" id="uLaterality" name="uLaterality" value="Left">Left</label>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <textarea type="text" name="display_name" id="uComment" class="form-control input-lg" placeholder="Notes.." tabindex="3" autocomplete="off"></textarea> 
                                <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">
                            </div>
                        </div>
                    </div>
                </form>
                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="updateBtnCCN" role="button" autocomplete="off">Update Symtoms</button>
                </div>
                <br>

            </div>     
        </div>
    </div>
</div>
<!--End modal update complain-->

<!--Start Update Diagnosis-->
<div class="modal fade" id="update_CIS030001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Diagnosis Form Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <form>
                    <div class="row">
                        <div class="col-md-12">
                            <label>Search From : </label>
                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType_update" value="P" >Favourite Term</label>
                            <label class="radio-inline"><input type="radio" name="rCISSubDGSSearchType_update" value="CT" checked="">All Term</label>
                            <input class="form-control input-lg" type="hidden" name="tCISSUBDGSCodeType_update"  id="tCISSUBDGSCodeType"  value="DGS" tabindex="4" readonly="">

                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-8">
                            <label>Search Diagnosis</label>
                            <div class="form-group">
                                <input type='text' id="tCISSubDGSSearch_update" placeholder='Type more than 3 character to search diagnosis...' class='form-control input-lg flexdatalist' data-min-length='1' name='country_name_suggestion' data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                <input class="form-control input-lg" type="text"  id="tCISSubDGSSearchPersonalised_update" placeholder="Type to Search Diagnosis Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                                <div id="tCISSubDGSSearchLoading_update"></div>
                                <input type="hidden" name="DGS" id="update_dgsCode" class="form-control input-lg"  tabindex="4">
                                <input type="hidden" name="DGS" id="jsonIdDGS" class="form-control input-lg" value="DGS" tabindex="4">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Diagnosis Date</label>
                            <div class="form-group">
                                <input class="form-control input-lg" type="text" name="date4" id="update_dateDGS" placeholder="DD/MM/YYYY" autocomplete="off"  placeholder="Diagnosis Date" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <label>Type</label>
                            <div class="form-group">
                                <label class="radio-inline"><input type="radio" id="update_TypeDGS" name="update_TypeDGS" value="Final">Final</label>
                                <label class="radio-inline"><input type="radio" id="update_TypeDGS" name="update_TypeDGS" value="Provision">Provision</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Severity</label>
                            <div class="form-group">
                                <label class="radio-inline"><input type="radio" id="update_SeverityDGS" name="update_SeverityDGS" value="Mild">Mild</label>
                                <label class="radio-inline"><input type="radio" id="update_SeverityDGS" name="update_SeverityDGS" value="Normal">Normal</label>
                                <label class="radio-inline"><input type="radio" id="update_SeverityDGS" name="update_SeverityDGS" value="Acute">Acute</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label>Site</label>
                            <div class="form-group">
                                <label class="radio-inline"><input type="radio" id="update_SiteDGS" name="update_SiteDGS" value="Right">Right</label>
                                <label class="radio-inline"><input type="radio" id="update_SiteDGS" name="update_SiteDGS" value="Left">Left</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label>Laterality</label>
                            <div class="form-group">
                                <label class="radio-inline"><input type="radio" id="update_LateralityDGS" name="update_LateralityDGS" value="Right">Right</label>
                                <label class="radio-inline"><input type="radio" id="update_LateralityDGS" name="update_LateralityDGS" value="Left">Left</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <textarea type="text" name="display_name" id="update_commentDGS" class="form-control input-lg" placeholder="Notes.." tabindex="3" autocomplete="off"></textarea> 
                            </div>
                        </div>
                    </div>
                </form>
                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="updateBtnDGS" role="button" autocomplete="off">Update Diagnosis</button>
                </div>
                <br>

            </div>     
        </div>
    </div>
</div>
<!--End Update Diagnosis-->

<!--Start Update BP-->
<div class="modal fade" id="CIS020003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Blood Pressure Update</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="BloodPressureForm" >
                    <input type="hidden" id="BPidFast">
                    <div class="form-group">
                        <h4 id="BP_setting">Blood Pressure Sitting</h4>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <h5>Systolic</h5>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <h5>Diastolic</h5>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <h5>Pulse</h5>

                            </div>
                        </div>
                    </div>
                    <div class="row lineSeperator">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input type="number" name="sitS" id="sitSFast" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" >
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input type="number" name="sitD" id="sitDFast" class="form-control input-lg BP-class" placeholder="mmHg" tabindex="4" >
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input type="number" name="sitP" id="sitPFast" class="form-control input-lg BP-class" placeholder="bpm" tabindex="4"  >

                            </div>
                        </div>
                    </div>
                </form>  
                <!-- content goes here -->

                <br>

                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="updateBloodPBtn"  role="button" autocomplete="off">Update Blood Pressure</button>
                </div>


            </div>     
        </div>
    </div>
</div>
<!--End Update BP-->


<!--Start Update RR-->
<div class="modal fade" id="CIS020004" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Respiratory Rate Update</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2" method="post">
                    <div class="form-group">
                        <h4>Respitatory Rate</h4>
                    </div>
                    <div class="row">
                        <div class="col-xs-2 col-sm-2 col-md-2">
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <input type="number" name="rrRate" id="rrRateFast" class="form-control input-lg rr-rate-input" placeholder="Respiratory Rate" tabindex="4">
                                <input type="hidden" id="RRidFast">
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="form-group">
                                <h4>breaths / min</h4>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                        </div>
                    </div>
                </form>
                <!-- content goes here -->

                <br>

                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="updateRRBtn"  role="button" autocomplete="off">Update Respiratory Rate</button>
                </div>

            </div>     
        </div>
    </div>
</div>
<!--End Update RR-->


<!--Start Update OS-->
<div class="modal fade" id="CIS020005" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Oxygen Saturation Update</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2" method="post">
                    <div class="form-group">
                        <h4>Oxygen Saturation</h4>
                    </div>
                    <div class="form-group">
                        <input type="number" min="0" max="99.9" step="0.1" name="OSat" id="OSatFast" class="form-control input-lg" placeholder="Oxygen Saturation" tabindex="4" >
                        <input type="hidden" name="idOS" id="idOSFast" class="form-control input-lg" tabindex="4">
                    </div>
                </form>
                <!-- content goes here -->

                <br>

                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="updateOSBtn"  role="button" autocomplete="off">Update Oxygen Saturation</button>
                </div>

            </div>     
        </div>
    </div>
</div>
<!--End Update OS-->

<!--Start Update BT-->
<div class="modal fade" id="CIS020006" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Body Temperature Update</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2" method="post">
                    <div class="form-group">
                        <input type="number"  id="BTempFast" class="form-control input-lg" placeholder="Body Temperature" tabindex="4"  >
                        <input type="hidden"  id="BTidFast" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" readonly >
                    </div>
                    <div class="form-group">
                        <div id="slider"></div>
                    </div>
                </form>  
                <!-- content goes here -->

                <br>

                <div class="text-right">
                    <button type="button" class="btn btn-primary" id="updateBTBtn"   role="button" autocomplete="off">Update Body Temperature</button>
                </div>

            </div>     
        </div>
    </div>
</div>
<!--End Update BT-->


<!--Start Update HW-->
<div class="modal fade" id="CIS020008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Height Weight Update</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form role="form" id="myForm2" method="post">
                    <input type="hidden" name="otherId" id="otherIdFast" class="form-control input-lg" placeholder="cm" tabindex="4">
                    <div class="row">
                        <div class="col-xs-2 col-sm-2 col-md-2"><h4>Height</h4></div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group">
                                <input type="number" name="bmiHeight" id="bmiHeightFast" class="form-control input-lg BP-class" placeholder="" tabindex="4">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"><h4>cm</h4></div>
                        <div class="col-xs-2 col-sm-2 col-md-2"><h4>Weight</h4></div>
                        <div class="col-xs-2 col-sm-2 col-md-2">
                            <div class="form-group">
                                <input type="number" name="bmiWeight" id="bmiWeightFast" class="form-control input-lg BP-class" placeholder="" tabindex="4">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2"><h4>kg</h4></div>
                    </div>
                </form>  
                <!-- content goes here -->

                <br>

                <div class="text-right">
                    <button type="button" class="btn btn-primary"  id="updateOtherBtn"  role="button" autocomplete="off">Update Height Weight</button>
                </div>

            </div>     
        </div>
    </div>
</div>
<!--End Update HW-->


<script src="jsFunction/SearchClinicalTerm.js?v=1.1"></script>
<!--<script src="jsFunction/FastTrackConfiguration.js?v=1.4"></script>-->

<script src="jsFunction/CISF0101.js?v=1.4"></script>
<script src="jsFunction/CISF0202.js?v=1.4"></script>
<script src="jsFunction/CISF0303.js?v=1.4"></script>
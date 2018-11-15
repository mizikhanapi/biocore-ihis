<!DOCTYPE html>
<html lang="en">
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>iHIS | Screen Name</title>

        <!-- header -->
        <%@include file = "../assets/header.html" %>
        <!-- header -->
        <style>
            .panel-heading.accordion-toggle:after {
                /* symbol for "opening" panels */
                font-family:'Glyphicons Halflings';
                /* essential for enabling glyphicon */
                content:"\e114";
                /* adjust as needed, taken from bootstrap.css */
                float: right;
                position: relative;
                bottom: 23px;
                font-size: 15pt;
                /* adjust as needed */
                color: grey;
                /* adjust as needed */
            }
            .panel-heading.accordion-toggle.collapsed:after {
                /* symbol for "collapsed" panels */
                content:"\e080";
                /* adjust as needed, taken from bootstrap.css */
            }
            .panel-heading:hover {
                cursor: pointer;
            }
            .panel-heading:hover h4 {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       

                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.html" %>
                <!-- menu side -->	

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">

                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->

                    <div class="row">
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <div class="text-center">
                                    <div class="bed-booking-title">First Class | WARD 01</div>
                                    <span class="bed-booking-total">123</span>
                                    <div>
                                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;12</span> 
                                        <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;10</span>
                                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;2</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <div class="text-center">
                                    <div class="bed-booking-title">First Class | WARD 01</div>
                                    <span class="bed-booking-total">123</span>
                                    <div>
                                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;12</span> 
                                        <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;10</span>
                                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;2</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="thumbnail">
                                <div class="text-center">
                                    <div class="bed-booking-title">First Class | WARD 01</div>
                                    <span class="bed-booking-total">123</span>
                                    <div>
                                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;12</span> 
                                        <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;10</span>
                                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;2</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h4>
                                    Pop-Up
                                </h4>
                                <div class="row">
                                    <div class="col-md-12">

                                        <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#squarespaceModal1">Pop-up with Action Button</button>
                                        <button class="btn btn-info btn-lg" data-toggle="modal" data-target="#squarespaceModal2">Pop-up with NO Action Button</button>


                                    </div>


                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <br/>
                                        <div class="text-center">
                                            <button id="button1id" name="button1id" class="btn btn-default"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                                            <button id="button1id" name="button1id" class="btn btn-default"><i class="fa fa-pencil-square-o fa-lg"></i>&nbsp; Update</button>
                                            <button id="button1id" name="button1id" class="btn btn-default"><i class="fa fa-times fa-lg"></i>&nbsp; Delete</button>
                                            <button id="button2id" name="button2id" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Start Panel -->
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="generic">
                            <%@include file = "cis/panel-generic.jsp" %>
                        </div>
                        <div class="tab-pane fade" id="orthopedic">
                            <%@include file = "cis/panel-orthopedic.jsp" %>
                        </div>
                    </div>


                    <!-- End Panel -->

                </div>
                <!-- main -->		

            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="squarespaceModal1" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <i class="fa fa-info fa-lg" style="font-size: 88px; margin: 20px 0px;"></i>
                            <h2>Are you sure?</h2>
                            <p>Content Goes Here</p>
                        </div>
                        <div class="text-center margin-bottom-10px">
                            <button type="button" class="btn btn-default ">Cancel</button>
                            <button type="button" class="btn btn-primary">Save</button>
                        </div>


                    </div>
                </div>
            </div>
        </div>

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
                                                        <input class="form-control input-lg flexdatalist flexdatalist-selected flexdatalist-set" type="hidden" id="tCISSubCCNHFCSearch" placeholder="Type to search Common Term..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)" value=""><input class="form-control input-lg flexdatalist-selected flexdatalist-alias" type="text" id="tCISSubCCNHFCSearch-flexdatalist" placeholder="Type to search Common Term..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)" value="Fever" autocomplete="off" style="">
                                                        <input class="form-control input-lg flexdatalist flexdatalist-set" type="hidden" id="tCISSubCCNHFCSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)" value=""><input class="form-control input-lg flexdatalist-alias" type="text" id="tCISSubCCNHFCSearchPersonalised-flexdatalist" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)" autocomplete="off" style="display: none;">
                                                        <div id="tCISSubCCNHFCSearchLoading"></div>
                                                        <input class="form-control input-lg" type="hidden" name="problem" id="problem" placeholder="Please Type Chief Complaint" tabindex="4" value="">
                                                        <div id="match50"></div>
                                                    </div>
                                                    <div class="form-group" style="
                                                         ">
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
                                                </div></div>

                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Severity</label>
                                                    <div class="form-group">



                                                        <label class="radio-inline"><input type="radio" name="optradio" checked="">Mild</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Moderate</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Severe</label>
                                                        <select name="mild" id="Mild" class="form-control input-lg" placeholder="Severity" autocomplete="off" style="
                                                                display: none;
                                                                ">

                                                            <option value="None" selected="">None</option>
                                                            <option value="Mild">Mild</option>
                                                            <option value="Moderate">Moderate</option>
                                                            <option value="Severe">Severe</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label>Site</label>
                                                    <div class="form-group">
                                                        <label class="radio-inline"><input type="radio" name="optradio" checked="">Right</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Left</label>

                                                        <select name="site" id="Site" class="form-control input-lg" autocomplete="off" style="
                                                                display: none;
                                                                ">

                                                            <option value="None" selected="">None</option>
                                                            <option value="Right">Right</option>
                                                            <option value="Left">Left</option>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-4">
                                                    <label>Laterality</label><div class="form-group">

                                                        <label class="radio-inline"><input type="radio" name="optradio" checked="">Right</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Left</label>
                                                        <select name="lat" id="Laterality" class="form-control input-lg" autocomplete="off" style="
                                                                display: none;
                                                                ">

                                                            <option value="None" selected="">None</option>
                                                            <option value="Right">Right</option>
                                                            <option value="Left">Left</option>
                                                        </select>
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
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Symptoms</th>
                                                            <th>Duration</th>
                                                            <th>Severity</th>
                                                            <th>Site</th>
                                                            <th>Laterity</th>
                                                            <th>Notes</th>
                                                            <th>Actions</th>


                                                        </tr>
                                                    </thead>
                                                    <tbody id="tableOrderDTO">
                                                        <tr>
                                                            <td>Fever</td>
                                                            <td>1 Days</td>
                                                            <td>Mild</td>
                                                            <td>Right</td>
                                                            <td>Right</td>
                                                            <td>Remark</td>
                                                            <td><i class="fa fa-times" style="
                                                                   color: #ff0000;
                                                                   "></i></td>


                                                        </tr>
                                                        <tr>
                                                            <td>Cought</td>
                                                            <td>1 Days</td>
                                                            <td>Mild</td>
                                                            <td>Right</td>
                                                            <td>Right</td>
                                                            <td>Remark</td>
                                                            <td><i class="fa fa-times" style="
                                                                   color: #ff0000;
                                                                   "></i></td>


                                                        </tr>
                                                        <tr>
                                                            <td>Flu</td>
                                                            <td>1 Days</td>
                                                            <td>Mild</td>
                                                            <td>Right</td>
                                                            <td>Right</td>
                                                            <td>Remark</td>
                                                            <td><i class="fa fa-times" style="
                                                                   color: #ff0000;
                                                                   "></i></td>


                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
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
                                                                    <button class="btn btn-default" type="button">Go!</button>
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
                                                            <button class="btn btn-default" type="button">Go!</button>
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
                                                            <button class="btn btn-default" type="button">Go!</button>
                                                        </span>
                                                    </div>
                                                </div><div class="col-md-6">
                                                    <h5>Body Temperature °C</h5>

                                                    <div class="input-group">
                                                        <input type="number" id="BTemp" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" autocomplete="off">
                                                        <input type="hidden" id="BTid" class="form-control input-lg" placeholder="Body Temperature" tabindex="4" readonly="">
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" type="button">Go!</button>
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
                                                    <label>Search Diagnosis</label>
                                                    <div class="form-group">
                        <input type="hidden" id="tCISSubDGSSearch" placeholder="Type more than 3 character to search diagnosis..." class="form-control input-lg flexdatalist flexdatalist-set" data-min-length="1" name="country_name_suggestion" data-search-by-word="true" onkeypress="return blockSpecialChar(event)" value=""><input type="text" id="tCISSubDGSSearch-flexdatalist" placeholder="Type more than 3 character to search diagnosis..." class="form-control input-lg flexdatalist-alias" data-min-length="1" data-search-by-word="true" onkeypress="return blockSpecialChar(event)" autocomplete="off">
                        <input class="form-control input-lg flexdatalist flexdatalist-set" type="hidden" id="tCISSubDGSSearchPersonalised" placeholder="Type to Search Diagnosis Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)"><input class="form-control input-lg flexdatalist-alias" type="text" id="tCISSubDGSSearchPersonalised-flexdatalist" placeholder="Type to Search Diagnosis Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)" autocomplete="off" style="display: none;">
                        <div id="tCISSubDGSSearchLoading"></div>
                    </div>
                                                    <div class="form-group" style="
                                                         ">
                                                        <input class="form-control input-lg" type="hidden" name="ccnCode" id="ccnCode" tabindex="4" value="">
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label>Diagnosis Date</label>
                                                    <div class="form-group">
                    <input class="form-control input-lg hasDatepicker" type="text" name="date4" id="dateDGS" placeholder="DD/MM/YYYY" autocomplete="off">
                </div>
                                                </div></div>

                                            <div class="row">
                                                
<div class="col-md-4">
                                                    <label>Type</label>
                                                    <div class="form-group">



                                                        <label class="radio-inline"><input type="radio" name="optradio" checked="">Final</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Provision</label>
                                                        
                                                        <select name="mild" id="Mild" class="form-control input-lg" placeholder="Severity" autocomplete="off" style="
                                                                display: none;
                                                                ">

                                                            <option value="None" selected="">None</option>
                                                            <option value="Mild">Mild</option>
                                                            <option value="Moderate">Moderate</option>
                                                            <option value="Severe">Severe</option>
                                                        </select>
                                                    </div>
                                                </div><div class="col-md-4">
                                                    <label>Severity</label>
                                                    <div class="form-group">



                                                        <label class="radio-inline"><input type="radio" name="optradio" checked="">Mild</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Moderate</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Severe</label>
                                                        <select name="mild" id="Mild" class="form-control input-lg" placeholder="Severity" autocomplete="off" style="
                                                                display: none;
                                                                ">

                                                            <option value="None" selected="">None</option>
                                                            <option value="Mild">Mild</option>
                                                            <option value="Moderate">Moderate</option>
                                                            <option value="Severe">Severe</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    <label>Site</label>
                                                    <div class="form-group">
                                                        <label class="radio-inline"><input type="radio" name="optradio" checked="">Right</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Left</label>

                                                        <select name="site" id="Site" class="form-control input-lg" autocomplete="off" style="
                                                                display: none;
                                                                ">

                                                            <option value="None" selected="">None</option>
                                                            <option value="Right">Right</option>
                                                            <option value="Left">Left</option>
                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="col-md-2">
                                                    <label>Laterality</label><div class="form-group">

                                                        <label class="radio-inline"><input type="radio" name="optradio" checked="">Right</label>
                                                        <label class="radio-inline"><input type="radio" name="optradio">Left</label>
                                                        <select name="lat" id="Laterality" class="form-control input-lg" autocomplete="off" style="
                                                                display: none;
                                                                ">

                                                            <option value="None" selected="">None</option>
                                                            <option value="Right">Right</option>
                                                            <option value="Left">Left</option>
                                                        </select>
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
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>Symptoms</th>
                                                            <th>Duration</th>
                                                            <th>Severity</th>
                                                            <th>Site</th>
                                                            <th>Laterity</th>
                                                            <th>Notes</th>
                                                            <th>Actions</th>


                                                        </tr>
                                                    </thead>
                                                    <tbody id="tableOrderDTO">
                                                        <tr>
                                                            <td>Fever</td>
                                                            <td>1 Days</td>
                                                            <td>Mild</td>
                                                            <td>Right</td>
                                                            <td>Right</td>
                                                            <td>Remark</td>
                                                            <td><i class="fa fa-times" style="
                                                                   color: #ff0000;
                                                                   "></i></td>


                                                        </tr>
                                                        <tr>
                                                            <td>Cought</td>
                                                            <td>1 Days</td>
                                                            <td>Mild</td>
                                                            <td>Right</td>
                                                            <td>Right</td>
                                                            <td>Remark</td>
                                                            <td><i class="fa fa-times" style="
                                                                   color: #ff0000;
                                                                   "></i></td>


                                                        </tr>
                                                        <tr>
                                                            <td>Flu</td>
                                                            <td>1 Days</td>
                                                            <td>Mild</td>
                                                            <td>Right</td>
                                                            <td>Right</td>
                                                            <td>Remark</td>
                                                            <td><i class="fa fa-times" style="
                                                                   color: #ff0000;
                                                                   "></i></td>
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
                </div>
            </div>
        </div>



        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <script>
                                                            $('a[class="panelito"]').on('shown.bs.tab', function (e) {
                                                                var target = $(this).attr('href');

                                                                $(target).css('left', '' + $(window).width() + 'px');
                                                                var left = $(target).offset().left;
                                                                $(target).css({left: left}).animate({"left": "0px"}, "10");
                                                            })
        </script>


    </body></html>
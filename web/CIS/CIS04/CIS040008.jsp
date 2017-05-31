<%-- 
    Document   : CIS040008
    Created on : Feb 18, 2017, 12:28:10 PM
    Author     : -D-
--%>


<!--Modal ADD MC & Time Slip-->
<div class="modal fade" id="CIS040008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Medical Certification (MC) and Time Slip</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Start Date</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg DateFromMEC" type="text" name="DateFrom" id="DateFromMEC"  placeholder="DD-MM-YY">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">End Date</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg DateToMEC" type="text" name="DateTo" id="DateToMEC" placeholder="DD-MM-YY">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Start Time</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg num1MEC" type="text" name="num1" id="num1MEC" placeholder="Time Start">
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">End Time</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg num2MEC" type="text" name="num2" id="num2MEC"  placeholder="End End">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary btn-block btn-lg" id="btnCIS_GenerateMC">Generate MC</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary btn-block btn-lg" id="btnCIS_GenerateTimeSlip">Generate Time Slip</button>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptMCTS" role="button">Accept</button>
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
<!--End ADD MC & Time Slip-->

<!--Modal Update MC & Time Slip-->
<div class="modal fade" id="update_CIS040008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Medical Certification (MC) and Time Slip</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <h4>Date Start</h4>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <h4>Date End</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg DateFromMEC" type="text" name="DateFrom" id="UDateFromMEC"  placeholder="DD-MM-YY">
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg DateToMEC" type="text" name="DateTo" id="UDateToMEC"  placeholder="DD-MM-YY">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <h4>Time Start</h4>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <h4>Time End</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg num1MEC" type="text" name="num1" id="Unum1MEC" placeholder="Time Start">
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg num2MEC" type="text" name="num2" id="Unum2MEC"   placeholder="End End">
                        </div>
                    </div>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary btn-block btn-lg" id="btnMC">Generate MC</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-primary btn-block btn-lg" id="btnTimeSlip">Generate Time Slip</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" id="updateMCTS" role="button">Update</button>
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

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title">Sijil Cuti Sakit</h3>
            </div>
            <div class="modal-body">
                <div id="mCIS_MC_Slip"></div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <input name="b_print" id="b_print" type="button" class="btn btn-success btn-lg" value=" Approve ">        
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Close</button>     
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
        $(document).ready(function () {

    });
    </script>
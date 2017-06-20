<%-- 
    Document   : chartObservation
    Created on : Jun 7, 2017, 5:27:06 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="cobserved1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Chart Observation</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWObsDate">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="NIWObsTime">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Blood Pressure</label>
                            </div>
                        </div>
                    </div>

                        <div class="row">
                            <div class="col-md-4">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Systolic</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" placeholder="mmHg"id="NIWOBsystolic">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Diatolic</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" placeholder="mmHg" id="NIWOBdiatolic">
                                    </div>

                                </div>

                            </div><div class="col-md-4">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Pulse</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" placeholder="/min" id="NIWOBpulse">
                                    </div>
                                </div>
                            </div></div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Respiratory Rate</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="breath/min" id="NIWOBrr">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Oxygen Saturation</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="oxygen saturation" id="NIWOBos">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Pain Score</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="pain scale" id="NIWOBps" readonly="">
                                    <button class="btn btn-default btn-block margin-bottom-10px" id="btnNIWaddps" data-toggle="modal" data-target="#CIS020007">Add Pain Score</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Comments</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md" id="NIWOBcomment"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWOBADD" role="button">Add Items</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#NIWObsDate').datepicker();
    });


    $('#btnNIWaddps').on('click', function (e) {
        e.preventDefault();
        $('#actionPS #btnNIWps').show();
        $('#actionPS #acceptPSBtn').hide();
    });
    
    $('#btnNIWOBADD').on('click',function(e){
        e.preventDefault();
        var date = $('#NIWObsDate').val();
        var time = $('#NIWObsTime').val();
        var systolic = $('#NIWOBsystolic').val();
        var dialotic = $('#NIWOBdiatolic').val();
        var pulse = $('#NIWOBpulse').val();
        var respiratoryRate = $('#NIWOBrr').val();
        var oxygenSatu = $('#NIWOBos').val();
        var painScore = $('#NIWOBps').val();
        var comment = $('#NIWOBcomment').val();
        
        var pmi_no = $('#pmiNumber').text();
        var hfc_cd1 = hfc_cd;
        var epDate = episodeDate;
        console.log(pmi_no+" "+hfc_cd1+" "+epDate);
        
       
    });
</script>
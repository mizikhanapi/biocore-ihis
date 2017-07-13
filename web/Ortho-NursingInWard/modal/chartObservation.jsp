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
                            <input type="hidden" id="NIWObsEpisodeDate" >
                            <input type="hidden" id="NIWObsEncounterDate">
                            <input type="hidden" id="NIWObsPmi" >
                            <input type="hidden" id="NIWObsHfc" >
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
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWOBUPDATE" role="button">Update Items</button>
                    </div>
                    <!--                    <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWOBUP" role="button">Update Items</button>
                                        </div>-->
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
        $('#NIWObsDate').datepicker({dateFormat: "dd/mm/yy"});
    });

    //btn add pain scale
    $('#cobserved1 #btnNIWaddps').on('click', function (e) {
        e.preventDefault();
        $('#actionPS #btnNIWps').show();
        $('#actionPS #acceptPSBtn').hide();
    });


    //btn add observation chart
    $('#cobserved1 #btnNIWOBADD').on('click', function (e) {
        e.preventDefault();

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();

        var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;
        var date = $('#NIWObsDate').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
        var time = $('#NIWObsTime').val();
        var systolic = $('#NIWOBsystolic').val();
        var dialotic = $('#NIWOBdiatolic').val();
        var pulse = $('#NIWOBpulse').val();
        var respiratoryRate = $('#NIWOBrr').val();
        var oxygenSatu = $('#NIWOBos').val();
        var painScore = $('#NIWOBps').val();
        var comment = $('#NIWOBcomment').val();
        var sel = $('#selectOBdate').val();
        var pmi_no = pmiNo;
        var hfc_cd1 = hfc_cd;
        var epDate = episodeDate;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "| | |" + newDate + " " + time + ":00.0|" + pulse + "|" + systolic + "|" + dialotic + "|" + respiratoryRate + "|" + oxygenSatu + "|" + painScore + "|" + comment;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/ObservationFunction.jsp",
            data: {datas: datas, methodName: "add"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully added!");
                    if (sel !== null) {
                        $('#selectOBdate').val(sel).change();
                    }

                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to add");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#cobserved1").modal('toggle');
    });

    //btn update observation chart
    $('#cobserved1 #btnNIWOBUPDATE').on('click', function (e) {
        e.preventDefault();

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();

        //var encounterDate = yy+"-"+mm+"-"+dd+" "+hh+":"+m+":"+ss+"."+ms;
        var encounterDate = $('#NIWObsEncounterDate').val();
        var date = $('#NIWObsDate').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
        var time = $('#NIWObsTime').val();
        var systolic = $('#NIWOBsystolic').val();
        var dialotic = $('#NIWOBdiatolic').val();
        var pulse = $('#NIWOBpulse').val();
        var respiratoryRate = $('#NIWOBrr').val();
        var oxygenSatu = $('#NIWOBos').val();
        var painScore = $('#NIWOBps').val();
        var comment = $('#NIWOBcomment').val();
        var sel = $('#selectOBdate').val();




        var pmi_no = $('#NIWObsPmi').val();
        var hfc_cd1 = $('#NIWObsHfc').val();
        var epDate = $('#NIWObsEpisodeDate').val();

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "| | |" + newDate + " " + time + "|" + pulse + "|" + systolic + "|" + dialotic + "|" + respiratoryRate + "|" + oxygenSatu + "|" + painScore + "|" + comment;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/ObservationFunction.jsp",
            data: {datas: datas, methodName: "update"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully update!");
                    if (sel !== null) {
                        $('#selectOBdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to update");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#cobserved1").modal('toggle');
    });
</script>
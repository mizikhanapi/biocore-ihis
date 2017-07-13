<%-- 
    Document   : 4hly
    Created on : Jun 8, 2017, 3:38:25 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="4hly" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">4 Hourly Observation Chart for Thrombophlebitis</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <input type="hidden" id="NIW4hlyEpisodeDate" >
                            <input type="hidden" id="NIW4hlyEncounterDate">
                            <input type="hidden" id="NIW4hlyPmi" >
                            <input type="hidden" id="NIW4hlyHfc" >
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="dateNIW4hly">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time 4hly Observation</label>
                                <div class="col-md-12 form-inline">
                                    <input type="time" class="form-control input-md" id="timeNIW4hly">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Site of IV Canulation</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="site4canulation4hly">
                                        <option selected="" disabled="">please select site of canulation</option>
                                        <option value="Vein of the dorsal hand">Vein of the dorsal hand</option>
                                        <option value="Vein of the foot">Vein of the foot</option>
                                        <option value="Vein of the anterior forearm">Vein of the anterior forearm</option>
                                        <option value="External jugular vein">External jugular vein</option>
                                    </select>
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
                                    <input type="text" class="form-control input-md" placeholder="pain scale" id="NIW4hlyps" readonly="">
                                    <button class="btn btn-default btn-block margin-bottom-10px" id="btnNIWaddps" data-toggle="modal" data-target="#CIS020007">Add Pain Score</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Choose..</label>
                                <div class="col-md-12">
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose1" value="Yes">
                                        <label for="hourlychoose1">
                                            Slight Redness
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose2" value="Yes">
                                        <label for="hourlychoose2">
                                            Redness
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose3" value="Yes">
                                        <label for="hourlychoose3">
                                            Swelling
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose4" value="Yes">
                                        <label for="hourlychoose4">
                                            Palpable Venous cord
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose5" value="Yes">
                                        <label for="hourlychoose5">
                                            Unconscious Pt
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Additive</label>
                                <div class="col-md-12">
                                    <div class="checkbox">
                                        <input type="checkbox" name="radio2" id="Additive1" value="Yes">
                                        <label for="Additive1">
                                            Medication
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="radio2" id="Additive2" value="Yes">
                                        <label for="Additive2">
                                            Blood Tx
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="radio2" id="Additive3" value="Yes">
                                        <label for="Additive3">
                                            Plain I/V drip
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Thrombophlebitis</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio3" id="Thrombo1" value="Yes">
                                        <label for="Thrombo1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio3" id="Thrombo2" value="No">
                                        <label for="Thrombo2">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">V.I.P. Score</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip1" value="1">
                                        <label for="vip1">
                                            1
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip2" value="2">
                                        <label for="vip2">
                                            2
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip3" value="3">
                                        <label for="vip3">
                                            3
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip4" value="4">
                                        <label for="vip4">
                                            4
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip5" value="5">
                                        <label for="vip5">
                                            5
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIW4hlyADD" role="button">Add Items</button>
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIW4hlyUPDATE" role="button">Update Items</button>
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
        $('#dateNIW4hly').datepicker({dateFormat: "dd/mm/yy"});
    });

    //btn add pain scale
    $('#4hly #btnNIWaddps').on('click', function (e) {
        e.preventDefault();
        $('#actionPS #btnNIWps').show();
        $('#actionPS #acceptPSBtn').hide();
    });

    $('#4hly #btnNIW4hlyADD').on('click', function (e) {
        e.preventDefault();
        var pmi_no = pmiNo;
        var hfc_cd1 = hfc_cd;
        var epDate = episodeDate;

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();
        var sel = $('#select4hlydate').val();

        var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;

        var date = $('#dateNIW4hly').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var time4h = $('#timeNIW4hly').val();
        var siteOfCanulation = $('#site4canulation4hly').find(":selected").val();

        var painScore = $('#NIW4hlyps').val();
        var slightRedness, redness, swelling, palpable, unconscious, medication, blood_tx, plain_iv_drip;

        if ($('#hourlychoose1').prop('checked')) {
            slightRedness = "Yes";
        } else {
            slightRedness = "No";
        }

        if ($('#hourlychoose2').prop('checked')) {
            redness = "Yes";
        } else {
            redness = "No";
        }

        if ($('#hourlychoose3').prop('checked')) {
            swelling = "Yes";
        } else {
            swelling = "No";
        }

        if ($('#hourlychoose4').prop('checked')) {
            palpable = "Yes";
        } else {
            palpable = "No";
        }

        if ($('#hourlychoose5').prop('checked')) {
            unconscious = "Yes";
        } else {
            unconscious = "No";
        }

        if ($('#Additive1').prop('checked')) {
            medication = "Yes";
        } else {
            medication = "No";
        }

        if ($('#Additive2').prop('checked')) {
            blood_tx = "Yes";
        } else {
            blood_tx = "No";
        }

        if ($('#Additive3').prop('checked')) {
            plain_iv_drip = "Yes";
        } else {
            plain_iv_drip = "No";
        }

        var thrombophlebitis = $("input[name='radio3']:checked").val();
        var vip_pain = $("input[name='radio4']:checked").val();

        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time4h + ":00.0|" + time4h + "|" + siteOfCanulation + "|" + painScore + "|" + slightRedness + "|" + redness + "|" + swelling + "|" + palpable + "|" + unconscious + "|" + thrombophlebitis + "|" + vip_pain + "|" + medication + "|" + blood_tx + "|" + plain_iv_drip + "|" + assignBy;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/4hlyFunction.jsp",
            data: {datas: datas, methodName: "add"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully added!");
                    if (sel !== null) {
                        $('#select4hlydate').val(sel).change();
                    }
                    //$('#select4hlydate').val(sel).change();
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to add");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#4hly").modal('toggle');
    });


    $('#4hly #btnNIW4hlyUPDATE').on('click', function (e) {
        e.preventDefault();
        var pmi_no = $('#NIW4hlyPmi').val();
        ;
        var hfc_cd1 = $('#NIW4hlyHfc').val();
        var epDate = $('#NIW4hlyEpisodeDate').val();
        var sel = $('#select4hlydate').val();

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();

        var encounterDate = $('#NIW4hlyEncounterDate').val();

        var date = $('#dateNIW4hly').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var time4h = $('#timeNIW4hly').val();
        var siteOfCanulation = $('#site4canulation4hly').find(":selected").val();

        var painScore = $('#NIW4hlyps').val();
        var slightRedness, redness, swelling, palpable, unconscious, medication, blood_tx, plain_iv_drip;

        if ($('#hourlychoose1').prop('checked')) {
            slightRedness = "Yes";
        } else {
            slightRedness = "No";
        }

        if ($('#hourlychoose2').prop('checked')) {
            redness = "Yes";
        } else {
            redness = "No";
        }

        if ($('#hourlychoose3').prop('checked')) {
            swelling = "Yes";
        } else {
            swelling = "No";
        }

        if ($('#hourlychoose4').prop('checked')) {
            palpable = "Yes";
        } else {
            palpable = "No";
        }

        if ($('#hourlychoose5').prop('checked')) {
            unconscious = "Yes";
        } else {
            unconscious = "No";
        }

        if ($('#Additive1').prop('checked')) {
            medication = "Yes";
        } else {
            medication = "No";
        }

        if ($('#Additive2').prop('checked')) {
            blood_tx = "Yes";
        } else {
            blood_tx = "No";
        }

        if ($('#Additive3').prop('checked')) {
            plain_iv_drip = "Yes";
        } else {
            plain_iv_drip = "No";
        }

        var thrombophlebitis = $("input[name='radio3']:checked").val();
        var vip_pain = $("input[name='radio4']:checked").val();

        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time4h + "|" + time4h + "|" + siteOfCanulation + "|" + painScore + "|" + slightRedness + "|" + redness + "|" + swelling + "|" + palpable + "|" + unconscious + "|" + thrombophlebitis + "|" + vip_pain + "|" + medication + "|" + blood_tx + "|" + plain_iv_drip + "|" + assignBy;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/4hlyFunction.jsp",
            data: {datas: datas, methodName: "update"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully update!");
                    if (sel !== null) {
                        $('#select4hlydate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to update");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#4hly").modal('toggle');
    });
</script>
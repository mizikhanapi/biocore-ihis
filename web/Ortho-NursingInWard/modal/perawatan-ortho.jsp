<%-- 
    Document   : perawatan-ortho
    Created on : Jun 8, 2017, 5:23:54 PM
    Author     : user
--%>

<div class="modal fade" id="perawatan-ortho" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Orthopedic Care Plan</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWtrEpisodeDate" >
                            <input type="hidden" id="NIWtrEncounterDate">
                            <input type="hidden" id="NIWtrPmi" >
                            <input type="hidden" id="NIWtrHfc" >
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="dateNIWtr">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="NIWtrTIME" id="OrthopedicCarePlan1" value="AM">
                                        <label for="OrthopedicCarePlan1">
                                            AM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="NIWtrTIME" id="OrthopedicCarePlan2" value="PM">
                                        <label for="OrthopedicCarePlan2">
                                            PM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="NIWtrTIME" id="OrthopedicCarePlan3" value="ON">
                                        <label for="OrthopedicCarePlan3">
                                            ON
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">IV Branula</label>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Right Upper Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightUpperLimb" id="RightUpperLimb1" value="Inserted">
                                        <label for="RightUpperLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightUpperLimb" id="RightUpperLimb2" value="Changed">
                                        <label for="RightUpperLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightUpperLimb" id="RightUpperLimb3" value="Off">
                                        <label for="RightUpperLimb3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Left Upper Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftUpperLimb" id="LeftUpperLimb1" value="Inserted">
                                        <label for="LeftUpperLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftUpperLimb" id="LeftUpperLimb2" value="Changed">
                                        <label for="LeftUpperLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftUpperLimb" id="LeftUpperLimb3" value="Off">
                                        <label for="LeftUpperLimb3">
                                            Off
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
                                <label class="col-md-12 control-label" for="textinput">Right Lower Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightLowerLimb" id="RightLowerLimb1" value="Inserted">
                                        <label for="RightLowerLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightLowerLimb" id="RightLowerLimb2" value="Changed">
                                        <label for="RightLowerLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightLowerLimb" id="RightLowerLimb3" value="Off">
                                        <label for="RightLowerLimb3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Left Lower Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftLowerLimb" id="LeftLowerLimb1" value="Inserted">
                                        <label for="LeftLowerLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftLowerLimb" id="LeftLowerLimb2" value="Changed">
                                        <label for="LeftLowerLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftLowerLimb" id="LeftLowerLimb3" value="Off">
                                        <label for="LeftLowerLimb3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <hr/>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Angio Cathter</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="AngioCathter" id="AngioCathter1" value="Inserted">
                                        <label for="AngioCathter1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="AngioCathter" id="AngioCathter2" value="Changed">
                                        <label for="AngioCathter2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="AngioCathter" id="AngioCathter3" value="Off">
                                        <label for="AngioCathter3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">CVP</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="CVP" id="CVP1" value="Inserted">
                                        <label for="CVP1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="CVP" id="CVP2" value="Changed">
                                        <label for="CVP2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="CVP" id="CVP3" value="Off">
                                        <label for="CVP3">
                                            Off
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
                                <label class="col-md-12 control-label" for="textinput">Tracheostomy</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Tracheostomy" id="Tracheostomy1" value="Inserted">
                                        <label for="Tracheostomy1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Tracheostomy" id="Tracheostomy2" value="Changed">
                                        <label for="Tracheostomy2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Tracheostomy" id="Tracheostomy3" value="Off">
                                        <label for="Tracheostomy3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Urinary Catheter</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter1" value="Inserted">
                                        <label for="UrinaryCatheter1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter2" value="Changed">
                                        <label for="UrinaryCatheter2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter3" value="Off">
                                        <label for="UrinaryCatheter3">
                                            Off
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
                                <label class="col-md-12 control-label" for="textinput">Drain 1</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain1" id="Drain11" value="Inserted">
                                        <label for="Drain11">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain1" id="Drain12" value="Changed">
                                        <label for="Drain12">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain1" id="Drain13" value="Off">
                                        <label for="Drain13">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drain 2</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain2" id="Drain21" value="Inserted">
                                        <label for="Drain21">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain2" id="Drain22" value="Changed">
                                        <label for="Drain22">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain2" id="Drain23" value="Off">
                                        <label for="Drain23">
                                            Off
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
                                <label class="col-md-12 control-label" for="textinput">Vaccum Dressing</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing1" value="Inserted">
                                        <label for="VaccumDressing1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing2" value="Changed">
                                        <label for="VaccumDressing2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing3" value="Off">
                                        <label for="VaccumDressing3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Ryies Tube</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RyiesTube" id="RyiesTube1" value="Inserted">
                                        <label for="RyiesTube1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RyiesTube" id="RyiesTube2" value="Changed">
                                        <label for="RyiesTube2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RyiesTube" id="RyiesTube3" value="Off">
                                        <label for="RyiesTube3">
                                            Off
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
                                <label class="col-md-12 control-label" for="textinput">Chest Tube</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ChestTube" id="ChestTube1" value="Inserted">
                                        <label for="ChestTube1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ChestTube" id="ChestTube2" value="Changed">
                                        <label for="ChestTube2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ChestTube" id="ChestTube3" value="Off">
                                        <label for="ChestTube3">
                                            Off
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
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWtrADD" role="button">Add Items</button>
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWtruUPDATE" role="button">Update Items</button>
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
        $('#dateNIWtr').datepicker({dateFormat: "dd/mm/yy"});
    });

    $('#perawatan-ortho #btnNIWtrADD').on('click', function (e) {
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
        var sel = $('#selecttrdate').val();

        var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;

        var date = $('#dateNIWtr').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var treatmentDate = newDate;
        var shift = $("input[name='NIWtrTIME']:checked").val();
        var iv_branula_rul = $("input[name='RightUpperLimb']:checked").val();
        var iv_branula_lul = $("input[name='LeftUpperLimb']:checked").val();
        var iv_branula_rll = $("input[name='RightLowerLimb']:checked").val();
        var iv_branula_lll = $("input[name='LeftLowerLimb']:checked").val();
        var angiocatheter = $("input[name='AngioCathter']:checked").val();
        var cvp = $("input[name='CVP']:checked").val();
        var tracheostomy = $("input[name='Tracheostomy']:checked").val();
        var urinary_catheter = $("input[name='UrinaryCatheter']:checked").val();
        var drain1 = $("input[name='Drain1']:checked").val();
        var drain2 = $("input[name='Drain2']:checked").val();
        var vaccum_dressing = $("input[name='VaccumDressing']:checked").val();
        var ryiestube = $("input[name='RyiesTube']:checked").val();
        var chesttube = $("input[name='ChestTube']:checked").val();


        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + treatmentDate + "|" + shift + "|" + iv_branula_rul + "|" + iv_branula_lul + "|" + iv_branula_rll + "|" + iv_branula_lll + "|" + angiocatheter + "|" + cvp + "|" + tracheostomy + "|" + urinary_catheter + "|" + drain1 + "|" + drain2 + "|" + vaccum_dressing + "|" + ryiestube + "|" + chesttube + "|" + assignBy;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/TreatmentFunction.jsp",
            data: {datas: datas, methodName: "add"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully added!");
                    if (sel !== null) {
                        $('#selecttrdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to add");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#perawatan-ortho").modal('toggle');
    });

    $('#perawatan-ortho #btnNIWtruUPDATE').on('click', function (e) {
        e.preventDefault();
        var pmi_no = $('#NIWtrPmi').val();
        var hfc_cd1 = $('#NIWtrHfc').val();
        var epDate = $('#NIWtrEpisodeDate').val();

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();
        var sel = $('#selecttrdate').val();

        var encounterDate = $('#NIWtrEncounterDate').val();

        var date = $('#dateNIWtr').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var treatmentDate = newDate;
        var shift = $("input[name='NIWtrTIME']:checked").val();
        var iv_branula_rul = $("input[name='RightUpperLimb']:checked").val();
        var iv_branula_lul = $("input[name='LeftUpperLimb']:checked").val();
        var iv_branula_rll = $("input[name='RightLowerLimb']:checked").val();
        var iv_branula_lll = $("input[name='LeftLowerLimb']:checked").val();
        var angiocatheter = $("input[name='AngioCathter']:checked").val();
        var cvp = $("input[name='CVP']:checked").val();
        var tracheostomy = $("input[name='Tracheostomy']:checked").val();
        var urinary_catheter = $("input[name='UrinaryCatheter']:checked").val();
        var drain1 = $("input[name='Drain1']:checked").val();
        var drain2 = $("input[name='Drain2']:checked").val();
        var vaccum_dressing = $("input[name='VaccumDressing']:checked").val();
        var ryiestube = $("input[name='RyiesTube']:checked").val();
        var chesttube = $("input[name='ChestTube']:checked").val();


        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + treatmentDate + "|" + shift + "|" + iv_branula_rul + "|" + iv_branula_lul + "|" + iv_branula_rll + "|" + iv_branula_lll + "|" + angiocatheter + "|" + cvp + "|" + tracheostomy + "|" + urinary_catheter + "|" + drain1 + "|" + drain2 + "|" + vaccum_dressing + "|" + ryiestube + "|" + chesttube + "|" + assignBy;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/TreatmentFunction.jsp",
            data: {datas: datas, methodName: "update"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully updated!");
                    if (sel !== null) {
                        $('#selecttrdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to update");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#perawatan-ortho").modal('toggle');
    });
</script>

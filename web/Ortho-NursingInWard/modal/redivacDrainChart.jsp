<%-- 
    Document   : redivacDrainChart
    Created on : Jun 9, 2017, 3:26:58 PM
    Author     : user
--%>


<div class="modal fade" id="redivacDrainChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Redivac Drain Chart</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWredivacEpisodeDate" >
                            <input type="hidden" id="NIWredivacEncounterDate">
                            <input type="hidden" id="NIWredivacPmi" >
                            <input type="hidden" id="NIWredivacHfc" >
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWRedivacDate">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Shift</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="NIWredivacShift" id="redivacShift1" value="7am-2pm">
                                        <label for="redivacShift1">
                                            7am-2pm
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="NIWredivacShift" id="redivacShift2" value="2pm-9pm">
                                        <label for="redivacShift2">
                                            2pm-9pm
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="NIWredivacShift" id="redivacShift3" value="9pm-7am">
                                        <label for="redivacShift3">
                                            9pm-7am
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Total in Bottle</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWredivacTIB">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Amount increased / shift</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWredivacAIS">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Total in Bottle end of shift</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWredivacTBES">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Remarks</label>
                                <div class="col-md-12 ">
                                    <textarea class="form-control input-md" id="NIWredivacREMARK"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWredivacADD" role="button">Add Items</button>
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWredivacUPDATE" role="button">Update Items</button>
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
        $('#NIWRedivacDate').datepicker({dateFormat: "dd/mm/yy"});
    });

    $('#redivacDrainChart #btnNIWredivacADD').on('click', function (e) {
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
        var sel = $('#selectredivacdate').val();

        var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;

        var date = $('#NIWRedivacDate').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var treatmentDate = newDate;

        var shift = $("input[name='NIWredivacShift']:checked").val();
        var TIB = $("#NIWredivacTIB").val();
        var AIS = $("#NIWredivacAIS").val();
        var TBES = $("#NIWredivacTBES").val();
        var remark = $("#NIWredivacREMARK").val();


        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + treatmentDate + "|" + shift + "|" + TIB + "|" + AIS + "|" + TBES + "|" + remark + "|" + assignBy;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/redivacFunction.jsp",
            data: {datas: datas, methodName: "add"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully added!");
                    if (sel !== null) {
                        $('#selectredivacdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to add");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#redivacDrainChart").modal('toggle');
    });

    $('#redivacDrainChart #btnNIWredivacUPDATE').on('click', function (e) {
        e.preventDefault();
        var pmi_no = $('#NIWredivacPmi').val();
        var hfc_cd1 = $('#NIWredivacHfc').val();
        var epDate = $('#NIWredivacEpisodeDate').val();

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();
        var sel = $('#selectredivacdate').val();

        var encounterDate = $('#NIWredivacEncounterDate').val();

        var date = $('#NIWRedivacDate').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var treatmentDate = newDate;

        var shift = $("input[name='NIWredivacShift']:checked").val();
        var TIB = $("#NIWredivacTIB").val();
        var AIS = $("#NIWredivacAIS").val();
        var TBES = $("#NIWredivacTBES").val();
        var remark = $("#NIWredivacREMARK").val();


        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + treatmentDate + "|" + shift + "|" + TIB + "|" + AIS + "|" + TBES + "|" + remark + "|" + assignBy;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/redivacFunction.jsp",
            data: {datas: datas, methodName: "update"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully updated!");
                    if (sel !== null) {
                        $('#selectredivacdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to update");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#redivacDrainChart").modal('toggle');
    });
</script>
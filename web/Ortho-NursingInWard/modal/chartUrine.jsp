<%-- 
    Document   : chartUrine
    Created on : Jun 9, 2017, 4:23:04 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="chartUrine" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Urine Chart</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWurEpisodeDate" >
                            <input type="hidden" id="NIWurEncounterDate">
                            <input type="hidden" id="NIWurPmi" >
                            <input type="hidden" id="NIWurHfc" >
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWDateurine" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-8 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="urinechrt" id="urinechrt1" value="4">
                                        <label for="urinechrt1">
                                            4
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="urinechrt" id="urinechrt2" value="8">
                                        <label for="urinechrt2">
                                            8
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="urinechrt" id="urinechrt3" value="12">
                                        <label for="urinechrt3">
                                            12
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 " style="padding-right: 0px;">
                                    <select class="form-control input-md" id="NIWam-pm">
                                        <option value="AM">AM</option>
                                        <option value="PM">PM</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">

                        <div class="col-md-6">
                            <!--                            <button class="btn btn-default btn-block">Add Urine Temperature</button>-->
                            <input type="text" class="form-control input-md" id="NIWTemperature" placeholder="Urine Temperature">
                        </div>
                        <div class="col-md-6">
                            <!--                            <button class="btn btn-default btn-block">Add Pulse</button>-->
                            <input type="text" class="form-control input-md" id="NIWpulseurine" placeholder="Pulse">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWurADD" role="button">Add Items</button>
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWurUPDATE" role="button">Update Items</button>
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
        $('#NIWDateurine').datepicker({dateFormat: "dd/mm/yy"});
    });

    $('#chartUrine #btnNIWurADD').on('click', function (e) {
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
        var sel = $('#selecturdate').val();

        var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;

        var date = $('#NIWDateurine').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var urDate = newDate;

        var TMUR = $("input[name='urinechrt']:checked").val();
        var RPUR = $("#NIWpulseurine").val();
        var RTEMPUR = $("#NIWTemperature").val();
        var AMPMUR = $("#NIWam-pm").val();
        var masaUR;

        if (AMPMUR === "AM") {
            if (TMUR !== "12") {
                masaUR = TMUR;
            } else if (TMUR === "12") {
                masaUR = "00";
            }
        } else if (AMPMUR === "PM") {
            if (TMUR !== "12") {
                masaUR = parseInt(TMUR) + 12;
            } else if (TMUR === "12") {
                masaUR = TMUR;
            }
        }

        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + TMUR + ":" + AMPMUR + "|" + RTEMPUR + "|" + RPUR + "|" + urDate + " " + masaUR + ":00";

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/UrineFunction.jsp",
            data: {datas: datas, methodName: "add"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully added!");
                    if (sel !== null) {
                        $('#selecturdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to add");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#chartUrine").modal('toggle');
    });
    
    $('#chartUrine #btnNIWurUPDATE').on('click', function (e) {
        e.preventDefault();
        var pmi_no = $('#NIWurPmi').val();
        var hfc_cd1 = $('#NIWurHfc').val();
        var epDate = $('#NIWurEpisodeDate').val();

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();
        var sel = $('#selecturdate').val();

        var encounterDate = $('#NIWurEncounterDate').val();

        var date = $('#NIWDateurine').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var urDate = newDate;

        var TMUR = $("input[name='urinechrt']:checked").val();
        var RPUR = $("#NIWpulseurine").val();
        var RTEMPUR = $("#NIWTemperature").val();
        var AMPMUR = $("#NIWam-pm").val();
        var masaUR;

        if (AMPMUR === "AM") {
            if (TMUR !== "12") {
                masaUR = TMUR;
            } else if (TMUR === "12") {
                masaUR = "00";
            }
        } else if (AMPMUR === "PM") {
            if (TMUR !== "12") {
                masaUR = parseInt(TMUR) + 12;
            } else if (TMUR === "12") {
                masaUR = TMUR;
            }
        }

        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + TMUR + ":" + AMPMUR + "|" + RTEMPUR + "|" + RPUR + "|" + urDate + " " + masaUR + ":00";

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/UrineFunction.jsp",
            data: {datas: datas, methodName: "update"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully updated!");
                    if (sel !== null) {
                        $('#selecturdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to update");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong call the technician,error: " + err);
            }
        });
        $("#chartUrine").modal('toggle');
    });

</script>
<%-- 
    Document   : FitsChart
    Created on : Jun 9, 2017, 12:41:20 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="FitsChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Fits Chart</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWfitEpisodeDate" >
                            <input type="hidden" id="NIWfitEncounterDate">
                            <input type="hidden" id="NIWfitPmi" >
                            <input type="hidden" id="NIWfitHfc" >
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWFitsDate">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="NIWFitsTime">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row margin-bottom-30px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Nature of Fits</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="" id="NIWFitsNOF">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Duration</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="NIWFitsDuration">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Remarks</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md" id="NIWFitsRemark"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWFitsADD" role="button">Add Items</button>
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnNIWFitsUPDATE" role="button">Update Items</button>
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
        $('#NIWFitsDate').datepicker({dateFormat: "dd/mm/yy"});
    });

    $('#FitsChart #btnNIWFitsADD').on('click', function (e) {
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
        var sel = $('#selectfitsdate').val();

        var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;

        var date = $('#NIWFitsDate').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var treatmentDate = newDate;

        var time = $("#NIWFitsTime").val();
        var NOF = $("#NIWFitsNOF").val();
        var DU = $("#NIWFitsDuration").val();
        var REMARK = $("#NIWFitsRemark").val();


        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + treatmentDate +" "+time+":00.0|" + NOF + "|" + DU + "|" + REMARK;

        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/FitFunction.jsp",
            data: {datas: datas, methodName: "add"},
            timeout: 10000,
            success: function (result) {
                if (result.trim() === 'true') {
                    bootbox.alert("successfully added!");
                    if (sel !== null) {
                        $('#selectfitsdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to add");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#FitsChart").modal('toggle');
    });

    $('#FitsChart #btnNIWFitsUPDATE').on('click', function (e) {
        e.preventDefault();
        var pmi_no = $('#NIWfitPmi').val();
        var hfc_cd1 = $('#NIWfitHfc').val();
        var epDate = $('#NIWfitEpisodeDate').val();

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();
        var sel = $('#selectfitsdate').val();

        var encounterDate = $('#NIWfitEncounterDate').val();

        var date = $('#NIWFitsDate').val();
        var sDate = date.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var treatmentDate = newDate;

        var time = $("#NIWFitsTime").val();
        var NOF = $("#NIWFitsNOF").val();
        var DU = $("#NIWFitsDuration").val();
        var REMARK = $("#NIWFitsRemark").val();


        var assignBy = doctor_id;

        var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + treatmentDate +" "+time+"|" + NOF + "|" + DU + "|" + REMARK;
        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/FitFunction.jsp",
            data: {datas: datas, methodName: "update"},
            timeout: 10000,
            success: function (result) {
                console.log(result);
                if (result.trim() === 'true') {
                    bootbox.alert("successfully updated!");
                    if (sel !== null) {
                        $('#selectfitsdate').val(sel).change();
                    }
                } else if (result.trim() === 'false') {
                    bootbox.alert("fail to update");
                }
            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
        $("#FitsChart").modal('toggle');
    });
</script>
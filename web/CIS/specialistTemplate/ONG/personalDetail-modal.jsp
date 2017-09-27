<%-- 
    Document   : personalDetail-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Start Modal -->
<div class="modal fade" id="ong-pDetails1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Gravida & etc</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gravida *</label>
                                <div class="col-md-12">
                                    <input  class="form-control input-md numbersOnly" type="text"  maxlength="2" id="PIgravida">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Parity *</label>
                                <div class="col-md-12">
                                    <input  class="form-control input-md numbersOnly" type="text"  maxlength="2" id="PIparity">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <h4>Present Pregnancy</h4>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">LMP *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIlmp">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">EDD *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIedd">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Scan EDD *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIscanedd"> 
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <h4>Period Cycle *</h4>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIperiodCycle"> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <hr>
                        <h4>Past History</h4>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Past gynaecological History</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIgynaecologicalHistory">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Past Medical History</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIpastMedHis">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Past Surgical History</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIsurHis">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnPIadd" role="button">Add Items</button>
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
<!-- End Modal -->
<!-- Start Modal -->
<div class="modal fade" id="ong-pDetails3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Previous Pregnancy</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Year *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md numbersOnly" id="PIyear" size="4" maxlength="4">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gestation *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIgestation">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <hr>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Place of Delivery *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIpod">
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Labour/Delivery *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIlabour">
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <hr>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">WT *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIwt">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gender *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIgender">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <div class="col-md-12">
                                    <textarea type="text" name="" id="" class="form-control input-lg" placeholder="Comment..." tabindex="3" id="PIcoment"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBloodPBtn" role="button">Add Items</button>
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
<!-- End Modal -->
<script>
    $('#ong-pDetails1').on('hidden.bs.modal', function (e) {
        $(this)
                .find("input,textarea,select")
                .val('')
                .end()
                .find("input[type=checkbox], input[type=radio]")
                .prop("checked", "")
                .end();
        //$(this).find('form')[0].reset();
    });

    function getPI(data) {
        //console.log(data);
        $.ajax({
            type: "post",
            url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
            data: {datas: data, methodName: "getPI"},
            success: function (databack) {
                $('#PIdiv').html(databack);
            }
        });
    }

    $(function () {
        $('#PIlmp').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        $('#PIedd').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        $('#PIscanedd').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
    });

    $('.numbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        }
    });

    function convertDate(date) {
        var date = date.split('/');
        var newDate = date[2] + "-" + date[1] + "-" + date[0];
        return newDate;
    }

    $('#btnPIadd').on('click', function () {
        var gravida, parity, lmp, edd, scanEdd, periodCycle, pgh, pmh, psh;
        gravida = $('#PIgravida').val();
        parity = $('#PIparity').val();
        lmp = $('#PIlmp').val();
        edd = $('#PIedd').val();
        scanEdd = $('#PIscanedd').val();
        periodCycle = $('#PIperiodCycle').val();
        pgh = $('#PIgynaecologicalHistory').val();
        pmh = $('#PIpastMedHis').val();
        psh = $('#PIsurHis').val();


        if (gravida === "" || parity === "" || lmp === "" || edd === "" || scanEdd === "" || periodCycle === "") {
            bootbox.alert("please insert the compulsory item to proceed");
        } else {
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
            var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;

            var Clmp = convertDate(lmp);
            var Cedd = convertDate(edd);
            var Csedd = convertDate(scanEdd);

            var datas2 = pmi_no + "|" + hfc_cd1;
            var datas = datas2 + "|" + epDate + "|" + encounterDate + "|" + gravida + "|" + parity + "|" + Clmp + "|" + Cedd + "|" + Csedd + "|" + periodCycle + "|" + pgh + "|" + pmh + "|" + psh;

            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
                data: {datas: datas, methodName: "add"},
                success: function (databack) {
                    getPI(datas2);
                    if (databack) {
                        bootbox.alert("succes inserting");
                    } else {
                        bootbox.alert("fail inserting");
                    }
                }
            });
        }

    });

</script>



<%-- 
    Document   : anteNatal
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4 hidden" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control">
                <option>View by</option>
                <option>Today</option>
                <option>Yesterday</option>
                <option>7 Days</option>
                <option>30 Days</option>
                <option>60 Days</option>
                <option>Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px hidden">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="exampleInputName2" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="exampleInputEmail2" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<div class="panel panel-default" id="divAnteB">
    <div class="panel-body" id="divAntenatal">
        <div class="row">
            <div class="col-xs-3">
                <dt style="font-size: 18px;">Blood Profile</dt>
            </div>
            <div class="col-xs-3">
                <dd>Blood Group: <strong>-</strong></dd>
                <dd>Rhesus Factor: <strong>-</strong></dd>
                <dd>VDRL: <strong>-</strong></dd>
            </div>
            <div class="col-xs-3">
                <dd>ATT Injection: <strong>-</strong></dd>
                <dd>Rubella Status: <strong>-</strong></dd>
                <dd>Hepatitis B Antibody: <strong>-</strong></dd>
                <dd>Hepatitis B Antigen: <strong>-</strong></dd>
            </div>
            <div class="col-xs-3">
                <dd>1st dose: <strong>-</strong></dd>
                <dd>2nd dose: <strong>-</strong></dd>
                <dd>Booster: <strong>-</strong></dd>
            </div>
        </div>  
    </div>  
    <table class="table table-striped table-bordered" style="margin-bottom: 0px;" id="tblante">
        <thead>
            <tr>
                <th>Date.</th>
                <th>Gestation Weeks</th>
                <th>Prest/Lie</th>
                <th>Ultrasound</th>
                <th>BP</th>
                <th>Hb</th>
                <th>WT</th>
                <th colspan="2" class="text-center">Urine<br>
                    <span class="pull-left" style="padding-left: 10px;">A</span>
                    <span class="pull-right" style="padding-right: 10px;">S</span>
                </th>
                <th>Follow up</th>
                <th>Action</th>
            </tr>  
        </thead>
        <tbody>

        </tbody>
    </table>
</div>
<script>
    $('#divAnteB ').on('click', '#tblante tbody tr td a#delAN', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataEncounter = row.find('#ANencounter').val();
        var dataEpisode = row.find('#ANepisode').val();
        var pmi_no = pmiNo;
        var hfc_cd1 = hfc_cd;
        var datas2 = pmi_no + "|" + hfc_cd1;
        var datas = datas2 + "|" + dataEpisode + "|" + dataEncounter;

        bootbox.confirm({
            message: "Are you sure want to delete?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    $.ajax({
                        type: "post",
                        url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
                        data: {datas: datas, methodName: "del"},
                        success: function (databack) {
                            getBP(datas2);
                            getAnteNatal(datas2);
                            if (databack) {
                                bootbox.alert("Deleted");
                            } else {
                                bootbox.alert("fail deleting");
                            }
                        }
                    });
                }
            }
        });


    });
</script>

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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="startdateantenatal" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="text" class="form-control" id="enddateantenatal" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="searchantenatalbro"><i class="fa fa-search fa-lg"></i></button>
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
     $(document).ready(function () {
        $('#startdateantenatal').datepicker({dateFormat: "dd/mm/yy"});
        $('#enddateantenatal').datepicker({dateFormat: "dd/mm/yy"});
    });
    
    $('#searchantenatalbro').on('click', function () {
        var pmi_no = pmiNo;
        var hfc_cd1 = hfc_cd;
        var startdate = $('#startdateantenatal').val();
        var enddate = $('#enddateantenatal').val();
        
        var sDate = startdate.split('/');
        var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var eDate = enddate.split('/');
        var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
        
        var x = pmi_no + "|" + hfc_cd1+"|"+SnewDate+"|"+EnewDate;
        getBP(x);
        getAnteNatal(x);
    });
    
    $('#divAnteB').on('click', '#tblante tbody tr td a#delAN', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataEncounter = row.find('#ANencounter').val();
        var dataEpisode = row.find('#ANepisode').val();
        var pmi_no = pmiNo;
        var hfc_cd1 = hfc_cd;
        var datas2 = pmi_no + "|" + hfc_cd1;
        var datas = datas2 + "|" + dataEpisode + "|" + dataEncounter;
        
        var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();
        
        var startdate = $('#startdateantenatal').val();
        var enddate = $('#enddateantenatal').val();
        
        if(startdate === "" || enddate === ""){
                var data3 = datas2+"|"+yy + "-" + mm + "-" + dd+"|"+yy + "-" + mm + "-" + dd;
            }else{
                var sDate = startdate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = enddate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                var data3 = datas2+"|"+SnewDate+"|"+EnewDate;
            }

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
                            getBP(data3);
                            getAnteNatal(data3);
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
    
    $('#divAnteB').on('click', '#tblante tbody tr td a#upAN', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var fulldata = row.find('#updateAnteKey').val();
        var splitdata = fulldata.split("|");
        
        $('#anteGestation').val(splitdata[4]);
        $('#antePrest').val(splitdata[5]);
        $('#anteUltra').val(splitdata[6]);
        $('#anteBpSystolic').val(splitdata[7]);
        $('#anteBpDiastolic').val(splitdata[13]);
        $('#anteHb').val(splitdata[8]);
        $('#anteWt').val(splitdata[9]);
        $('#anteA').val(splitdata[10]);
        $('#anteS').val(splitdata[11]);
        $('#anteFollowUp').val(splitdata[12]);
        $('#ANTEkeyupdate').val(splitdata[0]+"|"+splitdata[1]+"|"+splitdata[2]+"|"+splitdata[3]);
        
        $('#btnAnteUpdateItem').show();
        $('#btnAnteAddItem').hide();
    });
    
    $('#divAnteB').on('click','#divAntenatal #keyBPDIV #updateBp',function(){
        var row = $(this).closest("div");
        var dataX = row.find('#updateBPKEY').val();
        var split = dataX.split("|");
        var pmi = split[0];
        var hfc = split[1];
        var episode = split[2];
        var encounter = split[3];
        var blood = split[14];
        var rhesus = split[15];
        var att = split[5];
        var rubela = split[7];
        var vdrl = split[8];
        var haptitis_antibody = split[9];
        var hepatitis_antigen = split[10];
        var Fdose = split[11];
        var Sdose = split[12];
        var booster = split[13];
        
        $('#ong-anteNatal1 #BPbGroup').val(blood);
        $('#ong-anteNatal1 #BPatt').val(att);
        $('#ong-anteNatal1 #BPbRhesus').val(rhesus);
        $('#ong-anteNatal1 #BPrubella').val(rubela);
        $('#ong-anteNatal1 #BPvdrl').val(vdrl);
        $('#ong-anteNatal1 #BPhBantibody').val(haptitis_antibody);
        $('#ong-anteNatal1 #BPhBantigen').val(hepatitis_antigen);
        $('#ong-anteNatal1 #BP1dose').val(Fdose);
        $('#ong-anteNatal1 #BP2dose').val(Sdose);
        $('#ong-anteNatal1 #BPbooster').val(booster);
        $('#ong-anteNatal1 #BPkeyupdate').val(pmi+"|"+hfc+"|"+episode+"|"+encounter);
        $('#btnBPUpdateItem').show();
        $('#btnBPAddItem').hide();
        
        console.log(split);
    });
    
    $('#divAnteB').on('click','#divAntenatal #keyBPDIV #delBp',function(){
        var row = $(this).closest("div");
        var dataX = row.find('#updateBPKEY').val();
        var split = dataX.split("|");
        var pmi = split[0];
        var hfc = split[1];
        var episode = split[2];
        var encounter = split[3];
        var datas2 = pmi + "|" + hfc;
        var datas = datas2 + "|" + episode + "|" + encounter;
        var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();
        
        var startdate = $('#startdateantenatal').val();
        var enddate = $('#enddateantenatal').val();
        
        if(startdate === "" || enddate === ""){
                var data3 = datas2+"|"+yy + "-" + mm + "-" + dd+"|"+yy + "-" + mm + "-" + dd;
            }else{
                var sDate = startdate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = enddate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                var data3 = datas2+"|"+SnewDate+"|"+EnewDate;
            }
        
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
                        data: {datas: datas, methodName: "delBP"},
                        success: function (databack) {
                            getBP(data3);
                            getAnteNatal(data3);
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
        
        
        console.log(split);
    });
</script>

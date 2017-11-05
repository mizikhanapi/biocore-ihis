<%-- 
    Document   : personalDetails
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

<div class="well well-sm well-primary" id="PIdiv">
    <div class="row">
        <div class="col-xs-3">
            <dt style="font-size: 18px;">Personal Info</dt>
        </div>
        <div class="col-xs-3">
            <dt style="font-size: 18px;">Gravida: </dt>
            <dd class="">Gravida: <strong>-</strong></dd>
            <dd class="">Parity: <strong>-</strong> </dd>
            <dd class="">LMP  <strong>-</strong></dd>
            <dd class="">EDD  <strong>-</strong> </dd>
            <dd class="">Scan EDD  <strong>-</strong></dd>
            <dd class="">Period Cycle  <strong>-</strong></dd>
        </div>
        <div class="col-xs-3">
            <dt style="font-size: 18px;">Past History: </dt>
            <dd>Past gynaelogical History: <strong>-</strong></dd>
            <dd>Past Medical History: <strong>-</strong></dd>
            <dd>Past Surgical History: <strong>-</strong></dd>
        </div>
    </div>  
</div>

<div class="panel panel-default" id="divPIpreg">
    <div class="panel-body">
        <dt style="font-size: 18px;">Pregnancy History</dt>
    </div>  
    <table class="table table-striped" style="margin-bottom: 0px;" id="tblPreg">
        <thead>
            <tr>
                <th>No.</th>
                <th>Year</th>
                <th>Gestation</th>
                <th>Place of Delivery</th>
                <th>Labour / Delivery</th>
                <th>WT</th>
                <th>Gender</th>
                <th>Comments</th>
                <th>Action</th>
            </tr>  
        </thead>
        <tbody>
        </tbody>
    </table>

</div>
<script>
    $('#divPIpreg ').on('click', '#tblPreg tbody tr td a#delPIpreg', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataEncounter = row.find('#PIpregencounter').val();
        var dataEpisode = row.find('#PIpregepisode').val();
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
                        url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
                        data: {datas: datas, methodName: "delPreg"},
                        success: function (databack) {
                            getPI(datas2);
                            getPIpreg(datas2);
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
    
    $('#divPIpreg ').on('click', '#tblPreg tbody tr td a#updatePIpreg', function (e) {
        e.preventDefault();
        $('#btnPIpregUpdate').show(); 
       $('#btnPIpreg').hide();
        var row = $(this).closest("tr");
        var fulldata = row.find('#PIdetailsFull').val();
        var splittedData = fulldata.split("|");
        var pmino = splittedData[0];
        var hfc = splittedData[1];
        var episode = splittedData[2];
        var encounter = splittedData[3];
        var year = splittedData[4];
        var gestation = splittedData[5];
        var place = splittedData[6];
        var labour = splittedData[7];
        var wt = splittedData[8];
        var description = splittedData[9];
        var coment = splittedData[10];
        var gender = splittedData[11];
        
        $('#ong-pDetails3 #PIupdateKey').val(pmino+"|"+hfc+"|"+episode+"|"+encounter);
        $('#ong-pDetails3 #PIyear').val(year);
        $('#ong-pDetails3 #PIgestation').val(gestation);
        $('#ong-pDetails3 #PIpod').val(place);
        $('#ong-pDetails3 #PIlabour').val(labour);
        $('#ong-pDetails3 #PIwt').val(wt);
        $('#ong-pDetails3 #PIgender').val(gender);
        $('#ong-pDetails3 #PIcoment').val(coment);
        
    });
</script>
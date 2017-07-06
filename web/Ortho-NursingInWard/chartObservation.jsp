<%-- 
    Document   : chartObservation
    Created on : Jun 7, 2017, 5:34:35 PM
    Author     : Mizi K (UI)
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="selectOBdate">
                <option selected="" disabled="">View by</option>
                <option value="Viewtoday">Today</option>
                <option value="Viewyesterday">Yesterday</option>
                <option value="View7day">7 Days</option>
                <option value="View30day">30 Days</option>
                <option value="View60day">60 Days</option>
                <option value="Viewcustomday">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="customDateOB">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control"   style="margin-bottom: 0px !important;" id="startDateOB">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control"   style="margin-bottom: 0px !important;" id="endDateOB">
            </div>
            <button type="submit" class="btn btn-default" id="btnCustomDateOB"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>
<div id="divBIWOB">
    <table class="table table-bordered table-striped" id="tblNIW_observation_chart" width="100%">
        <thead>
        <th>Date</th>
        <th>Time</th>
        <th>B/P</th>
        <th>PR</th>
        <th>RR</th>
        <th>SpO2</th>
        <th>Pain Scale</th>
        <th style="width: 30%;">Notes</th>
        <th>Approval</th>
        <th>Action</th>
        </thead>
        <tbody>
            <tr>
                <td colspan="10" align="center"> Please choose view history assessment to view the data </td>
                <td hidden=""></td>
                <td hidden=""></td>
                <td hidden=""></td>
                <td hidden=""></td>
                <td hidden=""></td>
                <td hidden=""></td>
                <td hidden=""></td>
                <td hidden=""></td>
                <td hidden=""></td>
            </tr>
        </tbody>
        <!--    <tr>
                <td>07/06/2017</td>
                <td>5:36 PM</td>
                <td>144</td>
                <td>43</td>
                <td>43</td>
                <td>35</td>
                <td>8</td>
                <td>Dia ni asik sakit je. mungkin perlu jagaan emosi.</td>
                <td>
                    <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
                </td>
                <td>
                    <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                    &nbsp;
                    <a id="MW_delete" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        
                </td>
            </tr>-->
    </table>
</div>
<script>
    //datatable
    $(document).ready(function () {
        //$('#tblNIW_observation_chart').dataTable();

        //set the custom date default hidden
        $('#customDateOB').hide();
        //$('#cobserved1 #btnNIWOBUP').hide();
        $('#startDateOB').datepicker({dateFormat: "dd/mm/yy"});
        $('#endDateOB').datepicker({dateFormat: "dd/mm/yy"});

    });

    //function view by date on change
    $('#selectOBdate').on('change', function () {
        var viewBy = $(this).val();
        var datas;
        var todayDate;

        var pmiOB = pmiNo;
        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();
        var hh = enDate.getHours();
        var m = enDate.getMinutes();
        var ss = enDate.getSeconds();
        var ms = enDate.getMilliseconds();

        todayDate = yy + "-" + mm + "-" + dd;


        if (viewBy === "Viewtoday") {
            $('#customDateOB').hide();
            datas = pmiOB + "|" + todayDate + "|today";

        } else if (viewBy === "Viewyesterday") {
            $('#customDateOB').hide();
            datas = pmiOB + "|" + todayDate + "|yesterday";

        } else if (viewBy === "View7day") {
            $('#customDateOB').hide();
            datas = pmiOB + "|" + todayDate + "|7day";

        } else if (viewBy === "View30day") {
            $('#customDateOB').hide();
            datas = pmiOB + "|" + todayDate + "|30day";

        } else if (viewBy === "View60day") {
            $('#customDateOB').hide();
            datas = pmiOB + "|" + todayDate + "|60day";

        } else if (viewBy === "Viewcustomday") {
            $('#customDateOB').show();
            datas = "null";
        }
        console.log(datas);
        ajaxObservation(datas);

    });

    $("#btnCustomDateOB").on('click', function () {
        var strtDate = $('#startDateOB').val();
        var endDate = $('#endDateOB').val();

        var pmiOB = pmiNo;

        var sDate = strtDate.split('/');
        var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var eDate = endDate.split('/');
        var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

        var data2 = pmiOB + "|" + SnewDate + "^" + EnewDate + "|custom";
        //console.log(data2);
        ajaxObservation(data2);

    });

    function ajaxObservation(datas) {
        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/ObservationFunction.jsp",
            data: {datas: datas, methodName: "view"},
            timeout: 10000,
            success: function (result) {
                //console.log(result);
                $('#divBIWOB').html(result);

            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
    }
    ;

    $('#divBIWOB').on('click', '#tblNIW_observation_chart #pendingNIWOB', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWOB').html();
        var sel = $('#selectOBdate').val();
        //console.log(dataX);


        bootbox.confirm({
            message: "Are you sure want to approve?",
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
                if (result === true) {
                    $.ajax({
                        type: "post",
                        url: "../Ortho-NursingInWard/controller/ObservationFunction.jsp",
                        timeout: 10000,
                        data: {datas: dataX, methodName: 'approving'},
                        success: function (result) {
                            console.log(result);
                            if (result.trim() === 'true') {
                                $('#selectOBdate').val(sel).change();
                            } else {

                            }
                        },
                        error: function (err) {

                        }
                    });
                }
            }
        });

    });

    $('#divBIWOB').on('click', '#tblNIW_observation_chart #delNIWOB', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWOB').html();
        var sel = $('#selectOBdate').val();

        bootbox.confirm({
            message: "Are you sure want to delete?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-danger'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-success'
                }
            },
            callback: function (result) {
                if (result === true) {
                    $.ajax({
                        type: "post",
                        url: "../Ortho-NursingInWard/controller/ObservationFunction.jsp",
                        timeout: 10000,
                        data: {datas: dataX, methodName: 'delete'},
                        success: function (result) {
                            console.log(result);
                            if (result.trim() === 'true') {
                                $('#selectOBdate').val(sel).change();
                            } else {

                            }
                        },
                        error: function (err) {

                        }
                    });
                }
            }
        });
    });


    $('#divBIWOB').on('click', '#tblNIW_observation_chart #editNIWOB', function (e) {
        e.preventDefault();
        $('#cobserved1 #btnNIWOBUPDATE').show();
        $('#cobserved1 #btnNIWOBADD').hide();

        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWOB').html();
        var sel = $('#selectOBdate').val();
        console.log(dataX);
        var sdataX = dataX.split("|");
        $('#NIWObsDate').val(sdataX[7]);
        $('#NIWObsTime').val(sdataX[16]);
        $('#NIWOBsystolic').val(sdataX[9]);
        $('#NIWOBdiatolic').val(sdataX[10]);
        $('#NIWOBpulse').val(sdataX[8]);
        $('#NIWOBrr').val(sdataX[11]);
        $('#NIWOBos').val(sdataX[12]);
        $('#NIWOBps').val(sdataX[13]);
        $('#NIWOBcomment').val(sdataX[14]);
        $('#NIWObsEpisodeDate').val(sdataX[2]);
        $('#NIWObsEncounterDate').val(sdataX[3]);
        $('#NIWObsPmi').val(sdataX[0]);
        $('#NIWObsHfc').val(sdataX[1]);
    });
</script>

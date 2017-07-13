<%-- 
    Document   : 4hly
    Created on : Jun 8, 2017, 4:22:58 PM
    Author     : Mizi K (UI)
--%>
<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="select4hlydate">
                <option value="none" selected="" disabled="">View by</option>
                <option value="Viewtoday">Today</option>
                <option value="Viewyesterday">Yesterday</option>
                <option value="View7day">7 Days</option>
                <option value="View30day">30 Days</option>
                <option value="View60day">60 Days</option>
                <option value="Viewcustomday">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="customDate4hly">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control"   style="margin-bottom: 0px !important;" id="startDate4hly">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control"   style="margin-bottom: 0px !important;" id="endDate4hly">
            </div>
            <button type="submit" class="btn btn-default" id="btnCustomDate4hly"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>
<div id="divBIW4hly">
    <table class="table table-bordered table-striped" id="tblNIW_4hly">
        <thead>
        <th>Date</th>
        <th>Time 4hly obs.</th>
        <th>Site of IV Canulation</th>
        <th>Pain Score</th>
        <th>Yes / No</th>
        <th>Additive</th>
        <th>Thrombo Phlebitis</th>
        <th>V.I.P. Score</th>
        <th>Approval</th>

        </thead>
        <tbody>
            <tr>
                <td colspan="9" align="center"> Please choose view history assessment to view the data </td>
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
    </table>
</div>
<script>
    //datatable
    $(document).ready(function () {
        //$('#tblNIW_observation_chart').dataTable();

        //set the custom date default hidden
        $('#customDate4hly').hide();

        $('#startDate4hly').datepicker({dateFormat: "dd/mm/yy"});
        $('#endDate4hly').datepicker({dateFormat: "dd/mm/yy"});

    });

    //function view by date on change
    $('#select4hlydate').on('change', function () {
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
            $('#customDate4hly').hide();
            datas = pmiOB + "|" + todayDate + "|today";

        } else if (viewBy === "Viewyesterday") {
            $('#customDate4hly').hide();
            datas = pmiOB + "|" + todayDate + "|yesterday";

        } else if (viewBy === "View7day") {
            $('#customDate4hly').hide();
            datas = pmiOB + "|" + todayDate + "|7day";

        } else if (viewBy === "View30day") {
            $('#customDate4hly').hide();
            datas = pmiOB + "|" + todayDate + "|30day";

        } else if (viewBy === "View60day") {
            $('#customDate4hly').hide();
            datas = pmiOB + "|" + todayDate + "|60day";

        } else if (viewBy === "Viewcustomday") {
            $('#customDate4hly').show();
            datas = "null";
        }
        //console.log(datas);
        ajax4hly(datas);

    });

    $("#btnCustomDate4hly").on('click', function () {
        var strtDate = $('#startDate4hly').val();
        var endDate = $('#endDate4hly').val();

        var pmiOB = pmiNo;

        var sDate = strtDate.split('/');
        var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var eDate = endDate.split('/');
        var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

        var data2 = pmiOB + "|" + SnewDate + "^" + EnewDate + "|custom";
        //console.log(data2);
        ajax4hly(data2);

    });

    function ajax4hly(datas) {
        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/4hlyFunction.jsp",
            data: {datas: datas, methodName: "view"},
            timeout: 10000,
            success: function (result) {
                //console.log(result);
                $('#divBIW4hly').html(result);

            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
    }
    ;

    $('#divBIW4hly').on('click', '#tblNIW_4hly #delNIW4hly', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataX = row.find('#priNIW4hly').html();
        var sel = $('#select4hlydate').val();

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
                        url: "../Ortho-NursingInWard/controller/4hlyFunction.jsp",
                        timeout: 10000,
                        data: {datas: dataX, methodName: 'delete'},
                        success: function (result) {
                            console.log(result);
                            if (result.trim() === 'true') {
                                $('#select4hlydate').val(sel).change();
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

    $('#divBIW4hly').on('click', '#tblNIW_4hly #editNIW4hly', function (e) {
        e.preventDefault();
        $('#4hly #btnNIW4hlyUPDATE').show();
        $('#4hly #btnNIW4hlyADD').hide();

        var row = $(this).closest("tr");
        var dataX = row.find('#priNIW4hly').html();
        var sel = $('#select4hlydate').val();
        console.log(dataX);
        var sdataX = dataX.split("|");
        $('input[name="radio3"][value="' + sdataX[13] + '"]').prop('checked', true);
        $('input[name="radio4"][value="' + sdataX[14] + '"]').prop('checked', true);
        
        $('input[id="hourlychoose1"][value="' + sdataX[8] + '"]').prop('checked', true);
        $('input[id="hourlychoose2"][value="' + sdataX[9] + '"]').prop('checked', true);
        $('input[id="hourlychoose3"][value="' + sdataX[10] + '"]').prop('checked', true);
        $('input[id="hourlychoose4"][value="' + sdataX[11] + '"]').prop('checked', true);
        $('input[id="hourlychoose5"][value="' + sdataX[12] + '"]').prop('checked', true);
        
        $('input[id="Additive1"][value="' + sdataX[15] + '"]').prop('checked', true);
        $('input[id="Additive2"][value="' + sdataX[16] + '"]').prop('checked', true);
        $('input[id="Additive3"][value="' + sdataX[17] + '"]').prop('checked', true);
        
        $('#timeNIW4hly').val(sdataX[19]);
        $('#NIW4hlyps').val(sdataX[7]);
        $('#dateNIW4hly').val(sdataX[4]);
        $('#site4canulation4hly').val(sdataX[6]);
        $('#NIW4hlyEpisodeDate').val(sdataX[2]);
        $('#NIW4hlyEncounterDate').val(sdataX[3]);
        $('#NIW4hlyPmi').val(sdataX[0]);
        $('#NIW4hlyHfc').val(sdataX[1]);
    });

</script>
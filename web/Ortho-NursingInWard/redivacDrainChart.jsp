<%-- 
    Document   : redivacDrainChart
    Created on : Jun 9, 2017, 3:21:44 PM
    Author     : Mizi K (UI)
--%>
<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="selectredivacdate">
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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="customDateredivac">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="startDateRedivac" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="text" class="form-control" id="endDateRedivac" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg" id="btnCustomDateredivac"></i></button>
        </div>
    </div>
</div>
<div id="divBIWredivac"><table class="table table-bordered" id="tblNIW_redivac">
        <tr>
            <th>Date</th>
            <th>Shift</th>
            <th>Total in Bottle</th>
            <th>Amount<br>Increased / shift</th>
            <th>Total in Bottle<br>end of shift</th>
            <th>Remarks</th>
            <th>Action</th>
        </tr>
        <tr>
            <td colspan="7" align="center"> Please choose view history assessment to view the data </td>
            <td hidden=""></td>
            <td hidden=""></td>
            <td hidden=""></td>
            <td hidden=""></td>
            <td hidden=""></td>
            <td hidden=""></td>
        </tr>
    </table></div>

<script>
    $(document).ready(function () {
        //$('#tblNIW_observation_chart').dataTable();

        //set the custom date default hidden
        $('#customDateredivac').hide();

        $('#startDateRedivac').datepicker({dateFormat: "dd/mm/yy"});
        $('#endDateRedivac').datepicker({dateFormat: "dd/mm/yy"});

    });

    //function view by date on change
    $('#selectredivacdate').on('change', function () {
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
            $('#customDateredivac').hide();
            datas = pmiOB + "|" + todayDate + "|today";

        } else if (viewBy === "Viewyesterday") {
            $('#customDateredivac').hide();
            datas = pmiOB + "|" + todayDate + "|yesterday";

        } else if (viewBy === "View7day") {
            $('#customDateredivac').hide();
            datas = pmiOB + "|" + todayDate + "|7day";

        } else if (viewBy === "View30day") {
            $('#customDateredivac').hide();
            datas = pmiOB + "|" + todayDate + "|30day";

        } else if (viewBy === "View60day") {
            $('#customDateredivac').hide();
            datas = pmiOB + "|" + todayDate + "|60day";

        } else if (viewBy === "Viewcustomday") {
            $('#customDateredivac').show();
            datas = "null";
        }
        //console.log(datas);
        ajaxredivac(datas);

    });

    $("#btnCustomDateredivac").on('click', function () {
        var strtDate = $('#startDateRedivac').val();
        var endDate = $('#endDateRedivac').val();

        var pmiOB = pmiNo;

        var sDate = strtDate.split('/');
        var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var eDate = endDate.split('/');
        var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

        var data2 = pmiOB + "|" + SnewDate + "^" + EnewDate + "|custom";
        //console.log(data2);
        ajaxredivac(data2);

    });

    function ajaxredivac(datas) {
        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/redivacFunction.jsp",
            data: {datas: datas, methodName: "view"},
            timeout: 10000,
            success: function (result) {
                //console.log(result);
                $('#divBIWredivac').html(result);

            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
    }

//delete
    $('#divBIWredivac').on('click', '#tblNIW_redivac #delNIWredivac', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWredavic').html();
        var sel = $('#selectredivacdate').val();
        console.log(dataX);

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
                        url: "../Ortho-NursingInWard/controller/redivacFunction.jsp",
                        timeout: 10000,
                        data: {datas: dataX, methodName: 'delete'},
                        success: function (result) {
                            console.log(result);
                            if (result.trim() === 'true') {
                                $('#selectredivacdate').val(sel).change();
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


//update
    $('#divBIWredivac').on('click', '#tblNIW_redivac #editNIWredivac', function (e) {
        e.preventDefault();
        $('#redivacDrainChart #btnNIWredivacUPDATE').show();
        $('#redivacDrainChart #btnNIWredivacADD').hide();

        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWredavic').html();
        var sel = $('#selectredivacdate').val();
        console.log(dataX);
        var sdataX = dataX.split("|");

        $('#NIWredivacEpisodeDate').val(sdataX[2]);
        $('#NIWredivacEncounterDate').val(sdataX[3]);
        $('#NIWredivacPmi').val(sdataX[0]);
        $('#NIWredivacHfc').val(sdataX[1]);
        $('#NIWRedivacDate').val(sdataX[4]);
        $("input[name='NIWredivacShift'][value='" + sdataX[5] + "']").prop('checked', true);
        $("#NIWredivacTIB").val(sdataX[6]);
        $("#NIWredivacAIS").val(sdataX[7]);
        $("#NIWredivacTBES").val(sdataX[8]);
        $("#NIWredivacREMARK").val(sdataX[9]);
    });
</script>
<%-- 
    Document   : FitsChart
    Created on : Jun 9, 2017, 12:55:20 PM
    Author     : user
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="selectfitsdate">
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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="customDatefits">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="startDateFits" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="endDateFits" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="btnCustomDatefits"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>
<div id="divBIWfits">
    <table class="table table-bordered" id="tblNIW_fits">
        <thead>
            <th hidden=""></th>
            <th>Date</th>
            <th>Time</th>
            <th>Nature of Fits</th>
            <th>Duration</th>
            <th>Remarks</th>
            <th>Action</th>
        </thead>
    </table>
</div>
<script>
    $(document).ready(function () {
        //$('#tblNIW_observation_chart').dataTable();

        //set the custom date default hidden
        $('#customDatefits').hide();

        $('#startDateFits').datepicker({dateFormat: "dd/mm/yy"});
        $('#endDateFits').datepicker({dateFormat: "dd/mm/yy"});

    });

    //function view by date on change
    $('#selectfitsdate').on('change', function () {
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
            $('#customDatefits').hide();
            datas = pmiOB + "|" + todayDate + "|today";

        } else if (viewBy === "Viewyesterday") {
            $('#customDatefits').hide();
            datas = pmiOB + "|" + todayDate + "|yesterday";

        } else if (viewBy === "View7day") {
            $('#customDatefits').hide();
            datas = pmiOB + "|" + todayDate + "|7day";

        } else if (viewBy === "View30day") {
            $('#customDatefits').hide();
            datas = pmiOB + "|" + todayDate + "|30day";

        } else if (viewBy === "View60day") {
            $('#customDatefits').hide();
            datas = pmiOB + "|" + todayDate + "|60day";

        } else if (viewBy === "Viewcustomday") {
            $('#customDatefits').show();
            datas = "null";
        }
        console.log(datas);
        ajaxfits(datas);

    });

    $("#btnCustomDatefits").on('click', function () {
        var strtDate = $('#startDateFits').val();
        var endDate = $('#endDateFits').val();

        var pmiOB = pmiNo;

        var sDate = strtDate.split('/');
        var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var eDate = endDate.split('/');
        var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

        var data2 = pmiOB + "|" + SnewDate + "^" + EnewDate + "|custom";
        //console.log(data2);
        ajaxfits(data2);

    });

    function ajaxfits(datas) {
        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/FitFunction.jsp",
            data: {datas: datas, methodName: "view"},
            timeout: 10000,
            success: function (result) {
                //console.log(result);
                $('#divBIWfits').html(result);

            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err.toString());
            }
        });
    }

//delete
    $('#divBIWfits').on('click', '#tblNIW_fits #delNIWfits', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWfits').html();
        var sel = $('#selectfitsdate').val();
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
                        url: "../Ortho-NursingInWard/controller/FitFunction.jsp",
                        timeout: 10000,
                        data: {datas: dataX, methodName: 'delete'},
                        success: function (result) {
                            console.log(result);
                            if (result.trim() === 'true') {
                                $('#selectfitsdate').val(sel).change();
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
    $('#divBIWfits').on('click', '#tblNIW_fits #editNIWfits', function (e) {
        e.preventDefault();
        $('#FitsChart #btnNIWFitsUPDATE').show();
        $('#FitsChart #btnNIWFitsADD').hide();

        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWfits').html();
        var sel = $('#selectfitsdate').val();
        console.log(dataX);
        var sdataX = dataX.split("|");

        $('#NIWfitEpisodeDate').val(sdataX[2]);
        $('#NIWfitEncounterDate').val(sdataX[3]);
        $('#NIWfitPmi').val(sdataX[0]);
        $('#NIWfitHfc').val(sdataX[1]);
        $('#NIWFitsDate').val(sdataX[4]);
        $("#NIWFitsTime").val(sdataX[6]);
        $("#NIWFitsNOF").val(sdataX[7]);
        $("#NIWFitsDuration").val(sdataX[8]);
        $("#NIWFitsRemark").val(sdataX[9]);
    });
</script>

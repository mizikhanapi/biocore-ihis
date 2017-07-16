<%-- 
    Document   : chartUrine
    Created on : Jun 9, 2017, 4:41:49 PM
    Author     : Mizi K (UI)
--%>
<!--<link href="../assets/css/chart.css" rel="stylesheet" type="text/css"/>-->
<script src="../assets/js/Chart.bundle.js" type="text/javascript"></script>
<!--<script src="../assets/js/Chart.js" type="text/javascript"></script>-->
<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
                        <select class="form-control" id="selecturdate">
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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="customeDateur">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="startDateur" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="endDateur" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="btnCustomeDareur"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>
<div id="divBIWur"></div>
<script>
    $(document).ready(function () {
        //$('#tblNIW_observation_chart').dataTable();

        //set the custom date default hidden
        $('#customeDateur').hide();

        $('#startDateur').datepicker({dateFormat: "dd/mm/yy"});
        $('#endDateur').datepicker({dateFormat: "dd/mm/yy"});

    });

    //function view by date on change
    $('#selecturdate').on('change', function () {
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
            $('#customeDateur').hide();
            datas = pmiOB + "|" + todayDate + "|today";

        } else if (viewBy === "Viewyesterday") {
            $('#customeDateur').hide();
            datas = pmiOB + "|" + todayDate + "|yesterday";

        } else if (viewBy === "View7day") {
            $('#customeDateur').hide();
            datas = pmiOB + "|" + todayDate + "|7day";

        } else if (viewBy === "View30day") {
            $('#customeDateur').hide();
            datas = pmiOB + "|" + todayDate + "|30day";

        } else if (viewBy === "View60day") {
            $('#customeDateur').hide();
            datas = pmiOB + "|" + todayDate + "|60day";

        } else if (viewBy === "Viewcustomday") {
            $('#customeDateur').show();
            datas = "null";
        }
        //console.log(datas);
        ajaxur(datas);

    });

    $("#btnCustomeDareur").on('click', function () {
        var strtDate = $('#startDateur').val();
        var endDate = $('#endDateur').val();

        var pmiOB = pmiNo;

        var sDate = strtDate.split('/');
        var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        var eDate = endDate.split('/');
        var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

        var data2 = pmiOB + "|" + SnewDate + "^" + EnewDate + "|custom";
        //console.log(data2);
        ajaxur(data2);

    });

    function ajaxur(datas) {
        $.ajax({
            type: "post",
            url: "../Ortho-NursingInWard/controller/UrineFunction.jsp",
            data: {datas: datas, methodName: "view"},
            timeout: 10000,
            success: function (result) {
                //console.log(result);
                $('#divBIWur').html(result);

            },
            error: function (err) {
                bootbox.alert("something wrong,error: " + err);
            }
        });
    }


    $('#divBIWur').on('click', '#tblNIW_ur #delNIWur', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWur').html();
        var sel = $('#selecturdate').val();
//        console.log(dataX);

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
                        url: "../Ortho-NursingInWard/controller/UrineFunction.jsp",
                        timeout: 10000,
                        data: {datas: dataX, methodName: 'delete'},
                        success: function (result) {
                            console.log(result);
                            if (result.trim() === 'true') {
                                $('#selecturdate').val(sel).change();
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

    $('#divBIWur').on('click', '#tblNIW_ur #editNIWur', function (e) {
        e.preventDefault();
        $('#chartUrine #btnNIWurUPDATE').show();
        $('#chartUrine #btnNIWurADD').hide();

        var row = $(this).closest("tr");
        var dataX = row.find('#priNIWur').html();
        var sel = $('#selecturdate').val();
        var sdataX = dataX.split("|");

        $('#NIWurEpisodeDate').val(sdataX[2]);
        $('#NIWurEncounterDate').val(sdataX[3]);
        $('#NIWurPmi').val(sdataX[0]);
        $('#NIWurHfc').val(sdataX[1]);
        $('#NIWDateurine').val(sdataX[7]);
        console.log(dataX);
        var splt = sdataX[4].split(":");
        $("input[name='urinechrt'][value='" + splt[0] + "']").prop('checked', true);
        $("#NIWam-pm").val(splt[1]);
        $("#NIWTemperature").val(sdataX[5]);
        $("#NIWpulseurine").val(sdataX[6]);
    });
</script>
<%-- 
    Document   : dateSelect
    Created on : 24-Dec-2018, 14:04:01
    Author     : Shay
--%>
<div class="form-group" id="divDate">
<!--    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">Date</label>
        <div class="form-group">
                <select id="bydateSel" name="bydateSel" class="form-control" required="">
                    <option selected=""  disabled="" value="-"> Please select Date</option>
                    <option   value="today"> Today</option>
                    <option   value="yesterday"> Yesterday</option>
                    <option   value="7"> 7 Days</option>
                    <option   value="30"> 30 days</option>
                    <option   value="60"> 60 days</option>
                    <option   value="custom"> Select Date</option>
                </select>
                <button class="btn btn-default" id="PIS_ScreenSearch"><i class=" fa fa-search" style=" padding-right: 5px;padding-left: 5px;color: black;"></i></button>
        </div>
         
        <div class="col-md-2" id="refreshbuttondiv">
            <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
        </div>
    </div>-->
    <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Show list of order: </label>
            <div class="col-md-4">
                <div class="input-group">
                    <select class="form-control"  id="bydateSel" style="margin-bottom: 0px !important;">
                        <option selected=""  disabled="" value="-"> Please select Date</option>
                        <option value="today"> Today</option>
                        <option value="yesterday"> Yesterday</option>
                        <option value="7"> 7 Days</option>
                        <option value="30"> 30 days</option>
                        <option value="60"> 60 days</option>
                        <option value="custom"> Select Date</option>
                    </select>
                    <span class="input-group-btn" id="spansearchbutton">
                        <button class="btn btn-default" id="PIS_ScreenSearch"><i class=" fa fa-search" style=" padding-right: 5px;padding-left: 5px;color: black;"></i></button>
                    </span>
                </div>
            </div>
            <div id="refreshbuttondiv">
            <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>
       </div>
    <div class="form-group select-type" id="OM_selectDate" style="display: none;">
        <label class="col-md-4 control-label" for="textinput">From</label>
        <div class="col-md-2">
            <input type="text" id="OM_DateFrom" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
        </div>

        <label class="col-md-1 control-label" for="textinput">To</label>
        <div class="col-md-2">
            <input type="text" id="OM_DateTo" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
        </div>
    </div>

</div>
<script>
    $("#OM_selectDate").hide();
    $('#OM_DateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });


    //--- initialise datepicker for to after changes on from ------------
    $('#OM_DateFrom').on('change', function () {

        $("#OM_DateTo").datepicker("destroy");
        $('#OM_DateTo').val('');

        var fromDate = $("#OM_DateFrom").datepicker("getDate");

        $('#OM_DateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });

    });

    //function on change select
    $('#bydateSel').on('change', function () {
        var menu = $(this).val();

        if (menu === "custom") {
            $("#OM_selectDate").show();
        } else {
            $("#OM_selectDate").hide();
        }
    });
</script>
<%-- 
    Document   : manageLabSpecimenMasterMain
    Created on : Jan 15, 2018, 5:57:10 PM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">

</h4>

<div style="width:50%; margin: auto;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput">Show list of order: </label>
            <div class="col-md-5">
                <div class="input-group">
                    <select class="form-control"  id="LAB_SpecimenTime" style="margin-bottom: 0px !important;">
                        <option selected=""  disabled="" value="-"> Please select Date</option>
                        <option value="today"> Today</option>
                        <option value="yesterday"> Yesterday</option>
                        <option value="7"> 7 Days</option>
                        <option value="30"> 30 days</option>
                        <option value="60"> 60 days</option>
                        <option value="custom"> Select Date</option>
                    </select>
                    <span class="input-group-btn">
                        <button class="btn btn-default" id="LAB_SpecimenSearch"><i class=" fa fa-search" style=" padding-right: 5px;padding-left: 5px;color: black;"></i></button>
                    </span>
                </div>
            </div>
            <button id="LAB_SpecimenRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
        </div>
        <div class="form-group select-type" id="OM_selectDate">
            <label class="col-md-2 control-label" for="textinput">From</label>
            <div class="col-md-3">
                <input type="text" id="OM_DateFrom" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
            </div>
            <label class="col-md-1 control-label" for="textinput">To</label>
            <div class="col-md-3">
                <input type="text" id="OM_DateTo" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
            </div>
        </div>
    </div>
</div>

<script>

    $(function () {


        $("#OM_selectDate").hide();

        $('#OM_DateFrom').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d',
            beforeShow: function () {
                setTimeout(function () {
                    $('.ui-datepicker').css('z-index', 999999999);
                }, 0);
            }
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
                maxDate: '+0d',
                beforeShow: function () {
                    setTimeout(function () {
                        $('.ui-datepicker').css('z-index', 999999999);
                    }, 0);
                }
            });

        });

        //function on change select
        $('#LAB_SpecimenTime').on('change', function () {

            var menu = $(this).val();

            if (menu === "custom") {
                $("#OM_selectDate").show();
            } else {
                $("#OM_selectDate").hide();
            }

        });


        //-------------------------refresh the order table ---------------------------------------
        $('#LAB_SpecimenRefresh').on('click', function () {

            var process = $('#LAB_SpecimenTime').val();
            var dateFrom, dateTo;

            if (process === null || process === "" || process === "-") {

                bootbox.alert("Please Select Correct Filter And Press Refresh Button");

            } else {

                $('#lisLabRequestSpecimenMasterContent').html('<div class="loading">Loading</div>');

                if (process === "custom") {
                    dateFrom = $("#OM_DateFrom").val();
                    dateTo = $("#OM_DateTo").val();
                } else {
                    dateFrom = "";
                    dateTo = "";
                }

                var data = {
                    process: process,
                    dateFrom: dateFrom,
                    dateTo: dateTo
                };

                $.ajax({
                    type: 'POST',
                    url: "manageLabSpecimenMasterTable.jsp",
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        $('#lisLabRequestSpecimenMasterContent').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert('Opps: ' + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        $('.loading').hide();
                    }

                });

            }


        });
        //-------------------------refresh the order table ---------------------------------------


        //-------------------------search the order table ---------------------------------------
        $('#LAB_SpecimenSearch').on('click', function () {

            var process = $('#LAB_SpecimenTime').val();
            var dateFrom, dateTo;

            if (process === null || process === "" || process === "-") {

                bootbox.alert("Please Select Correct Filter And Press Refresh Button");

            } else {

                $('#lisLabRequestSpecimenMasterContent').html('<div class="loading">Loading</div>');

                if (process === "custom") {
                    dateFrom = $("#OM_DateFrom").val();
                    dateTo = $("#OM_DateTo").val();
                } else {
                    dateFrom = "";
                    dateTo = "";
                }

                var data = {
                    process: process,
                    dateFrom: dateFrom,
                    dateTo: dateTo
                };

                $.ajax({
                    type: 'POST',
                    url: "manageLabSpecimenMasterTable.jsp",
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        $('#lisLabRequestSpecimenMasterContent').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert('Opps: ' + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        $('.loading').hide();
                    }

                });

            }


        });
        //-------------------------search the order table ---------------------------------------


    });

</script>
<%-- 
    Document   : patientDispenseListMain
    Created on : Oct 30, 2018, 10:27:32 PM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ORDER LIST
</h4>

<div style="width:50%; margin: auto;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Show list of order: </label>
            <div class="col-md-5">
                <select class="form-control"  id="PIS_DispenseTime">
                    <option value="1">Today's Orders</option>
                    <option value="2">All Orders</option>
                </select>

            </div>
            <div class="col-md-2">
                <button id="PIS_DispenseRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {

        //-------------------------refresh the order table ---------------------------------------
        $('#PIS_DispenseRefresh').on('click', function () {

            $('#patientDispenseListContent').html('<div class="loading">Loading</div>');

            var process = $('#PIS_DispenseTime').val();

            var data = {
                process: process
            };

            $.ajax({
                type: 'POST',
                url: "patientDispenseListTable.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    $('#patientDispenseListContent').html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert('Opps! ' + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }

            });

        });

    });

</script>
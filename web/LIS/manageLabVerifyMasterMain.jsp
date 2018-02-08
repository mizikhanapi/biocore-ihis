<%-- 
    Document   : manageLabVerifyMasterMain
    Created on : Jan 16, 2018, 1:44:04 AM
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
            <label class="col-md-3 control-label" for="textinput">Show list of order: </label>
            <div class="col-md-3">
                <select class="form-control"  id="LAB_VerifyTime">
                    <option value="1">Today's Orders</option>
                    <option value="2">All Orders</option>
                </select>

            </div>
            <div class="col-md-2">
                <button id="LAB_VerifyRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>
        </div>
    </div>
</div>

<script>

    $(function () {

        //-------------------------refresh the order table ---------------------------------------
        $('#LAB_VerifyRefresh').on('click', function () {

            $('#lisLabRequestVerifyMasterContent').html('<div class="loading">Loading</div>');

            var process = $('#LAB_VerifyTime').val();

            var data = {
                process: process
            };

            console.log(data);

            $.ajax({
                type: 'POST',
                url: "manageLabVerifyMasterTable.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    $('#lisLabRequestVerifyMasterContent').html(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert('Opps! ' + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }

            });

        });
        //-------------------------refresh the order table ---------------------------------------

    });

</script>
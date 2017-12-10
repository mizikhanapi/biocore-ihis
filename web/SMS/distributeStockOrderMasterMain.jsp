<%-- 
    Document   : distributeStockOrderMasterMain
    Created on : Nov 16, 2017, 10:57:47 AM
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
                <select class="form-control"  id="STOCK_DistributeOrderTime">
                    <option value="1">Today's Orders</option>
                    <option value="2">All Orders</option>
                </select>

            </div>
            <div class="col-md-2">
                <button id="STOCK_DistributeRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>
        </div>
    </div>
</div>

<script>

    $(function () {

        //-------------------------refresh the order table ---------------------------------------
        $('#STOCK_DistributeRefresh').on('click', function () {

            $('#distributeStockOrderMasterContent').html('<div class="loading">Loading</div>');

            var process = $('#STOCK_DistributeOrderTime').val();

            var data = {
                process: process
            };
            
            console.log(data);

            $.ajax({
                type: 'POST',
                url: "distributeStockOrderMasterTable.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    $('#distributeStockOrderMasterContent').html(data);
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
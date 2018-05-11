<%-- 
    Document   : risManageOrderMaster_main
    Created on : Apr 24, 2017, 6:02:03 PM
    Author     : user
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
                <select class="form-control"  id="RMOM_oderTime">
                    <option value="1">Today's Orders</option>
                    <option value="2">All Orders</option>
                </select>

            </div>
            <div class="col-md-2">
                <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>
        </div>
    </div>
</div>

<script>
    
    function reloadOrderMasterList(){
        $('#risOrderListContent').html('<div class="loading">Loading</div>');
            
            var process = $('#RMOM_oderTime').val();
            
            var data = {
                process: process
            };
            
            $.ajax({
                type: 'POST',
                url: "risManageOrderListTable.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                        $('#risOrderListContent').html(data);
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert('Opps! '+ errorThrown);
                    },
                complete: function (jqXHR, textStatus ) {
                        $('.loading').hide();
                }
                
            });
    }
    
    $(function(){
        
        //-------------------------refresh the order table ---------------------------------------
        $('#RMOM_btnRefresh').on('click', function(){
            
            reloadOrderMasterList();
            
        });
        
        $('#RMOM_oderTime').on('change', function(){
            $('#RMOM_btnRefresh').click();
        });
        
    });
    
</script>
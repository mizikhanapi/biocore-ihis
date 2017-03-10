<%-- 
    Document   : transaction_table
    Created on : Feb 27, 2017, 6:10:23 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>
<table  id="THE_transactionTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Transaction Code</th>
    <th>Transaction Name</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT transaction_code, transaction_name, status FROM adm_txn_code";
        ArrayList<ArrayList<String>> dataTXN = conn.getData(sql);

        int size = dataTXN.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="TT_hidden" type="hidden" value="<%=String.join("|", dataTXN.get(i))%>">
        <td><%= dataTXN.get(i).get(0)%></td>
        <td><%= dataTXN.get(i).get(1)%></td>
        <td><%if(dataTXN.get(i).get(2).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td>


        <td style="width: 5% ">

            <!-- Update Part Start -->
            <a id="TT_btnUpdate" data-toggle="modal" data-target="#TT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td style="width: 5% ">
            <!-- Delete Button Start -->
            <a id="TT_btnDelete" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
</table>    


<div class="modal fade" id="TT_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Transaction Code</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Transaction Code</label>
                        <div class="col-md-8">
                            <input id="TT_transactionCode"  type="text" placeholder="Code required" class="form-control input-md" readonly="true">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Transaction Name</label>
                        <div class="col-md-8">
                            <input id="TT_transactionName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="TT_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="TT_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="TT_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->


<script type="text/javascript" charset="utf-8">
    
    $('#transactionTable').off('click', '#THE_transactionTable #TT_btnUpdate').on('click', '#THE_transactionTable #TT_btnUpdate', function (e) {
        e.preventDefault();
  
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#TT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var transactionCode = arrayData[0], transactionName = arrayData[1], status = arrayData[2];
        //set value in input on the top
        $('#TT_transactionCode').val(transactionCode);
        $('#TT_transactionName').val(transactionName);
        
        if(status === '1')
            $('#TT_status').val(1);
        else
            $('#TT_status').val(0);
          
        
    });
    
    $("#TT_btn_update_").off('click').on('click', function (e) {
        
        e.preventDefault();
        //console.log("entering Update");
        var transactionCode = $("#TT_transactionCode").val();
        var transactionName = $("#TT_transactionName").val();
        var status = $("#TT_status").val();

       if(transactionName === "" || transactionName === null){
            bootbox.alert("Fill in the system name");
            $("#TT_transactionName").focus();
            
        }
        else if(status !=='1' && status !=='0'){
            alert("Select the status");
        }
        else{
            var data = {
                transactionCode : transactionCode,
                transactionName : transactionName,
                status : status
            };
            
            //console.log("entering Ajax");
            $.ajax({
                url: "transaction_update.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#transactionTable').load('transaction_table.jsp');
                            $(".modal-backdrop").hide();
                            //alert("Update Success");
                            
                            bootbox.alert({
                                    message: "Transaction code is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Update failed!");
                        }

                },
                error: function (err) {
                    bootbox.alert("Error! Ajax failed!!");
                }

            });
        }   


    });
        
    
     $('#transactionTable').off('click', '#THE_transactionTable #TT_btnDelete').on('click', '#THE_transactionTable #TT_btnDelete', function (e) {
         
         e.preventDefault();
         
        var row = $(this).closest("tr");
        var rowData = row.find("#TT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var transactionCode = arrayData[0];
        
        
        bootbox.confirm({
            message: "Are you sure want to delete this item? " + transactionCode,
            title: "Delete Item?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result === true) {
                    
                var data = {
                    transactionCode : transactionCode 
                };

                $.ajax({
                    url: "transaction_delete.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#transactionTable').load('transaction_table.jsp');
                            //alert("Delete Success");
                            
                            bootbox.alert({
                                    message: "A transaction code is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Delete failed!");
                            
                        } else{
                            bootbox.alert(datas.trim());
                            
                        }

                    },
                    error: function (err) {
                        bootbox.alert("Error! Deletion failed!!");
                    }

                });
                    
                } else {
                    console.log("Process Is Canceled");
                }

            }
        });
         
          
     });
    

</script>  





<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_transactionTable').DataTable();
    });
</script>


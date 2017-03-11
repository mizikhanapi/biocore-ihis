<%-- 
    Document   : transaction_main
    Created on : Feb 27, 2017, 3:34:19 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    TRANSACTION CODE MANAGEMENT
    <span class="pull-right">
        <button class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#TM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Transaction Code</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="TM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Transaction Code</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="TM_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Transaction Code</label>
                        <div class="col-md-8">
                            <input id="TM_transactionCode"  type="text" placeholder="Code required" class="form-control input-md" maxlength="30">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Transaction Name</label>
                        <div class="col-md-8">
                            <input id="TM_transactionName"  type="text" placeholder="Name required" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="TM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="TM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="TM_btnReset" class="btn btn-default btn-block btn-lg"  role="button" >Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->


 <script>

        w3IncludeHTML();

        $(document).ready(function () {
            
            function TM_reset() {
                document.getElementById("TM_addForm").reset();
                
                
            }

            $('#TM_btnReset').on('click', function () {
                TM_reset();
            });

            $('#TM_btnAdd').on('click', function () {
                               
                var transactionCode = $('#TM_transactionCode').val();
                var transactionName = $('#TM_transactionName').val();
                var status = $('#TM_status').val();

                if (transactionCode === "") {
                    bootbox.alert("Fill in the transaction code");
                    
                    
                } else if (transactionName === "") {
                    bootbox.alert("Fill in the  transaction name");
                    
                    
                } else if (status !== "1" && status !== "0") {
                    bootbox.alert("Select Any Status");
                   
                } else {

                    var data = {
                        transactionCode : transactionCode,
                        transactionName : transactionName,
                        status: status
                    };

                    $.ajax({
                        url: "transaction_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#transactionTable').load('transaction_table.jsp');
                                $('#TM_detail').modal('hide');
                                //alert("Insertion Success");
                                bootbox.alert({
                                message: "New transaction code is added",
                                title: "Process Result",
                                backdrop: true
                            });
                                TM_reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                bootbox.alert("Insertion failed!");
                                //$('#TM_detail').modal('hide');
                                TM_reset();
                                
                            } else{
                                bootboxalert(datas.trim());
                                $('#TM_transactionCode').val("");
                                
                            }
                            
                        },
                        error: function (err) {
                            console.log("Ajax Is Not Success");
                        }

                    });
                }

            });


        });



    </script>



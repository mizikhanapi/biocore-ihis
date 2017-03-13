


<h3><span id="DLT_detailOf"></span></h3>

<span id="DLT_detailOf"></span>
<table  id="THE_detailTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Master Code</th>
    <th>Master Name</th>
    <th>Detail Code</th>
    <th>Detail Name</th>
    <th>Priority</th>
    <th>Start Date</th>
    <th>End Date</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody id="detailTable_body">

</tbody>
</table>

<!-- Modal Update -->
<div class="modal fade" id="DLT_detail2_" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Lookup Detail</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Master Code</label>
                        <div class="col-md-8">
                            <input id="DLT_masterCode_" name="textinput" type="text" placeholder="ATC Code" class="form-control input-md" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail Code</label>
                        <div class="col-md-8">
                            <input id="detailCode_" name="textinput" type="text" placeholder="Detail Code" class="form-control input-md" readonly>
                        </div>
                    </div>    

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail Code Name</label>
                        <div class="col-md-8">
                            <input id="detailDesc_" class="form-control" maxlength="200"  >
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Priority</label>
                        <div class="col-md-8">
                            <input id="DLT_priority" class="form-control" type="number" maxlength="10" >
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start Date</label>
                        <div class="col-md-8">
                            <input id="DLT_startDate" class="form-control" type="text" readonly="true" >
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">End Date</label>
                        <div class="col-md-8">
                            <input id="DLT_endDate" class="form-control" type="text" readonly="true">
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="DLT_status_">
                                <option id="DLT_option1" value="0" >Active</option>
                                <option id="DLT_option2" value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="DLT_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="DLT_updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->
<!-- Update Part End -->

<!-- Delete Part Start -->


<script type="text/javascript" charset="utf-8">

    $('#detailTable').off('click', '#THE_detailTable #DLT_btnUpdate').on('click', '#THE_detailTable #DLT_btnUpdate', function (e) {
        e.preventDefault();
        $('#DLT_endDate').datepicker('option', 'minDate', null);

        //go to the top
        //        $('html,body').animate({
        //            scrollTop: $("#maintainFam").offset().top
        //        }, 500);

        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#DLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0], detailCode = arrayData[1], detailDesc = arrayData[2], status = arrayData[3], priority = arrayData[5], startDate = arrayData[6], endDate = arrayData[7];
        //set value in input on the top
        $('#DLT_masterCode_').val(masterCode);
        $('#detailCode_').val(detailCode);
        $('#detailDesc_').val(detailDesc);
        $('#DLT_priority').val(priority);
        $('#DLT_startDate').val(startDate);
        $('#DLT_endDate').val(endDate);

        if (status === '1')
            $('#DLT_status_').val(1);
        else
            $('#DLT_status_').val(0);



        console.log(arrayData);
    });





    $('#DLT_btn_update_').on('click', function () {

        var masterCode = $('#DLT_masterCode_').val();
        var detailCode = $('#detailCode_').val();
        var detailDesc = $('#detailDesc_').val();
        var priority = $('#DLT_priority').val();
        var startDate = $('#DLT_startDate').val();
        var endDate = $('#DLT_endDate').val();
        var status = $('#DLT_status_').val();

        var startDateX = $('#DLT_startDate').datepicker('getDate');
        var endDateX = $('#DLT_endDate').datepicker('getDate');


        if (detailDesc === "" || detailDesc === null) {
            bootbox.alert("Please fill in the description");
            $('#detailDesc_').focus();

        } else if (status !== '1' && status !== '0') {
            bootbox.alert("Please choose the status");
            $('#DLT_status_').focus();

        } else if (priority === "" || priority === null) {
            $('#DLT_priority').focus();
            bootbox.alert("Fill in the priority");

        } else if (startDate === "" || startDate === null) {
            $('#DLT_startDate').focus();
            bootbox.alert("Fill in the start date");

        } else if (endDate === "" || endDate === null) {
            $('#DLT_endDate').focus();
            bootbox.alert("Fill in the end date");

        } else if (startDateX > endDateX) {
            bootbox.alert("End date must be later than start date");
            $('#DLT_endDate').datepicker('option', 'minDate', startDateX);
            $('#DLT_endDate').focus();

        } else {

            var data = {
                masterCode: masterCode,
                detailCode: detailCode,
                detailDesc: detailDesc,
                priority: priority,
                startDate: startDate,
                endDate: endDate,
                status: status
            };

            $.ajax({
                url: "detail_lookup_update.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    console.log(datas.trim());
                    if (datas.trim() === 'Success') {
                        $('#detailTable').load('detail_lookup_table_1.jsp');
                        $(".modal-backdrop").hide();
                        bootbox.alert("A lookup detail code is updated");
                    } else if (datas.trim() === 'Failed') {
                        alert("Update failed!");

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });
        }



    });

    $('#detailTable').off('click', '#THE_detailTable #DLT_deleteButton_').on('click', '#THE_detailTable #DLT_deleteButton_', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#DLT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var masterCode = arrayData[0], detailCode = arrayData[1];
        console.log(arrayData);

        bootbox.confirm('Are you sure want to delete? '+ masterCode +"-"+detailCode, function(conf){
            if (conf) {



            var data = {
                detailCode: detailCode,
                masterCode: masterCode
            };

            $.ajax({
                url: "detail_lookup_delete.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                    if (datas.trim() === 'Success') {
                        $('#detailTable').load('detail_lookup_table_1.jsp');
                        bootbox.alert("A lookup detail is deleted");
                        
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert("Delete failed!");
                        
                    }else{
                        
                        bootbox.alert(datas.trim());
                    }

                },
                error: function (err) {
                    bootbox.alert("Error! Deletion failed!!");
                }

            });

        }
            
        }  );
        



    });



</script>  


<!-- Delete Part Start -->




<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
       
        $('#DLT_startDate').datepicker({
            changeYear: true,
            changeMonth: true,
            dateFormat: 'dd/mm/yy'
        });

        $('#DLT_endDate').datepicker({
            changeYear: true,
            changeMonth: true,
            dateFormat: 'dd/mm/yy'
        });

    });
</script>

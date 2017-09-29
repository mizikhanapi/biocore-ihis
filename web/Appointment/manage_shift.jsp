<%-- 
    Document   : master_lookup_main
    Created on : Jan 25, 2017, 4:11:22 PM
    Author     : user
--%>

<%

    

%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MANAGE SHIFT

    <span class="pull-right">
        <button id="MLM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#modal_manage_shift" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD SHIFT</button>
    </span>

</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="modal_manage_shift" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Shift</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">



                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Shift Name</label>
                        <div class="col-md-8">
                            <input id="shiftName" name="masterName" type="text" placeholder="e.g. Morning" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start Time</label>
                        <div class="col-md-8">
                            <input id="shift_start_time" name="masterName" type="text" placeholder="e.g. 08:00" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Shift Hour</label>
                        <div class="col-md-8">
                            <select class="form-control input-md" maxlength="100" id="shift_status">
                                <option value="0"></option>
                                <option value="12">12 Hour</option>
                                <option value="11">11 Hour</option>
                                <option value="10">10 Hour</option>
                                <option value="19">9 Hour</option>
                                <option value="8">8 Hour</option>
                                <option value="7">7 Hour</option>
                                <option value="6">6 Hour</option>
                            </select>
                        </div>
                    </div>
                    
                                        <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">End Time</label>
                        <div class="col-md-8">
                            <input id="shift_end_time" name="masterName" type="text" placeholder="End Time" class="form-control input-md" maxlength="100" readonly="">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start Date</label>
                        <div class="col-md-8">
                            <input id="shift_start_date" name="masterName" type="text" placeholder="Start Date" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                                        
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">End Date</label>
                        <div class="col-md-8">
                            <input id="shift_end_date" name="masterName" type="text" placeholder="End Date" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                       <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control input-md" maxlength="100" id="shift_status">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="btnAddShiftCode">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Add Modal End -->                         
<!-- Add Part End -->


 <script>

     

        $(document).ready(function () {
            $('#shift_status').prop('disabled', 'disabled');
            
                $( "#shift_start_date" ).datepicker({

                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                dateFormat:"dd-mm-yy"
              });
              
                          
                $( "#shift_end_date" ).datepicker({

                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                dateFormat:"dd-mm-yy"
              });
            
            $('#shift_start_time').datetimepicker({
                datepicker:false,
                format:'H:i',
                step:5
              }); 
              
              $("#shift_start_time").on('change',function(){
                  $('#shift_status').prop('disabled', false);
                  changeShiftEndTime();
              })
              
              $("#shift_status").on('change',function(){
//                                var time = moment(hours+':'+minutes,'HH:mm');
//                time.add(7,'m');
//                console.log(time.format("HH:mm"));
                changeShiftEndTime();
                
              })
              


        });
        
        function changeShiftEndTime(){
            var start_time = $("#shift_start_time").val();
                var time = moment(start_time,'HH:mm');
                var hour = $("#shift_status").val();
                time.add(parseInt(hour)+1,'H');
                
                $('#shift_end_time').val(time.format("HH:mm"));
        }



    </script>

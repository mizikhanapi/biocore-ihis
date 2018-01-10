<%-- 
    Document   : master_lookup_main
    Created on : Jan 25, 2017, 4:11:22 PM
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        String hfc_name = (String) session.getAttribute("HFC_NAME");
        String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
        String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
                    ///     0           1           2        3          4               5       6       
    String sql = "select shift_cd, shift_name, start_time,end_time,shift_duration,start_date,end_date,status from pms_shift where hfc_cd = '"+hfc+"' AND discipline_cd = '"+discipline+"' AND subdiscipline_cd = '"+subdiscipline+"'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);


%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">


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
                <h3 class="modal-title" id="lineModalLabel">Manage Shift</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="Manage_SHIFT_ADD_FORM">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Shift Code</label>
                        <div class="col-md-8">
                            <input id="Add_shift_code" name="masterName" type="text" placeholder="e.g. FS" class="form-control input-md" maxlength="40">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Shift Name</label>
                        <div class="col-md-8">
                            <input id="Add_shift_name" name="masterName" type="text" placeholder="e.g. First Shift" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start Time</label>
                        <div class="col-md-8">
                            <input id="Add_shift_start_time" name="masterName" type="text" placeholder="e.g. 08:00" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Shift Duration</label>
                        <div class="col-md-8">
                            <select class="form-control input-md" maxlength="100" id="Add_shift_duration">
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
                            <input id="Add_shift_end_time" name="masterName" type="text" placeholder="End Time" class="form-control input-md" maxlength="100" readonly="">
                        </div>
                    </div>
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Start Date</label>
                        <div class="col-md-8">
                            <input id="Add_shift_start_date" name="masterName" type="text" placeholder="Start Date" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                                        
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">End Date</label>
                        <div class="col-md-8">
                            <input id="Add_shift_end_date" name="masterName" type="text" placeholder="End Date" class="form-control input-md" maxlength="100">
                        </div>
                    </div>
                    
                       <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control input-md" maxlength="100" id="Add_shift_status">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer" id="ActionAddShift">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="btnAddShiftName">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer" id="ActionUpdateShift">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="btnUpdateShiftName">Update</button>
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

    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( "dd-mm-yy", element.value );
      } catch( error ) {
        date = null;
      }
  }

        $(document).ready(function () {
            $('#shift_duration').prop('disabled', 'disabled');
            $('#ActionUpdateShift').hide();
            
            $("#modal_manage_shift").on('hide.bs.modal',function(){
                $('#ActionUpdateShift').hide();
                $('#ActionAddShift').show();
                
            });
               
              var start_date_picker = $( "#Add_shift_start_date" ).datepicker({
                changeMonth: true,
                changeYear: true,
                //yearRange: "+100:+0",
                dateFormat:"dd-mm-yy"
              }).on( "change", function() {
                  var date_start_min = $( "#Add_shift_start_date" ).val();
                  var date_start_min_obj = date_start_min.split("-");
                  var new_day = parseInt(date_start_min_obj[0])+1;
                end_date_picker.datepicker( "option", "minDate", new_day+"-"+date_start_min_obj[1]+"-"+date_start_min_obj[2] );
                
              });
              
                          
              var end_date_picker = $( "#Add_shift_end_date" ).datepicker({

                changeMonth: true,
                changeYear: true,
                ///yearRange: "+100:+0",
                dateFormat:"dd-mm-yy"
              });
//              
        
            
            $('#Add_shift_start_time').datetimepicker({
                datepicker:false,
                format:'H:i',
                step:5
              }); 
              
              $("#Add_shift_start_time").on('change',function(){
                  $('#Add_shift_duration').prop('disabled', false);
                  changeShiftEndTime();
              })
              
              $("#Add_shift_duration").on('change',function(){
//                                var time = moment(hours+':'+minutes,'HH:mm');
//                time.add(7,'m');
//                console.log(time.format("HH:mm"));
                changeShiftEndTime();
                
              })
              $("#detailTable").on('click','#manage_shift_table #MSHIFT_btnDelete',function(){
                  var c = confirm("Are you sure want to delete this?");
                  if(c === true){
                      var _tr = $(this).closest("tr");
                      var shift_code = _tr.find("#shift_code_e").text();
                      $.ajax({
                          url:"deleteShift.jsp",
                          timeout:3000,
                          data:{
                              shift_code:shift_code
                          },
                          success:function(r){
                           if(r.trim() === "|SUCCESS|"){
                            
                            
                            $("#detailTable").load("manage_shift_table.jsp");
                          
                        }else{
                            console.log(r.trim());
                        }
                          }
                      })
                  }else{
                      return false
                  }
              });
              
              $("#detailTable").on('click','#manage_shift_table #MSHIFT_btnUpdate',function(){
                $("#modal_manage_shift").modal('show');
                $('#ActionAddShift').hide();
                $('#ActionUpdateShift').show();
               
                var _tr = $(this).closest("tr");
                var shift_code = _tr.find("#shift_code_e").text();
                var shift_name = _tr.find("#shift_name_e").text();
                var start_time = _tr.find("#start_time_e").text();
                var end_time = _tr.find("#end_time_e").text();
                var duration = _tr.find("#duration_e").text();
                var start_date = _tr.find("#start_date_e").text();
                var end_date = _tr.find("#end_date_e").text();
                var status = _tr.find("#status_e").text();
                
                 $("#Add_shift_code").val(shift_code);
                 $("#Add_shift_name").val(shift_name);
                 $("#Add_shift_start_time").val(start_time);
                 $("#Add_shift_duration").val(duration);
                 $("#Add_shift_end_time").val(end_time);
                 $("#Add_shift_start_date").val(start_date);
                 $("#Add_shift_end_date").val(end_date);
                 $("#Add_shift_status").val(status);
                 $('#Add_shift_code').prop('disabled', 'disabled');
                
               
              });
              $("#btnUpdateShiftName").click(function(e){
                  e.preventDefault();
                   var shift_code = $("#Add_shift_code").val();
                  var shift_name = $("#Add_shift_name").val();
                  var start_time = $("#Add_shift_start_time").val();
                  var shift_duration = $("#Add_shift_duration").val();
                  var end_time = $("#Add_shift_end_time").val();
                  var start_date = $("#Add_shift_start_date").val();
                  var end_date = $("#Add_shift_end_date").val();
                  var status = $("#Add_shift_status").val();
                  
                  if(shift_code === ""){
                      alert("Please enter the shift code");
                  }else if(shift_name === ""){
                      alert("Please enter the shift name");
                  }else if(start_time === ""){
                      alert("Please enter the shift time");
                  }else if(shift_duration === ""){
                      alert("Please enter the shift duration");
                  }else if(end_time === ""){
                      alert("Please enter the shift end time");
                  }else if(start_date === ""){
                      alert("Please enter the shift start date");
                  }else if(end_date === ""){
                      alert("Please enter the shift end date");
                  }else if(status === ""){
                      alert("Please enter the shift status date");
                  } else {
                          
                  var data ={
                      shift_code:shift_code,
                      shift_name:shift_name,
                      start_time:start_time,
                      shift_duration:shift_duration,
                      end_time:end_time,
                      start_date:start_date,
                      end_date:end_date,
                      status:status
                  }
                  $.ajax({
                     timeout:3000,
                     data:data,
                     url:"updateShift.jsp",
                     method:'POST',
                     success:function(r){
                        if(r.trim() === "|SUCCESS|"){
                            alert("Update Success");
                            $("#modal_manage_shift").modal('hide');
                            $("#detailTable").load("manage_shift_table.jsp");
                            
                        }else{
                            console.log(r.trim());
                        }
                     }
                  })
                  }
                 
              
              })
              
              $("#btnAddShiftName").click(function(e){
                  e.preventDefault();
               
                  var shift_code = $("#Add_shift_code").val();
                  var shift_name = $("#Add_shift_name").val();
                  var start_time = $("#Add_shift_start_time").val();
                  var shift_duration = $("#Add_shift_duration").val();
                  var end_time = $("#Add_shift_end_time").val();
                  var start_date = $("#Add_shift_start_date").val();
                  var end_date = $("#Add_shift_end_date").val();
                  var status = $("#Add_shift_status").val();
                  
                  if(shift_code === ""){
                      alert("Please enter the shift code");
                  }else if(shift_name === ""){
                      alert("Please enter the shift name");
                  }else if(start_time === ""){
                      alert("Please enter the shift time");
                  }else if(shift_duration === ""){
                      alert("Please enter the shift duration");
                  }else if(end_time === ""){
                      alert("Please enter the shift end time");
                  }else if(start_date === ""){
                      alert("Please enter the shift start date");
                  }else if(end_date === ""){
                      alert("Please enter the shift end date");
                  }else if(status === ""){
                      alert("Please enter the shift status date");
                  } else {
                    var data ={
                        shift_code:shift_code,
                        shift_name:shift_name,
                        start_time:start_time,
                        shift_duration:shift_duration,
                        end_time:end_time,
                        start_date:start_date,
                        end_date:end_date,
                        status:status
                    }
                    $.ajax({
                       timeout:3000,
                       data:data,
                       url:"addShift.jsp",
                       method:'POST',
                       success:function(r){
                          if(r.trim() === "|SUCCESS|"){
                              alert("Inserting Success");
                              $("#modal_manage_shift").modal('hide');
                              $("#detailTable").load("manage_shift_table.jsp");
                                clearShiftForm();
                          }else{
                              console.log(r.trim());
                          }
                       }
                    })
                  }
                  

              })
              


        });
        
        function changeShiftEndTime(){
            var start_time = $("#Add_shift_start_time").val();
                var time = moment(start_time,'HH:mm');
                var hour = $("#Add_shift_duration").val();
                time.add(parseInt(hour)+1,'H');
                
                $('#Add_shift_end_time').val(time.format("HH:mm"));
        }

        function clearShiftForm(){
             $("#Add_shift_code").val("");
             $("#Add_shift_name").val("");
             $("#Add_shift_start_time").val("");
             $("#Add_shift_duration").val("");
            $("#Add_shift_end_time").val("");
                 $("#Add_shift_start_date").val("");
              $("#Add_shift_end_date").val("");
                  $("#Add_shift_status").val("active");
        }



    </script>

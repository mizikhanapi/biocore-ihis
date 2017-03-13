<%-- 
    Document   : accessRole_main
    Created on : Feb 20, 2017, 2:08:35 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ASSIGN ROLE TO USER
    <span class="pull-right">
        <button id="ARM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#ARM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>New Assignment</button>
    </span>
</h4>
<!-- Add Button End -->

<% Conn conn = new Conn();%>
<!-- Add Modal Start -->
<div class="modal fade" id="ARM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">New Role Assignment</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="ARM_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">User</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ARM_user" placeholder="User">
                            <div id="ARM_user_match">
                                <!--for search area-->
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role</label>
                        <div class="col-md-8">
                            <select id="ARM_role" class="form-control input-md">
                                            <option value="">-- Select role --</option>
                                            <%
                                                String sqlRole = "Select role_code, role_name FROM adm_role";
                                                ArrayList<ArrayList<String>> dataRole = conn.getData(sqlRole);

                                                for (int i = 0; i < dataRole.size(); i++) {

                                            %><option value="<%=dataRole.get(i).get(0)%>"><%=dataRole.get(i).get(1)%></option><%
                                                }
                                            %>

                            </select>
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline</label>
                        <div class="col-md-8">
                            <select id="ARM_discipline" class="form-control input-md">
                                <option value="">-- Select discipline--</option>
                            </select>
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline</label>
                        <div class="col-md-8">
                            <select id="ARM_subdiscipline" class="form-control input-md">
                                <option value="">-- Select subdiscipline--</option>
                            </select>
                        </div>
                    </div> 
                     
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="ARM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="ARM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="ARM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
            
            var isUserSelected = false;
            var selectedUser = "";
            var G_hfcCode="";
           
            
            function ARM_reset() {
//               $('#ARM_select_HFC').val('0');
//               $('#ARM_select_discipline').val('0');
//               $('#ARM_select_subdiscipline').val('0');
//               $('#ARM_status').val('0');
                 document.getElementById("ARM_addForm").reset();
            }

            $('#ARM_btnReset').on('click', function () {
                ARM_reset();
            });
            
            $('#ARM_btnAddNew').on('click', function(){
                ARM_reset();
                isUserSelected = false;
                selectedUser = "";
                
            });

            $('#ARM_btnAdd').on('click', function () {
                               
                var user = $('#ARM_user').val();
                var role = $('#ARM_role').val();
                var discipline = $('#ARM_discipline').val();
                var subdiscipline = $('#ARM_subdiscipline').val();
                var status = $('#ARM_status').val();

                if (user === "") {
                    bootbox.alert("Fill in the user");
                                        
                } else if (discipline === "") {
                    bootbox.alert("Select the discipline");
                                        
                }else if (subdiscipline === "") {
                    bootbox.alert("Select the subdiscipline");
                                        
                } else if (status !== "1" && status !== "0") {
                    bootbox.alert("Select Any Status");
                                       
                } else if (isUserSelected === false || user !== selectedUser) {
                    bootbox.alert("Choose existing user");
                    $('#ARM_user').val("");
                    
                } else {
                    
                    var array1 = user.split("|");
                    user = array1[0].trim();
                    
                    
                    var data = {
                        userCode : user,
                        roleCode : role,
                        disciplineCode : discipline,
                        subdisciplineCode : subdiscipline,
                        status : status
                    };

                    $.ajax({
                        url: "accessRole_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#assignRoleTable').load('accessRole_table.jsp');
                                $('#ARM_detail').modal('hide');
                                //alert("Insertion Success");
                                bootbox.alert({
                                message: "Role is successfully assigned to a user",
                                title: "Process Result",
                                backdrop: true
                            });
                                ARM_reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                alert("Insertion failed!");
                                //$('#ARM_detail').modal('hide');
                                ARM_reset();
                                
                            } else{
                                bootbox.alert(datas.trim());
                                $('#ARM_user').val("");
                                
                            }
                            
                        },
                        error: function (err) {
                            console.log("Ajax Is Not Success");
                        }

                    });
                }

            });
            
            
            $('#ARM_user').on('keyup', function(){
                
                var input = $(this).val(); // We take the input value
                if (input.length >= 1) { // Minimum characters = 2 (you can change)
                    $('#ARM_user_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="PM_match_system"></div>
                    var dataFields = {user : input, process : "user"}; // We pass input argument in Ajax
                    $.ajax({
                        type: "POST",
                        url: "ARM_result.jsp", // call the php file ajax/tuto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 5000,
                        success: function (dataBack) { // If success
                            $('#ARM_user_match').html(dataBack); // Return data (UL list) and insert it in the <div id="PM_match_system"></div>
                            $('#ARM_user_matchlist li').on('click', function () { // When click on an element in the list
                               // Update the field with the new element
                                $('#ARM_user').val($(this).text());
                                G_hfcCode = $(this).data('hfc');
                                createDisciplineList();
                                $('#ARM_user_match').text(''); // Clear the <div id="PM_match_system"></div>
                                
                                isUserSelected = true;
                                selectedUser = $('#ARM_user').val();
                               
                            });
                        },
                        error: function () { // if error
                            $('#ARM_user_match').text('Problem!');
                        }
                    });
            } else {
                $('#ARM_user_match').text(''); // If less than 2 characters, clear the <div id="PM_match_system"></div>
            }
                
        });
        
        
        function createDisciplineList(){
            var data = {process : "discipline", hfc : G_hfcCode};
            $.ajax({
                url: "ARM_result.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                   $('#ARM_discipline').html(datas);

                },
                error: function (err) {
                    console.log("Ajax Is Not Success");
                }

            });
            
        }
        
        
        $('#ARM_discipline').on('change', function(){
            
            var data = {process : "subdiscipline",
                        discipline : $(this).val(),
                        hfc : G_hfcCode
                        };
            
            $.ajax({
                url: "ARM_result.jsp",
                type: 'POST',
                data: data,
                timeout: 10000,
                success: function (data) {
                    
                    $('#ARM_subdiscipline').html(data);
                        
                },
                error: function (jqXHR, textStatus, errorThrown) {
                        
                    }
            });
        });
        
        
    });



    </script>



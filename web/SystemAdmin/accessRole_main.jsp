<%-- 
    Document   : accessRole_main
    Created on : Feb 20, 2017, 2:08:35 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<!-- Add Part Start -->
<!-- Add Button Start -->
<link href="css/multi-select.css" rel="stylesheet" type="text/css"/>
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
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">New Role Assignment</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 500px; margin: 0 auto;" id="ARM_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        
                        
                        <div style="align-items: center; text-align: center">
                            <label for="textinput">Select User</label>
                            <select id="ARM_user" multiple="multiple"></select>

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                       
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

                    <!-- Text input-->
                    <div class="form-group">
                        
                            <select id="ARM_discipline" class="form-control input-md">
                                <option value="">-- Select discipline--</option>
                            </select>
                       
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                                             
                            <select id="ARM_subdiscipline" class="form-control input-md">
                                <option value="">-- Select subdiscipline--</option>
                            </select>
                        
                    </div> 


                    <div class="form-group">
                         <select class="form-control"  id="ARM_status">
                                <option  value="" >-- Select status --</option>
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="ARM_btnAdd"><i class=" fa fa-check"></i> Assign</button>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->

<script src="js/jquery.multi-select.js" type="text/javascript"></script>
<script>



    $(document).ready(function () {

//            var isUserSelected = false;
//            var selectedUser = "";
        var G_hfcCode = "<%= session.getAttribute("HEALTH_FACILITY_CODE").toString()%>";


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

        $('#ARM_btnAddNew').on('click', function () {
            ARM_reset();
//                isUserSelected = false;
//                selectedUser = "";
            createUserList();
            createDisciplineList();

        });

        $('#ARM_btnAdd').on('click', function () {
            
            var arraySelect = [];
                $("#ARM_user option:selected").each(function () {
                    arraySelect.push($(this));

                });

                var strUser = arraySelect.map(function (elem) {
                    return elem.val();
                }).join("|");

                console.log(strUser);


            //var user = $('#ARM_user').val();
            var role = $('#ARM_role').val();
            var discipline = $('#ARM_discipline').val();
            var subdiscipline = $('#ARM_subdiscipline').val();
            var status = $('#ARM_status').val();

            if (strUser=== "") {
                bootbox.alert("Select at least one user");

            }else if (role === "") {
                bootbox.alert("Select the role");

            } else if (discipline === "") {
                bootbox.alert("Select the discipline");

            } else if (subdiscipline === "") {
                bootbox.alert("Select the subdiscipline");

            } else if (status !== "1" && status !== "0") {
                bootbox.alert("Select Any Status");

            } else {
                $('<div class="loading">Loading</div>').appendTo('body');

                var data = {
                    userCode: strUser,
                    roleCode: role,
                    disciplineCode: discipline,
                    subdisciplineCode: subdiscipline,
                    status: status
                };

                $.ajax({
                    url: "accessRole_insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#accessRoleTable').load('accessRole_table.jsp');
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

                        } else {
                            bootbox.alert(datas.trim());
                            $('#ARM_user').val("");

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    },
                    complete: function (jqXHR, textStatus ) {
                        $('.loading').hide();
                }

                });
            }

        });


//            $('#ARM_user').on('keyup', function(){
//                
//                var input = $(this).val(); // We take the input value
//                if (input.length >= 1) { // Minimum characters = 2 (you can change)
//                    $('#ARM_user_match').html('<img src="bootstrap-3.3.6-dist/image/ajax-loader.gif" />'); // Loader icon apprears in the <div id="PM_match_system"></div>
//                    var dataFields = {user : input, process : "user"}; // We pass input argument in Ajax
//                    $.ajax({
//                        type: "POST",
//                        url: "ARM_result.jsp", // call the php file ajax/tuto-autocomplete.php
//                        data: dataFields, // Send dataFields var
//                        timeout: 5000,
//                        success: function (dataBack) { // If success
//                            $('#ARM_user_match').html(dataBack); // Return data (UL list) and insert it in the <div id="PM_match_system"></div>
//                            $('#ARM_user_matchlist li').on('click', function () { // When click on an element in the list
//                               // Update the field with the new element
//                                $('#ARM_user').val($(this).text());
//                                G_hfcCode = $(this).data('hfc');
//                                createDisciplineList();
//                                $('#ARM_user_match').text(''); // Clear the <div id="PM_match_system"></div>
//                                
//                                isUserSelected = true;
//                                selectedUser = $('#ARM_user').val();
//                               
//                            });
//                        },
//                        error: function () { // if error
//                            $('#ARM_user_match').text('Problem!');
//                        }
//                    });
//            } else {
//                $('#ARM_user_match').text(''); // If less than 2 characters, clear the <div id="PM_match_system"></div>
//            }
//                
//        });

        function createUserList() {

            var data = {
                process: "user",
                hfc: G_hfcCode
            };
             $('#ARM_user').multiSelect('destroy');

            $.ajax({
                type: 'POST',
                url: "ARM_result.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    $('#ARM_user').html(data);
                    $('#ARM_user').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selectable users</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected users</div>",
                        keepOrder: true
                    });

                }
            });

        }


        function createDisciplineList() {
            var data = {process: "discipline", hfc: G_hfcCode};
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


        $('#ARM_discipline').on('change', function () {

            var data = {process: "subdiscipline",
                discipline: $(this).val(),
                hfc: G_hfcCode
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



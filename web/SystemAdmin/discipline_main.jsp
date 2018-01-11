<%-- 
    Document   : master_lookup_main
    Created on : Jan 25, 2017, 4:11:22 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="ADM_helper.MySession"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String hfc_name = (String) session.getAttribute("HFC_NAME");
    String user_id = session.getAttribute("USER_ID").toString();
    
    MySession mys = new MySession(user_id, hfc_cd);
    

%>
<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    DISCIPLINE MANAGEMENT
   
    <span class="pull-right">
        <button id="DM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#DM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Discipline</button>
    </span>
    
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="DM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Discipline</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Health Facility*</label>
                        <div class="col-md-8">
                            <input id="D_hfc_name"  type="text" placeholder="Search health facility" class="form-control input-md" maxlength="100">
                            <!--<input id="D_hfc_cd" type="hidden">-->
                            <div id="D_match" class="search-drop">
                                
                            </div>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Name*</label>
                        <div class="col-md-8">
                            <input id="disciplineName"  type="text" placeholder="Insert discipline name" class="form-control input-md" maxlength="100">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code*</label>
                        <div class="col-md-8">
                            <input id="disciplineCode"  type="text" placeholder="Insert discipline code" class="form-control input-md code-input" maxlength="30">
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Group Code</label>
                        <div class="col-md-8">
                            <input id="groupCode"  type="text" placeholder="Insert group code (optional)" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code</label>
                        <div class="col-md-8">
                            <input id="categoryCode"  type="text" placeholder="Insert category code (optional)" class="form-control input-md" maxlength="30">
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Specialty Code</label>
                        <div class="col-md-8">
                            <input id="specialtyCode"  type="text" placeholder="Insert specialty code (optional)" class="form-control input-md" maxlength="30">
                        </div>
                    </div>

                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="DM_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="DM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="DM_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
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
            
            //---------------global variable for selecting hfc --------------------
            
            var D_isHFCselected = false;
            var D_selectedHFC = '';
            
            //=====================================================================
            
            function DM_reset() {
                document.getElementById("disciplineName").value = "";
                document.getElementById("disciplineCode").value = "";
                document.getElementById("groupCode").value = "";
                $('#D_match').html('');
                
            }

            $('#DM_btnReset').on('click', function () {
                DM_reset();
            });
            
            $('#DM_btnAddNew').on('click', function(){
                
                DM_reset();
                
    <%
                   if (!mys.isSuperUser()) {
                       String curHFC = hfc_cd + " | " + hfc_name;
    %>

                $('#D_hfc_name').val('<%=curHFC%>').prop('disabled', true);
                
                D_isHFCselected = true;
                D_selectedHFC = $('#D_hfc_name').val();
                console.log(D_selectedHFC);

    <%

                }//end if
    %>

            });
            
            //------------------------- search health facility -----------------------------------------
            
<%
    if(mys.isSuperUser())
    {
%>
            
            $('#D_hfc_name').on('keyup', function(){
                var input = $(this).val();
                
                if(input.length > 0){
                    var data = {
                        key: input
                    };
                    $('#D_match').html('<img src="img/ajax-loader.gif">');
                    
                    $.ajax({
                        type: 'POST',
                        url: "controller/search_hfc.jsp",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            $('#D_match').html(data);
                            $('#HFC_matchlist li').on('click', function () { // When click on an element in the list
                            // Update the field with the new element
                            $('#D_hfc_name').val($(this).text());
                            
                            D_isHFCselected = true;
                            D_selectedHFC =  $('#D_hfc_name').val();
                            
                            $('#D_match').text(''); // Clear the <div id="PM_match_system"></div>


                        });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#D_match').html('Opps! '+errorThrown);
                        }
                    });
                } 
                else{
                    $('#D_match').html('');
                }
            });
            
<%
    }
%>            
            
            //========================================================================================

            $('#DM_btnAdd').on('click', function () {
                
                var hfc_name = $('#D_hfc_name').val();
                var disciplineName = $('#disciplineName').val();
                var disciplineCode = $('#disciplineCode').val();
                var groupCode = $('#groupCode').val();
                var categoryCode = $('#categoryCode').val();
                var specialtyCode = $('#specialtyCode').val();
                var status = $('#DM_status').val();
                
                var gotSpecialChar = /[!@#$%^&*()+=,?\/\\:;\"\' ]/.test(disciplineCode);  
                
                if(D_isHFCselected === false || D_selectedHFC !== hfc_name){
                    bootbox.alert('Please choose existing hfc!');
                }
                else if (disciplineName === "") {
                    bootbox.alert("Fill in the Discipline name");
                    $('#disciplineName').focus();
                    
                } else if (disciplineCode === "") {
                    bootbox.alert("Fill in the discipline code");
                    $('#disciplineCode').focus();
                    
                } else if (gotSpecialChar){
                    bootbox.alert("Discipline code can only contain alphanumeric characters!");
                    $('#disciplineCode').val('');
                }
                else if (status !== "1" && status !== "0") {
                    bootbox.alert("Select Any Status");
                    $('#DM_status').focus();
                } else {
                    
                    disciplineName = disciplineName.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                    var D_array = D_selectedHFC.split("|");
                    var hfc_cd = D_array[0].trim();

                    var data = {
                        hfc_cd: hfc_cd,
                        disciplineName : disciplineName,
                        disciplineCode : disciplineCode,
                        groupCode : groupCode,
                        categoryCode : categoryCode,
                        specialtyCode : specialtyCode,
                        status: status
                    };

                    $.ajax({
                        url: "discipline_insert.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $('#disciplineTable').load('discipline_table.jsp');
                                $('#DM_detail').modal('hide');
                                //alert("Insertion Success");
                                bootbox.alert({
                                message: "New discipline is added",
                                title: "Process Result",
                                backdrop: true
                            });
                                DM_reset();
                                
                            } else if (datas.trim() === 'Failed') {
                                
                                alert("Insertion failed!");
                                //$('#DM_detail').modal('hide');
                                DM_reset();
                                
                            } else{
                                alert(datas.trim());
                                $('#disciplineCode').val("");
                                $('#disciplineCode').focus();
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

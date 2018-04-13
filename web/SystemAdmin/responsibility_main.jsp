<%-- 
    Document   : responsibility_main
    Created on : Feb 28, 2017, 6:42:15 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ASSIGN PAGE TO ROLE
    <span class="pull-right">
        <button id="RESM_btnModal" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#RESM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>Assign Responsibility</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="RESM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" style="color: red"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title text-center" id="lineModalLabel">Page Responsibilities:</h3>

            </div>
            <div class="modal-body">

                <form style="width: 100%; margin: 0 auto;" id="RESM_form">
                    <div class="form-group">
                        <select class="form-control" id="RESM_selectRole">
                            <option value="">--Select Role--</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="RESM_selectPage" multiple="multiple">


                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="RESM_selectStatus">
                            <option value="">--Select Status--</option>
                            <option value="0">Active</option>
                            <option value="1">Inactive</option>

                        </select>
                    </div>



                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer" >
                <button class="btn btn-primary btn-block" type="button" id="RESM_btnAssign"><i class=" fa fa-check"></i> Assign</button>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->


<div class="modal fade" id="REST_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Responsibility</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Code</label>
                        <div class="col-md-8">
                            <input id="REST_roleCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Name</label>
                        <div class="col-md-8">
                            <input id="REST_roleName"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Code</label>
                        <div class="col-md-8">
                            <input id="REST_systemCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Module Code</label>
                        <div class="col-md-8">
                            <input type="text" id="REST_moduleCode" class="form-control" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Page Code</label>
                        <div class="col-md-8">
                            <input id="REST_pageCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Page Name</label>
                        <div class="col-md-8">
                            <input id="REST_pageName"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="REST_status">
                                <option value="0" >Active</option>
                                <option value="1" >Inactive</option>

                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="REST_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="REST_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->

<!--modal role page map-->
<div class="modal fade" id="REST_detail2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Edit Page to Role Assignment</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="REST_addForm" autocomplete="off">

                    <input type="hidden" id="REST_hidden_roleCode">
                    <!-- Text input-->
                    <div class="col-md-12" style="align-items: center; text-align: center" >
                        <label class="col-md-2 control-label" for="textinput">Role *</label>
                        <div class="col-md-8">
                            <input id="REST_role2"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <div style="height: 80px"></div>

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <label for="textinput">Select Page</label><br>
                            <span>
                                <a id="REST_user_selectAll" href="#">Select all</a>
                                <span style="color: white">--------------------------</span>
                                <a id="REST_user_deselectAll" href="#">Deselect all</a>
                            </span>
                            <div>
                                <select id="REST_page2" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>

                    <div style="height: 40px"></div>

                    <div class="form-group">
                        <select class="form-control"  id="REST_status2">
                            <option  value="" >-- Select status --</option>
                            <option  value="0" >Active</option>
                            <option  value="1" >Inactive</option>
                        </select>

                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="REST_btnSave"><i class=" fa fa-save"></i> Save Changes</button>
            </div>
        </div>
    </div>
</div>

<!--modal role page map-->

<!--modal menu detail-->
<!--modal role page map-->
<div class="modal fade" id="MENU_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Menu Assignment</h3>
            </div>
            <input type="hidden" id="MENU_page_cd">
            <input type="hidden" id="MENU_module_cd">
            <input type="hidden" id="MENU_role_cd">
            <div class="modal-body">
                <h3 id="MENU_title"></h3>
                <!-- content goes here -->
                <div id="MENU_tableDiv"></div>
                <!-- content goes here -->
            </div>

        </div>
    </div>
</div>

<!--modal menu detail-->


<script>



    $(document).ready(function () {

        function RESM_reset() {
            document.getElementById("RESM_form").reset();
        }

        $('#RESM_btnModal').on('click', function () {
            RESM_reset();
            createRoleList();
            createPageList();
        });



        $('#RESM_btnAssign').on('click', function () {

            var arraySelect = [];
            $("#RESM_selectPage option:selected").each(function () {
                arraySelect.push($(this));

            });


            var systemCode = arraySelect.map(function (elem) {
                return elem.data('system');
            }).join("|");


            var moduleCode = arraySelect.map(function (elem) {
                return elem.data('module');
            }).join("|");

            var pageCode = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            var roleCode = $('#RESM_selectRole').val();
            var status = $('#RESM_selectStatus').val();

            console.log(systemCode);
            console.log(moduleCode);
            console.log(pageCode);

            if (roleCode === "") {
                bootbox.alert("Select the role");


            } else if (pageCode === "") {
                bootbox.alert("Select the page");


            } else if (status !== "1" && status !== "0") {
                bootbox.alert("Select Any Status");

            } else {

                var data = {
                    roleCode: roleCode,
                    system: systemCode,
                    module: moduleCode,
                    page: pageCode,
                    status: status
                };
                createScreenLoading();
                $.ajax({
                    url: "responsibility_edit.jsp",
                    type: "post",
                    data: data,
                    dataType: 'json',
                    timeout: 60000,
                    success: function (datas) {

                        if (datas.isValid) {

                            $('#responsibilityTable').load('responsibility_table.jsp');
                            $('#RESM_detail').modal('hide');
                            //alert("Insertion Success");
                            bootbox.alert({
                                message: "Pages are assigned to a role",
                                title: "Process Result",
                                backdrop: true
                            });
                            RESM_reset();

                        } else if (!datas.isValid) {

                            bootbox.alert(datas.msg);
                            //$('#RESM_detail').modal('hide');
                            console.log(datas.query);
                            RESM_reset();

                        } else {
                            bootbox.alert(datas.trim());
                            $('#RESM_selectPage').val("");

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }

                });
            }

        });

        function createRoleList() {

            var data = {process: "role"};

            $.ajax({
                type: 'POST',
                url: "RESM_result.jsp",
                data: data,
                success: function (data) {

                    $('#RESM_selectRole').html(data);

                },
                error: function (jqXHR, textStatus, errorThrown) {

                }


            });
        }

        function  createPageList() {

            var data = {process: "page"};

            $('#RESM_selectPage').multiSelect('destroy');
            createScreenLoading();
            $.ajax({
                data: data,
                type: 'POST',
                url: "RESM_result.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#RESM_selectPage').html(data);
                    $('#RESM_selectPage').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3'>Available pages</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Assigned pages</div>",
                        keepOrder: true
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }


        //--------------------------- resposibility_table -----------------------------------------------------------
        $('#responsibilityTable').on('click', '#THE_responsibilityTable #REST_btnRolePage', function (e) {
            e.preventDefault();
            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#REST_hidden").val();
            var arrayData = rowData.split("|");

            var roleName = arrayData[3], roleCode = arrayData[2];

            $('#REST_role2').val(roleName);
            $('#REST_hidden_roleCode').val(roleCode);
            $('#REST_status2').val('0');

            createScreenLoading();

            createPageList2(roleCode);
        });


        $('#REST_user_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#REST_page2').multiSelect('select_all');
            return false;
        });

        $('#REST_user_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#REST_page2').multiSelect('deselect_all');
            return false;
        });


        $('#REST_btnSave').on('click', function () {

            var roleCode = $('#REST_hidden_roleCode').val();
            var status = $('#REST_status2').val();
            var roleName = $('#REST_role2').val();

            var arraySelect = [];
            $("#REST_page2 option:selected").each(function () {
                arraySelect.push($(this));

            });

            var strPageCode = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            var strSystemCode = arraySelect.map(function (elem) {
                return elem.data('system');
            }).join("|");

            var strModuleCode = arraySelect.map(function (elem) {
                return elem.data('module');
            }).join("|");

            console.log(strPageCode);
            console.log(strSystemCode);
            console.log(strModuleCode);
            console.log(roleCode);
            console.log(status);

            if (status === "") {
                bootbox.alert("Please select the status");

            } else {
                createScreenLoading();
                var data = {
                    system: strSystemCode,
                    module: strModuleCode,
                    page: strPageCode,
                    roleCode: roleCode,
                    status: status
                };

                $.ajax({
                    type: 'POST',
                    data: data,
                    dataType: 'json',
                    timeout: 60000,
                    url: "responsibility_edit.jsp",
                    success: function (datas, textStatus, jqXHR) {
                        if (datas.isValid) {
                            bootbox.alert({
                                message: "Page of " + roleName + " is updated",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#responsibilityTable').load('responsibility_table.jsp');
                            $(".modal-backdrop").hide();
                            $('#REST_detail2').modal('hide');
                            console.log(datas.msg);
                            console.log(datas.query);
                        } else {
                            bootbox.alert(datas.msg);
                            console.log(datas.query);
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Opps! " + errorThrown + ". Please try again later");
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }
                });


            }




        });



        $('#responsibilityTable').on('click', '#THE_responsibilityTable #REST_btnUpdate', function (e) {
            e.preventDefault();


            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#REST_hidden").val();
            var arrayData = rowData.split("|");
            //assign into seprated val
            var roleName = arrayData[3], roleCode = arrayData[2], systemCode = arrayData[4], moduleCode = arrayData[5], pageCode = arrayData[0], pageName = arrayData[1], status = arrayData[6];
            //set value in input on the top
            $('#REST_systemCode').val(systemCode);
            $('#REST_moduleCode').val(moduleCode);
            $('#REST_roleCode').val(roleCode);
            $('#REST_roleName').val(roleName);
            $('#REST_pageCode').val(pageCode);
            $('#REST_pageName').val(pageName);

            if (status === '1')
                $('#REST_status').val(1);
            else
                $('#REST_status').val(0);

            //e.stopPropagation();


        });

        $("#REST_btn_update_").on('click', function (e) {

            e.preventDefault();
            //console.log("entering Update");
            var roleCode = $('#REST_roleCode').val();
            var pageCode = $('#REST_pageCode').val();
            var status = $('#REST_status').val();

            if (status !== '1' && status !== '0') {
                alert("Select the status");
            } else {
                var data = {
                    roleCode: roleCode,
                    pageCode: pageCode,
                    status: status
                };
                createScreenLoading();
                //console.log("entering Ajax");
                $.ajax({
                    url: "responsibility_update.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#responsibilityTable').load('responsibility_table.jsp');
                            $(".modal-backdrop").hide();
                            $('#REST_detail').modal('hide');
                            //alert("Update Success");

                            bootbox.alert({
                                message: "Responsibility is updated",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Update failed!");
                        }

                    },
                    error: function (err) {
                        bootbox.alert("Error! Ajax failed!!");
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }

                });
            }


        });


        $('#responsibilityTable').on('click', '#THE_responsibilityTable #REST_btnDelete', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#REST_hidden").val();
            var arrayData = rowData.split("|");
            //assign into seprated val
            var roleName = arrayData[3], roleCode = arrayData[2], pageCode = arrayData[0];
            console.log(arrayData);

            bootbox.confirm({
                message: "Are you sure want to delete page " + pageCode + " responsibility from role " + roleName,
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
                            roleCode: roleCode,
                            pageCode: pageCode
                        };
                        createScreenLoading();
                        $.ajax({
                            url: "responsibility_delete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {
                                    $('#responsibilityTable').load('responsibility_table.jsp');
                                    //alert("Delete Success");

                                    bootbox.alert({
                                        message: "A responsibility is deleted",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {
                                    bootbox.alert("Delete failed!");

                                } else {
                                    bootbox.alert(datas.trim());

                                }

                            },
                            error: function (err) {
                                bootbox.alert("Error! Deletion failed!!");
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }

                        });

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

            //e.stopPropagation();

        });

        function createPageList2(roleCode) {

            var data = {
                roleCode: roleCode
            };
            $('#REST_page2').multiSelect('destroy');

            $.ajax({
                type: 'POST',
                url: "REST_result_multiSelect.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    $('#REST_page2').html(data);
                    $('#REST_page2').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3'>Available pages</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Assigned pages</div>",
                        keepOrder: true
                    });

                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });

        }

        //========================== responsibility_table ==========================================================

        //---------------------------------- responsibility detail -------------------------------------------------------------
        $('#responsibilityTable').on('click', '#MENU_btnMenuModal', function () {
            var arrData = $(this).closest('tr').find('#REST_hidden').val().split("|");
            var page_cd = arrData[0];
            var role_cd = arrData[2];
            var module_cd = arrData[5];
            var page_name = arrData[1];
            var role_name = arrData[3];

            MENU_loadMenuList(role_cd, page_cd, module_cd);

            $('#MENU_title').text("Menu available for role " + role_name + " on page (" + page_cd + ") " + page_name + ".");
            $('#MENU_page_cd').val(page_cd);
            $('#MENU_module_cd').val(module_cd);
            $('#MENU_role_cd').val(role_cd);

        });

        $('#MENU_tableDiv').on('click', '#MENU_btnEnable', function () {
            var arrData = $(this).closest('td').find('#MENU_hidden').val().split("|");

            var input = {
                menu_cd: arrData[0],
                role_cd: $('#MENU_role_cd').val(),
                page_cd: $('#MENU_page_cd').val(),
                module_cd: $('#MENU_module_cd').val(),
                status: '0'
            };

            bootbox.confirm({
                message: "Are you sure you want to enable menu (" + input.menu_cd + ") " + arrData[1] + "? All of its parent menus will be enabled automatically.",
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
                    if (result) {
                        // process to enable
                        createScreenLoading();
                        $.ajax({
                            type: 'POST',
                            timeout: 60000,
                            url: "HIS010002/menu_control/access_control.jsp",
                            data: input,
                            dataType: 'json',
                            success: function (data, textStatus, jqXHR) {
                                if(data.isValid){
                                    bootbox.alert("The menu is enabled");
                                    MENU_loadMenuList(input.role_cd, input.page_cd, input.module_cd);
                                    
                                }
                                else{
                                    bootbox.alert("Opps! Something went wrong!");
                                    console.log(data.query);
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {

                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }
                        });// end ajax
                    }
                }
            });

        });

        $('#MENU_tableDiv').on('click', '#MENU_btnDisable', function () {
            var arrData = $(this).closest('td').find('#MENU_hidden').val().split("|");

            var input = {
                menu_cd: arrData[0],
                role_cd: $('#MENU_role_cd').val(),
                page_cd: $('#MENU_page_cd').val(),
                module_cd: $('#MENU_module_cd').val(),
                status: '1'
            };

            bootbox.confirm({
                message: "Are you sure you want to disable menu (" + input.menu_cd + ") " + arrData[1] + "? All of its child menus will be disabled automatically.",
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
                    if (result) {
                        // process to enable
                        createScreenLoading();
                        $.ajax({
                            type: 'POST',
                            timeout: 60000,
                            url: "HIS010002/menu_control/access_control.jsp",
                            data: input,
                            dataType: 'json',
                            success: function (data, textStatus, jqXHR) {
                                if(data.isValid){
                                    bootbox.alert("The menu is disabled");
                                    MENU_loadMenuList(input.role_cd, input.page_cd, input.module_cd);
                                    
                                }
                                else{
                                    bootbox.alert("Opps! Something went wrong!");
                                    console.log(data.query);
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {

                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }
                        });// end ajax
                    }
                }
            });

        });

        function MENU_loadMenuList(role_cd, page_cd, module_cd) {
            createScreenLoading();

            var send = {
                page_cd: page_cd,
                role_cd: role_cd,
                module_cd: module_cd
            };

            $.ajax({
                type: 'POST',
                timeout: 60000,
                url: "HIS010002/menu_control/getMenuList.jsp",
                data: send,
                success: function (data, textStatus, jqXHR) {
                    $('#MENU_tableDiv').html(data);
                    $('#MENU_modal').css('overflow', 'auto');
                    $('#MENU_modal').modal('show');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $('#MENU_tableDiv').html("<b class='text-danger'>Oops! " + errorThrown + "</b>");
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }

        //================================== responsibility detail ============================================================


    }); // END of document ready




</script>



<%-- 
    Document   : page_main
    Created on : Feb 7, 2017, 5:31:11 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    PAGE CODE MANAGEMENT
    <span class="pull-right">
        <button id="MENU_btnAddModal" class="btn btn-success" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Menu</button>
    </span>
</h4>
<!-- Add Button End -->


<!--hidden field-->
<input type="hidden" id="MENU_module_cd">
<input type="hidden" id="MENU_page_cd">
<!--hidden field-->

<!-- Add Modal Start -->
<div class="modal fade" id="MENU_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="MENU_lineModalLabel"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="MENU_form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Menu Code*</label>
                        <div class="col-md-8">
                            <input id="MENU_code"  type="text" placeholder="Enter menu code" class="form-control input-md code-input" maxlength="30">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Menu Name*</label>
                        <div class="col-md-8">
                            <input id="MENU_name"  type="text" placeholder="Enter menu name" class="form-control input-md" maxlength="200">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Menu Type*</label>
                        <div class="col-md-8">
                            <input id="MENU_type"  type="text" placeholder="Enter menu type" class="form-control input-md" maxlength="200">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="MENU_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>

                    <div id="MENU_levelHolder">

                    </div>

                    <div class="form-group menu_add">
                        <input type="hidden" id="MENU_parent_cd">
                        <input type="hidden" id="MENU_level">
                        <label class="col-md-4 control-label" for="textinput">Level <span id="MENU_levelNoText">1</span>*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="MENU_parent">

                            </select>
                        </div>
                        <div class="col-md-12 text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" title="Plus level" id="MENU_btnPlusLevel"><i class="fa fa-plus-circle"></i></button>
                                <button type="button" class="btn btn-danger" title="Minus level" id="MENU_btnMinusLevel"><i class="fa fa-minus-circle"></i></button>
                            </div>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group menu_add" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MENU_btnAdd">Add</button>
                    </div>
                    <div class="btn-group menu_update" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MENU_btnUpdate">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MENU_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->

<script type="text/javascript">

    $(function () {

        codeValidityKeyUp(".code-input");
        preventPipeKeyUp("input");

        var MENU_table;

        function MENU_initDataTable() {
            $('#THE_menuTable').DataTable({destroy: true});
            MENU_table = null;
            MENU_table = $('#THE_menuTable').DataTable();
        }

        //load available parent menu
        function MENU_loadParentMenu() {
            var level = $('#MENU_level').val();
            var parent_cd = $('#MENU_parent_cd').val();
            var page_cd = $('#MENU_page_cd').val();
            var module_cd = $('#MENU_module_cd').val();

            createScreenLoading();

            var data = {
                level: level,
                parent_cd: parent_cd,
                page_cd: page_cd,
                module_cd: module_cd
            };

            $.ajax({
                type: 'POST',
                url: "HIS010005/menu_control/getParent.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                    $('#MENU_parent').html(data);
//                    var new_parent_cd = $('#MENU_parent').val();
//                    $('#MENU_parent_cd').val(new_parent_cd);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Oops! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }

        $('#pageTable').on('click', '#PT_btnViewMenu', function () {
            createScreenLoading();

            var arrData = $(this).closest('tr').find('#PT_hidden').val().split("|");

            var data = {
                module_cd: arrData[2],
                page_cd: arrData[4],
                module_name: arrData[3],
                page_name: arrData[5]
            };

            $.ajax({
                url: "HIS010005/menu_table.jsp",
                type: 'POST',
                data: data,
                timeout: 60000,
                success: function (data, textStatus, jqXHR) {
                    $('#menuTable').html(data);
                    $('#MENU_module_cd').val(arrData[2]);
                    $('#MENU_page_cd').val(arrData[4]);
                    $('.nav-tabs a[href="#S_tab5"]').tab('show');
                    MENU_initDataTable();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Oops! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        });

        //---------- plus minus level-------------
        $('#MENU_btnPlusLevel').on('click', function () {
            var immediateParent = $('#MENU_parent').val().trim();
            var level = $('#MENU_level').val();

            if (immediateParent === "-") {
                bootbox.alert("Level " + level + " is the highest level for this menu.");
            } else {
                $('#MENU_parent_cd').val(immediateParent);
                var intLevel = parseInt(level) + 1;
                $('#MENU_levelNoText').html(intLevel);
                $('#MENU_level').val(intLevel);

                MENU_loadParentMenu();

                var parentName = $("#MENU_parent option:selected").text();

                var strHtml = "  <div class=\"form-group\" id=\"MENU_levelHolder" + level + "\">"
                        + "<label class=\"col-md-4 control-label\" for=\"textinput\">Level " + level + " :</label>"
                        + "<div class=\"col-md-8\">"
                        + "<input type=\"text\" class=\"form-control input-md\" readonly value=\"" + parentName + "\">"
                        + "<input type=\"hidden\" value=\"" + immediateParent + "\" id=\"MENU_LevelHolderParent" + level + "\">"
                        + "</div>"
                        + "</div>";
                $('#MENU_levelHolder').append(strHtml);

            }
        });

        $('#MENU_btnMinusLevel').on('click', function () {
            var level = parseInt($('#MENU_level').val());

            if (level === 1) {
                bootbox.alert("Level " + level + " is the lowest level for this menu.");
            } else {
                level = level - 1;
                $('#MENU_level').val(level);
                $('#MENU_levelNoText').html(level);

                var parent_cd;

                var strIDparent = "MENU_LevelHolderParent" + (level - 1);

                try {
                    parent_cd = $('#' + strIDparent).val().trim();
                } catch (error) {
                    //console.log(error);
                    parent_cd = "-";
                }
                $('#MENU_parent_cd').val(parent_cd);
                MENU_loadParentMenu();
                var curParent_cd = $('#MENU_parent_cd').val();
                console.log("Current parent code: " + curParent_cd);

                var strID = "MENU_levelHolder" + level;
                var elem = document.getElementById(strID);
                elem.parentNode.removeChild(elem);
            }
        });
        //========= plus minus level =============


        //validate the input
        function MENU_validateInput() {
            var isValid = true;
            var msg = "";

            var menu_name = $('#MENU_name').val().trim();
            var menu_cd = $('#MENU_code').val().trim();
            var type = $('#MENU_type').val().trim();
            var status = $('#MENU_status').val().trim();
            var level = $('#MENU_level').val().trim();
            var parent_cd = $('#MENU_page_cd').val().trim();

            if (menu_cd === "") {
                msg = "Please enter the menu code.";
                isValid = false;
            } else if (menu_name === "") {
                msg = "Please enter the menu name.";
                isValid = false;
            } else if (type === "") {
                msg = "Please enter the menu type.";
                isValid = false;
            } else if (status === "") {
                msg = "Please choose the status.";
                isValid = false;
            } else if (level === "") {
                msg = "Please choose proper level.";
                isValid = false;
            } else if (parent_cd === "") {
                msg = "Please choose proper parent.";
                isValid = false;
            }

            if (!isValid) {
                bootbox.alert(msg);
            }

            return isValid;
        }

        //add new menu
        $('#MENU_btnAddModal').on('click', function () {
            var module_cd = $('#MENU_module_cd').val().trim();
            var page_cd = $('#MENU_page_cd').val().trim();
            $('#MENU_lineModalLabel').html("Add New Menu");

            if (module_cd === "" || page_cd === "") {
                bootbox.alert("Please choose a page first!", function () {
                    $('.nav-tabs a[href="#S_tab4"]').tab('show');
                });
            } else {
                $('#MENU_form')[0].reset();
                $('#MENU_modal').modal('show');
                $('#MENU_parent_cd').val("-");
                $('#MENU_level').val("1");
                $('#MENU_levelNoText').html("1");
                $('#MENU_levelHolder').html("");
                MENU_loadParentMenu();
                $('.menu_add').show();
                $('.menu_update').hide();
                $('#MENU_code').prop('disabled', false);
            }
        });

        $('#MENU_btnAdd').on('click', function () {
            if (MENU_validateInput()) {
                var menu_name = $('#MENU_name').val().trim();
                var menu_cd = $('#MENU_code').val().trim();
                var type = $('#MENU_type').val().trim();
                var status = $('#MENU_status').val().trim();
                var level = $('#MENU_level').val().trim();
                var parent_cd = $('#MENU_parent_cd').val().trim();

                var page_cd = $('#MENU_page_cd').val();
                var module_cd = $('#MENU_module_cd').val();

                createScreenLoading();

                var data = {
                    menu_name: menu_name,
                    menu_cd: menu_cd,
                    type: type,
                    status: status,
                    level: level,
                    parent_cd: parent_cd,
                    page_cd: page_cd,
                    module_cd: module_cd
                };

                $.ajax({
                    type: 'POST',
                    url: "HIS010005/menu_control/addMenu.jsp",
                    data: data,
                    dataType: 'json',
                    timeout: 60000,
                    success: function (data, textStatus, jqXHR) {
                        if (data.isValid) {
                            bootbox.alert(data.msg);
                            $('#MENU_modal').modal('hide');

                            var tempArr = [menu_cd, menu_name, level, type, parent_cd, status];
                            var strStatus = status.trim() === "0" ? "Active" : "Inactive";

                            var strRow = '<tr>'
                                    + '<td>' + menu_cd + '</td> <!-- code -->   '
                                    + '<td>' + menu_name + '</td> <!-- name  --> '
                                    + '<td>' + level + '</td> <!-- level  --> '
                                    + '<td>' + type + '</td> <!-- type  --> '
                                    + '<td>' + parent_cd + '</td> <!-- parent  --> '
                                    + '<td style="width: 5%">' + strStatus + '</td> <!--status --> '
                                    + '<td style="width: 5% ">'
                                    + '    <input id="MENU_hidden" type="hidden" value="' + tempArr.join("|") + '">'
                                    + '    <!-- Update Part Start -->'
                                    + '    <a id="MENU_btnUpdateModal" style="cursor: pointer" title="Update menu"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>'
                                    + '    <!-- Delete Button Start -->'
                                    + '    <a id="MENU_btnDelete" class="testing" style="cursor: pointer" title="Delete menu"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>'
                                    + '    <!-- Delete Button End -->'
                                    + '</td>'
                                    + '</tr>';
                            MENU_table.row.add($(strRow)[0]).draw();

                        } else {
                            bootbox.alert("<b class='text-danger'>" + data.msg + "</b>");
                            console.log(data.query);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("<b class='text-danger'>Oops! " + errorThrown + "</b>");
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }
                });
            }
        });

        //delete menu
        $('#menuTable').on('click', '#MENU_btnDelete', function () {
            var tr = $(this).closest('tr');
            var arrData = tr.find('#MENU_hidden').val().split("|");

            var menu_cd = arrData[0];
            var menu_name = arrData[1];

            bootbox.confirm({
                message: "Are you sure want to delete this menu (" + menu_cd + ") " + menu_name,
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
                        createScreenLoading();
                        var data = {
                            menu_cd: menu_cd
                        };

                        $.ajax({
                            url: "HIS010005/menu_control/deleteMenu.jsp",
                            type: "post",
                            data: data,
                            timeout: 60000, // 10 seconds
                            dataType: 'json',
                            success: function (data, textStatus, jqXHR) {

                                if (data.isValid) {
                                    bootbox.alert(data.msg);
                                    MENU_table.row(tr).remove().draw();
                                } else {
                                    bootbox.alert("<b class='text-danger'>" + data.msg + "</b>");
                                }

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                bootbox.alert("Oops! " + errorThrown);
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }

                        });

                    }
                }
            });
        });

        var $row;
        //update menu
        $('#menuTable').on('click', '#MENU_btnUpdateModal', function () {
            var tr = $(this).closest('tr');
            $row = tr;
            var arrData = tr.find('#MENU_hidden').val().split("|");
            $('.menu_add').hide();
            $('.menu_update').show();
            $('#MENU_code').prop('disabled', true);
            
            $('#MENU_lineModalLabel').html("Update Menu");
            $('#MENU_modal').modal('show');
            
            $('#MENU_code').val(arrData[0]);
            $('#MENU_name').val(arrData[1]);
            $('#MENU_level').val(arrData[2]);
            $('#MENU_type').val(arrData[3]);
            $('#MENU_status').val(arrData[5]);
            $('#MENU_parent_cd').val(arrData[4]);
        });
        
        $('#MENU_btnUpdate').on('click', function(){
            if(MENU_validateInput()){
                createScreenLoading();
                var input = {
                    menu_cd : $('#MENU_code').val(),
                    menu_name: $('#MENU_name').val(),
                    type: $('#MENU_type').val(),
                    status: $('#MENU_status').val()
                };
                
                $.ajax({
                    type: 'POST',
                    url: 'HIS010005/menu_control/updateMenu.jsp',
                    timeout: 60000,
                    data: input,
                    dataType: 'json',
                    success: function (data, textStatus, jqXHR) {
                        if(data.isValid){
                            bootbox.alert(data.msg);
                                                       
                            var strStatus = input.status.trim() === "0"? "Active" : "Inactive";
                            var parent_cd = $('#MENU_parent_cd').val().trim();
                            var level = $('#MENU_level').val().trim();
                            
                            var arrHidden = [input.menu_cd, input.menu_name, level, input.type, parent_cd, input.status ];
                            
                             var td7 = '<input id="MENU_hidden" type="hidden" value="'+arrHidden.join("|")+'">'
                                    +  '    <a id="MENU_btnUpdateModal" style="cursor: pointer" title="Update menu"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>'
                                    +  '    <a id="MENU_btnDelete" class="testing" style="cursor: pointer" title="Delete menu"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a> ';
                            
                            var arrRow = [input.menu_cd, input.menu_name, level, input.type, parent_cd, strStatus, td7];
                            MENU_table.row($row).data(arrRow).draw();
                            $('#MENU_modal').modal('hide');                           
                          
                        }
                        else{
                            bootbox.alert(data.msg);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown);
                    },
                    complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                    }
                });
            }
        });


    });// end document ready

</script>



<%-- 
    Document   : modality_main
    Created on : Mar 30, 2017, 7:25:00 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MODALITY CODE MANAGEMENT
    <span class="pull-right">
        <button id="MOD_btnCloneModal" class="btn btn-link" title="Clone item">Clone Modality</button>
        <button id="MOD_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#MOD_detail"><i class=" fa fa-plus"></i>&nbsp;&nbsp;Add Modality</button>
        
    </span>
</h4>
<!-- Add Button End -->

<!--clone modal-->
<jsp:include page="modal/modality_clone_modal.jsp"/>

<script>

    $('#MOD_btnAddNew').on('click', function () {

        $('#MOD_modal_title').text("Add New Modality");
        $('#MOD_modalityCode').prop('readonly', false);
        $('#MOD_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MOD_btnAdd">Add</button>');

        $('#MOD_addForm')[0].reset();



    });


    //------------------------------------------------------------ add new modality ----------------------------------------------------------------

    $('#MOD_div_btnAdd_or_update').on('click', '#MOD_btnAdd', function (e) {

        e.preventDefault();

        var mod_name = $('#MOD_modalityName').val();
        var mod_code = $('#MOD_modalityCode').val();
        var mod_status = $('#MOD_status').val();

        if (mod_code === "") {
            bootbox.alert("Insert the modality code");

        } else if (mod_name === "") {
            bootbox.alert("Insert the modality name");

        } else {
            var data = {
                mod_code: mod_code,
                mod_name: mod_name,
                status: mod_status
            };

            $.ajax({
                type: 'POST',
                url: "controller/modality_insert.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#modalityTable').load('modality_table.jsp');
                        $('#MOD_detail').modal('hide');
                        //alert("Insertion Success");
                        bootbox.alert({
                            message: "New modality code is added",
                            title: "Process Result",
                            backdrop: true
                        });

                    } else if (data.trim() === 'fail') {
                        bootbox.alert("Failed to add new modality code");

                    } else {

                        bootbox.alert(data.trim());
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                }
            });

        }

    });

    //------------------------------------------------------------ add new modality end ----------------------------------------------------------------


    //-----------------------------------------creatting modal for update----------------------------------------------------------------------

    $('#modalityTable').on('click', '#THE_modalityTable #MOD_btnModalUpdate', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#MOD_hidden").val();
        var arrayData = rowData.split("|");

        var mod_code = arrayData[0], mod_name = arrayData[1], status = arrayData[2];

        $('#MOD_modalityCode').val(mod_code);
        $('#MOD_modalityName').val(mod_name);
        $('#MOD_status').val(status);

        $('#MOD_modal_title').text("Update Body System");
        $('#MOD_modalityCode').prop('readonly', true);
        $('#MOD_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MOD_btnUpdate">Update</button>');




    });

    //-----------------------------------------creatting modal for update end----------------------------------------------------------------------


    //------------------------------- update upon button click ----------------------------------------------------------------

    $('#MOD_div_btnAdd_or_update').on('click', '#MOD_btnUpdate', function () {

        var mod_code = $('#MOD_modalityCode').val();
        var mod_name = $('#MOD_modalityName').val();
        var status = $('#MOD_status').val();

        if (mod_code === "") {
            bootbox.alert("Modality code can't be empty");

        } else if (mod_name === "") {
            bootbox.alert("Please fill in the modality name");

        } else {

            var data = {
                mod_code: mod_code,
                mod_name: mod_name,
                status: status
            };

            $.ajax({
                type: 'POST',
                url: "controller/modality_update.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#modalityTable').load('modality_table.jsp');
                        $(".modal-backdrop").hide();
                        $('#MOD_detail').modal('hide');
                        //alert("Update Success");

                        bootbox.alert({
                            message: "Modality code is updated",
                            title: "Process Result",
                            backdrop: true
                        });

                    }else if(data.trim() === 'fail'){
                        bootbox.alert("Failed to update modality code");
                    }


                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                }
            });
        }
    });

    //------------------------------- update upon button click end ----------------------------------------------------------------


    //------------------------------- delete upon button click -------------------------------------------------------

    $('#modalityTable').on('click', '#THE_modalityTable #MOD_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest('tr');
        var rowData = row.find('#MOD_hidden').val();
        var arrayData = rowData.split("|");

        var mod_code = arrayData[0], mod_name = arrayData[1];

        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete " + mod_code + " - " + mod_name,
            buttons: {
                confirm: {
                    label: "Yes",
                    className: "btn-success"
                },
                cancel: {
                    label: "No",
                    className: "btn-danger"
                }
            },
            callback: function (result) {

                if (result) {
                    var data = {
                        mod_code: mod_code
                    };

                    $.ajax({
                        type: 'POST',
                        url: "controller/modality_delete.jsp",
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === 'success') {

                                $('#modalityTable').load('modality_table.jsp');
                                $(".modal-backdrop").hide();
                                //alert("Update Success");

                                bootbox.alert({
                                    message: "A modality code is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });

                            } else if (data.trim() === 'fail') {

                                bootbox.alert("Failed to delete " + mod_code + " - " + mod_name);
                            
                            }else{
                                
                                bootbox.alert(data.trim());
                                
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            bootbox.alert("Opps! " + errorThrown);

                        }
                    });

                }
            }
        });



    });

    //------------------------------- delete upon button click end -------------------------------------------------------
    
    
    //---------------- clone modality ---------------------------------
    //.... laod cloneable modality
    function MOD_loadClone(){
        createScreenLoading();
        $('#MOD_clone_select_list').multiSelect('destroy');
        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "controller/modality_getClone.jsp",
            success: function (data, textStatus, jqXHR) {
                        $('#MOD_clone_select_list').html(data);
                        $('#MOD_clone_select_list').multiSelect({
                            selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Available Modality</div>",
                            selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Modality</div>",
                            keepOrder: true
                        });
                        $('#MOD_clone_modal').modal('show');
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown );
                        $('#MOD_clone_modal').modal('hide');
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
    //.... creating modal
    $('#MOD_btnCloneModal').on('click', function(){
        MOD_loadClone();
        
    });
    
    //... select all
    $('#MOD_clone_select_all').on('click', function(e){
        e.preventDefault();
        $('#MOD_clone_select_list').multiSelect('select_all');
    });
    
    //... deselect all
     $('#MOD_clone_deselect_all').on('click', function(e){
        e.preventDefault();
        $('#MOD_clone_select_list').multiSelect('deselect_all');
    });
    
    //... clone on button click
     $('#MOD_btnClone').on('click', function(){
        
        var arraySelect = [];
        $('#MOD_clone_select_list option:selected').each(function(){
            arraySelect.push($(this));
        });
        
        var strCode = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");
            
        if(strCode === "" || strCode === null){
            bootbox.alert("Please select at least one modality.");
        }
        else{
            createScreenLoading();
            
            var data = {
                strCode: strCode
            };
            
            var msg = "";
            
            $.ajax({
                type: 'POST',
                url: "controller/modality_insertClone.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim() === "success"){
                            msg="Modality is cloned sucessfully.";
                            $('#MOD_clone_modal').modal('hide');
                            $('#modalityTable').load('modality_table.jsp');
                        }
                        else if(data.trim() === "fail"){
                            msg="Failed to clone modality.";
                            MOD_loadClone();
                        }
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        msg="Oopps! "+ errorThrown;
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                        bootbox.alert(msg);
                }
            });
        }

    });
    //=================== end clone modality ==========================




    $(function () {
        $('.loading').hide();
    });

</script>
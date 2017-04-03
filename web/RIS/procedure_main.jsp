<%-- 
    Document   : procedure_main
    Created on : Apr 3, 2017, 6:46:06 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    PROCEDURE CODE MANAGEMENT
    <span class="pull-right">
        <button id="PRO_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#PRO_detail" style=" padding-right: 10px;padding-left: 10px;color: white;">
            <a data-toggle="tooltip" data-placement="top" title="Add Items" id="test">
                <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            </a>ADD Procedure
        </button>
    </span>
</h4>
<!-- Add Button End -->

<script>

    $('#PRO_btnAddNew').on('click', function () {

        $('#PRO_modal_title').text("Add New Radiology Procedure");
        $('#PRO_modalityCode').prop('readonly', false);
        $('#PRO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnAdd">Add</button>');

        $('#PRO_addForm')[0].reset();



    });



    //------------------------------------------------------------ add new modality ----------------------------------------------------------------

    $('#PRO_div_btnAdd_or_update').on('click', '#PRO_btnAdd', function (e) {

        e.preventDefault();

        var mod_name = $('#PRO_modalityName').val();
        var mod_code = $('#PRO_modalityCode').val();
        var mod_status = $('#PRO_status').val();

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
                        $('#PRO_detail').modal('hide');
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

    $('#modalityTable').on('click', '#THE_modalityTable #PRO_btnModalUpdate', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#PRO_hidden").val();
        var arrayData = rowData.split("|");

        var mod_code = arrayData[0], mod_name = arrayData[1], status = arrayData[2];

        $('#PRO_modalityCode').val(mod_code);
        $('#PRO_modalityName').val(mod_name);
        $('#PRO_status').val(status);

        $('#PRO_modal_title').text("Update Body System");
        $('#PRO_modalityCode').prop('readonly', true);
        $('#PRO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnUpdate">Update</button>');




    });

    //-----------------------------------------creatting modal for update end----------------------------------------------------------------------


    //------------------------------- update upon button click ----------------------------------------------------------------

    $('#PRO_div_btnAdd_or_update').on('click', '#PRO_btnUpdate', function () {

        var mod_code = $('#PRO_modalityCode').val();
        var mod_name = $('#PRO_modalityName').val();
        var status = $('#PRO_status').val();

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
                        $('#PRO_detail').modal('hide');
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

    $('#modalityTable').on('click', '#THE_modalityTable #PRO_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest('tr');
        var rowData = row.find('#PRO_hidden').val();
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




    $(function () {
        $('.loading').hide();
    });

</script>
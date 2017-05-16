<%-- 
    Document   : procedure_main
    Created on : May 10, 2017, 6:24:40 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    CIS PROCEDURE LEVEL 1 MANAGEMENT
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

        $('#PRO_modal_title').text("Add New Procedure");
        $('#PRO_Code').prop('disabled', false);
        $('#PRO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnAdd">Add</button>');

        $('#PRO_addForm')[0].reset();



    });


    //------------------------------------------------------------ add new procedure ----------------------------------------------------------------

    $('#PRO_div_btnAdd_or_update').on('click', '#PRO_btnAdd', function (e) {

        e.preventDefault();

        var name = $('#PRO_Name').val();
        var code = $('#PRO_Code').val();
        var status = $('#PRO_status').val();

        if (code === "") {
            bootbox.alert("Insert the procedure code");

        } else if (name === "") {
            bootbox.alert("Insert the procedure name");

        } else {

            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            var data = {
                code: code,
                name: name,
                status: status
            };

            $.ajax({
                type: 'POST',
                url: "procedure_controller/procedure_insert.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#procedureTable').load('procedure_table.jsp');
                        $('#PRO_detail').modal('hide');
                        //alert("Insertion Success");
                        bootbox.alert({
                            message: "New procedure code is added",
                            title: "Process Result",
                            backdrop: true
                        });

                    } else if (data.trim() === 'fail') {
                        bootbox.alert("Failed to add new procedure code");

                    } else if (data.trim() === 'duplicate') {

                        bootbox.alert('Sorry, the code ' + code + ' has been used. Please enter different code.');
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                }
            });

        }

    });

    //------------------------------------------------------------ add new procedure end ----------------------------------------------------------------


    //-----------------------------------------creatting modal for update----------------------------------------------------------------------

    $('#procedureTable').on('click', '#THE_procedureTable #PRO_btnModalUpdate', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#PRO_hidden").val();
        var arrayData = rowData.split("|");

        var code = arrayData[0], name = arrayData[1], status = arrayData[2];

        $('#PRO_Code').val(code);
        $('#PRO_Name').val(name);
        $('#PRO_status').val(status);

        $('#PRO_modal_title').text("Update Procedure");
        $('#PRO_Code').prop('disabled', true);
        $('#PRO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnUpdate">Update</button>');




    });

    //-----------------------------------------creatting modal for update end----------------------------------------------------------------------


    //------------------------------- update upon button click ----------------------------------------------------------------

    $('#PRO_div_btnAdd_or_update').on('click', '#PRO_btnUpdate', function () {

        var code = $('#PRO_Code').val();
        var name = $('#PRO_Name').val();
        var status = $('#PRO_status').val();

        if (code === "") {
            bootbox.alert("Procedure code can't be empty");

        } else if (name === "") {
            bootbox.alert("Please fill in the procedure name");

        } else {

            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            var data = {
                code: code,
                name: name,
                status: status
            };

            $.ajax({
                type: 'POST',
                url: "procedure_controller/procedure_update.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#procedureTable').load('procedure_table.jsp');
                        $(".modal-backdrop").hide();
                        $('#PRO_detail').modal('hide');
                        //alert("Update Success");

                        bootbox.alert({
                            message: "Procedure code is updated",
                            title: "Process Result",
                            backdrop: true
                        });

                    } else if (data.trim() === 'fail') {
                        bootbox.alert("Failed to update procedure code");
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

    $('#procedureTable').on('click', '#THE_procedureTable #PRO_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest('tr');
        var rowData = row.find('#PRO_hidden').val();
        var arrayData = rowData.split("|");

        var code = arrayData[0], name = arrayData[1];

        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete " + code + " - " + name,
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
                        code: code
                    };

                    $.ajax({
                        type: 'POST',
                        url: "procedure_controller/procedure_delete.jsp",
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === 'success') {

                                $('#procedureTable').load('procedure_table.jsp');
                                $(".modal-backdrop").hide();
                                //alert("Update Success");

                                bootbox.alert({
                                    message: "A procedure code is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });

                            } else if (data.trim() === 'fail') {

                                bootbox.alert("Failed to delete " + code + " - " + name);

                            } else if (data.trim() === 'look') {

                                bootbox.alert('You can\'t delete this code. The code '+code+', is referred by procedure 1.');

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

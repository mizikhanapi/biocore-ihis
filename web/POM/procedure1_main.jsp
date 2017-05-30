<%-- 
    Document   : procedure1_main
    Created on : May 15, 2017, 6:26:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    CIS PROCEDURE LEVEL 2 MANAGEMENT
    <span class="pull-right">
        <button id="PRO1_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#PRO1_detail" style=" padding-right: 10px;padding-left: 10px;color: white;">
            <a data-toggle="tooltip" data-placement="top" title="Add Items" id="test">
                <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            </a>ADD Procedure Level 2
        </button>
    </span>
</h4>
<!-- Add Button End -->

<script>

    $('#PRO1_btnAddNew').on('click', function () {

        $('#PRO1_modal_title').text("Add New Procedure");
        $('#PRO1_Code').prop('disabled', false);
        $('#PRO1_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO1_btnAdd">Add</button>');

        $('#PRO1_div_level1').show();
        $("#PRO1_div_insert").show();
        $("#PRO1_div_update").hide();


        $('#PRO1_addForm')[0].reset();



    });


    //------------------------------------------------------------ add new procedure ----------------------------------------------------------------

    $('#PRO1_div_btnAdd_or_update').on('click', '#PRO1_btnAdd', function (e) {

        e.preventDefault();

        var name = $('#PRO1_Name').val();
        var code_1 = $('#PRO1_level2_code_front').val();
        var code_2 = $('#PRO1_level2_code_ins').val();
        var status = $('#PRO1_status').val();

        if (code_1 === "") {
            bootbox.alert("Please choose existing level 1 code");

        } else if (code_2 === "") {
            bootbox.alert("Please complete the level 2 code");

        } else if (!/^[a-zA-Z0-9]+$/.test(code_2)) {
            bootbox.alert("Please enter alphabets and numbers only.", function(){
                $('#PRO1_level2_code_ins').focus();
            });
        } else if (name === "") {
            bootbox.alert("Please insert the level 2 name");

        } else {

            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var code = code_1.trim() + '.' + code_2.trim();

            var data = {
                code_1: code_1,
                code: code,
                name: name,
                status: status
            };

            $.ajax({
                type: 'POST',
                url: "procedure_controller/procedure1_insert.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#procedure1Table').load('procedure1_table.jsp');
                        $('#PRO1_detail').modal('hide');
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
                        $('#PRO1_level2_code_ins').val('');
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

    $('#procedure1Table').on('click', '#THE_procedure1Table #PRO1_btnModalUpdate', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#PRO1_hidden").val();
        var arrayData = rowData.split("|");

        var code_1 = arrayData[0], name = arrayData[1], status = arrayData[2], code_2 = arrayData[3];

        $('#PRO1_level1_code').val(code_1);
        $('#PRO1_level2_code_upd').val(code_2);
        $('#PRO1_Name').val(name);
        $('#PRO1_status').val(status);

        $('#PRO1_modal_title').text("Update Procedure");
        $('#PRO1_div_level1').hide();
        $("#PRO1_div_insert").hide();
        $("#PRO1_div_update").show();

        $('#PRO1_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO1_btnUpdate">Update</button>');

        //console.log( $('#PRO1_level1_code').val());



    });

    //-----------------------------------------creatting modal for update end----------------------------------------------------------------------


    //------------------------------- update upon button click ----------------------------------------------------------------

    $('#PRO1_div_btnAdd_or_update').on('click', '#PRO1_btnUpdate', function () {

        var code_1 = $("#PRO1_level1_code").val();
        var code = $('#PRO1_level2_code_upd').val();
        var name = $('#PRO1_Name').val();
        var status = $('#PRO1_status').val();


        if (code === "") {
            bootbox.alert("Procedure code can't be empty");

        } else if (name === "") {
            bootbox.alert("Please fill in the procedure name");

        } else {

            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            var data = {
                code_1: code_1,
                code: code,
                name: name,
                status: status
            };

            $.ajax({
                type: 'POST',
                url: "procedure_controller/procedure1_update.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#procedure1Table').load('procedure1_table.jsp');
                        $(".modal-backdrop").hide();
                        $('#PRO1_detail').modal('hide');
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

    $('#procedure1Table').on('click', '#THE_procedure1Table #PRO1_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest('tr');
        var rowData = row.find('#PRO1_hidden').val();
        var arrayData = rowData.split("|");

        var code_1 = arrayData[0], name = arrayData[1], code_2 = arrayData[3];

        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete " + code_2 + " - " + name,
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
                        code_1: code_1,
                        code: code_2
                    };

                    $.ajax({
                        type: 'POST',
                        url: "procedure_controller/procedure1_delete.jsp",
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === 'success') {

                                $('#procedure1Table').load('procedure1_table.jsp');
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

                                bootbox.alert('You can\'t delete this code. The code ' + code + ', is referred by procedure 1.');

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


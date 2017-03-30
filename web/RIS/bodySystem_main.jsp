<%-- 
    Document   : bodySystem_main
    Created on : Mar 28, 2017, 12:37:37 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    BODY SYSTEM CODE MANAGEMENT
    <span class="pull-right">
        <button id="BS_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#BS_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Body System</button>
    </span>
</h4>
<!-- Add Button End -->

<script>

    $('#BS_btnAddNew').on('click', function () {

        $('#BS_modal_title').text("Add New Body System");
        $('#BS_bodySystemCode').prop('readonly', false);
        $('#BS_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="BS_btnAdd">Add</button>');

        $('#BS_addForm')[0].reset();



    });


    //------------------------------------------------------------ add new body system ----------------------------------------------------------------

    $('#BS_div_btnAdd_or_update').on('click', '#BS_btnAdd', function (e) {

        e.preventDefault();

        var bs_name = $('#BS_bodySystemName').val();
        var bs_code = $('#BS_bodySystemCode').val();
        var bs_status = $('#BS_status').val();

        if (bs_code === "") {
            bootbox.alert("Insert the body system code");

        } else if (bs_name === "") {
            bootbox.alert("Insert the body system name");

        } else {
            var data = {
                bs_code: bs_code,
                bs_name: bs_name,
                status: bs_status
            };

            $.ajax({
                type: 'POST',
                url: "controller/bodySystem_insert.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#bodySystemTable').load('bodySystem_table.jsp');
                        $('#BS_detail').modal('hide');
                        //alert("Insertion Success");
                        bootbox.alert({
                            message: "New body system code is added",
                            title: "Process Result",
                            backdrop: true
                        });

                    } else if (data.trim() === 'fail') {
                        bootbox.alert("Failed to add new body system code");

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

    //------------------------------------------------------------ add new body system end ----------------------------------------------------------------


    //-----------------------------------------creatting modal for update----------------------------------------------------------------------

    $('#bodySystemTable').on('click', '#THE_bodySystemTable #BS_btnModalUpdate', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#BS_hidden").val();
        var arrayData = rowData.split("|");

        var bs_code = arrayData[0], bs_name = arrayData[1], status = arrayData[2];

        $('#BS_bodySystemCode').val(bs_code);
        $('#BS_bodySystemName').val(bs_name);
        $('#BS_status').val(status);

        $('#BS_modal_title').text("Update Body System");
        $('#BS_bodySystemCode').prop('readonly', true);
        $('#BS_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="BS_btnUpdate">Update</button>');




    });

    //-----------------------------------------creatting modal for update end----------------------------------------------------------------------


    //------------------------------- update upon button click ----------------------------------------------------------------

    $('#BS_div_btnAdd_or_update').on('click', '#BS_btnUpdate', function () {

        var bs_code = $('#BS_bodySystemCode').val();
        var bs_name = $('#BS_bodySystemName').val();
        var status = $('#BS_status').val();

        if (bs_code === "") {
            bootbox.alert("Body system code can't be empty");

        } else if (bs_name === "") {
            bootbox.alert("Please fill in the body system name");

        } else {

            var data = {
                bs_code: bs_code,
                bs_name: bs_name,
                status: status
            };

            $.ajax({
                type: 'POST',
                url: "controller/bodySystem_update.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#bodySystemTable').load('bodySystem_table.jsp');
                        $(".modal-backdrop").hide();
                        $('#BS_detail').modal('hide');
                        //alert("Update Success");

                        bootbox.alert({
                            message: "Body system code is updated",
                            title: "Process Result",
                            backdrop: true
                        });

                    }else if(data.trim() === 'fail'){
                        bootbox.alert("Failed to update body system code");
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

    $('#bodySystemTable').on('click', '#THE_bodySystemTable #BS_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest('tr');
        var rowData = row.find('#BS_hidden').val();
        var arrayData = rowData.split("|");

        var bs_code = arrayData[0], bs_name = arrayData[1];

        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete " + bs_code + " - " + bs_name,
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
                        bs_code: bs_code
                    };

                    $.ajax({
                        type: 'POST',
                        url: "controller/bodySystem_delete.jsp",
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === 'success') {

                                $('#bodySystemTable').load('bodySystem_table.jsp');
                                $(".modal-backdrop").hide();
                                //alert("Update Success");

                                bootbox.alert({
                                    message: "A body system code is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });

                            } else if (data.trim() === 'fail') {

                                bootbox.alert("Failed to delete " + bs_code + " - " + bs_name);
                            
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
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
        <button id="PRO_btnCloneModal" class="btn btn-primary" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Clone item">
            <a>
                <i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            </a>CLONE Procedure
        </button>
    </span>
</h4>
<!-- Add Button End -->

<!--clone modal-->
<jsp:include page="procedure_modal/procedure_clone_modal.jsp"/>

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
        var buy= $('#PRO_buyPrice').val();
        var sell= $('#PRO_sellPrice').val();

        if (code === "") {
            bootbox.alert("Insert the procedure code");

        } else if (name === "") {
            bootbox.alert("Insert the procedure name");

        } else if (buy===""){
            bootbox.alert("Insert the buying price");
            
        } else if (sell===""){
            bootbox.alert("Insert the selling price");
            
        } else if(!$('#PRO_addForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#PRO_addForm').click().remove();
           
        }
        else {

            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            var data = {
                code: code,
                name: name,
                buy: buy,
                sell: sell,
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

        var code = arrayData[0], name = arrayData[1], status = arrayData[2], buy=arrayData[3], sell=arrayData[4];

        $('#PRO_Code').val(code);
        $('#PRO_Name').val(name);
        $('#PRO_status').val(status);
        $('#PRO_sellPrice').val(sell);
        $('#PRO_buyPrice').val(buy);

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
        var buy= $('#PRO_buyPrice').val();
        var sell= $('#PRO_sellPrice').val();

        if (code === "") {
            bootbox.alert("Procedure code can't be empty!");

        } else if (name === "") {
            bootbox.alert("Please fill in the procedure name.");

        } else if (buy ===""){
            bootbox.alert("Please fill in the buying price.");
        
        } else if (sell===""){
            bootbox.alert("Please fill in the selling price.");
            
        } else if(!$('#PRO_addForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#PRO_addForm').click().remove();
           
        }
        else {

            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            var data = {
                code: code,
                name: name,
                buy: buy,
                sell:sell,
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
    
    //----------------- clone procedure ---------------------------
    
    //.... load cloneable procedure
    function PRO_loadClone(){
        createScreenLoading();
        $('#PRO_clone_select_list').multiSelect('destroy');
        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "clone_controll/procedure_getClone.jsp",
            success: function (data, textStatus, jqXHR) {
                        $('#PRO_clone_select_list').html(data);
                        $('#PRO_clone_select_list').multiSelect({
                            selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Available Procedure Level 1</div>",
                            selectionHeader: "<div style='display:block; color:white; background-color:#2196f3;'>Selected Procedure Level 1</div>",
                            keepOrder: true
                        });
                        $('#PRO_clone_modal').modal('show');
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown );
                        $('#PRO_clone_modal').modal('hide');
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
    //.... creating modal
    $('#PRO_btnCloneModal').on('click', function(){
        PRO_loadClone();
        
    });
    
    //... select all
    $('#PRO_clone_select_all').on('click', function(e){
        e.preventDefault();
        $('#PRO_clone_select_list').multiSelect('select_all');
    });
    
    //... deselect all
     $('#PRO_clone_deselect_all').on('click', function(e){
        e.preventDefault();
        $('#PRO_clone_select_list').multiSelect('deselect_all');
    });
    
    //... clone on button click
     $('#PRO_btnClone').on('click', function(){
        
        var arraySelect = [];
        $('#PRO_clone_select_list option:selected').each(function(){
            arraySelect.push($(this));
        });
        
        var strCode = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");
            
        if(strCode === "" || strCode === null){
            bootbox.alert("Please select at least one procedure.");
        }
        else{
            createScreenLoading();
            
            var data = {
                strCode: strCode
            };
            
            var msg = "";
            
            $.ajax({
                type: 'POST',
                url: "clone_controll/procedure_insertClone.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim() === "success"){
                            msg="Procedure level 1 is cloned sucessfully.";
                            $('#PRO_clone_modal').modal('hide');
                            $('#procedureTable').load('procedure_table.jsp');
                        }
                        else if(data.trim() === "fail"){
                            msg="Failed to clone procedure level 1.";
                            PRO_loadClone();
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
    //================= end clone =================================
    
     //------------------------------ controlling number input ------------------------------------------------------------------

    $('#PRO_buyPrice').on('keypress', function (event) {
        if (((event.which !== 46 || $(this).val().indexOf('.') !== -1)
                && (event.which < 48 || event.which > 57)
                || ($(this).val().length > 9))
                && event.which !== 8) {
            event.preventDefault();
            $("#PRO_buyPrice_err").html("Decimal Number Only!!!").show().fadeOut("slow");

        }


    });

    $('#PRO_sellPrice').on('keypress', function (event) {
        if (((event.which !== 46 || $(this).val().indexOf('.') !== -1)
                && (event.which < 48 || event.which > 57)
                || ($(this).val().length > 9))
                && event.which !== 8) {
            event.preventDefault();
            $("#PRO_sellPrice_err").html("Decimal Number Only!!!").show().fadeOut("slow");

        }

    });




    $(function () {
        $('.loading').hide();
    });

</script>

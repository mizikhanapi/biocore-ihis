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
        <button id="PRO_btnCloneModal" class="btn btn-link" title="Clone item">
                Clone Procedure
        </button>
        <button id="PRO_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#PRO_detail" >
                <i class=" fa fa-plus"></i>&nbsp;&nbsp;Add Procedure
        </button>
    </span>
</h4>
<!-- Add Button End -->

<!--clone modal-->
<jsp:include page="modal/procedure_clone_modal.jsp"/>

<script>

    $('#PRO_btnAddNew').on('click', function () {

        $('#PRO_modal_title').text("Add New Radiology Procedure");
        $('#PRO_proCode2').prop('readonly', false);
        $('#PRO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnAdd">Add</button>');

        //create all the option list
        createBodySystemOption("");
        createModalityOption("");

        //enabling all option

        $('#PRO_addForm')[0].reset();



    });



    //------------------------------------------------------------ add new modality ----------------------------------------------------------------

    $('#PRO_div_btnAdd_or_update').on('click', '#PRO_btnAdd', function (e) {

        e.preventDefault();
        
        var cdis_code = $('#PRO_clinical').val();
        var bs_code = $('#PRO_bodySystem').val();
        var mod_code = $('#PRO_modality').val();
        var last4_proCode = $('#PRO_proCode2').val();
        var proName = $('#PRO_proName').val();
        var buyPrice = $('#PRO_buyPrice').val();
        var sellPrice = $('#PRO_sellPrice').val();
        var quantity = $('#PRO_quantity').val();
        var status = $('#PRO_status').val();
       

        if (cdis_code === "") {
            bootbox.alert("Opps! Something went wrong. Clinical discipline can't be empty.");

        } else if (bs_code === "") {
            bootbox.alert("Select the body system");

        }else if (mod_code === "") {
            bootbox.alert("Select the modality");

        }else if (last4_proCode === "" || last4_proCode.length <= 3) {
            bootbox.alert("Please complete the procedure code. Procedure code must have 4 characters.");

        }else if (proName === "") {
            bootbox.alert("Please insert the procedure name");

        }else if (buyPrice === "") {
            bootbox.alert("Please insert the buying price");

        }else if (sellPrice === "") {
            bootbox.alert("Please insert the selling price");

        }else if (quantity === "") {
            bootbox.alert("Please insert the quantity");

        } else if(!$('#PRO_addForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#PRO_addForm').click().remove();
           
        }
        else {
            
            var procedure_code = cdis_code.trim() + bs_code.trim() + mod_code.trim() + last4_proCode.trim();
            console.log(procedure_code);
            
            var bs_name = $('#PRO_bodySystem').find(':selected').data('name');
            var mod_name = $('#PRO_modality').find(':selected').data('name');
            
            
            var data = {
                clinical_discipline_cd : cdis_code,
                bs_cd : bs_code,
                bs_name : bs_name,
                mod_cd : mod_code,
                mod_name : mod_name,
                procedure_cd : procedure_code,
                procedure_name : proName,
                buyPrice : buyPrice,
                sellPrice : sellPrice,
                quantity : quantity,
                status : status
                
            };

            $.ajax({
                type: 'POST',
                url: "controller/procedure_insert.jsp",
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

    $('#procedureTable').on('click', '#THE_procedureTable #PRO_btnModalUpdate', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#PRO_hidden").val();
        var arrayData = rowData.split("|");
        
        //                          0                            1               2              3           4               5               6                   7               8           9       10
    //String sqlPRO = "Select clinical_discipline_cd, body_system_cd, body_system_name, modality_cd, modality_name, ris_procedure_cd, ris_procedure_name, buying_price, selling_price, quantity, status from ris_procedure_master"
    

        var cli_cd = arrayData[0], bs_cd = arrayData[1], mod_cd = arrayData[3], pro_cd = arrayData[5], pro_name = arrayData[6], sell = arrayData[8], buy = arrayData[7], quantity = arrayData[9], status = arrayData[10];
        
        //create read only option
        createBodySystemOption(bs_cd);
        createModalityOption(mod_cd);
        
        var last4_code = pro_cd.substring(3);

        $('#PRO_clinical').val(cli_cd);
        $('#PRO_proCode1').val(cli_cd+'-'+bs_cd+'-'+mod_cd);
        $('#PRO_proCode2').val(last4_code);
        $('#PRO_proName').val(pro_name);
        $('#PRO_sellPrice').val(sell);
        $('#PRO_buyPrice').val(buy);
        $('#PRO_quantity').val(quantity);
        $('#PRO_status').val(status);

        $('#PRO_modal_title').text("Update Radiology Procedure");
        //$('#PRO_modalityCode').prop('readonly', true);
        $('#PRO_proCode2').prop('readonly', true);
        $('#PRO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnUpdate">Update</button>');




    });

    //-----------------------------------------creatting modal for update end----------------------------------------------------------------------


    //------------------------------- update upon button click ----------------------------------------------------------------

    $('#PRO_div_btnAdd_or_update').on('click', '#PRO_btnUpdate', function () {

        var cdis_code = $('#PRO_clinical').val();
        var bs_code = $('#PRO_bodySystem').val();
        var mod_code = $('#PRO_modality').val();
        var last4_proCode = $('#PRO_proCode2').val();
        var proName = $('#PRO_proName').val();
        var buyPrice = $('#PRO_buyPrice').val();
        var sellPrice = $('#PRO_sellPrice').val();
        var quantity = $('#PRO_quantity').val();
        var status = $('#PRO_status').val();
       

        if (cdis_code === "") {
            bootbox.alert("Opps! Something went wrong. Clinical discipline can't be empty.");

        } else if (bs_code === "") {
            bootbox.alert("Select the body system");

        }else if (mod_code === "") {
            bootbox.alert("Select the modality");

        }else if (last4_proCode === "" || last4_proCode.length <= 3) {
            bootbox.alert("Please complete the procedure code. Procedure code must have 4 characters.");

        }else if (proName === "") {
            bootbox.alert("Please insert the procedure name");

        }else if (buyPrice === "") {
            bootbox.alert("Please insert the buying price");

        }else if (sellPrice === "") {
            bootbox.alert("Please insert the selling price");

        }else if (quantity === "") {
            bootbox.alert("Please insert the quantity");

        } else if(!$('#PRO_addForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#PRO_addForm').click().remove();
           
        } else {
            
            var procedure_code = cdis_code.trim() + bs_code.trim() + mod_code.trim() + last4_proCode.trim();
            console.log(procedure_code);
            
                      
            
            var data = {
                procedure_cd : procedure_code,
                procedure_name : proName,
                buyPrice : buyPrice,
                sellPrice : sellPrice,
                quantity : quantity,
                status : status
                
            };

            $.ajax({
                type: 'POST',
                url: "controller/procedure_update.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {
                        $('#procedureTable').load('procedure_table.jsp');
                        $('#PRO_detail').modal('hide');
                        //alert("Insertion Success");
                        bootbox.alert({
                            message: "A procedure code is updated",
                            title: "Process Result",
                            backdrop: true
                        });

                    } else if (data.trim() === 'fail') {
                        bootbox.alert("Failed to update procedure code");

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

    //------------------------------- update upon button click end ----------------------------------------------------------------


    //----------------------------- creating option for bodySystem -------------------------------------------------
    function createBodySystemOption(pilihan) {
        var data = {
            process: "bsOption",
            pilihan: pilihan
        };

        $.ajax({
            type: 'POST',
            url: "controller/procedure_getOption.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                $('#PRO_bodySystem').html(data);

                if (pilihan !== "") {
                    $('#PRO_bodySystem').val(pilihan);
                    $('#PRO_bodySystem').prop('disabled', true);
                
                }else{
                    $('#PRO_bodySystem').prop('disabled', false);                    
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    }
    //----------------------------- creating option for bodySystem end -------------------------------------------------

    //----------------------------- creating option for modality -------------------------------------------------
    function createModalityOption(pilihan) {
        var data = {
            process: "modOption",
            pilihan: pilihan
        };

        $.ajax({
            type: 'POST',
            url: "controller/procedure_getOption.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                $('#PRO_modality').html(data);

                if (pilihan !== "") {
                    $('#PRO_modality').val(pilihan);
                    $('#PRO_modality').prop('disabled', true);
                    
                }else{
                    $('#PRO_modality').prop('disabled', false);                    
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(errorThrown);
            }
        });
    }
    //----------------------------- creating option for modality end -------------------------------------------------


    //-------------------------------generating first 3 code for procedure ------------------------------------------

    function generateFirst3ProcedureCode() {

        //console.log("hai");
        var dis, bs, mod;

        dis = $('#PRO_clinical').val();
        bs = $('#PRO_bodySystem').val();
        mod = $('#PRO_modality').val();

        if (bs === "") {
            bs = '_';
        }

        if (mod === "") {
            mod = '_';
        }

        var code = dis+'-'+ bs + '-'+mod;

        $('#PRO_proCode1').val(code);

    }

    $('#PRO_bodySystem').on('change', function () {
        generateFirst3ProcedureCode();
    });

    $('#PRO_modality').on('change', function () {
        generateFirst3ProcedureCode();
    });

    //-------------------------------generating first 3 code for procedure end------------------------------------------


    //------------------------------- delete upon button click -------------------------------------------------------

    $('#procedureTable').on('click', '#THE_procedureTable #PRO_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest('tr');
        var rowData = row.find('#PRO_hidden').val();
        var arrayData = rowData.split("|");

        var pro_cd = arrayData[5], pro_name = arrayData[6];

        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete " + pro_cd + " - " + pro_name,
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
                        proCode : pro_cd
                    };

                    $.ajax({
                        type: 'POST',
                        url: "controller/procedure_delete.jsp",
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

                                bootbox.alert("Failed to delete " + pro_cd + " - " + pro_name);

                            } else {

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

    $('#PRO_quantity').on('keypress', function (e) {

        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57) || $(this).val().length > 10) {
            //display error message
            $("#PRO_quantity_err").html("Whole Number Only!!!").show().fadeOut("slow");
            return false;
        }
    });

    //------------------------------ controlling number input end --------------------------------------------------------------

    //----------------- clone procedure ---------------------------
    
    //.... load cloneable procedure 
    function PRO_loadClone(){
        createScreenLoading();
        $('#PRO_clone_select_list').multiSelect('destroy');
        $.ajax({
            type: 'GET',
            timeout: 60000,
            url: "controller/procedure_getClone.jsp",
            success: function (data, textStatus, jqXHR) {
                        $('#PRO_clone_select_list').html(data);
                        $('#PRO_clone_select_list').multiSelect({
                            selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Available Procedure</div>",
                            selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Procedure</div>",
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
                url: "controller/procedure_insertClone.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim() === "success"){
                            msg="Procedure is cloned sucessfully.";
                            $('#PRO_clone_modal').modal('hide');
                            $('#procedureTable').load('procedure_table.jsp');
                        }
                        else if(data.trim() === "fail"){
                            msg="Failed to clone procedure.";
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


    $(function () {
        $('.loading').hide();
    });

</script>
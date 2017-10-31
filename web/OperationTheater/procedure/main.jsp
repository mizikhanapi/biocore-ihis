<%-- 
    Document   : main
    Created on : Jul 20, 2017, 3:04:44 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    PROCEDURE MANAGEMENT
    <span class="pull-right" id="PRO_span_buttons" style="display: none">
        <button id="PRO_btnAddModal" class="btn btn-success" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Add item">
           <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
           ADD Procedure
        </button>
        <button id="PRO_btnCloneModal" class="btn btn-primary" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Clone item">
            <i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            CLONE Procedure
        </button>
    </span>
</h4>
<!-- Add Button End -->

<!--hidden leaf village-->
<input type="hidden" id="PRO_hidden_name">
<input type="hidden" id="PRO_hidden_code">

<h4 id="PRO_h3_name">Please select a category first.</h4>

<!--modal-->
<jsp:include page="modal.jsp"/>
<!--modal-->

<script type="text/javascript">
    
    
    //....... check all field are insert
    function PRO_checkFields(){
        var msg="";
        var isComplete = true;
        
        var category_name = $('#PRO_category_name').val();
        var category_code = $('#PRO_proCode1').val();
        var proCode = $('#PRO_proCode2').val();
        var proNameS = $('#PRO_proNameShort').val();
        var proNameL = $('#PRO_proNameLong').val();
        var buy =$('#PRO_buyPrice').val();
        var sell =$('#PRO_sellPrice').val();
        var quantity =$('#PRO_quantity').val();
        var status = $('#PRO_status').val();
        
        if(category_name === ''){
            isComplete=false;
            msg="Something went wrong. Please try again later.";
        }
        else if(category_code===""){
            isComplete=false;
            msg="Something went wrong. Please try again later.";
        }
        else if(proCode===""){
            isComplete=false;
            msg="Please fill in the procedure code.";
        }
        else if(proNameS===""){
            isComplete=false;
            msg="Please write the abbreviation of the procedure.";
        }
        else if(proNameL===""){
            isComplete=false;
            msg="Please write the complete procedure name.";
        }
        else if(buy===""){
            isComplete=false;
            msg="Please fill in the buying price.";
        }
        else if(sell===""){
            isComplete=false;
            msg="Please fill in the selling price.";
        }
        else if(quantity===""){
            isComplete=false;
            msg="Please fill in the quantity.";
        }
        else if(status===""){
            isComplete=false;
            msg="Please select the status";
        }
        
        if(!isComplete){
            bootbox.alert(msg);
            $('#PRO_modal').css('overflow', 'auto');
        }
        
        return isComplete;
    }
    
    //--------------- add new procedure ---------------------------------------
    
    //... create modal
    $('#PRO_btnAddModal').on('click', function(){
        $('#PRO_modal_title').text("Add Procedure");
        $('#div_PRO_btnAdd').show();
        $('#div_PRO_btnUpdate').hide();
        
        $('#PRO_proCode2').prop('disabled', false);
        
        $('#PRO_modal').modal('show');
        
        $('#PRO_addForm')[0].reset();
        
        $('#PRO_category_name').val($('#PRO_hidden_name').val().trim());
        $('#PRO_proCode1').val($('#PRO_hidden_code').val().trim());
    });
    
    //... add on button click
    $('#PRO_btnAdd').on('click', function(){
        if(PRO_checkFields()){
            
            var category_name = $('#PRO_category_name').val();
            var category_code = $('#PRO_proCode1').val();
            var proCode = $('#PRO_proCode2').val();
            var proNameS = $('#PRO_proNameShort').val();
            var proNameL = $('#PRO_proNameLong').val();
            var buy =$('#PRO_buyPrice').val();
            var sell =$('#PRO_sellPrice').val();
            var quantity =$('#PRO_quantity').val();
            var status = $('#PRO_status').val();
            
            var completeCode = category_code.trim() + proCode.trim();
            
            proNameS = proNameS.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            proNameL = proNameL.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var data ={
                category_code: category_code,
                proCode: completeCode,
                nameS: proNameS,
                nameL: proNameL,
                buy: buy,
                sell: sell,
                quantity: quantity,
                status: status
            };
            var msg="-";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                url: "procedure/insert.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim()==='success'){
                            msg="Procedure inserted successfully.";
                            $('#PRO_modal').modal('hide');
                            OT_loadProcedureDetail(category_code, category_name);
                        }
                        else if(data.trim()==='fail'){
                            msg="Failed to add Procedure.";
                        }
                        else if(data.trim()==='duplicate'){
                            msg="The code "+completeCode+" is already in used.\nPlease insert different code.";
                            $('#PRO_proCode2').val();
                        }
                        else{
                            msg=data.trim();
                        }
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        msg="Oopps! "+errorThrown;
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                        bootbox.alert(msg);
                       
                }
            });
        }
    });
    
    //============== add new category end ====================================
    
    //------------------ update category ---------------------------------------
    
    //.... create the update modal
    $('#OT_procedureTable').on('click', '#PRO_btnModalUpdate', function(){
        var hidden = $(this).closest('tr').find('#PRO_hidden_column').text();
        //console.log(hidden);
        
        var tempArr = hidden.split("|");
        
        var proCode1 = tempArr[0].substring(0,3), proCode2 = tempArr[0].substring(3);
        
        $('#PRO_category_name').val($('#PRO_hidden_name').val());
        $('#PRO_proCode1').val(proCode1);
        $('#PRO_proCode2').val(proCode2);
        $('#PRO_proNameShort').val(tempArr[1]);
        $('#PRO_proNameLong').val(tempArr[2]);
        $('#PRO_buyPrice').val(tempArr[4]);
        $('#PRO_sellPrice').val(tempArr[5]);
        $('#PRO_quantity').val(tempArr[3]);
        $('#PRO_status').val(tempArr[6]);
        
        $('#PRO_modal_title').text("Update Procedure");
        $('#PRO_proCode2').prop('disabled', true);
        $('#div_PRO_btnAdd').hide();
        $('#div_PRO_btnUpdate').show();
        
        $('#PRO_modal').modal('show');
    });
    
    //... on bnt update click
    $('#PRO_btnUpdate').on('click', function(){
        if(PRO_checkFields()){
            var category_name = $('#PRO_category_name').val();
            var category_code = $('#PRO_proCode1').val();
            var proCode = $('#PRO_proCode2').val();
            var proNameS = $('#PRO_proNameShort').val();
            var proNameL = $('#PRO_proNameLong').val();
            var buy =$('#PRO_buyPrice').val();
            var sell =$('#PRO_sellPrice').val();
            var quantity =$('#PRO_quantity').val();
            var status = $('#PRO_status').val();
            
            var completeCode = category_code.trim() + proCode.trim();
            
            proNameS = proNameS.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            proNameL = proNameL.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var data ={
                category_code: category_code,
                proCode: completeCode,
                nameS: proNameS,
                nameL: proNameL,
                buy: buy,
                sell: sell,
                quantity: quantity,
                status: status
            };
            var msg="-";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                url: "procedure/update.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim()==='success'){
                            msg="Procedure updated successfully.";
                            $('#PRO_modal').modal('hide');
                            OT_loadProcedureDetail(category_code, category_name);
                        }
                        else if(data.trim()==='fail'){
                            msg="Failed to update procedure.";
                        }
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        msg="Oopps! "+errorThrown;
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                        bootbox.alert(msg);
                       
                }
            });
        }
    });
    //============= update procedure end ===========================
    
    //---------- delete category --------------------
    $('#OT_procedureTable').on('click', '#PRO_btnDelete', function(){
        
        var hidden = $(this).closest('tr').find('#PRO_hidden_column').text();
       
        var tempArr = hidden.split("|");
        
         var proCode = tempArr[0], proName= tempArr[1];
         var catCode = $('#PRO_hidden_code').val();
         var catName = $('#PRO_hidden_name').val();
        
        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete " + proCode + " - " + proName+"?",
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
                        proCode: proCode,
                        catCode: catCode
                    };

                    var msg="-";
                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        url: "procedure/delete.jsp",
                        timeout: 60000,
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                                if(data.trim()==='success'){
                                    msg="Procedure deleted successfully.";
                                    $('#PRO_modal').modal('hide');
                                    OT_loadProcedureDetail(catCode, catName);
                                }
                                else if(data.trim()==='fail'){
                                    msg="Failed to delete ptrocedure.";
                                }
                                
                            },
                        error: function (jqXHR, textStatus, errorThrown) {
                                msg="Oopps! "+errorThrown;
                            },
                        complete: function (jqXHR, textStatus ) {
                                destroyScreenLoading();
                                bootbox.alert(msg);

                        }
                    });

                }
            }
        });

    });
    
    
    //============== delete category end ===========================
    
    
    //----------------------------- clone procedure -------------------------------
    function PRO_loadClone(){
        var cat_cd = $('#PRO_hidden_code').val();
        createScreenLoading();
        $('#PRO_clone_select_list').multiSelect('destroy');
        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "procedure/getClone.jsp",
            data: {
                cat_cd: cat_cd
            },
            success: function (data, textStatus, jqXHR) {
                        $('#PRO_clone_select_list').html(data);
                        $('#PRO_clone_select_list').multiSelect({
                            selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Available Procedure</div>",
                            selectionHeader: "<div style='display:block; color:white; background-color:#2196f3;'>Selected Procedure</div>",
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
        
        var cat_cd = $('#PRO_hidden_code').val();
        var cat_name = $('#PRO_hidden_name').val();
        
        var strCode = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");
            
        if(strCode === "" || strCode === null){
            bootbox.alert("Please select at least one procedure.");
        }
        else{
            createScreenLoading();
            
            var data = {
                strCode: strCode,
                cat_cd: cat_cd
            };
            
            var msg = "";
            
            $.ajax({
                type: 'POST',
                url: "procedure/insertClone.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim() === "success"){
                            msg="Procedure is cloned sucessfully.";
                            $('#PRO_clone_modal').modal('hide');
                            OT_loadProcedureDetail(cat_cd, cat_name);
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
    //============================ clone procedure =================================
    
    //------------------------------ controlling number input ------------------------------------------------------------------

    $('#PRO_buyPrice').on('keypress', function (event) {
        if (((event.which !== 46 || $(this).val().indexOf('.') !== -1)
                && (event.which < 48 || event.which > 57)
                || ($(this).val().length > 8))
                && event.which !== 8) {
            event.preventDefault();
            $("#PRO_buyPrice_err").html("Decimal Number Only!!!").show().fadeOut("slow");

        }


    });

    $('#PRO_sellPrice').on('keypress', function (event) {
        if (((event.which !== 46 || $(this).val().indexOf('.') !== -1)
                && (event.which < 48 || event.which > 57)
                || ($(this).val().length > 8))
                && event.which !== 8) {
            event.preventDefault();
            $("#PRO_sellPrice_err").html("Decimal Number Only!!!").show().fadeOut("slow");

        }

    });

    $('#PRO_quantity').on('keypress', function (e) {

        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            $("#PRO_quantity_err").html("Whole Number Only!!!").show().fadeOut("slow");
            return false;
        }
    });

    //------------------------------ controlling number input end --------------------------------------------------------------
    
</script>

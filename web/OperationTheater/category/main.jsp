<%-- 
    Document   : main
    Created on : Jul 20, 2017, 3:04:44 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    PROCEDURE CATEGORY MANAGEMENT
    <span class="pull-right">
        <button id="CAT_btnAddModal" class="btn btn-success" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Add item">
            <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            ADD Category
        </button>
        
        <button id="CAT_btnCloneModal" class="btn btn-primary" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Clone item">
            <i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            CLONE Category
        </button>
    </span>
</h4>
<!-- Add Button End -->

<!--modal-->
<jsp:include page="modal.jsp"/>
<!--modal-->

<script type="text/javascript">
    
    //...... load category table
    function OT_loadCategoryTable(){
        createScreenLoading();
        $('#OT_categoryTable').load('category/table.jsp');
        destroyScreenLoading();
    }
    
    //....... check all field are insert
    function OT_checkFields(){
        var msg="";
        var isComplete = true;
        
        var code = $('#CAT_Code').val();
        var name = $('#CAT_Name').val();
        var status = $('#CAT_status').val();
        
        if(code === ''){
            isComplete=false;
            msg="Please fill in the code.";
        }
        else if(name===""){
            isComplete=false;
            msg="Please fill in the name.";
        }
        else if(status===""){
            isComplete=false;
            msg="Please select the status";
        }
        
        if(!isComplete){
            bootbox.alert(msg);
        }
        
        return isComplete;
    }
    
    //--------------- add new category ---------------------------------------
    
    //... create modal
    $('#CAT_btnAddModal').on('click', function(){
        $('#CAT_modal_title').text("Add Category");
        $('#div_CAT_btnAdd').show();
        $('#div_CAT_btnUpdate').hide();
        
        $('#CAT_Code').prop('disabled', false);
        
        $('#CAT_modal').modal('show');
        
        $('#CAT_addForm')[0].reset();
    });
    
    //... add on button click
    $('#CAT_btnAdd').on('click', function(){
        if(OT_checkFields()){
            
            var code = $('#CAT_Code').val();
            var name = $('#CAT_Name').val();
            var status = $('#CAT_status').val();
            
            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var data ={
                code: code,
                name: name,
                status: status
            };
            var msg="-";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                url: "category/insert.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim()==='success'){
                            msg="Category inserted successfully.";
                            $('#CAT_modal').modal('hide');
                            OT_loadCategoryTable();
                        }
                        else if(data.trim()==='fail'){
                            msg="Failed to add category.";
                        }
                        else if(data.trim()==='duplicate'){
                            msg="The code "+code+" is already in used.\nPlease insert different code.";
                            $('#CAT_Code').val();
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
    $('#OT_categoryTable').on('click', '#CAT_btnModalUpdate', function(){
        var hidden = $(this).closest('tr').find('#CAT_hidden_column').text();
        //console.log(hidden);
        
        var tempArr = hidden.split("|");
        
        $('#CAT_Code').val(tempArr[0]);
        $('#CAT_Name').val(tempArr[1]);
        $('#CAT_status').val(tempArr[2]);
        
        $('#CAT_modal_title').text("Update Category");
        $('#CAT_Code').prop('disabled', true);
        $('#div_CAT_btnAdd').hide();
        $('#div_CAT_btnUpdate').show();
        
        $('#CAT_modal').modal('show');
    });
    
    //... on bnt update click
    $('#CAT_btnUpdate').on('click', function(){
        if(OT_checkFields()){
            var code = $('#CAT_Code').val();
            var name = $('#CAT_Name').val();
            var status = $('#CAT_status').val();
            
            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            var data ={
                code: code,
                name: name,
                status: status
            };
            var msg="-";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                url: "category/update.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim()==='success'){
                            msg="Category updated successfully.";
                            $('#CAT_modal').modal('hide');
                            OT_loadCategoryTable();
                        }
                        else if(data.trim()==='fail'){
                            msg="Failed to update category.";
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
    //============= update categor end ===========================
    
    //---------- delete category --------------------
    $('#OT_categoryTable').on('click', '#CAT_btnDelete', function(){
        
        var hidden = $(this).closest('tr').find('#CAT_hidden_column').text();
       
        var tempArr = hidden.split("|");
        
        var code = tempArr[0].trim();
        var name = tempArr[1].trim();
        
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

                    var msg="-";
                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        url: "category/delete.jsp",
                        timeout: 60000,
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                                if(data.trim()==='success'){
                                    msg="Category deleted successfully.";
                                    $('#CAT_modal').modal('hide');
                                    OT_loadCategoryTable();
                                }
                                else if(data.trim()==='fail'){
                                    msg="Failed to delete category.";
                                }
                                else if(data.trim() === 'no'){
                                    msg="Cannot delete category "+name+" because it is referred by procedure.";
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
            }
        });

    });
    
    
    //============== delete category end ===========================
    
    //-------------- view procedure tab --------------------
    
    //... load procedure table
    function OT_loadProcedureDetail(code, name){
        createScreenLoading();
        var data ={
                code: code,
                name: name
            };
            var msg="";
        $.ajax({
            type: 'POST',
            url: "procedure/table.jsp",
            timeout: 60000,
            data: data,
            success: function (data, textStatus, jqXHR) {
                    $('#OT_procedureTable').html(data);
                    msg="Procedure loaded...";
                    $('#PRO_hidden_name').val(name);
                    $('#PRO_hidden_code').val(code);
                    $('#PRO_h3_name').text("Procedure of "+name+" Category");
                    $('#PRO_span_buttons').show();
                },
            error: function (jqXHR, textStatus, errorThrown) {
                    msg="Oopps! "+errorThrown;
                },
            complete: function (jqXHR, textStatus ) {
                    destroyScreenLoading();
                    //bootbox.alert(msg);

            }
        });

    }
    
    $('#OT_categoryTable').on('click', '#CAT_btnView', function(){
         
        var hidden = $(this).closest('tr').find('#CAT_hidden_column').text();
       
        var tempArr = hidden.split("|");
        
        var code = tempArr[0].trim();
        var name = tempArr[1].trim();
        
        OT_loadProcedureDetail(code, name);
        
        $('.nav-tabs a[href="#tab_default_2"]').tab('show');
    });
   //=============== view procedure tab end ================
   
   
   //----------------- clone category --------------------------
   
    //.... load cloneable procedure
    function CAT_loadClone(){
        createScreenLoading();
        $('#CAT_clone_select_list').multiSelect('destroy');
        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "category/getClone.jsp",
            success: function (data, textStatus, jqXHR) {
                        $('#CAT_clone_select_list').html(data);
                        $('#CAT_clone_select_list').multiSelect({
                            selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Available Procedure Category</div>",
                            selectionHeader: "<div style='display:block; color:white; background-color:#2196f3;'>Selected Procedure Category</div>",
                            keepOrder: true
                        });
                        $('#CAT_clone_modal').modal('show');
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown );
                        $('#CAT_clone_modal').modal('hide');
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
   
   $('#CAT_btnCloneModal').on('click', function(){
       CAT_loadClone();
   });
   
   //... select all
    $('#CAT_clone_select_all').on('click', function(e){
        e.preventDefault();
        $('#CAT_clone_select_list').multiSelect('select_all');
    });
    
    //... deselect all
     $('#CAT_clone_deselect_all').on('click', function(e){
        e.preventDefault();
        $('#CAT_clone_select_list').multiSelect('deselect_all');
    });
    
    //... clone on button click
     $('#CAT_btnClone').on('click', function(){
        
        var arraySelect = [];
        $('#CAT_clone_select_list option:selected').each(function(){
            arraySelect.push($(this));
        });
        
        var strCode = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");
            
        if(strCode === "" || strCode === null){
            bootbox.alert("Please select at least one category.");
        }
        else{
            createScreenLoading();
            
            var data = {
                strCode: strCode
            };
            
            var msg = "";
            
            $.ajax({
                type: 'POST',
                url: "category/insertClone.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim() === "success"){
                            msg="Category is cloned sucessfully.";
                            $('#CAT_clone_modal').modal('hide');
                            OT_loadCategoryTable();
                        }
                        else if(data.trim() === "fail"){
                            msg="Failed to clone procedure category.";
                            CAT_loadClone();
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
   //================ clone category end =================================
</script>

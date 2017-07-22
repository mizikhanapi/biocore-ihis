<%-- 
    Document   : main
    Created on : Jul 22, 2017, 6:20:27 AM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    ROOM MANAGEMENT
    <span class="pull-right">
        <button id="ROOM_btnAddModal" class="btn btn-success" style=" padding-right: 10px;padding-left: 10px;color: white;" title="Add item">
            <a>
                <i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i>
            </a>ADD Room
        </button>
    </span>
</h4>

<!--modal-->
<jsp:include page="modal.jsp"/>
<!--modal-->

<script type="text/javascript">
    
    //...... load room data
    function ROOM_loadTable(){
        createScreenLoading();
        $('#roomTable').load('room/table.jsp');
        destroyScreenLoading();
    }
    
     //....... check all field are insert
    function ROOM_checkFields(){
        var msg="";
        var isComplete = true;
        
        var code = $('#ROOM_Code').val();
        var name = $('#ROOM_Name').val();
        var status = $('#ROOM_status').val();
        
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
    
    //--------------- add new room ---------------------------------------
    
    //... create modal
    $('#ROOM_btnAddModal').on('click', function(){
        $('#ROOM_modal_title').text("Add Room");
        $('#div_ROOM_btnAdd').show();
        $('#div_ROOM_btnUpdate').hide();
        
        $('#ROOM_Code').prop('disabled', false);
        
        $('#ROOM_modal').modal('show');
        
        $('#ROOM_addForm')[0].reset();
    });
    
    //... add on button click
    $('#ROOM_btnAdd').on('click', function(){
        if(ROOM_checkFields()){
            
            var code = $('#ROOM_Code').val();
            var name = $('#ROOM_Name').val();
            var status = $('#ROOM_status').val();
            
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
                url: "room/insert.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim()==='success'){
                            msg="Room inserted successfully.";
                            $('#ROOM_modal').modal('hide');
                            ROOM_loadTable();
                        }
                        else if(data.trim()==='fail'){
                            msg="Failed to add room.";
                        }
                        else if(data.trim()==='duplicate'){
                            msg="The number "+code+" is already in used.\nPlease insert different number.";
                            $('#ROOM_Code').val('');
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
    
    //------------------ update room ---------------------------------------
    
    //.... create the update modal
    $('#roomTable').on('click', '#ROOM_btnModalUpdate', function(){
        var hidden = $(this).closest('tr').find('#ROOM_hidden_column').text();
        //console.log(hidden);
        
        var tempArr = hidden.split("|");
        
        $('#ROOM_Code').val(tempArr[0]);
        $('#ROOM_Name').val(tempArr[1]);
        $('#ROOM_status').val(tempArr[2]);
        
        $('#ROOM_modal_title').text("Update Category");
        $('#ROOM_Code').prop('disabled', true);
        $('#div_ROOM_btnAdd').hide();
        $('#div_ROOM_btnUpdate').show();
        
        $('#ROOM_modal').modal('show');
    });
    
    //... on bnt update click
    $('#ROOM_btnUpdate').on('click', function(){
        if(ROOM_checkFields()){
            var code = $('#ROOM_Code').val();
            var name = $('#ROOM_Name').val();
            var status = $('#ROOM_status').val();
            
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
                url: "room/update.jsp",
                timeout: 60000,
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim()==='success'){
                            msg="Room updated successfully.";
                            $('#ROOM_modal').modal('hide');
                            ROOM_loadTable()
                        }
                        else if(data.trim()==='fail'){
                            msg="Failed to update room.";
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
    //============= update room end ===========================
    
    //---------- delete room --------------------
    $('#roomTable').on('click', '#ROOM_btnDelete', function(){
        
        var hidden = $(this).closest('tr').find('#ROOM_hidden_column').text();
       
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
                        url: "room/delete.jsp",
                        timeout: 60000,
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                                if(data.trim()==='success'){
                                    msg="Room deleted successfully.";
                                    $('#ROOM_modal').modal('hide');
                                    ROOM_loadTable();
                                }
                                else if(data.trim()==='fail'){
                                    msg="Failed to delete room.";
                                }
                                else if(data.trim() === 'no'){
                                    msg="Cannot delete room "+name+" because it is booked for operation.";
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
    
    
    //============== delete room end ===========================
    
    
</script>
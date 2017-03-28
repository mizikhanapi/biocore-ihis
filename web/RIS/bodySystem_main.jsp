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

        //------------------------------------------------------------ add new body system ----------------------------------------------------------------

        $('#BS_btnAdd').on('click', function () {

            var bs_name = $('#BS_bodySystemName').val();
            var bs_code = $('#BS_bodySystemCode').val();
            var bs_status = $('#BS_status').val();

            if (bs_name === "") {
                bootbox.alert("Insert the body system name");

            }else if(bs_code === ""){
                bootbox.alert("Insert the body system code");
                
            }else{
                var data = {
                    bs_code : bs_code,
                    bs_name : bs_name,
                    status : bs_status
                };
                
                $.ajax({
                    type: 'POST',
                    url: "controller/bodySystem_insert.jsp",
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        
                        if(data.trim() === 'success'){
                            $('#bodySystemTable').load('bodySystem_table.jsp');
                            $('#BS_detail').modal('hide');
                            //alert("Insertion Success");
                            bootbox.alert({
                                    message: "New body system code is added",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        }else if(data.trim() === 'fail'){
                            bootbox.alert("Failed to add new body system code");
                            
                        }else{
                            
                            bootbox.alert(data.trim());
                        }
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Opps! "+ errorThrown);
                    }
                });
                
            }

        });

        //------------------------------------------------------------ add new body system end ----------------------------------------------------------------


    });


    $(function () {
        $('.loading').hide();
    });

</script>
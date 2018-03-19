<%-- 
    Document   : page_main
    Created on : Feb 7, 2017, 5:31:11 PM
    Author     : user
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    PAGE CODE MANAGEMENT
    <span class="pull-right">
        <button id="MENU_btnAddModal" class="btn btn-success" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Menu</button>
    </span>
</h4>
<!-- Add Button End -->


<!--hidden field-->
<input type="hidden" id="MENU_module_cd">
<input type="hidden" id="MENU_page_cd">
<!--hidden field-->

<!-- Add Modal Start -->
<div class="modal fade" id="MENU_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Menu</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="MENU_form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Menu Code*</label>
                        <div class="col-md-8">
                            <input id="MENU_code"  type="text" placeholder="Enter menu code" class="form-control input-md code-input" maxlength="30">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Menu Name*</label>
                        <div class="col-md-8">
                            <input id="MENU_name"  type="text" placeholder="Enter menu name" class="form-control input-md" maxlength="200">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Menu Type*</label>
                        <div class="col-md-8">
                            <input id="MENU_type"  type="text" placeholder="Enter menu type" class="form-control input-md" maxlength="200">
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="MENU_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>
                    
                    <div id="MENU_levelHolder">
                        
                    </div>
                    
                     <div class="form-group">
                        <input type="hidden" id="MENU_parent_cd">
                        <input type="hidden" id="MENU_level">
                        <label class="col-md-4 control-label" for="textinput">Level <span id="MENU_levelNoText">1</span>*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="MENU_parent">
                                
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MENU_btnAdd">Add</button>
                    </div>
                    <div class="btn-group hidden" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MENU_btnUpdate">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MENU_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->

<script type="text/javascript">

    $(function () {

        var MENU_table;
        
        function MENU_initDataTable(){
            $('#THE_menuTable').DataTable({destroy:true});
            MENU_table = $('#THE_menuTable').DataTable();
        }

        $('#pageTable').on('click', '#PT_btnViewMenu', function () {
            createScreenLoading();

            var arrData = $(this).closest('tr').find('#PT_hidden').val().split("|");

            var data = {
                module_cd: arrData[2],
                page_cd: arrData[4],
                module_name: arrData[3],
                page_name: arrData[5]
            };
            
            $.ajax({
                url: "HIS010005/menu_table.jsp",
                type: 'POST',
                data: data,
                timeout: 60000,
                success: function (data, textStatus, jqXHR) {
                        $('#menuTable').html(data);
                        $('#MENU_module_cd').val(arrData[2]);
                        $('#MENU_page_cd').val(arrData[4]);
                        $('.nav-tabs a[href="#S_tab5"]').tab('show');
                        MENU_initDataTable();
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown);
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
            });
        });
        
        //add new menu
        $('#MENU_btnAddModal').on('click', function(){
            var module_cd = $('#MENU_module_cd').val().trim();
            var page_cd = $('#MENU_page_cd').val().trim();
            
            if(module_cd === "" || page_cd === ""){
                bootbox.alert("Please choose a page first!", function(){
                    $('.nav-tabs a[href="#S_tab4"]').tab('show');
                });
            }
            else{
                $('#MENU_modal').modal('show');
            }
        });


    });

</script>



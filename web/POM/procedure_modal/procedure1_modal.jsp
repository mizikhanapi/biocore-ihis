<%-- 
    Document   : procedure_modal
    Created on : May 10, 2017, 6:31:03 PM
    Author     : user
--%>

<!--Modal Detail--> 
<!-- Add Modal Start -->
<div class="modal fade" id="PRO1_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="PRO1_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="PRO1_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Level 1 Code*</label>
                        <div class="col-md-8">
                            <input id="PRO1_level1_name"  type="text" placeholder="Search CIS code level 1" class="form-control input-md" maxlength="30">
                            <input id="PRO1_level1_code" type="hidden">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Level 2 Code*</label>
                        <div class="col-md-8 input-group">
                            <input type="text" class="form-control" placeholder="End" size="4">
                            <span class="input-group-addon" style="border: 0px; background-color: white">.</span>
                            <input id="PRO1_level2_code"  type="text" placeholder="Insert level 2 procedure code " class="form-control input-md" maxlength="20">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Name*</label>
                        <div class="col-md-8">
                            <input id="PRO1_Name"  type="text" placeholder="Insert procedure name" class="form-control input-md" maxlength="199">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="PRO1_status">
                                <option  value="Active" >Active</option>
                                <option  value="Inactive" >Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="PRO1_div_btnAdd_or_update">
                        <!--<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO1_btnAdd">Add</button>-->
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="PRO1_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<!-- Modal -->


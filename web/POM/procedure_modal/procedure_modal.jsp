<%-- 
    Document   : procedure_modal
    Created on : May 10, 2017, 6:31:03 PM
    Author     : user
--%>

<!--Modal Detail--> 
<!-- Add Modal Start -->
<div class="modal fade" id="PRO_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="PRO_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="PRO_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Code*</label>
                        <div class="col-md-8">
                            <input id="PRO_Code"  type="text" placeholder="Insert procedure code" class="form-control input-md code-input" maxlength="10">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Name*</label>
                        <div class="col-md-8">
                            <input id="PRO_Name"  type="text" placeholder="Insert procedure name" class="form-control input-md" maxlength="199">

                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Buying Price (RM)*</label>
                        <div class="col-md-8">
                            <input type="number" placeholder="Insert the procedure buying price" class="form-control" max="9999999.99" min="0" step="0.01" id="PRO_buyPrice">
                            <p id="PRO_buyPrice_err" style="color: red"></p>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Selling Price (RM)*</label>
                        <div class="col-md-8">
                            <input type="number" placeholder="Insert the procedure selling price" class="form-control" max="9999999.99" min="0" step="0.01" id="PRO_sellPrice">
                            <p id="PRO_sellPrice_err" style="color: red"></p>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="PRO_status">
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
                    <div class="btn-group" role="group" id="PRO_div_btnAdd_or_update">
                        <!--<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PRO_btnAdd">Add</button>-->
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="PRO_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<!-- Modal -->


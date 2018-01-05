<%-- 
    Document   : modality_modal
    Created on : Mar 30, 2017, 7:19:40 PM
    Author     : user
--%>

<!-- Modal Detail -->
<!-- Add Modal Start -->
<div class="modal fade" id="MOD_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="MOD_modal_title"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="MOD_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Modality Code*</label>
                        <div class="col-md-8">
                            <input id="MOD_modalityCode"  type="text" placeholder="Insert modality code" class="form-control input-md code-input" maxlength="30">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Modality Name*</label>
                        <div class="col-md-8">
                            <input id="MOD_modalityName"  type="text" placeholder="Insert modality name" class="form-control input-md" maxlength="300">

                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="MOD_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="MOD_div_btnAdd_or_update">
                        <!--<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="MOD_btnAdd">Add</button>-->
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="MOD_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<!-- Modal -->


<%-- 
    Document   : manageStockCodeCateModal
    Created on : Nov 14, 2017, 10:05:29 AM
    Author     : Shammugam
--%>


<!-- Add Button End -->
<div class="modal fade" id="stockCateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="stockCateModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="stockCateForm">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Stock Category Code *</label>
                        <div class="col-md-8">
                            <input id="stockCateCode" name="freqCode" type="text" placeholder="Insert Stock Category Code" class="form-control input-md" maxlength="30" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Stock Category Name *</label>
                        <div class="col-md-8">
                            <textarea id="stockCateName" name="freqDesc" class="form-control" rows="4" placeholder="Insert Stock Category Name" maxlength="100" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Stock Category GL Code *</label>
                        <div class="col-md-8">
                            <input id="stockCateGLCode" name="freqValue" type="text" placeholder="Insert Stock Category GL Code" class="form-control input-md" maxlength="20" required>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Status *</label>
                        <div class="col-md-8">
                            <select id="stockCateStatus" name="freqStatus" class="form-control">
                                <option value="1" selected>Active</option>
                                <option value="0">Inactive</option>     
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="stockCate_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="stockCateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Supplier End -->
<!-- Add Part End -->
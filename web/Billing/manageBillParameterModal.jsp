<%-- 
    Document   : manageBillParameterModal
    Created on : Nov 29, 2017, 12:03:43 PM
    Author     : Shammugam
--%>


<!-- Add Button End -->
<div class="modal fade" id="billParameterModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="billParameterModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="billParameterModalForm">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Parameter Code *</label>
                        <div class="col-md-8">
                            <input id="billParameterCode" name="freqCode" type="text" placeholder="Insert Parameter Code" class="form-control input-md" maxlength="10" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Parameter Name *</label>
                        <div class="col-md-8">
                            <textarea id="billParameterName" name="freqDesc" class="form-control" rows="4" placeholder="Insert Parameter Name" maxlength="30" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Parameter value *</label>
                        <div class="col-md-8">
                            <input id="billParameterValue" name="freqValue" type="text" placeholder="Insert Parameter Value" class="form-control input-md decimalNumbersOnly" maxlength="6" required>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Enable *</label>
                        <div class="col-md-8">
                            <select id="billParameterEnable" name="freqStatus" class="form-control">
                                <option value="yes" selected>Yes</option>
                                <option value="no">No</option>     
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Status *</label>
                        <div class="col-md-8">
                            <select id="billParameterStatus" name="freqStatus" class="form-control">
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
                    <div class="btn-group" role="group" id="billParameter_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="billParameterReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Supplier End -->
<!-- Add Part End -->



<!-- Clone Modal Start -->
<div class="modal fade" id="billParameterCloneModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone Bill Parameter Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="BILLPARAMETERClone_Form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select Parameter Code To Be Cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="BILLPARAMETER_Code_selectAll">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="BILLPARAMETER_Code_deselectAll">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="BILLPARAMETER_Code" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="BILLPARAMETER_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->   
<%-- 
    Document   : manageTestDetailsModal
    Created on : Jan 12, 2018, 5:21:31 PM
    Author     : Shammugam
--%>

<!-- Add Button End -->
<div class="modal fade" id="testDetailsModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="testDetailsModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="testDetailsForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category Code *</label>
                        <div class="col-md-8">
                            <input id="testDetailsCateCode" name="freqCode" type="text" placeholder="Insert Category Code" class="form-control input-md" maxlength="30" required disabled>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail Code *</label>
                        <div class="col-md-8">
                            <input id="testDetailsCode" name="freqCode" type="text" placeholder="Insert Detail Code" class="form-control input-md" maxlength="30" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Detail Name *</label>
                        <div class="col-md-8">
                            <textarea id="testDetailsName" name="freqDesc" class="form-control" rows="2" placeholder="Insert Category Name" maxlength="100" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Specimen Source *</label>
                        <div class="col-md-8">
                            <input id="testDetailsSpeSource" name="freqCode" type="text" placeholder="Insert Detail Specimen Source" class="form-control input-md" maxlength="30" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Specimen Container *</label>
                        <div class="col-md-8">
                            <input id="testDetailsSpeContainer" name="freqCode" type="text" placeholder="Insert Detail Specimen Container" class="form-control input-md" maxlength="100" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Volume *</label>
                        <div class="col-md-8">
                            <input id="testDetailsVolume" name="freqCode" type="text" placeholder="Insert Detail Volume" class="form-control input-md" maxlength="100" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Special Instruction *</label>
                        <div class="col-md-8">
                            <textarea id="testDetailsSpeInstruc" name="freqDesc" class="form-control" rows="2" placeholder="Insert Detail Special Instruction" maxlength="200" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Buy Price *</label>
                        <div class="col-md-8">
                            <input id="testDetailsBuyPrice" name="freqCode" type="text" placeholder="Insert Detail Buy Price" class="form-control input-md decimalNumbersOnly" maxlength="7" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Sell Price *</label>
                        <div class="col-md-8">
                            <input id="testDetailsSellPrice" name="freqCode" type="text" placeholder="Insert Detail Sell Price" class="form-control input-md decimalNumbersOnly" maxlength="7" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Status *</label>
                        <div class="col-md-8">
                            <select id="testDetailsStatus" name="freqStatus" class="form-control">
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
                    <div class="btn-group" role="group" id="testDetails_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="testDetailsReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
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
<div class="modal fade" id="testDetailsCloneModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone Test Details Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="TESTDETAILSClone_Form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select Details Code To Be Cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="TESTDETAILS_Code_selectAll">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="TESTDETAILS_Code_deselectAll">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="TESTDETAILS_Code" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="TESTDETAILS_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->   
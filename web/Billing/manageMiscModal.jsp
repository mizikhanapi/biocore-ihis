<%-- 
    Document   : manageMiscModal
    Created on : Nov 29, 2017, 12:20:21 PM
    Author     : Shammugam
--%>

<!-- Add Button End -->
<div class="modal fade" id="miscModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="miscModalTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="miscModalForm">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Miscellaneous Code *</label>
                        <div class="col-md-8">
                            <input id="miscCode" name="freqCode" type="text" placeholder="Insert Miscellaneous Code" class="form-control input-md" maxlength="30" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Miscellaneous Name *</label>
                        <div class="col-md-8">
                            <textarea id="miscName" name="freqDesc" class="form-control" rows="4" placeholder="Insert Miscellaneous Name" maxlength="100" required></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Buying Price (RM) *</label>
                        <div class="col-md-8">
                            <input id="miscBuyPrice" name="freqValue" type="text" placeholder="Insert Buying Price (RM)" class="form-control input-md decimalNumbersOnly" maxlength="7" required>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Selling Price (RM) *</label>
                        <div class="col-md-8">
                            <input id="miscSellPrice" name="freqValue" type="text" placeholder="Insert Selling Price (RM)" class="form-control input-md decimalNumbersOnly" maxlength="7" required>
                        </div>
                    </div>


<!--                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Status *</label>
                        <div class="col-md-8">
                            <select id="miscStatus" name="freqStatus" class="form-control">
                                <option value="1" selected>Active</option>
                                <option value="0">Inactive</option>     
                            </select>
                        </div>
                    </div>-->
                    

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Enable *</label>
                        <div class="col-md-8">
                            <select id="miscEnable" name="freqStatus" class="form-control">
                                <option value="yes">Yes</option>
                                <option value="no">No</option>     
                            </select>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="misc_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="miscReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
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
<div class="modal fade" id="miscCloneModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Clone Miscellaneous Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form style="width: 100%; margin: 0 auto;" id="MISCClone_Form" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">


                        <div style="align-items: center; text-align: center">
                            <br>
                            <label>Select Miscellaneous Code To Be Cloned</label>
                            <br><br>
                            <span>
                                <a href="#" class="btn btn-default" id="MISC_Code_selectAll">&nbsp; Select all &nbsp;</a>
                                &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
                                <a href="#" class="btn btn-default" id="MISC_Code_deselectAll">Deselect all</a>
                            </span>
                            <br><br>
                            <div>
                                <select id="MISC_Code" multiple="multiple"></select>
                            </div>    
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-block" type="button" id="MISC_btnClone"><i class=" fa fa-check"></i> Clone</button>
            </div>
        </div>
    </div>
</div>
<!-- Clone Modal End -->
<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
    Modified by: Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>
<!-- Start Modal -->
<div class="modal fade" id="ong-maternityUnit1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title" id="MU_therapyModalTitle">Add Intravenous Therapy</h3>
            </div>
            <div class="modal-body">
                <form id="MU_theraphyForm">
                    <input type="hidden" id="MU_theraphyModalID">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Order Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_therapyOrderDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Order Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_therapyOrderTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">

                                <div class="col-md-12">
                                    <textarea id="MU_txtTherapy" class="form-control input-lg" placeholder="Insert Intravenous Therapy..." tabindex="3" maxlength="230"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Off Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_therapyOffDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Off Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_therapyOffTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Status</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md"  id="MU_therapyStatus">
                                        <option  value="0" >Have not follow up</option>
                                        <option  value="1" >Results noted to doctor</option>
                                        <option  value="2" >Results already traced</option>
                                    </select>
                                </div>
                            </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="MU_therapy_div_add">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="MU_therapy_btnAdd" role="button">Add Therapy</button>
                    </div>
                    <div class="btn-group" role="group" id="MU_theraphy_div_update" style="display: none">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="MU_theraphy_btnUpdate" role="button">Update Therapy</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- Start Modal -->
<div class="modal fade" id="ong-maternityUnit2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="MU_investigationModalTitle"> Add Investigation</h4>
            </div>
            <div class="modal-body">
                <form id="MU_investigationForm">
                    <input type="hidden" id="MU_investigationModalID">
                     <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Order Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_investigationOrderDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Order Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_investigationOrderTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">

                                <div class="col-md-12">
                                    <textarea id="MU_txtInvestigation" class="form-control input-lg" placeholder="Insert Investigation..." tabindex="3" maxlength="230"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Off Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_investigationOffDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Off Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="MU_investigationOffTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Status</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md"  id="MU_investigationStatus">
                                        <option  value="0" >Have not follow up</option>
                                        <option  value="1" >Results noted to doctor</option>
                                        <option  value="2" >Results already traced</option>
                                    </select>
                                </div>
                            </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="MU_investigation_div_add">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="MU_investigationBtnAdd" role="button">Add Investigation</button>
                    </div>
                    <div class="btn-group" role="group" id="MU_investigation_div_update" style="display: none">
                        <button type="button" class="btn btn-success btn-block btn-lg" data-dismiss="modal" role="button" id="MU_investigationBtnUpdate">Update Investigation</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->


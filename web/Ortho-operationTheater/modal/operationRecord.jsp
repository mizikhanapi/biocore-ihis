<%-- 
    Document   : operationRecord
    Created on : Jun 7, 2017, 11:06:46 AM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="operationRecord1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Operation Record</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Surgeon</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control input-md" >
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Assistants</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control input-md" >
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Anaesthetist</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control input-md" >
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Scrub Nurses</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control input-md" >
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Date</label>
                                        <div class="col-md-12">
                                            <input type="date" class="form-control input-md" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Time started</label>
                                        <div class="col-md-12 ">
                                            <input type="time" class="form-control input-md" >
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">Time ended</label>
                                        <div class="col-md-12 ">
                                            <input type="time" class="form-control input-md" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-12 control-label" for="textinput">ANAESTHESIA</label>
                                        <div class="col-md-12 form-inline">
                                            <div class="radio radio-primary">
                                                <input type="radio" name="ANAESTHESIA" id="ANAESTHESIA1" value="option1">
                                                <label for="ANAESTHESIA1">
                                                    General
                                                </label>
                                            </div>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="ANAESTHESIA" id="ANAESTHESIA2" value="option2">
                                                <label for="ANAESTHESIA2">
                                                    Local
                                                </label>
                                            </div>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="ANAESTHESIA" id="ANAESTHESIA3" value="option3">
                                                <label for="ANAESTHESIA3">
                                                    Spinal
                                                </label>
                                            </div>
                                            <div class="radio radio-primary">
                                                <input type="radio" name="ANAESTHESIA" id="ANAESTHESIA4" value="option3">
                                                <label for="ANAESTHESIA4">
                                                    Other
                                                </label>
                                                <input type="text" class="form-control input-md" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <h4 class="modal-title" style="font-weight: bold">Diagnoses </h4>    
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Pre-operative</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Post-operative</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr/>
                    <div class="row">
                        <h4 class="modal-title" style="font-weight: bold">Operation </h4>    
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" style="text-align: right" for="textinput">Emergency</label>
                                <div class="col-md-6 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Emergency" id="Emergency1" value="option1">
                                        <label for="Emergency1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Emergency" id="Emergency2" value="option2">
                                        <label for="Emergency2">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Findings</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBloodPBtn" role="button">Add Items</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

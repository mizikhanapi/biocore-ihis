<%-- 
    Document   : procedureIncision
    Created on : Jun 13, 2017, 11:25:42 AM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="procedureIncision1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Procedure Incision</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row margin-bottom-30px">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Procedure</label>
                                <div class="col-md-12">
                                    <button class="btn btn-default btn-block">Add Procedure</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Procedure Incision</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Closure</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr/>
                    <div class="row">
                        <h4 class="modal-title" style="font-weight: bold">Sponge and Swap Counts </h4>    
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">&nbsp;</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Sponge" id="Sponge1" value="option1">
                                        <label for="Sponge1">
                                            Correct
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Sponge" id="Sponge2" value="option2">
                                        <label for="Sponge2">
                                            Incorrect
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Nurse in charge</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="Type to search..." >
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <hr/>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Signature</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="Type to search..." >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Designation</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="Type to search..." >
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

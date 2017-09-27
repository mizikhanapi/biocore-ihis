<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>
<!-- Start Modal -->
<div class="modal fade" id="ong-labourSummary1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Labour Onset</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Spontaneous</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Spontaneous" name="Spontaneous" type="checkbox" class="form-control input-md">
                                        <label for="Spontaneous"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Oxytocin</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Oxytocin" name="Oxytocin" type="checkbox" class="form-control input-md">
                                        <label for="Oxytocin"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">SROM</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="SROM" name="SROM" type="checkbox" class="form-control input-md">
                                        <label for="SROM"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Induced</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Induced" name="Induced" type="checkbox" class="form-control input-md">
                                        <label for="Induced"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Prostagiandins</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Prostagiandins" name="Prostagiandins" type="checkbox" class="form-control input-md">
                                        <label for="Prostagiandins"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Augmented</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Augmented" name="Augmented" type="checkbox" class="form-control input-md">
                                        <label for="Augmented"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Artificial rupture of membranes (ARM)</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="ARM" name="ARM" type="checkbox" class="form-control input-md">
                                        <label for="ARM"></label>
                                    </div>
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
<!-- End Modal -->

<!-- Start Modal -->
<div class="modal fade" id="ong-labourSummary2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Labour Onset</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Delivery Date</label>
                                <div class="col-md-12">
                                    <input type="date" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Delivery Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <hr/>
                        <h4>Vaginal</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">SVD</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="SVD" name="SVD" type="checkbox" class="form-control input-md">
                                        <label for="SVD"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Vaccum Delivery</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Vaccum" name="Vaccum" type="checkbox" class="form-control input-md">
                                        <label for="Vaccum"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr/>
                        <h4>Operative</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">CAESARIAN Elective</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="CAESARIAN" name="CAESARIAN" type="checkbox" class="form-control input-md">
                                        <label for="CAESARIAN"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Emergency</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Emergency" name="Emergency" type="checkbox" class="form-control input-md">
                                        <label for="Emergency"></label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <hr/>
                        <h4>3rd Stage</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Blood loss</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="ml">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Placenta</label>
                                <div class="col-md-12">
                                    <select id="" name="" class="form-control">
                                        <option value="null" selected="" disabled="">Complete</option>
                                        <option value="-">Incomplete</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr/>
                        <h4>Other</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Cord Round Neck<br/>Episiotomy/Tear</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="CordRoundNeck" name="CordRoundNeck" type="checkbox" class="form-control input-md">
                                        <label for="CordRoundNeck"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-8 control-label" for="textinput">Tight/Loose</label>
                                <div class="col-md-4">
                                    <div class="ckbox">
                                        <input id="Tight" name="Tight" type="checkbox" class="form-control input-md">
                                        <label for="Tight"></label>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Repaired By</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="">
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
<!-- End Modal -->

<!-- Start Modal -->

<!-- End Modal -->


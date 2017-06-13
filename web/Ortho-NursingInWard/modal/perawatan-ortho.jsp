<%-- 
    Document   : perawatan-ortho
    Created on : Jun 8, 2017, 5:23:54 PM
    Author     : user
--%>

<div class="modal fade" id="perawatan-ortho" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Orthopedic Care Plan</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="date" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="OrthopedicCarePlan" id="OrthopedicCarePlan1" value="option1">
                                        <label for="OrthopedicCarePlan1">
                                            AM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="OrthopedicCarePlan" id="OrthopedicCarePlan2" value="option2">
                                        <label for="OrthopedicCarePlan2">
                                            PM
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="OrthopedicCarePlan" id="OrthopedicCarePlan3" value="option3">
                                        <label for="OrthopedicCarePlan3">
                                            ON
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
                                <label class="col-md-12 control-label" for="textinput">IV Branula</label>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Right Upper Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightUpperLimb" id="RightUpperLimb1" value="option1">
                                        <label for="RightUpperLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightUpperLimb" id="RightUpperLimb2" value="option2">
                                        <label for="RightUpperLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightUpperLimb" id="RightUpperLimb3" value="option3">
                                        <label for="RightUpperLimb3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Left Upper Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftUpperLimb" id="LeftUpperLimb1" value="option1">
                                        <label for="LeftUpperLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftUpperLimb" id="LeftUpperLimb2" value="option2">
                                        <label for="LeftUpperLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftUpperLimb" id="LeftUpperLimb3" value="option3">
                                        <label for="LeftUpperLimb3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Right Lower Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightLowerLimb" id="RightLowerLimb1" value="option1">
                                        <label for="RightLowerLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightLowerLimb" id="RightLowerLimb2" value="option2">
                                        <label for="RightLowerLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RightLowerLimb" id="RightLowerLimb3" value="option3">
                                        <label for="RightLowerLimb3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Left Lower Limb</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftLowerLimb" id="LeftLowerLimb1" value="option1">
                                        <label for="LeftLowerLimb1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftLowerLimb" id="LeftLowerLimb2" value="option2">
                                        <label for="LeftLowerLimb2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="LeftLowerLimb" id="LeftLowerLimb3" value="option3">
                                        <label for="LeftLowerLimb3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <hr/>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Angio Cathter</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="AngioCathter" id="AngioCathter1" value="option1">
                                        <label for="AngioCathter1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="AngioCathter" id="AngioCathter2" value="option2">
                                        <label for="AngioCathter2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="AngioCathter" id="AngioCathter3" value="option3">
                                        <label for="AngioCathter3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">CVP</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="CVP" id="CVP1" value="option1">
                                        <label for="CVP1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="CVP" id="CVP2" value="option2">
                                        <label for="CVP2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="CVP" id="CVP3" value="option3">
                                        <label for="CVP3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Tracheostomy</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Tracheostomy" id="Tracheostomy1" value="option1">
                                        <label for="Tracheostomy1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Tracheostomy" id="Tracheostomy2" value="option2">
                                        <label for="Tracheostomy2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Tracheostomy" id="Tracheostomy3" value="option3">
                                        <label for="Tracheostomy3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Urinary Catheter</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter1" value="option1">
                                        <label for="UrinaryCatheter1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter2" value="option2">
                                        <label for="UrinaryCatheter2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter3" value="option3">
                                        <label for="UrinaryCatheter3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drain 1</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain1" id="Drain11" value="option1">
                                        <label for="Drain11">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain1" id="Drain12" value="option2">
                                        <label for="Drain12">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain1" id="Drain13" value="option3">
                                        <label for="Drain13">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drain 2</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain2" id="Drain21" value="option1">
                                        <label for="Drain21">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain2" id="Drain22" value="option2">
                                        <label for="Drain22">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Drain2" id="Drain23" value="option3">
                                        <label for="Drain23">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Vaccum Dressing</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing1" value="option1">
                                        <label for="VaccumDressing1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing2" value="option2">
                                        <label for="VaccumDressing2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing3" value="option3">
                                        <label for="VaccumDressing3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Ryies Tube</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RyiesTube" id="RyiesTube1" value="option1">
                                        <label for="RyiesTube1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RyiesTube" id="RyiesTube2" value="option2">
                                        <label for="RyiesTube2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="RyiesTube" id="RyiesTube3" value="option3">
                                        <label for="RyiesTube3">
                                            Off
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Chest Tube</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ChestTube" id="ChestTube1" value="option1">
                                        <label for="ChestTube1">
                                            Inserted
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ChestTube" id="ChestTube2" value="option2">
                                        <label for="ChestTube2">
                                            Changed
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ChestTube" id="ChestTube3" value="option3">
                                        <label for="ChestTube3">
                                            Off
                                        </label>
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


<%-- 
    Document   : woundAssessment
    Created on : Jun 20, 2017, 3:51:27 PM
    Author     : user
--%>
<div class="modal fade" id="woundAssessment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="woundAssessmentModalTitle"></h4>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="woundAssessmentForm">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWWoundAssessmentPmi" >
                            <input type="hidden" id="NIWWoundAssessmentHfc" >
                            <input type="hidden" id="NIWWoundAssessmentEpisodeDate" >
                            <input type="hidden" id="NIWWoundAssessmentEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date of next dressing change</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalDateFuture" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Wound Dimensions in cm</label>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Length x Height x Depth</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalDimension1">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Length x Height x Depth</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalDimension2">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Length x Height x Depth</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalDimension3">
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Exudate Level</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateLevel" id="woundExudateLevel1" value="Low">
                                        <label for="woundExudateLevel1">
                                            Low
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateLevel" id="woundExudateLevel2" value="Moderate">
                                        <label for="woundExudateLevel2">
                                            Moderate
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateLevel" id="woundExudateLevel3" value="High">
                                        <label for="woundExudateLevel3">
                                            High
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Exudate Colour</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateColour" id="woundExudateColour1" value="Clear/Serous">
                                        <label for="woundExudateColour1">
                                            Clear/Serous
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateColour" id="woundExudateColour2" value="Cloudy/Purulent">
                                        <label for="woundExudateColour2">
                                            Cloudy/Purulent
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateColour" id="woundExudateColour3" value="Other">
                                        <label for="woundExudateColour3">
                                            Other
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateColour" id="woundExudateColour4" value="Odour">
                                        <label for="woundExudateColour4">
                                            Odour
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
                                <label class="col-md-12 control-label" for="textinput">Wound Bed in %</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundBed" id="woundWoundBed1" value="Necrotic">
                                        <label for="woundWoundBed1">
                                            Necrotic - Black/Brown
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundBed" id="woundWoundBed2" value="Sloughy">
                                        <label for="woundWoundBed2">
                                            Sloughy - Yellow
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundBed" id="woundWoundBed3" value="Granulating">
                                        <label for="woundWoundBed3">
                                            Granulating - Red
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundBed" id="woundWoundBed4" value="Eplithalising">
                                        <label for="woundWoundBed4">
                                            Eplithalising - Pink
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Wound Edges</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundEdges" id="woundWoundEdges1" value="Healthy">
                                        <label for="woundWoundEdges1">
                                            Healthy - attached
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundEdges" id="woundWoundEdges2" value="Unhealthy">
                                        <label for="woundWoundEdges2">
                                            Unhealthy - not attached /
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundEdges" id="woundWoundEdges3" value="undermined">
                                        <label for="woundWoundEdges3">
                                            rolled under, tunneling, undermined
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
                                <label class="col-md-12 control-label" for="textinput">Surrounding Skin</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="woundSurroundingSkin1" value="Healthy">
                                        <label for="woundSurroundingSkin1">
                                            Healthy
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="woundSurroundingSkin2" value="Erythema">
                                        <label for="woundSurroundingSkin2">
                                            Erythema - Redness
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="woundSurroundingSkin3" value="Macerated/Wet">
                                        <label for="woundSurroundingSkin3">
                                            Macerated / Wet
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="woundSurroundingSkin4" value="Dry/Excoriated">
                                        <label for="woundSurroundingSkin4">
                                            Dry / Excoriated
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="woundSurroundingSkin5" value="Other">
                                        <label for="woundSurroundingSkin5">
                                            Other
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Signs of Clinical Infection</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="woundUrinaryCatheter1" value="None">
                                        <label for="woundUrinaryCatheter1">
                                            None present
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="woundUrinaryCatheter2" value="Same/Improved/Worst">
                                        <label for="woundUrinaryCatheter2">
                                            Same / Improved / Worst
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="woundUrinaryCatheter3" value="Swabbed">
                                        <label for="woundUrinaryCatheter3">
                                            Swabbed - Yes/No
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Patient Pain</label>
                            </div>
                        </div>
                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">During Removal</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalPain1">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">While in place</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalPain2">
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Wound Progress</label>
                                <div class="col-md-12">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="woundVaccumDressing1" value="Same">
                                        <label for="woundVaccumDressing1">
                                            Same
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="woundVaccumDressing2" value="Improved">
                                        <label for="woundVaccumDressing2">
                                            Improved
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="woundVaccumDressing3" value="Worse">
                                        <label for="woundVaccumDressing3">
                                            Worse
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Dressing Plan</label>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-3">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Primary Dressing</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalPlan1">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Size & no. of pieces</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalPlan2">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Secondary Dressing</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalPlan3">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Size & no of pieces</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="woundAssessmentModalPlan4">
                                </div>
                            </div>
                        </div>

                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="woundAssessmentModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="woundAssessmentModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>



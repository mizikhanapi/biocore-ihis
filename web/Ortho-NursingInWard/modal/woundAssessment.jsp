<%-- 
    Document   : woundAssessment
    Created on : Jun 20, 2017, 3:51:27 PM
    Author     : user
--%>
<div class="modal fade" id="woundAssessment1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                <label class="col-md-12 control-label" for="textinput">Date of next dressing change</label>
                                <div class="col-md-12">
                                    <input type="date" class="form-control input-md" >
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
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Length x Height x Depth</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Length x Height x Depth</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
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
                                        <input type="radio" name="ExudateLevel" id="ExudateLevel1" value="option1">
                                        <label for="ExudateLevel1">
                                            Low
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateLevel" id="ExudateLevel2" value="option2">
                                        <label for="ExudateLevel2">
                                            Moderate
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateLevel" id="ExudateLevel3" value="option3">
                                        <label for="ExudateLevel3">
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
                                        <input type="radio" name="ExudateColour" id="ExudateColour1" value="option1">
                                        <label for="ExudateColour1">
                                            Clear/Serous
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateColour" id="ExudateColour2" value="option2">
                                        <label for="ExudateColour2">
                                            Cloudy/Purulent
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateColour" id="ExudateColour3" value="option3">
                                        <label for="ExudateColour3">
                                            Other
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ExudateColour" id="ExudateColour4" value="option3">
                                        <label for="ExudateColour4">
                                            Odour
                                        </label>
                                        <select class="form-control input-md" >
                                            <option>Yes</option>
                                            <option>No</option>
                                        </select>
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
                                        <input type="radio" name="WoundBed" id="WoundBed1" value="option1">
                                        <label for="WoundBed1">
                                            Necrotic - Black/Brown
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundBed" id="WoundBed2" value="option2">
                                        <label for="WoundBed2">
                                            Sloughy - Yellow
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundBed" id="WoundBed3" value="option3">
                                        <label for="WoundBed3">
                                            Granulating - Red
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundBed" id="WoundBed4" value="option3">
                                        <label for="WoundBed4">
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
                                        <input type="radio" name="WoundEdges" id="WoundEdges1" value="option1">
                                        <label for="WoundEdges1">
                                            Healthy - attached
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundEdges" id="WoundEdges2" value="option2">
                                        <label for="WoundEdges2">
                                            Unhealthy - not attached /
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="WoundEdges" id="WoundEdges3" value="option3">
                                        <label for="WoundEdges3">
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
                                        <input type="radio" name="SurroundingSkin" id="SurroundingSkin1" value="option1">
                                        <label for="SurroundingSkin1">
                                            Healthy
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="SurroundingSkin2" value="option2">
                                        <label for="SurroundingSkin2">
                                            Erythema - Redness
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="SurroundingSkin3" value="option3">
                                        <label for="SurroundingSkin3">
                                            Macerated / Wet
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="SurroundingSkin4" value="option3">
                                        <label for="SurroundingSkin4">
                                            Dry / Excoriated
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SurroundingSkin" id="SurroundingSkin5" value="option3">
                                        <label for="SurroundingSkin5">
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
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter1" value="option1">
                                        <label for="UrinaryCatheter1">
                                            None present
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter2" value="option2">
                                        <label for="UrinaryCatheter2">
                                            Same / Improved / Worst
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="UrinaryCatheter" id="UrinaryCatheter3" value="option3">
                                        <label for="UrinaryCatheter3">
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
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">While in place</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
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
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing1" value="option1">
                                        <label for="VaccumDressing1">
                                            Same
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing2" value="option2">
                                        <label for="VaccumDressing2">
                                            Improved
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="VaccumDressing" id="VaccumDressing3" value="option3">
                                        <label for="VaccumDressing3">
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
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Size & no. of pieces</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Secondary Dressing</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Size & no of pieces</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
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



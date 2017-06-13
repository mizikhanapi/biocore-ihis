<%-- 
    Document   : chartDailySkin
    Created on : Jun 9, 2017, 11:19:30 AM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="chartDailySkin1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Daily Skin Assessment Tool</h4>
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
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <div class="row margin-bottom-30px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Temperature</label>
                                <div class="col-md-12 ">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Temperature" id="Temperature1" value="option1">
                                        <label for="Temperature1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Temperature" id="Temperature2" value="option1">
                                        <label for="Temperature2">
                                            Warm
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Temperature" id="Temperature3" value="option1">
                                        <label for="Temperature3">
                                            Cold
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Color</label>
                                <div class="col-md-12 ">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Color" id="Color1" value="option1">
                                        <label for="Color1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Color" id="Color2" value="option1">
                                        <label for="Color2">
                                            Redness
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Color" id="Color3" value="option1">
                                        <label for="Color3">
                                            Pale
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row margin-bottom-30px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Moisture</label>
                                <div class="col-md-12 ">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Moisture" id="Moisture1" value="option1">
                                        <label for="Moisture1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Moisture" id="Moisture2" value="option1">
                                        <label for="Moisture2">
                                            Warm
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Moisture" id="Moisture3" value="option1">
                                        <label for="Moisture3">
                                            Cold
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Skin Turgor</label>
                                <div class="col-md-12 ">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SkinTurgor" id="SkinTurgor1" value="option1">
                                        <label for="SkinTurgor1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SkinTurgor" id="SkinTurgor2" value="option1">
                                        <label for="SkinTurgor2">
                                            Redness
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row margin-bottom-30px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Integrity (Skin injury)</label>
                                <div class="col-md-12 ">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Integrity" id="Integrity1" value="option1">
                                        <label for="Integrity1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Integrity" id="Integrity2" value="option1">
                                        <label for="Integrity2">
                                            No
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

<div class="modal fade" id="chartDailySkin2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Positioning Chart</h4>
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
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Position/Activity</label>
                                <div class="col-md-12 ">
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

<%-- 
    Document   : chartDailySkin
    Created on : Jun 9, 2017, 11:19:30 AM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="dailySkinTool" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="dailySkinToolModalTitle"></h4>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="dailySkinToolModalForm">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWDailySkinToolPmi" >
                            <input type="hidden" id="NIWDailySkinToolHfc" >
                            <input type="hidden" id="NIWDailySkinToolEpisodeDate" >
                            <input type="hidden" id="NIWDailySkinToolEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="dailySkinToolModalDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="dailySkinToolModalTime">
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
                                        <input type="radio" name="Temperature" id="dailySkinToolModalTemperature1" value="Normal">
                                        <label for="dailySkinToolModalTemperature1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Temperature" id="dailySkinToolModalTemperature2" value="Warm">
                                        <label for="dailySkinToolModalTemperature2">
                                            Warm
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Temperature" id="dailySkinToolModalTemperature3" value="Cold">
                                        <label for="dailySkinToolModalTemperature3">
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
                                        <input type="radio" name="Color" id="dailySkinToolModalColor1" value="Normal">
                                        <label for="dailySkinToolModalColor1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Color" id="dailySkinToolModalColor2" value="Redness">
                                        <label for="dailySkinToolModalColor2">
                                            Redness
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Color" id="dailySkinToolModalColor3" value="Pale">
                                        <label for="dailySkinToolModalColor3">
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
                                        <input type="radio" name="Moisture" id="dailySkinToolModalMoisture1" value="Normal">
                                        <label for="dailySkinToolModalMoisture1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Moisture" id="dailySkinToolModalMoisture2" value="Warm">
                                        <label for="dailySkinToolModalMoisture2">
                                            Warm
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Moisture" id="dailySkinToolModalMoisture3" value="Cold">
                                        <label for="dailySkinToolModalMoisture3">
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
                                        <input type="radio" name="SkinTurgor" id="dailySkinToolModalSkinTurgor1" value="Normal">
                                        <label for="dailySkinToolModalSkinTurgor1">
                                            Normal
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="SkinTurgor" id="dailySkinToolModalSkinTurgor2" value="Redness">
                                        <label for="dailySkinToolModalSkinTurgor2">
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
                                        <input type="radio" name="Integrity" id="dailySkinToolModalIntegrity1" value="Yes">
                                        <label for="dailySkinToolModalIntegrity1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="Integrity" id="dailySkinToolModalIntegrity2" value="No">
                                        <label for="dailySkinToolModalIntegrity2">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>                      
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Refer To Wound Care Team</label>
                                <div class="col-md-12 ">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ReferToTeam" id="dailySkinToolModalReferToTeam1" value="Yes">
                                        <label for="dailySkinToolModalReferToTeam1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="ReferToTeam" id="dailySkinToolModalReferToTeam2" value="No">
                                        <label for="dailySkinToolModalReferToTeam2">
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
                    <div class="btn-group" role="group" id="dailySkinToolModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="dailySkinToolModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="dailySkinPosition" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="dailySkinPositionModalTitle"></h4>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="dailySkinPositionForm">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWDailySkinPositionPmi" >
                            <input type="hidden" id="NIWDailySkinPositionHfc" >
                            <input type="hidden" id="NIWDailySkinPositionEpisodeDate" >
                            <input type="hidden" id="NIWDailySkinPositionEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="dailySkinPositionModalDate">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="dailySkinPositionModalTime">
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
                                    <textarea class="form-control input-md" id="dailySkinPositionModalActivity"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="dailySkinPositionModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="dailySkinPositionModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

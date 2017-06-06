<%-- 
    Document   : neuAssessment
    Created on : Jun 5, 2017, 12:51:45 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="neuAssessment1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Date & Time</h4>
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


<div class="modal fade" id="neuAssessment2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Muscle Power</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Surface -->
                            <h5>Hip</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        SLRT
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Extension
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Flexion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Abduction
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Surface -->
                            <h5>Knee</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Extension
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Flexion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Surface -->
                            <h5>Ankle</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Dorsiflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Pantarflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Eversion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Inversion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Surface -->
                            <h5>Toes</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Dorsiflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Plantarflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
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


<div class="modal fade" id="neuAssessment3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Sensory</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Surface -->
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 1
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 2
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 3
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 4
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 5
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        S 1
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        S 2
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Sacral
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Abdominal
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Crematenic
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Anal
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        BO
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
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
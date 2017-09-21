<%-- 
    Document   : addNeurosurgical
    Created on : Apr 18, 2017, 10:54:23 AM
    Author     : user
--%>

<div class="modal fade" id="NeurosurgicalOC" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Neurosurgical Observation Chart</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="date" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
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
                        <hr>
                        <h4>Coma Scale</h4>
                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Best Eye Opening</label>
                                <div class="col-md-12">
                                    <select class="form-control">
                                        <option>Spontaneously</option>
                                        <option>To Speech</option>
                                        <option>To Pain</option>
                                        <option>None/No Response</option>
                                    </select>   
                                </div>
                            </div>

                        </div>


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Best Verbal Response</label>
                                <div class="col-md-12">
                                    <select class="form-control">
                                        <option>Oriented</option>
                                        <option>Confused</option>
                                        <option>Inappropriate Words</option>
                                        <option>Incomprehesible Sound</option>
                                        <option>None/No Response</option>
                                    </select> 
                                </div>
                            </div>

                        </div>


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Best Motor Response</label>
                                <div class="col-md-12">
                                    <select class="form-control">
                                        <option>Obeys Commands</option>
                                        <option>Localizes to Pain</option>
                                        <option>Flexion to Pain</option>
                                        <option>Abnormal Flexion to Pain</option>
                                        <option>Extension to Pain</option>
                                        <option>None/No Response</option>
                                    </select> 
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="row">
                        <hr>
                        <h4>Blood Pressure</h4>
                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Systolic</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="Systolic">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="Systolic" class="form-control input-number" min="1" max="240" placeholder="mmHg">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="Systolic">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Diastolic</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="Diastolic">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="Diastolic" class="form-control input-number" min="1" max="240" placeholder="mmHg">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="Diastolic">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Pulse</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="Pulse">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="Pulse" class="form-control input-number" min="1" max="240" placeholder="mmHg">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="Pulse">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="row">
                        <hr>
                        <h4>Pupil Size Reaction</h4>
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Left</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="quant[1]" class="form-control input-number" value="1" min="1" max="10">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Right</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="quant[2]" class="form-control input-number" value="1" min="1" max="10">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput"></label>
                                <div class="col-md-12">
<!--                                    <img src="lib/Pupil-Scale-(mm).jpg" alt="" style="width: 100%;" />-->
                                    <p style="text-align: center; font-weight: 500; margin-bottom: 0px;">Pupil Scale<br/>(mm)</p>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <hr>
                        <h4>Limb Movement</h4>
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Arm</label>
                                <div class="col-md-12">
                                    <select class="form-control">
                                        <option>Normal Power</option>
                                        <option>Mild Weakness</option>
                                        <option>Severe Weakness</option>
                                        <option>Spastic Flexion</option>
                                        <option>Extension</option>
                                        <option>No Response</option>
                                    </select>   
                                </div>
                            </div>

                        </div>


                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Legs</label>
                                <div class="col-md-12">
                                    <select class="form-control">
                                        <option>Normal Power</option>
                                        <option>Mild Weakness</option>
                                        <option>Severe Weakness</option>
                                        <option>Spastic Flexion</option>
                                        <option>Extension</option>
                                        <option>No Response</option>
                                    </select>  
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
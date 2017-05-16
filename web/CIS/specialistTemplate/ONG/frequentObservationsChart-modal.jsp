<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>
<!-- Start Modal -->
<div class="modal fade" id="ong-fObservationChart1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">T | P | R | BP</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">T</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">P</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" > 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">R</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" > 
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr/>
                        <h4>BP</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
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
<!-- End Modal -->

<!-- Start Modal -->
<div class="modal fade" id="ong-fObservationChart2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Pupils</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
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
<div class="modal fade" id="ong-fObservationChart3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Conscious State & Remarks</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <div class="col-md-12">
                                    <textarea type="text" name="display_name" id="details" class="form-control input-lg" placeholder="Add conscious state & remarks.." tabindex="3"></textarea>
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
<div class="modal fade" id="ong-fObservationChart4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Drug Given</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Search Drug</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="Type to search...">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr/>
                        <h4>Drug Details</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Form</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Route</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr/>
                        <h4>Order Drug Details</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Strength</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md" >
                                </div>
                                <div class="col-md-6">
                                    <select name="site" id="tCIS_DTODrugStrengthUnit" class="form-control input-md">
                                        <option value="" disabled="">Unit</option>
                                        <option value="ml">milliliter</option>
                                        <option value="mg">milligram</option>  
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Dosage</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md" >
                                </div>
                                <div class="col-md-6">
                                    <select name="site" id="tCIS_DTODrugStrengthUnit" class="form-control input-md">
                                        <option value="" disabled="">Unit</option>
                                        <option value="ml">Tab</option>
                                        <option value="mg">Cap</option>  
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <br/>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Duration</label>
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-md" >
                                </div>
                                <div class="col-md-6">
                                    <select name="site" id="tCIS_DTODrugStrengthUnit" class="form-control input-md">
                                        <option value="" disabled="">Unit</option>
                                        <option value="ml">Day</option>
                                        <option value="mg">Week</option>  
                                        <option value="mg">Month</option>  
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Frequency</label>
                                <div class="col-md-12">
                                    <select name="site" id="tCIS_DTODrugStrengthUnit" class="form-control input-md">
                                        <option value="" >Select Here</option>
                                        <option value="ml">Tab</option>
                                        <option value="mg">Cap</option>  
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <br/>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Quantity</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Remarks</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <br/>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Comments</label>
                                <div class="col-md-12">
                                    <textarea type="text" name="display_name" id="tCIS_DTOComment" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
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
<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
    Modified by: Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>


<!-- Start Modal -->
<div class="modal fade" id="LS_labourModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Labour</h3>
            </div>
            <div class="modal-body">
                <form id="LS_labourForm">
                    <input type="hidden" id="LS_labourModalID">
                    <div class="col-md-12">
                        
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Delivery Date</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_labourDeliveryDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Delivery Time</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_labourDeliveryTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                        <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Labour onset:</label>
                                <div class="col-md-8">
                                    <select id="LS_labourOnset" class="form-control input-md">
                                        <option selected disabled value="">Select labour onset</option>
                                        <option value="Spontaneous">Spontaneous</option>
                                        <option value="Induced">Induced</option>
                                        <option value="Augmented">Augmented</option>
                                        <option value="Oxytocin">Oxytocin</option>
                                        <option value="Prostagiandins">Prostagiandins</option>
                                        <option value="SROM">SROM</option>
                                        <option value="ARM">ARM</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                        <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Vaginal:</label>
                                <div class="col-md-8">
                                    <select id="LS_labourVaginal" class="form-control input-md">
                                        <option selected disabled value="">Select vaginal delivery</option>
                                        <option value="SVD">SVD</option>
                                        <option value="Vacuum delivery">Vacuum delivery</option>
                                        <option value="None">None</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                                              
                        <div class="row">
                        <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Operative:</label>
                                <div class="col-md-8">
                                    <select id="LS_labourOperative" class="form-control input-md">
                                        <option selected disabled value="">Select operative</option>
                                        <option value="None">None</option>
                                        <option value="Caesarian">Caesarian</option>
                                        <option value="Emergency">Emergency</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                         <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Blood loss:</label>
                                <div class="col-md-8">
                                    <input id="LS_labourBloodLoss" type="number" placeholder="Insert blood loss in ml" class="form-control input-md" min="0" max="9999" step="1">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                        <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Placenta:</label>
                                <div class="col-md-8">
                                    <select id="LS_labourPlacenta" class="form-control input-md">
                                        <option selected disabled value="">Select placenta condition</option>
                                        <option value="Complete">Complete</option>
                                        <option value="Incomplete">Incomplete</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                        <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Cord round neck:</label>
                                <div class="col-md-8">
                                    <input id="LS_labourCord" placeholder="Insert how many loop of cord" class="form-control input-md" type="number" min="0" max="30" step="1">
                                </div>
                            </div>
                        </div>
                        
                         <div class="row">
                        <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Cord tightness:</label>
                                <div class="col-md-8">
                                    <select id="LS_labourTightness" class="form-control input-md" >
                                        <option value="" selected disabled>-- Select cord tightness --</option>
                                        <option value="Tight">Tight</option>
                                        <option value="Loose">Loose</option>
                                        <option value="None">None</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                         <div class="row">
                        <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Episiotomy/tear:</label>
                                <div class="col-md-8">
                                    <select id="LS_labourTear" class="form-control input-md">
                                        <option selected disabled value="">Select tear condition</option>
                                        <option value="Episiotomy">Episiotomy</option>
                                        <option value="Tear">Tear</option>
                                        <option value="Tear">None</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                         <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Repaired by:</label>
                                <div class="col-md-8">
                                    <input id="LS_labourRepair" placeholder="Search doctor/nurse ..." class="form-control input-md flexdatalist"
                                           data-search-by-word="true"
                                           data-selection-required="true">
                                    <div id="LS_labourRepairMatch" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                        
                    </div> 
                </form>
                
                <br>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="LS_labour_div_add">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="LS_labourBtnAdd" role="button">Add Summary</button>
                    </div>
                    <div class="btn-group" role="group" id="LS_labour_div_update" style="display: none">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="LS_labourBtnUpdate">Update Summary</button>
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

<!--Start Modal -->
<div class="modal fade" id="LS_stageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Labour Stage</h3>
            </div>
            <div class="modal-body">
                <form id="LS_stageForm">
                    <input type="hidden" id="LS_stageModalID">
                    <div class="col-md-12">
                        
                        <div class="row">
                            <label class="col-md-12 control-label" for="textinput">Labour begin</label>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Date</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageBeginDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Time</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageBeginTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <label class="col-md-12 control-label" for="textinput">Membranes ruptured</label>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Date</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageMembraneDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Time</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageMembraneTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <label class="col-md-12 control-label" for="textinput">Second stage</label>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Date</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageSecondDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Time</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageSecondTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <label class="col-md-12 control-label" for="textinput">Child Born</label>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Date</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageBornDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Time</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stageBornTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <label class="col-md-12 control-label" for="textinput">Placenta Expelled</label>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Date</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stagePlacentaDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Time</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_stagePlacentaTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <h4>Duration of labour stages</h4>
                            <div class="row">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">1st stage:</label>
                                    <div class="col-md-8">
                                        <div class="col-md-6">
                                            <input type="number" min="0" step="1" class="form-control input-md" placeholder="hours" id="LS_stage1hour">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="number" min="0" step="1" class="form-control input-md" placeholder="minutes" id="LS_stage1minute">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">2nd stage:</label>
                                    <div class="col-md-8">
                                        <div class="col-md-6">
                                            <input type="number" min="0" step="1" class="form-control input-md" placeholder="hours" id="LS_stage2hour">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="number" min="0" step="1" class="form-control input-md" placeholder="minutes" id="LS_stage2minute">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">3rd stage:</label>
                                    <div class="col-md-8">
                                        <div class="col-md-6">
                                            <input type="number" min="0" step="1" class="form-control input-md" placeholder="hours" id="LS_stage3hour">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="number" min="0" step="1" class="form-control input-md" placeholder="minutes" id="LS_stage3minute">
                                        </div>
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
                        <button type="button" class="btn btn-success btn-block btn-lg" id="LS_stageBtnAdd" role="button">Save Labour Stage</button>
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

<!--Start Modal -->
<div class="modal fade" id="LS_eventModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Delivery event</h3>
            </div>
            <div class="modal-body">
                <form id="LS_eventForm">
                    <input type="hidden" id="LS_eventModalID">
                    <div class="col-md-12">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Conducted by:</label>
                            <div class="col-md-8">
                                <input id="LS_eventConductedBy"  type="text" class="form-control input-md flexdatalist" placeholder="Search doctor/nurse..."
                                        data-search-by-word="true"
                                        data-selection-required="true">
                                <div id="LS_eventMatch" class="search-drop"></div>

                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Witnessed by:</label>
                            <div class="col-md-8">
                                <input id="LS_eventWitness"  type="text" class="form-control input-md" maxlength="200">

                            </div>
                        </div>
                    </div> 
                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="LS_eventBtnAdd" role="button">Save Record</button>
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

<!--Start Modal -->
<div class="modal fade" id="LS_infantModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Infant Birth Record</h3>
            </div>
            <div class="modal-body">
                <form id="LS_infantForm">
                    <input type="hidden" id="LS_infantModalID">
                    <div class="col-md-12">
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Baby alive:</label>
                                <div class="col-md-8">
                                    <select id="LS_infantAlive" class="form-control input-md">
                                        <option selected disabled value="">Select baby condition</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Other condition:</label>
                                <div class="col-md-8">
                                    <textarea id="LS_infantOther" class="form-control input-md" maxlength="185" cols="4" placeholder="Insert other comment if any..."></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Tag no:</label>
                                <div class="col-md-8">
                                    <input id="LS_infantTag" class="form-control input-md" type="text" maxlength="200" placeholder="" readonly="">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Birth Date:</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_infantBirthDate" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-12 control-label" for="textinput">Birth Time:</label>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-md" id="LS_infantBirthTime" placeholder="Pick a time (hh:mm:ss)" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Sex:</label>
                                <div class="col-md-8">
                                    <select id="LS_infantSex" class="form-control input-md" >
                                        <option selected disabled value="">Select baby's sex</option>
                                        <option value="001">Male</option>
                                        <option value="002">Female</option>
                                        <option value="003">Other</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Birth weight:</label>
                                <div class="col-md-8">
                                    <input id="LS_infantWeight" class="form-control input-md" type="number" min="0" max="9999" step="1" placeholder="Insert weight in gms">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Head circumference:</label>
                                <div class="col-md-8">
                                    <input id="LS_infantHead" class="form-control input-md" type="number" min="0" max="150" step="1" placeholder="Insert head circumference in cm">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-3 control-label" for="textinput">Apgar score:</label>
                                <div class="col-md-3">
                                    <input id="LS_infantApgar1" class="form-control input-md" type="number" min="0" max="10" step="1" placeholder="1 min">
                                </div>
                                <div class="col-md-3">
                                    <input id="LS_infantApgar2" class="form-control input-md" type="number" min="0" max="10" step="1" placeholder="5 min">
                                </div>
                                <div class="col-md-3">
                                    <input id="LS_infantApgar3" class="form-control input-md" type="number" min="0" max="10" step="1" placeholder="10 min">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Length:</label>
                                <div class="col-md-8">
                                    <input id="LS_infantLength" class="form-control input-md" type="number" min="0" max="150" step="1" placeholder="Insert length in cm">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Cord blood collected:</label>
                                <div class="col-md-8">
                                   <select id="LS_infantCord" class="form-control input-md" >
                                        <option selected disabled value="">Is the cord collected?</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Vitamin K:</label>
                                <div class="col-md-8">
                                   <select id="LS_infantVitaminK" class="form-control input-md" >
                                        <option selected disabled value="">Is the baby given vitamin K?</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Hepatitis B Vaccine:</label>
                                <div class="col-md-8">
                                   <select id="LS_infantVaccine" class="form-control input-md" >
                                        <option selected disabled value="">Is the baby vaccinated?</option>
                                        <option value="Yes">Yes</option>
                                        <option value="No">No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Foetal Abnormality:</label>
                                <div class="col-md-8">
                                    <textarea id="LS_infantAbnormal" class="form-control input-md" placeholder="Insert baby's abnormality if got any..." cols="4" maxlength="185"></textarea>
                                </div>
                            </div>
                        </div>
                        
                     </div> 
                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="LS_infant_div_add">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="LS_infantBtnAdd" role="button">Add Birth Record</button>
                    </div>
                    <div class="btn-group" role="group" id="LS_infant_div_update" style="display: none">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="LS_infantBtnUpdate">Update Birth Record</button>
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

<!--Start Modal -->
<div class="modal fade" id="LS_transferModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Mother Transfer Observation</h3>
            </div>
            <div class="modal-body">
                <form id="LS_transferForm">
                    <input type="hidden" id="LS_transferModalID">
                    <div class="col-md-12">
                        
                        <div class="row">
                            <div class="col-md-6">
                                 <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Blood pressure (mmHg):</label>
                                    <div class="col-md-4">
                                        <input class="form-control input-md" type="number" min="0" max="999" step="1" placeholder="Systolic" id="LS_transferSystolic">
                                    </div>
                                    <div class="col-md-4">
                                        <input class="form-control input-md" type="number" min="0" max="999" step="1" placeholder="Diastolic" id="LS_transferDiastolic">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="col-md-4 control-label" for="textinput">Blood pulse:</label>
                                    <div class="col-md-8">
                                        <input class="form-control input-md" type="number" min="0" max="999" step="1" placeholder="Blood pulse in bpm" id="LS_transferPulse">
                                    </div>
                            </div>
                           
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                 <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Uterus:</label>
                                    <div class="col-md-8">
                                        <input class="form-control input-md" type="text" placeholder="Comment on the uterus" id="LS_transferUterus" maxlength="200">
                                    </div>
                                 </div>
                            </div>
                            <div class="col-md-6">
                                <label class="col-md-4 control-label" for="textinput">Perineum:</label>
                                    <div class="col-md-8">
                                        <input class="form-control input-md" type="text" placeholder="Comment on the perineum" id="LS_transferPerineum" maxlength="200">
                                    </div>
                            </div>
                           
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                 <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Time:</label>
                                    <div class="col-md-8">
                                        <input class="form-control input-md" type="text" placeholder="HH:mm" id="LS_transferTime" readonly>
                                    </div>
                                 </div>
                            </div>
                            <div class="col-md-6">
                                <label class="col-md-4 control-label" for="textinput">Doctor/Nurse:</label>
                                    <div class="col-md-8">
                                        <input class="form-control input-md flexdatalist" type="text" placeholder="Search doctor/nurse..." id="LS_transferDoctor" 
                                            data-search-by-word="true"
                                            data-selection-required="true">
                                        <div id="LS_transferMatch" class="search-drop"></div>
                                    </div>
                            </div>
                           
                        </div>
                                                
                        
                     </div> 
                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="LS_transferBtnAdd" role="button">Save Mother Transfer Observation</button>
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

<!--Start Modal -->
<div class="modal fade" id="LS_perNoteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Puerperium Notes</h3>
            </div>
            <div class="modal-body">
                <form id="LS_perNoteForm">
                    <input type="hidden" id="LS_perNoteModalID">
                    <div class="col-md-12">
                        
                        <div class="row">
                           
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Date:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" type="text" placeholder="dd/mm/yyyy" id="LS_perNoteDate" readonly>
                                </div>
                             </div>
                           
                        </div>
                        
                        <div class="row">
                           
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Notes:</label>
                                <div class="col-md-8">
                                    <textarea class="form-control input-md" placeholder="Notes on puerperium..." id="LS_perNoteNotes" maxlength="185" cols="4"></textarea>
                                </div>
                             </div>
                           
                        </div>
                        
                        <div class="row">
                           
                             <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Treatment:</label>
                                <div class="col-md-8">
                                    <textarea class="form-control input-md" placeholder="Treatment on puerperium..." id="LS_perNoteTreatment" maxlength="185" cols="4"></textarea>
                                </div>
                             </div>
                           
                        </div>
                        
                        
                     </div> 
                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="LS_perNoteBtnAdd" role="button">Save Puerperium Notes</button>
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

<!--Start Modal -->
<div class="modal fade" id="LS_puerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Puerperium Observation</h3>
            </div>
            <div class="modal-body">
                <form id="LS_puerForm">
                    <input type="hidden" id="LS_puerModalID">
                    <div class="col-md-12">
                        
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label ls-add-update" for="textinput">Date of month:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" type="text" placeholder="dd/mm/yyyy" id="LS_puerDate" readonly>
                                </div>
                             </div>
                        </div>
                        
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Day of puerperium:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" type="number" placeholder="Day of puerperium" id="LS_puerDay" max="999" min="0" step="1">
                                </div>
                             </div>
                        </div>
                        
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Time:</label>
                               <div class="col-md-8">
                                    <select class="form-control input-md ls-add-update" id="LS_puerTime">
                                        <option value="" selected disabled>-- Select time --</option>
                                        <option value="09:00">Morning</option>
                                        <option value="17:00">Evening</option>
                                    </select>
                                </div>
                             </div>
                        </div>
                        
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Fundal height (cm):</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" id="LS_puerHeight" type="number" min="0" max="999" step="1">
                                </div>
                             </div>
                        </div>
                                                
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Temperature (&#8451;):</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" id="LS_puerTemperature" type="number" min="0" max="100" step="1">
                                </div>
                             </div>
                        </div>
                        
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Systolic (mmHg):</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" id="LS_puerSystolic" type="number" min="0" max="999" step="1">
                                </div>
                             </div>
                        </div>
                        
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Diastolic (mmHg):</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" id="LS_puerDiastolic" type="number" min="0" max="999" step="1">
                                </div>
                             </div>
                        </div>
                        
                        <div class="row">
                           <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Pulse (bpm):</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" id="LS_puerPulse" type="number" min="0" max="999" step="1">
                                </div>
                             </div>
                        </div>
                        
                        
                     </div> 
                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="LS_puer_div_add">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="LS_puerBtnAdd" role="button">Add Puerperium Observation</button>
                    </div>
                    <div class="btn-group" role="group" id="LS_puer_div_update" style="display: none">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="LS_puerBtnUpdate">Update Puerperium Observation</button>
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

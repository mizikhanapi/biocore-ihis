<%-- 
    Document   : CIS040000
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : shay
--%>
<!--Modal add Procedure-->
<div class="modal fade" id="CIS040000" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%; height: 100%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Radiology Request Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="POS" id="codeROS" class="form-control input-lg"  tabindex="4">
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="problem"  id="ROS" placeholder="Search Radiology Procedure..." tabindex="4">
                    <div id="matchROS"></div>
                </div>
                
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Modality</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="modalityROS" readonly="">
                            <input class="form-control input-lg" type="hidden" name="pro" id="modalityROSCode" readonly="">
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Body System</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="bodySystemROS" readonly="">
                            <input class="form-control input-lg" type="hidden" name="pro" id="bodySystemROSCode" readonly="">
                        </div>
                    </div>

                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Service Provider</h4>
                        </div>
                    </div>

                </div>
                <div class="row">                    
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Health Facility </h4>
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text"  id="hfcROS" placeholder="">
                            <input class="form-control input-lg" type="hidden"  id="hfcIdROS">
                            <div id="matchHFCROS" ></div>
                        </div>

                    </div>


                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Location </h4>
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <textarea type="text" name="display_name" id="locationROS" class="form-control input-lg" tabindex="3"></textarea>

                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Appointment </h4>
                        </div>
                    </div>

                </div>
                <div class="row">                    
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Appointment </h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text"  id="appointmentLOS" placeholder="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Patient Condition </h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <!--                            <input class="form-control input-lg" type="text"  id="priorityLOS" placeholder="">-->
                            <select id="priorityROS" class="form-control input-lg">
                                <option disabled="" selected="">Please select condition..</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="commentROS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                        </div>
                    </div>
                </div>

            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptROS" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End add Procedure-->

<!--Modal update Procedure-->
<div class="modal fade" id="update_CIS040000" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Radiology Procedure</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="POS" id="UcodeROS" class="form-control input-lg" tabindex="4">
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="problem"  id="UROS" placeholder="Search Procedure..." tabindex="4">
                    <div id="UmatchROS"></div>
                </div>
                                
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Modality</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="UmodalityROS" readonly="">
                            <input class="form-control input-lg" type="hidden" name="pro" id="UmodalityROSCode" readonly="">
                        </div>
                    </div>

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Body System</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="UbodySystemROS" readonly="">
                            <input class="form-control input-lg" type="hidden" name="pro" id="UbodySystemROSCode" readonly="">
                        </div>
                    </div>

                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Service Provider</h4>
                        </div>
                    </div>

                </div>
                <div class="row">                    
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Health Facility </h4>
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text"  id="UhfcROS" placeholder="">
                            <input class="form-control input-lg" type="hidden"  id="UhfcIdROS">
                            <div id="UmatchHFCROS" ></div>
                        </div>

                    </div>


                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Location </h4>
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <textarea type="text" name="display_name" id="UlocationROS" class="form-control input-lg" tabindex="3"></textarea>

                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Appointment </h4>
                        </div>
                    </div>

                </div>
                <div class="row">                    
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Appointment </h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text"  id="UappointmentLOS" placeholder="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Patient Condition </h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <!--                            <input class="form-control input-lg" type="text"  id="priorityLOS" placeholder="">-->
                            <select id="UpriorityROS" class="form-control input-lg">
                                <option disabled="" selected="">Please select condition..</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                    <textarea type="text" name="display_name" id="UcommentROS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                        </div>
                    </div>
                </div>
                
            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateROSProcedure" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
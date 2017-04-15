<%-- 
    Document   : CIS040002
    Created on : Feb 18, 2017, 12:06:44 PM
    Author     : -D-
--%>
<!--Modal add Drug Order-->
<div class="modal fade" id="CIS040001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%; height: 100%">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Laboratory Request Form</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <input type="hidden" name="LOS" id="jsonId" class="form-control input-lg"  tabindex="4">
                            <input class="form-control input-lg" type="text" name="problem"  id="searchLOS" placeholder="Search Laboratory request..." tabindex="4">
                            <input class="form-control input-lg" type="hidden" name="dtoCode"  id="codeLOS" placeholder="Drug Code..." tabindex="4" readonly="">
                            <div id="matchLOS" ></div>
                        </div>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Item Details</h4>
                        </div>
                    </div>
                </div>

                <!-- content goes here -->
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Analyte </h4>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="catLOS" placeholder="" readonly="">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Specimen Source</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group ">
                            <input class="form-control input-lg" type="text" name="qty" id="sourceLOS" placeholder="" readonly="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Specimen Container</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="d_strength" id="containerLOS" placeholder="" readonly="">
                        </div>
                    </div>


                </div>
                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Volume Required</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="dose" id="volumeLOS" placeholder="" readonly="">
                        </div>
                    </div>
                </div>
                
                



                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Special Instruction</h4>
                        </div>
                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-10">
                        <div class="form-group">
                            <input type="text" name="display_name" id="spclLOS" class="form-control input-lg" placeholder="" tabindex="3" readonly>
                        </div>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Appointment</h4>
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
                            <select id="patientConditionLOScd" class="form-control input-lg">
                                <option disabled="" selected="">Please select condition..</option>
                                  <%
                                    if(dataPatientCondition.size()>0){
                                        for(int i = 0; i < dataPatientCondition.size();i++){
                                            %>
                                            <option value="<%out.print(dataPatientCondition.get(i).get(0));%>"><%out.print(dataPatientCondition.get(i).get(1));%></option>
                                            <%
                                        }
                                    }%>
                            </select>
                        </div>
                    </div>
                </div>
                                    <div class="row">
                                        <div class="col-xs-3col-sm-3 col-md-3">

                                        </div>
                                        <div class="col-xs-3col-sm-3 col-md-3">

                                            <div class="form-group">
                                                <h4 class="modal-title modalTextLabel">Priority</h4>

                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">

                                            <div class="form-group">
                                                <select id="priorityLOScd" class="form-control input-lg">
                                                    <option disabled="" selected="">Please select condition..</option>
                                                    <%
                                                        if (dataPriority.size() > 0) {
                                                            for (int i = 0; i < dataPriority.size(); i++) {
                                                    %>
                                                    <option value="<%out.print(dataPriority.get(i).get(0));%>"><%out.print(dataPriority.get(i).get(1));%></option>
                                                    <%
                                        }
                                    }%>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">

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
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text"  id="hfcLOS" placeholder="">
                            <input class="form-control input-lg" type="hidden"  id="hfcIdLOS">
                            <div id="matchHFCLOS" ></div>
                        </div>
                        
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="commentLOS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnLOS" role="button">Accept</button>
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

<!--End add Drug Order-->

<!--Modal update Drug Order-->
<div class="modal fade" id="update_CIS040001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%; height: 100%">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Laboratory Request</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <input type="hidden" name="DTO" id="codeDTO" class="form-control input-lg" value="DTO" tabindex="4">
                            <input class="form-control input-lg" type="text" name="problem"  id="UsearchLOS" placeholder="Search Drug..." tabindex="4">
                            <input class="form-control input-lg" type="hidden" name="dtoCode"  id="UcodeLOS" placeholder="Drug Code..." tabindex="4" readonly="">
                            <input type="hidden" name="jsonId" id="jsonIdLOS" class="form-control input-lg" placeholder="Comments" tabindex="4">

                            <div id="UmatchLOS" ></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Drug Details</h4>
                        </div>
                    </div>
                </div>

                <!-- content goes here -->
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group modalTextLabel">
                            <h4 class="modal-title">Item Category</h4>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="pro" id="UcatLOS" placeholder="" readonly="">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Specimen Source</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group ">
                            <input class="form-control input-lg" type="text" name="qty" id="UsourceLOS" placeholder="" readonly="">
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Specimen Container</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="d_strength" id="UcontainerLOS" placeholder="" readonly="">
                        </div>
                    </div>


                </div>
                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Volume Required</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="dose" id="UvolumeLOS" placeholder="" readonly="">
                        </div>
                    </div>
                </div>




                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Special Instruction</h4>
                        </div>
                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-10">
                        <div class="form-group">
                            <input type="text" name="display_name" id="UspclLOS" class="form-control input-lg" placeholder="" tabindex="3" readonly>
                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="form-group">
                            <h4 class="modal-title" style="font-weight: bold">Appointment</h4>
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
                            <select id="UpriorityLOScd" class="form-control input-lg">
                                <option disabled="" selected="">Please select condition..</option>
                                   <%
                                    if (dataPatientCondition.size() > 0) {
                                        for (int i = 0; i < dataPatientCondition.size(); i++) {
                                %>
                                <option value="<%out.print(dataPatientCondition.get(i).get(0));%>"><%out.print(dataPatientCondition.get(i).get(1));%></option>
                                <%
                                                    }
                                                }%>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-3col-sm-3 col-md-3">

                    </div>
                    <div class="col-xs-3col-sm-3 col-md-3">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Priority</h4>
                            
                        </div>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3">

                        <div class="form-group">
                            <select id="ureal_priorityLIO" class="form-control input-lg">
                                <option disabled="" selected="">Please select Priority..</option>
                                <%
                                    if (dataPriority.size() > 0) {
                                        for (int i = 0; i < dataPriority.size(); i++) {
                                %>
                                <option value="<%out.print(dataPriority.get(i).get(0));%>"><%out.print(dataPriority.get(i).get(1));%></option>
                                <%
                                                    }
                                                }%>

                            </select>
                        </div>
                    </div>
                     <div class="col-xs-3 col-sm-3 col-md-3">

                    </div>
                </div>
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
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text"  id="UhfcLOS" placeholder="">
                            <input class="form-control input-lg" type="hidden"  id="UhfcIdLOS">
                            <div id="UmatchHFCLOS" ></div>
                        </div>
                        
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="UcommentLOS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnLOS" role="button">Update</button>
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
<script>
    $(document).ready(function () {
        $(function () {
            $('#appointmentLOS').datepicker({dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true});
        });
    });
</script>
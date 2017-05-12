<%-- 
    Document   : CIS040000
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : shay
--%>
<!--Modal add Procedure-->
<%
    String searchPatientCondition = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0096' AND hfc_cd = '" + hfc_cd + "' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataPatientCondition = Conn.getData(searchPatientCondition);
    String searchPriority = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0095' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataPriority = Conn.getData(searchPriority);
%>
<div class="modal fade" id="CIS040000" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Radiology Request Form</h3>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <h4 class="modal-title" style="font-weight: bold">Service Provider</h4>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Health Facility</label>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" type="text"  id="hfcROS" placeholder="">
                                    <input class="form-control input-lg" type="hidden"  id="hfcOrderDetail" placeholder="">
                                    <input class="form-control input-lg" type="hidden"  id="hfcProviderDetail" placeholder="">
                                    <input class="form-control input-lg" type="hidden"  id="hfcIdROS">
                                    <div id="matchHFCROS" ></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Location</label>
                                <div class="col-md-6">
                                    <textarea type="text" name="display_name" id="locationROS" class="form-control input-lg" tabindex="3"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- content goes here -->
                            <div class="form-group">
                                <input type="text" name="POS" id="codeROS_2" class="form-control input-lg"  tabindex="4">
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="textinput">Search Radiology Procedure</label>
                                <div class="col-md-9">
                                    <input class="form-control input-lg" type="text" name="problem"  id="ROS" placeholder="Search Radiology Procedure..." tabindex="4">
                                    <div id="matchROS" class="search-drop"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Modality</label>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" type="text" name="pro" id="modalityROS" readonly="">
                                    <input class="form-control input-lg" type="hidden" name="pro" id="modalityROSCode" readonly="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Body System</label>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" type="text" name="pro" id="bodySystemROS" readonly="">
                                    <input class="form-control input-lg" type="hidden" name="pro" id="bodySystemROSCode" readonly="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <h4 class="modal-title" style="font-weight: bold">Appointment </h4>

                    <div class="row">                    
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Appointment</label>
                                <div class="col-md-6">
                                    <input class="form-control input-lg" type="text" id="appointmentROS" placeholder="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Patient Condition</label>
                                <div class="col-md-6">
                                    <select id="patientConditionROSCd" class="form-control input-lg">
                                        <option disabled="" >Please select Priority...</option>
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
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Priority</label>
                                <div class="col-md-6">
                                    <select id="priorityROScd" class="form-control input-lg">
                                        <option disabled="">Please select condition..</option>
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
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-12" for="textinput">Comments</label>
                                <div class="col-md-12">
                                    <textarea type="text" name="display_name" id="commentROS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                                </div>
                            </div>
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
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Radiology Procedure</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
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
                            <input class="form-control input-lg" type="hidden"  id="UhfcOrderDetail" placeholder="">
                            <input class="form-control input-lg" type="hidden"  id="UhfcProviderDetail" placeholder="">
                            <input class="form-control input-lg" type="hidden"  id="UhfcIdROS">
                            <div id="UmatchHFCROS" ></div>
                        </div>

                    </div>
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



                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Location </h4>
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <textarea type="text" name="display_name" id="UlocationROS" class="form-control input-lg" tabindex="3" readonly=""></textarea>

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
                            <input class="form-control input-lg" type="text"  id="UappointmentROS" placeholder="">
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
                            <select id="UpatientConditionROScd" class="form-control input-lg">
                                <option disabled="" >Please select condition..</option>
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
                            <select id="UpriorityROScd" class="form-control input-lg">
                                <option disabled="" >Please select condition..</option>
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
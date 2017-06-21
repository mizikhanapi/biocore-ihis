<%-- 
    Document   : CIS040002
    Created on : Feb 18, 2017, 12:06:44 PM
    Author     : -D-
--%>
<!--Modal add Drug Order-->
<div class="modal fade" id="CIS040001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Laboratory Request Form</h3>
            </div>
            <div class="modal-header" style="padding: 0px;">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="#laboratoryRequest1" data-toggle="tab">
                                New Laboratory Request</a>
                        </li>
                        <li>
                            <a href="#laboratoryRequest2" data-toggle="tab">
                                Laboratory Request History</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="modal-body">

                <div class="tabbable-panel">
                    <div class="tabbable-line">
                        <!-- tab content -->
                        <div class="tab-content">
                            <!-- Tab 1 -->
                            <div class="tab-pane active" id="laboratoryRequest1">

                                <!-- content goes here -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- content goes here -->
                                        <div class="form-group">
                                            <input type="hidden" name="POS" id="codeROS" class="form-control input-lg"  tabindex="4">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-6 control-label" for="textinput">Search Laboratory Request</label>
                                            <div class="col-md-12">
                                                <input type="hidden" name="LOS" id="jsonId" class="form-control input-lg"  tabindex="4">
                                                <input class="form-control input-lg" type="text" name="problem"  id="searchLOS" placeholder="Search Laboratory request..." tabindex="4">
                                                <input class="form-control input-lg" type="hidden" name="dtoCode"  id="codeLOS" placeholder="Drug Code..." tabindex="4" readonly="">
                                                <div id="matchLOS" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <h4 class="modal-title" style="font-weight: bold">Item Details </h4>    
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Analyte</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="pro" id="catLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Specimen Source</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="qty" id="sourceLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Specimen Container</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="d_strength" id="containerLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Volume Required</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="dose" id="volumeLOS" placeholder="" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Special Instruction</label>
                                            <div class="col-md-12">
                                                <input type="text" name="display_name" id="spclLOS" class="form-control input-lg" placeholder="" tabindex="3" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <hr/>
                                <div class="row">
                                    <h4 class="modal-title" style="font-weight: bold">Appointment</h4>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Appointment</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text"  id="appointmentLOS" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Patient Condition</label>
                                            <div class="col-md-12">
                                                <select id="patientConditionLOScd" class="form-control input-lg">
                                                    <option>Please select condition..</option>
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
                                            <label class="col-md-6" for="textinput">Priority</label>
                                            <div class="col-md-12">
                                                <select id="priorityLOScd" class="form-control input-lg">
                                                    <option >Please select condition..</option>
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
                                    <h4 class="modal-title" style="font-weight: bold">Service Provider</h4>    
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Health Facility</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text"  id="hfcLOS" placeholder="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailLIO" placeholder="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailLIO" placeholder="">
                                                <input class="form-control input-lg" type="hidden"  id="hfcIdLOS">
                                                <div id="matchHFCLOS" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="col-md-6" for="textinput">Comments</label>
                                            <div class="col-md-12">
                                                <textarea type="text" name="display_name" id="commentLOS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Tab 1 -->    

                            <!-- Tab 2 -->
                            <div class="tab-pane" id="laboratoryRequest2">
                                <form class="form-horizontal" name="myForm" id="myForm">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">Search drug by</label>
                                        <div class="col-md-4">
                                            <select id="idType" name="idType" class="form-control" required="">
                                                <option selected="" disabled="" value="-">View by</option>
                                                <option>Today</option>
                                                <option>Previous Episode</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Order</label>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0">
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>
                                        <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>
                                    </div>
                                </form>
                            </div>
                            <!-- Tab 2 -->

                        </div>
                    </div>
                </div>
                                                        
                <hr/>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>Episode Date</td>
                            <td>Order No.</td>
                            <td>Radiology Name</td>
                            <td>Radiology Details</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>16/06/2017 | 3:52 PM</td>
                            <td>000001</td>
                            <td>Put Name</td>
                            <td>Put details here</td>
                            <td>
                                <a data-toggle="tooltip" data-placement="top" title="Add Order" class="" style="cursor: pointer"><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>
                                &nbsp;
                                <a class="" style="cursor: pointer" data-toggle="tooltip" data-placement="top" title="Cancel Order"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
    <div class="modal-dialog modal-lg">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Laboratory Request</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Search Drug</label>
                            <div class="col-md-12">
                                <input type="hidden" name="DTO" id="codeDTO" class="form-control input-lg" value="DTO" tabindex="4">
                                <input class="form-control input-lg" type="text" name="problem"  id="UsearchLOS" placeholder="Search Drug..." tabindex="4">
                                <input class="form-control input-lg" type="hidden" name="dtoCode"  id="UcodeLOS" placeholder="Drug Code..." tabindex="4" readonly="">
                                <input type="hidden" name="jsonId" id="jsonIdLOS" class="form-control input-lg" placeholder="Comments" tabindex="4">
                                <div id="UmatchLOS" ></div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr/>
                <div class="row">
                    <h4 class="modal-title" style="font-weight: bold">Drug Details</h4>
                </div>

                <!-- content goes here -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Item Category</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="pro" id="UcatLOS" placeholder="" readonly="">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Specimen Source</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="qty" id="UsourceLOS" placeholder="" readonly="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Specimen Container</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="d_strength" id="UcontainerLOS" placeholder="" readonly="">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Volume Required</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="dose" id="UvolumeLOS" placeholder="" readonly="">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Special Instruction</label>
                            <div class="col-md-12">
                                <input type="text" name="display_name" id="UspclLOS" class="form-control input-lg" placeholder="" tabindex="3" readonly>
                            </div>
                        </div>
                    </div>
                </div>

                <hr/>
                <div class="row">
                    <h4 class="modal-title" style="font-weight: bold">Appointment</h4>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Appointment</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text"  id="UappointmentLOS" placeholder="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Patient Condition</label>
                            <div class="col-md-12">
                                <select id="UpriorityLOScd" class="form-control input-lg">
                                    <option>Please select condition..</option>
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
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Priority</label>
                            <div class="col-md-12">
                                <select id="ureal_priorityLIO" class="form-control input-lg">
                                    <option>Please select Priority..</option>
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
                    <h4 class="modal-title" style="font-weight: bold">Service Provider</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Health Facility</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text"  id="UhfcLOS" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="UhfcOrderDetailLIO" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="UhfcProviderDetailLIO" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="UhfcIdLOS">
                                <div id="UmatchHFCLOS" ></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Comments</label>
                            <div class="col-md-12">
                                <textarea type="text" name="display_name" id="UcommentLOS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                            </div>
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
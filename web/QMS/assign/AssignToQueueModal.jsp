<%-- 
    Document   : AssignToQueueModal
    Created on : Jul 20, 2017, 11:43:02 AM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<div class="modal fade" id="AssignToQueueModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Reassign Patient Queue</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        
                        <div class="form-group">
                            <h4 style="padding: 0px">Current Queue</h4>
                            <div class="row">
                                <div class="col-md-4 " ><label for="textinput">Health Facility  </label><p id="textQMS_ATQ_HFC_BEFORE">-</p></div>
                                <div class="col-md-4 " > <label for="textinput">Discipline  </label><p id="textQMS_ATQ_DISCIPLINE_BEFORE">-</p></div>
                                <div class="col-md-4 " > <label  for="textinput">Subdiscipline  </label><p id="textQMS_ATQ_SUBDISCIPLINE_BEFORE">-</p></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-4 " ><label for="textinput">PMI NO  </label><p id="textQMS_ATQ_PMI_NO">9504050251851</p></div>
                                <div class="col-md-4 " > <label for="textinput">Patient Name  </label><p id="textQMS_ATQ_PATIENT_NAME">-</p></div>
                                <div class="col-md-4 " > <label  for="textinput">Patient Category  </label><p id="textQMS_ATQ_CATEGORY">-</p></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-4 " ><label for="textinput">Queue Number </label><p id="textQMS_ATQ_QUEUE_NO"> -</p></div>
                                <div class="col-md-4 " > <label for="textinput">Queue Name  </label><p id="textQMS_ATQ_QUEUE_NAME">-</p></div>
                                <div class="col-md-4 " > <label  for="textinput">Queue Status </label><p id="textQMS_ATQ_STATUS">-</p></div>
                            </div>
                            

                        </div>
                            <h4 style="padding: 0px">Reassign To</h4>
                            <div class="form-group">
                                <input class="form-control input-lg" type="hidden" name="tQMS_ATQ_HFC_Code"  id="tQMS_ATQ_PMI_NO" placeholder="" tabindex="4" readonly="">
                                <input class="form-control input-lg" type="hidden" name="tQMS_ATQ_Episode_Date"  id="tQMS_ATQ_Episode_Date" placeholder="" tabindex="4" readonly="">
                                <div class="form-group"></div>
                                
                                <div id="divQMS_ATQ_HealthFacility">
                                    <label class="col-md-6 control-label" for="textinput" style="padding: 0px">Health Facility :</label>
                                     <div class="form-group">
                                        <input class="form-control input-lg" type="text" name="tQMS_ATQ_HFC"  id="tQMS_ATQ_HFC" placeholder="Search Health Facility..." tabindex="4">
                                        <input class="form-control input-lg" type="text" name="tQMS_ATQ_HFC_Code"  id="tQMS_ATQ_HFC_Code" placeholder="Search Health Facility..." tabindex="4" readonly="">
                                        <div id="tQMS_ATQ_HFC_Loading"></div>
                                    </div>
                                </div>
                                
                                <div id="divQMS_ATQ_Discipline">
                                    <label class="col-md-6 control-label" for="textinput" style="padding: 0px">Discipline :</label>
                                     <div class="form-group">
                                        <input class="form-control input-lg" type="text" name="tQMS_ATQ_Discipline"  id="tQMS_ATQ_Discipline" placeholder="Search Discipline..." tabindex="4">
                                        <input class="form-control input-lg" type="text" name="tQMS_ATQ_Discipline_Code"  id="tQMS_ATQ_Discipline_Code" placeholder="Discipline Code..." tabindex="4" readonly="">
                                        <div id="tQMS_ATQ_Discipline_Loading"></div>
                                    </div>
                                </div>
                                
                                <div id="divQMS_SubDiscipline">
                                    <label class="col-md-6 control-label" for="textinput" style="padding: 0px">Sub Discipline :</label>
                                     <div class="form-group">
                                        <input class="form-control input-lg" type="text" name="tQMS_ATQ_SubDiscipline"  id="tQMS_ATQ_SubDiscipline" placeholder="Search Discipline..." tabindex="4">
                                        <input class="form-control input-lg" type="text" name="tQMS_ATQ_SubDiscipline_Code"  id="tQMS_ATQ_SubDiscipline_Code" placeholder="Search Discipline..." tabindex="4" readonly="">
                                        <div id="tQMS_ATQ_SubDiscipline_Loading"></div>
                                    </div>
                                </div>
                                
                                
                            </div> 
                            <div class="row">
                                <div id="divQMS_ATQ_SelectQueue" >
                                    
                                </div>
                            </div>


   

<!--                        <div class="form-group">
                            <textarea type="text" name="display_name" id="comment10" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        </div>-->
                    </div>     
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="btnQMS_ATQ_ASSIGN_SUBMIT" role="button">Assign</button>
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
        <!--End ADD Diagnosis-->
        <script type="text/javascript" src="assign/AssignToQueue.js?v1"></script>
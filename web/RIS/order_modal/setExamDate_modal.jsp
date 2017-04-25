<%-- 
    Document   : setExamDate_modal
    Created on : Apr 25, 2017, 2:41:21 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String SED_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn SED_conn = new Conn();

    String SED_sql = "SELECT body_system_cd, body_system_name from ris_body_system where status = '0' AND hfc_cd = '" + SED_hfc_cd + "'";
    ArrayList<ArrayList<String>> SED_dataBS = SED_conn.getData(SED_sql);

    SED_sql = "SELECT modality_cd, modality_name from ris_modality where status = '0' AND hfc_cd = '" + SED_hfc_cd + "' ";
    ArrayList<ArrayList<String>> SED_dataMod = SED_conn.getData(SED_sql);


%>
<!-- Modal Detail -->
<!-- Add Modal Start -->
<div class="modal fade" id="modal_setExamDate" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title">Set Exam Date</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="SED_addForm" autocomplete="off">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Body System*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="SED_bodySystem">
                            <input type="hidden"  id="SED_bodySystem_cd">
                               
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Modality*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="SED_modality">
                            <input type="hidden" id="SED_modality_cd">
                              
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure*</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="SED_proName" readonly>
                            <input type="hidden" class="form-control" id="SED_pro_cd">
                            
                        </div>
                    </div>
                   
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Exam Date*</label>
                       <div class="col-md-8">
                           <input id="SED_date" placeholder="Click here to pick a date" class="form-control input-md" readonly>
                        </div>
                    </div>

                   
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="SED_btnAdd">Set</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="SED_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<!-- Modal -->


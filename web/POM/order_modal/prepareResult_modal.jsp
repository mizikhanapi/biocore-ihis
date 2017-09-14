<%-- 
    Document   : prepareResult_modal
    Created on : Apr 27, 2017, 5:20:29 AM
    Author     : user
--%>

<!--modal change logo-->
<div class="modal fade" id="modal_prepareResult" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Prepare Procedure Report</h3>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="PR_form">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Code*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="PR_procedureCode">
                            
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Name*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="PR_procedureName">
                            
                           
                        </div>
                    </div>
                          
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Doctor's Comment*</label>
                       <div class="col-md-8">
                           <textarea id="PR_comment" class="form-control input-md" maxlength="225" rows="4" disabled></textarea>
                        </div>
                    </div>
                     
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Duration (In whole minutes)*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="number" min="0" step="1" placeholder="Key in the duration to complete the procedure (minutes)" id="PR_duration">
                            <p id="PR_duration_err" style="color: red"></p>
                            
                        </div>
                    </div>
                                
                     
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure Outcome*</label>
                       <div class="col-md-8">
                           <textarea id="PR_outcome" placeholder="Write the outcome or findings (Compulsory)" class="form-control input-md" maxlength="225" rows="4" ></textarea>
                        </div>
                    </div>


                </form>


                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="PR_btnSubmit">Submit <span class="fa fa-check" aria-hidden="true" style="display: inline-block;" ></span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Part End -->


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
                <h3 class="modal-title" id="lineModalLabel">Prepare Exam Result</h3>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="PR_form">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Body System*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="PR_bodySystem">
                            <input type="hidden"  id="PR_bodySystem_cd">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Modality*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="PR_modality">
                            <input type="hidden" id="PR_modality_cd">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure*</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="PR_proName" readonly>
                            <input type="hidden" class="form-control" id="PR_pro_cd">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput" id="hfcLabel">Upload Result:</label>
                        <div class="col-md-8">
                            <input class="form-control" id="PR_fileToLoad" type="file" accept="image/*" >
                            <!--<input type="hidden" id="PR_gamba_url">-->
                        </div>
                        <div class="col-md-12" align="center">
                            <img src="" id="PR_gamba" alt="Exam Result" class="img-responsive" style="height: 100%; width: 100%">
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Comment*</label>
                       <div class="col-md-8">
                           <textarea id="PR_comment" placeholder="Write your comment here (Compulsory)" class="form-control input-md" maxlength="500" rows="4"></textarea>
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


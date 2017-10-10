<%-- 
    Document   : verifyResult_modal
    Created on : May 1, 2017, 4:14:57 AM
    Author     : user
--%>

<!--modal change logo-->
<div class="modal fade" id="modal_verifyResult" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Exam Result</h3>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="VR_form">
                    
                    <input type="hidden" id="VR_pmiNo">
                    <input type="hidden" id="VR_orderDate">
                    <input type="hidden" id="VR_episodeDate">
                    <input type="hidden" id="VR_encounterDate">
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Order No.*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="VR_orderNo">
                           
                        </div>
                    </div>


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Body System*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="VR_bodySystem">
                            <input type="hidden"  id="VR_bodySystem_cd">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Modality*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="VR_modality">
                            <input type="hidden" id="VR_modality_cd">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure*</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="VR_proName" readonly>
                            <input type="hidden" class="form-control" id="VR_pro_cd">

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput" id="hfcLabel">Result:</label>
                        
                        <div class="col-md-12" align="center">
                            <img src="" id="VR_gamba" alt="Exam Result" class="img-responsive" style="height: 100%; width: 100%">
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Comment</label>
                       <div class="col-md-8">
                           <textarea id="VR_comment" placeholder="Write your comment here (Optional)" class="form-control input-md" maxlength="500" rows="4"></textarea>
                        </div>
                    </div>


                </form>


                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="VR_btnSubmit">Verify <span class="fa fa-check" aria-hidden="true" style="display: inline-block;" ></span></button>
                    </div>
                     <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-danger btn-block btn-lg" role="button" id="VR_btnReject">Reject <span class="fa fa-ban" aria-hidden="true" style="display: inline-block;" ></span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Part End -->



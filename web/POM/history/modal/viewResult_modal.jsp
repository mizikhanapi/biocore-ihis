<%-- 
    Document   : verifyResult_modal
    Created on : May 1, 2017, 4:14:57 AM
    Author     : user
--%>

<!--modal change logo-->
<div class="modal fade" id="OD_modalResult" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Exam Result</h3>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" id="VR_form">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Order No.*</label>
                        <div class="col-md-8">
                            <input class="form-control" type="text" readonly id="VR_orderNo">

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
                        <label class="col-md-4 control-label" for="textinput">Requestor Comment</label>
                        <div class="col-md-8">
                            <textarea id="VR_Reqcomment" placeholder="Write your comment here (Optional)" class="form-control input-md" maxlength="500" rows="4" readonly></textarea>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Outcome</label>
                        <div class="col-md-8">
                            <textarea id="VR_Filcomment" placeholder="Write your comment here (Optional)" class="form-control input-md" maxlength="500" rows="4" readonly></textarea>
                        </div>
                    </div>

                </form>


                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" id="VR_btnSubmit">Close <span class="fa fa-check" aria-hidden="true" style="display: inline-block;" ></span></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Part End -->



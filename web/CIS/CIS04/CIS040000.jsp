<%-- 
    Document   : CIS040000
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : shay
--%>
<!--Modal add Procedure-->
<div class="modal fade" id="CIS040000" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
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
                <div>
                    <div class="form-group">
                        <textarea type="text" name="display_name" id="commentROS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                    </div>
                </div>
            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptROS" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
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
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
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
                <div class="form-group">
                    <textarea type="text" name="display_name" id="UcommentROS" class="form-control input-lg" placeholder="comments.." tabindex="3"></textarea>
                </div>
            </div>   
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateROSProcedure" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
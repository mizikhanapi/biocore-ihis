<%-- 
    Document   : CIS020016
    Created on : Feb 6, 2018, 7:34:09 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com
--%>

<!-- Modal -->
<div class="modal fade" id="CIS020016" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Blood Glucose</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <!-- content goes here -->
                    <form role="form" id="myForm2" method="post">

                        <div class="col-xs-2 col-sm-2 col-md-4"><h5>Blood Glucose :</h5></div>
                        <div class="col-xs-2 col-sm-2 col-md-4">
                            <div class="form-group">
                                <input type="number" id="CIS020016_glucose" class="form-control num-3-1" placeholder="Insert blood glucose level" tabindex="4">
                                <input type="hidden" id="CIS020016_glucoseID">
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-4"><h5>mmol/L</h5></div>
                    </form>
                </div>

            </div>
        </div>
        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                <div class="btn-group" role="group" id="actionBGlu">
                    <button type="submit" class="btn btn-success btn-block btn-lg" id="acceptBGluBtn" role="button">Accept</button>
                </div>
                <div class="btn-group" role="group" style="display: none;" id="updateBGlu">
                    <button type="submit" class="btn btn-success btn-block btn-lg" id="updateBGluBtn" role="button">Update</button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                </div>
            </div>

        </div>

    </div>
</div>


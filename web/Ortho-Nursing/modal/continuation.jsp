<%-- 
    Document   : perawatan
    Created on : Jun 7, 2017, 11:06:46 AM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="continuation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Continuation Sheet</h4>
            </div>
            <div class="modal-body">
                <form id="continuation_form">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="proNote_date" placeholder="Pick a date (dd/mm/yyyy)" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="proNote_time" placeholder="Pick a time (hh:mm:ss)" readonly>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Notes</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md" id="proNote_notes" maxlength="650"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="div_proNote_btnAdd">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="proNote_btnAdd">Add Notes</button>
                    </div>
                    <div class="btn-group btn-delete" role="group" id="div_proNote_btnUpdate">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="proNote_btnUpdate">Update Notes</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

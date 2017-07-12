<%-- 
    Document   : AddConsentOperation
    Created on : Jul 4, 2017, 11:25:14 AM
    Author     : user
--%>


<div class="modal fade" id="addConsentToOpration" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Next of Kin Name Information</h4>
            </div>
            <div class="modal-body">
                    <div>

                        <div class="col-md-12">
                            Next of Kin Name:<input id="nextOfKinName" type="text" class="form-control input-md" placeholder="Enter Next of Kin Name..." >
                        </div>
                        <div class="col-md-12">
                            IC No.:<input type="text" id="nextOfKinIC" class="form-control input-md" placeholder="Enter Next Of Kin IC Number..." >
                        </div>
                        <div class="col-md-12">
                            Relation with Patient:<input id="relaitonWithPatient" type="text" class="form-control input-md" placeholder="Enter relation of Next of kin with patient..." >
                        </div>
                        <div class="col-md-12">
                            Relation with Next of Kin:<input id="relationWitNextOfKin" type="text" class="form-control input-md" placeholder="Enter relation of patinet with next of kin..." >
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="addNextOfKinInfo" role="button">Generate Report</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

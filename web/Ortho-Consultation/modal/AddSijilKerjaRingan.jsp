<%-- 
    Document   : AddConsentOperation
    Created on : Jul 4, 2017, 11:25:14 AM
    Author     : user
--%>


<div class="modal fade" id="AddSijilKerjaRinganModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Sijil Kerja Ringan Form Information</h4>
            </div>
            <div class="modal-body">
                <div>

                    <div class="form-group">
                        <input type='text' id="tCISSubDGSSearchReport" placeholder='Type to Search Diagnosis...' class='form-control input-lg flexdatalist' data-min-length='1' name='country_name_suggestion'>
                        <div id="tCISSubDGSSearchLoadingReport"></div>
                    </div>   
                    <div class="form-group">
                        <input type="hidden" name="DGS" id="dgsCodeReport" class="form-control input-lg"  tabindex="4">
                        <input type="hidden" name="DGS" id="codeDGSReport" class="form-control input-lg" value="DGS" tabindex="4">
                    </div>
                    <div class="col-md-12">
                        Starting Date:<input id="SKRDM-startDate" type="text" class="form-control input-md" placeholder="Enter relation of Next of kin with patient..." >
                    </div>
                    <div class="col-md-12">
                        End Date:<input id="SKRDM-endDate" type="text" class="form-control input-md" placeholder="Enter relation of patinet with next of kin..." >
                    </div>
                    <div class="col-md-12">
                        Extra Comment:
                        <textarea rows="4" cols="50" id="drComment" class="form-control input-md" placeholder="Enter Any Extra Comment here..." ></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="generateSijilKerjaRinganModel" role="button">Generate Report</button>
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

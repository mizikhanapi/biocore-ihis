<%-- 
    Document   : settingModal.jsp
    Created on : Mar 12, 2017, 12:34:04 PM
    Author     : -D-
--%>

    <div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h3 class="modal-title" id="lineModalLabel">Setting</h3>
                    </div>
                    <div class="modal-body">
                        <!-- content goes here -->
                        <form>
                            <div class="form-group">
                               <h4>Before Discharge</h4>
                            </div>

                            <div class="row">
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="form-group">

                                    </div>
                                </div>
                                <div class="col-xs-10 col-sm-10 col-md-10">
                                    <div class="form-group">
                                        <p>
                                            <input type="checkbox" id="setCCN" class="setting" value="CCN"/>
                                            <label for="test6">Required to complete the Chief Complain before discharge</label>
                                        </p>
                                        <p>
                                            <input type="checkbox" id="setDGS"  class="setting"  value="DGS"/>
                                            <label for="test6">Required to complete the Diagnosis before discharge</label>
                                        </p>

                                    </div>
                                </div>
                                
                                <div class="col-xs-1 col-sm-1 col-md-1">
                                    <div class="form-group">

                                    </div>
                                </div>

                            </div>

                    </div>     
                    </form>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success btn-block btn-lg" id="acceptSettingBtn" role="button">Save</button>
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
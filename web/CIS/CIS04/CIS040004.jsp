<%-- 
    Document   : CIS040004
    Created on : 17-Mar-2017, 16:07:23
    Author     : ahmed
--%>

<!--Modal ADD Follow Up-->
<div class="modal fade" id="CIS040004" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Follow Up</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="FLU" id="codeFLU" class="form-control input-lg" value="SCO" tabindex="4">
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <label class="col-md-6 control-label" for="textinput">Follow Up Doctor</label>
                        <div class="col-md-12">
                            <input class="form-control input-lg" type="hidden" name="problem"  id="searchFLU" placeholder="Search Doctor" tabindex="4">
                            <input class="form-control input-lg" type="text" name="problem"  id="tCISPlanFLUDOCSearch" placeholder="Search Doctor" tabindex="4">
                            <div id="matchFLU"></div>
                            <div id="tCISPlanFLUDOCSearchLoading"></div>
                            <input id="docFLUCode" type="hidden">
                        </div>
                    </div>   
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <label class="col-md-6 control-label" for="textinput">Follow Up Date</label>
                        <div class="col-md-12">
                            <input class="form-control input-lg" type="text" name="DateFollowUp" id="DateFollowUp" placeholder="Date">
                        </div>
                    </div>
                </div>

                <!--                        <div class="form-group">
                                            <select name="site" id="hfcDiscipline" class="form-control input-lg">
                                                <option value="1" selected="" disabled="">Health Facility Discipline [Select]</option>
                                            </select>
                                        </div>-->        
                <div class="form-group">
                    <div class="col-md-12">
                        <textarea  name="display_name" id="commentFLU" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                    </div>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptFLU" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Follow Up-->

<!--Modal Update Follow Up-->
<div class="modal fade" id="update_CIS040004" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Follow Up</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="FLU" id="codeFLU" class="form-control input-lg" value="SCO" tabindex="4">
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <label class="col-md-6 control-label" for="textinput">Follow Up Doctor</label>
                        <input class="form-control input-lg" type="hidden" name="problem"  id="usearchFLU" placeholder="Search Doctor" tabindex="4">
                        <div id="umatchFLU"></div>
                        <input class="form-control input-lg" type="text" name="problem"  id="tCISPlanFLUDOCSearch_Update" placeholder="Search Doctor" tabindex="4">
                        <div id="tCISPlanFLUDOCSearchLoading_Update"></div>
                        <input id="UdocFLUCode" type="hidden">
                    </div>   
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <label class="col-md-6 control-label" for="textinput">Follow Up Date</label>
                        <input class="form-control input-lg" type="text" name="DateFollowUp" id="uDateFollowUp" placeholder="Date">
                    </div>
                </div>

                <!--                        <div class="form-group">
                                            <select name="site" id="hfcDiscipline" class="form-control input-lg">
                                                <option value="1" selected="" disabled="">Health Facility Discipline [Select]</option>
                                            </select>
                                        </div>-->        
                <div class="form-group">
                    <textarea  name="display_name" id="ucommentFLU" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" id="updateBtnFollowUp_FLU" role="button">Update</button>
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
<!--End Update Follow Up-->

<script src="jsFunction/CIS040004.js" type="text/javascript"></script>
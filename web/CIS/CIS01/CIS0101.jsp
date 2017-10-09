<%-- 
    Document   : CIS0101
    Created on : 31-Jan-2017, 10:17:36
    Author     : ahmed
--%>

<!-- Modal add complaint -->
<div class="modal fade" id="CIS01000001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Chief Complaint</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <form>
                    <div class="form-group">
                        <input type="hidden" name="ccn" id="codeCCN" class="form-control input-lg" value="CCN" tabindex="4">
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-11">
                            <label>Search From : </label>
                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType" value="P" >Personalised</label>
                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType" value="CT" checked="">Common Term</label>
                            <input class="form-control input-lg" type="hidden" name="tCISSUBCCNCodeType"  id="tCISSUBCCNCodeType"  value="CCN" tabindex="4" readonly="">

                        </div>
                        <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubCCNAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                    </div>
                    <label>Symptoms</label>
                    <div class="form-group">

                        <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearch" placeholder="Type to search Common Term..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <div id="tCISSubCCNHFCSearchLoading" ></div>
                        <input class="form-control input-lg" type="hidden" name="problem"  id="problem" placeholder="Please Type Chief Complaint" tabindex="4">
                        <div id="match50"></div>
                    </div>
                    <div class="form-group">
                        <input class="form-control input-lg" type="hidden" name="ccnCode"  id="ccnCode"  tabindex="4">
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <label>Severity</label>
                            <div class="form-group">
                                <select name="mild" id="Mild" class="form-control input-lg" placeholder="Severity">
                                    
                                    <option value="None" selected="">None</option>
                                    <option value="Mild">Mild</option>
                                    <option value="Moderate">Moderate</option>
                                    <option value="Severe">Severe</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <label>Site</label>
                            <div class="form-group">
                                <select name="site" id="Site" class="form-control input-lg">
                                    
                                    <option value="None" selected="">None</option>
                                    <option value="Right">Right</option>
                                    <option value="Left">Left</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <label>Duration</label>
                            <div class="form-group">
                                <input class="form-control input-lg" max="999" type="number" name="dur" id="duration" placeholder="Duration" />
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <label>Unit</label>
                            <div class="form-group">
                                <select name="lat" id="sdur" class="form-control input-lg">
                                    <option value="" selected="">Select One</option>
                                    <option value="Minutes">Minutes</option>
                                    <option value="Hour">Hour</option>
                                    <option value="Day">Day</option>
                                    <option value="Week">Week</option>
                                    <option value="Month">Month</option>
                                    <option value="Year">Year</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Laterality</label>
                        <select name="lat" id="Laterality" class="form-control input-lg">
                            
                            <option value="None" selected="">None</option>
                            <option value="Right">Right</option>
                            <option value="Left">Left</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <textarea type="text" name="display_name" id="Comment" class="form-control input-lg" placeholder="Comment..." tabindex="3"></textarea> 
                    </div>
                </form>

            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtn" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Modal add complaint -->

<!-- modal update complain-->
<div class="modal fade" id="update_CIS01000001" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Chief Complaint Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <form>
                    <div class="col-md-12">
                        <div class="col-md-11">
                            <label>Search From : </label>
                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType_update" value="P" >Personalised</label>
                            <label class="radio-inline"><input type="radio" name="rCISSubCCNSearchType_update" value="CT" checked="">Common Term</label>
                            <input class="form-control input-lg" type="hidden" name="tCISSUBCodeType_update"  id="tCISSUBCCNCodeType_update"  value="CCN" tabindex="4" readonly="">

                        </div>

                    </div>
                    <label>Symptoms</label>
                    <div class="form-group">
                        <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearch_update" placeholder="Type to search chief complaint..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)"> 
                        <input class="form-control input-lg" type="text"  id="tCISSubCCNHFCSearchPersonalised_update" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <div id="tCISSubCCNHFCSearchLoading_update" ></div>
                        <input class="form-control input-lg" type="hidden" name="uproblem"  id="uproblem" placeholder="Search CCN Problem..." tabindex="4">
                        <div id="match1"></div>
                    </div>
                    <div class="form-group">
                        <input class="form-control input-lg" type="hidden" name="uccnCode"  id="uccnCode"  tabindex="4">
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <label>Severity</label>
                            <div class="form-group">
                                <select name="mild" id="uMild" class="form-control input-lg">
                                   
                                    <option value="None" selected="">None</option>
                                    <option value="Mild">Mild</option>
                                    <option value="Moderate">Moderate</option>
                                    <option value="Severe">Severe</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <label>Site</label>
                            <div class="form-group">
                                <select name="site" id="uSite" class="form-control input-lg">
                                    
                                    <option value="None" selected="">None</option>
                                    <option value="Right">Right</option>
                                    <option value="Left">Left</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                             <label>Duration</label>
                            <div class="form-group">
                                <input class="form-control input-lg" type="number" name="dur" id="uduration" placeholder="Duration" max="999" min="1">
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <label>Unit</label>
                            <div class="form-group">
                                <select name="lat" id="ssdur" class="form-control input-lg">
                                    <option value="1" selected="" disabled="">Select One</option>
                                    <option value="Minutes">Minutes</option>
                                    <option value="Hour">Hour</option>
                                    <option value="Day">Day</option>
                                    <option value="Week">Week</option>
                                    <option value="Month">Month</option>
                                    <option value="Year">Year</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Laterality</label>
                        <select name="lat" id="uLaterality" class="form-control input-lg">
               
                            <option value="None" selected="">None</option>
                            <option value="Right">Right</option>
                            <option value="Left">Left</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <textarea type="text" name="display_name" id="uComment" class="form-control input-lg" placeholder="Comment..." tabindex="3"></textarea> 
                        <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">
                    </div>
                </form>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnCCN" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End modal update complain-->

<!-- Modal HPI -->
<div class="modal fade" id="CIS01000002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form id="formCIS_SUB_CCN">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">History of Present Illness</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="hpi" id="codeHPI" class="form-control input-lg" value="HPI" tabindex="4">
                </div>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="details" class="form-control input-lg clsHPI_COMMENT" placeholder="Details.." tabindex="3" onkeypress="return blockSpecialChar(event)"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnHPI" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
            </form>
    </div>
</div>
<!--End ADD HPI-->

<!-- modal update HPI-->
<div class="modal fade" id="update_CIS01000002" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">History of Present Illness Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <textarea type="text" name="display_name" id="udetails" class="form-control input-lg" placeholder="details.." tabindex="3" onkeypress="return blockSpecialChar(event)"></textarea>
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnHPI" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
            </form>
    </div>
</div>
<!--End HPI modal-->

<!-- Modal ADD PMH -->
<div class="modal fade" id="CIS01000003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Past Medical History</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubPMHSearchType" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubPMHSearchType" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBPMHCodeType"  id="tCISSUBPMHCodeType"  value="PMH" tabindex="4" readonly="">

                    </div>
                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubPMHAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="pmh" id="codePMH" class="form-control input-lg"tabindex="4">
                </div>
                <label>Medical History</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubPMHSearch" placeholder="Please Type Past Medical History" tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubPMHSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubPMHSearchLoading" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="Problem1" placeholder="Please Type Past Medical History" tabindex="4">-->
                    <div id="match2"></div>
                </div>
                <label>Status</label>
                <div class="form-group">
                    <select name="mild" id="Status" class="form-control input-lg">
                        <option value="" selected=""></option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment1" class="form-control input-lg" placeholder="Comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnPMH" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
            </form>
    </div>
</div>
<!--End ADD PMH-->

<!-- Modal Update PMH -->
<div class="modal fade" id="update_CIS01000003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Past Medical History Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubPMHSearchType_update" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubPMHSearchType_update" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBPMHCodeType_update"  id="tCISSUBPMHCodeType_update"  value="PMH" tabindex="4" readonly="">

                    </div>

                </div>
                <label>Medical History</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubPMHSearch_update" placeholder="Please Type Past Medical History..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubPMHSearchPersonalised_update" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubPMHSearchLoading_update" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem2"  placeholder="Please Type Past Medical History." tabindex="4">
                                                <div id="match3"></div>-->
                </div>
                <div class="form-group">
                    <input type="hidden" name="pmh" id="ucodePMH" class="form-control input-lg"tabindex="4">
                </div>
                <label>Status</label>
                <div class="form-group">
                    <select name="mild" id="PStatus" class="form-control input-lg">
                        <option></option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="Pcomment1" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnPMH" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
            </form>
    </div>
</div>
<!--End Update PMH-->

<!-- Modal ADD FMH -->
<div class="modal fade" id="CIS01000004" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Family Health History</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubFMHSearchType" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubFMHSearchType" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBFMHCodeType"  id="tCISSUBFMHCodeType"  value="FMH" tabindex="4" readonly="">

                    </div>
                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubFMHAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="FMH" id="codeFMH" class="form-control input-lg" tabindex="4">
                </div>
                <label>Medical History</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubFMHSearch" placeholder="Please Type Family Medical History..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubFMHSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubFMHSearchLoading" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem3"  id="Problem3" placeholder="Search FMH Problem..." tabindex="4">-->
                    <!--                            <div id="match17"></div>-->
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="hidden" name="fmhCode"  id="fmhCode" tabindex="4">
                </div>
                <label>Family Relationship</label>
                <div class="form-group">
                    <select name="mild" id="f_relationship" class="form-control input-lg">
                        <option value="" selected="" disabled=""></option>
                        <option value="Adopted child">Adopted child</option>
                        <option value="Biological child">Biological child</option>
                        <option value="cousin">cousin</option>
                        <option value="Ex-husband">Ex-husband</option>
                        <option value="Ex-wife">Ex-wife</option>
                        <option value="Father">Father</option>
                        <option value="Friend">Friend</option>
                        <option value="Grandchild">Grandchild</option>
                        <option value="Grandmother">Grandmother</option>
                        <option value="Guardian">Guardian</option>
                        <option value="Husband">Husband</option>
                        <option value="Mother">Mother</option>
                        <option value="Neighbor">Neighbor</option>
                        <option value="Other">Other</option>
                        <option value="Sibling">Sibling</option>
                        <option value="Step child">Step child</option>
                        <option value="Wife">Wife</option>
                    </select>
                </div>
                <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment2" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnFMH" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD FMH-->

<!-- Modal Update FMH -->
<div class="modal fade" id="update_CIS01000004" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Family Health History Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubFMHSearchType_update" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubFMHSearchType_update" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBFMHCodeType_update"  id="tCISSUBFMHCodeType_update"  value="FMH" tabindex="4" readonly="">

                    </div>

                </div>
                <label>Medical History</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubFMHSearch_update" placeholder="Please Type Family Medical History..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubFMHSearchPersonalised_update" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubFMHSearchLoading_update" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem3" placeholder="Search FMH Problem..." tabindex="4">
                                                <div id="match16"></div>-->
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="hidden" name="ufmhCode"  id="ufmhCode" tabindex="4">
                </div>
                <label>Family Relationship</label>
                <div class="form-group">
                    <select name="mild" id="ff_relationship" class="form-control input-lg">
                        <option value="1" selected="" disabled=""></option>
                        <option value="Adopted child">Adopted child</option>
                        <option value="Biological child">Biological child</option>
                        <option value="cousin">cousin</option>
                        <option value="Ex-husband">Ex-husband</option>
                        <option value="Ex-wife">Ex-wife</option>
                        <option value="Father">Father</option>
                        <option value="Friend">Friend</option>
                        <option value="Grandchild">Grandchild</option>
                        <option value="Grandmother">Grandmother</option>
                        <option value="Guardian">Guardian</option>
                        <option value="Husband">Husband</option>
                        <option value="Mother">Mother</option>
                        <option value="Neighbor">Neighbor</option>
                        <option value="Other">Other</option>
                        <option value="Sibling">Sibling</option>
                        <option value="Step child">Step child</option>
                        <option value="Wife">Wife</option>
                    </select>
                </div>
                 <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="Pcomment2" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnFMH" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Update FMH-->

<!-- Modal ADD Social History -->
<div class="modal fade" id="CIS01000005" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Social History</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubSOHSearchType" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubSOHSearchType" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBSOHCodeType"  id="tCISSUBSOHCodeType"  value="SOH" tabindex="4" readonly="">

                    </div>
                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubSOHAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="SOH" id="codeSOH" class="form-control input-lg" tabindex="4">
                </div>
                 <label>Social History</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubSOHSearch" placeholder="Type  to search..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubSOHSearchPersonalised" placeholder="Type to search personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubSOHSearchLoading" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="Problem4" placeholder="Please Type Social History" tabindex="4">
                                                <div id="match4"></div>-->
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="hidden" name="sohCode"  id="sohCode" tabindex="4">
                </div>
                 <label>Date</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="date" id="date" placeholder="Social History Date">
                </div>
                 <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment3" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnSOH" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Social History-->

<!-- Modal Update Social History -->
<div class="modal fade" id="update_CIS01000005" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Social History Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubSOHSearchType_update" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubSOHSearchType_update" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBSOHCodeType"  id="tCISSUBSOHCodeType_update"  value="SOH" tabindex="4" readonly="">

                    </div>

                </div>
                <label>Social History</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubSOHSearch_update" placeholder="Type to search..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubSOHSearchPersonalised_update" placeholder="Type to search personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubSOHSearchLoading_update" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem4" placeholder="Social History" tabindex="4">
                                                <div id="match5"></div>-->
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="hidden" name="usohCode"  id="usohCode" tabindex="4">
                </div>
                <label>Date</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="ddate" id="ddate" placeholder="Social History Date">
                </div>
                <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="Pcomment3" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtn4" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Update Social History-->

<!-- Modal ADD Blood Group/G6PD -->
<div class="modal fade" id="CIS01000006" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Blood Group/G6PD</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="BLD" id="codeBLD" class="form-control input-lg" value="BLD" tabindex="4">
                </div>
                <label>Blood Type</label>
                <div class="form-group">
                    <select name="mild" id="blood" class="form-control input-lg">
                        <option value="" selected="" ></option>
                        <option value="AB">AB</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="O">O</option>
                    </select>
                </div>
                <label>Rhesus Type</label>
                <div class="form-group">
                    <select name="mild" id="Rhesus_Type" class="form-control input-lg">
                        <option value="1" selected=""></option>
                        <option value="Positive">Positive</option>
                        <option value="Negative">Negative</option>
                    </select>                  
                </div>
                <label>G6PD Status</label>
                <div class="form-group">
                    <select name="mild" id="G6PD_Status" class="form-control input-lg">
                        <option value="1" selected="" ></option>
                        <option value="Normal">Normal</option>
                        <option value="Deficient">Deficient</option>
                    </select>           
                </div>
                <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment4" class="form-control input-lg" placeholder="Comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnBLD" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Blood Group/G6PD-->

<!-- Modal Update Blood Group/G6PD -->
<div class="modal fade" id="update_CIS01000006" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Blood Group/G6PD Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="modal-body">
                    <!-- content goes here -->
                     <label>Blood Type</label>
                    <div class="form-group">
                        <select name="mild" id="b_blood" class="form-control input-lg">
                            <option value="" selected=""></option>
                            <option value="AB">AB</option>
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="O">O</option>
                        </select>
                    </div>
                     <label>Rhesus Type</label>
                    <div class="form-group">
                        <select name="mild" id="RRhesus_Type" class="form-control input-lg">
                            <option value="" selected="" disabled=""></option>
                            <option value="Positive">Positive</option>
                            <option value="Negative">Negative</option>
                        </select>                  
                    </div>
                    <label>G6PD Status</label>
                    <div class="form-group">
                        <select name="mild" id="GG6PD_Status" class="form-control input-lg">
                            <option value="" selected=""></option>
                            <option value="Normal">Normal</option>
                            <option value="Deficient">Deficient</option>
                        </select>           
                    </div>
                    <label>Details</label>
                    <div class="form-group">
                        <textarea type="text" name="display_name" id="Pcomment4" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                        <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                    </div>
                </div>     
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnBLD" role="button">Update</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Update Blood Group/G6PD -->

<!-- Modal ADD Allergy -->
<div class="modal fade" id="CIS01000007" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Allergy</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubALGSearchType" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubALGSearchType" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBALGCodeType"  id="tCISSUBALGCodeType"  value="ALG" tabindex="4" readonly="">

                    </div>
                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubALGAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="Allergy" id="codeALG" class="form-control input-lg" tabindex="4">
                </div>
                <label>Allergy</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubALGSearch" placeholder="Type to search..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubALGSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubALGSearchLoading" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="Problem5" placeholder="Please Type Allergy" tabindex="4">
                                                <div id="match22"></div>-->
                </div>
                <label>Allergy Date</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="date1" id="date1" placeholder="">
                </div>
                <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment5" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnALG" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Allergy-->

<!-- Modal Update Allergy -->
<div class="modal fade" id="update_CIS01000007" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Allergy Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubALGSearchType_update" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubALGSearchType_update" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBALGCodeType_update"  id="tCISSUBALGCodeType_update"  value="ALG" tabindex="4" readonly="">

                    </div>

                </div>
                <label>Allergy</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubALGSearch_update" placeholder="Type to search ..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubALGSearchPersonalised_update" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubALGSearchLoading_update" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem5" placeholder="Please Type Allergy" tabindex="4">
                                                <div id="match23"></div>-->
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="hidden" name="uALG_cd"  id="uALG_cd" tabindex="4">
                </div>
                <label>Allergy Date</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="ddate1" id="ddate1" placeholder="">
                </div>
                <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="Pcomment5" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnALG" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Update Allergy-->

<!-- Modal ADD Immunization -->
<div class="modal fade" id="CIS01000008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Immunization</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubIMUSearchType" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubIMUSearchType" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBIMUCodeType"  id="tCISSUBIMUCodeType"  value="IMU" tabindex="4" readonly="">

                    </div>
                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubIMUAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="IMU" id="codeIMU" class="form-control input-lg" tabindex="4">
                </div>
                <label>Immunization</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubIMUSearch" placeholder="Type to search..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubIMUSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubIMUSearchLoading" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="Problem6" placeholder="Please Type Immunization" tabindex="4">
                                                <div id="match6"></div>-->
                </div>
                <label>Immunization Date</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="date2" id="date2" placeholder="Immunization Date">
                </div>
                <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment6" class="form-control input-lg" placeholder="Comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnIMU" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Immunization-->

<!-- Modal Update Immunization -->
<div class="modal fade" id="update_CIS01000008" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Immunization Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubIMUSearchType_update" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubIMUSearchType_update" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBIMUCodeType_update"  id="tCISSUBIMUCodeType_update"  value="IMU" tabindex="4" readonly="">

                    </div>

                </div>
                <label>Immunization</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubIMUSearch_update" placeholder=" Type to search..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubIMUSearchPersonalised_update" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubIMUSearchLoading_update" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem6" placeholder="Please Type Immunization" tabindex="4">
                                                <div id="match25"></div>-->
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="hidden" name="uIMU_cd"  id="uIMU_cd" tabindex="4">
                </div>
                <label>Immunization Date</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="ddate2" id="ddate2" placeholder="">
                </div>
                <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="Pcomment6" class="form-control input-lg" placeholder="comment.." tabindex="3"></textarea>
                    <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnIMU" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Update Immunization-->

<!-- Modal ADD Disability -->
<div class="modal fade" id="CIS01000009" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Disability</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDABSearchType" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDABSearchType" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBDABCodeType"  id="tCISSUBDABCodeType"  value="DAB" tabindex="4" readonly="">

                    </div>
                    <div class="col-md-1"><button class="btn btn-primary " id="btnCISSubDABAddPersonalised" style="padding-left: 10px"><i class="fa fa-plus" aria-hidden="true"> </i></button></div>
                </div>
                <div class="form-group">
                    <input type="hidden" name="DAB" id="codeDAB" class="form-control input-lg"  tabindex="4">
                </div>
                <label>Disability</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text"  id="tCISSubDABSearch" placeholder="Type to search..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <input class="form-control input-lg" type="text"  id="tCISSubDABSearchPersonalised" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                    <div id="tCISSubDABSearchLoading" ></div>
                    <!--                            <input class="form-control input-lg" type="text" name="problem"  id="Problem32" placeholder="Please Type Disability Name" tabindex="4">
                                                <div id="match32"></div>-->
                </div>
                <div class="form-group">
                    <input class="form-control input-lg" type="hidden" name="DAS_cd"  id="DAS_cd" tabindex="4">
                </div>
                <label>Disability Date</label>
                <div class="form-group">
                    <input class="form-control input-lg" type="text" name="date3" id="date3" placeholder="On Set Date">
                </div>
                 <label>Details</label>
                <div class="form-group">
                    <textarea type="text" name="display_name" id="comment7" class="form-control input-lg" placeholder="Type Your Comment.." tabindex="3"></textarea>
                </div>
            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBtnDAB" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End ADD Disability-->

<!-- Modal Update Disability -->
<div class="modal fade" id="update_CIS01000009" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Disability Update</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="col-md-12">
                    <div class="col-md-11">
                        <label>Search From : </label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDABSearchType_update" value="P" >Personalised</label>
                        <label class="radio-inline"><input type="radio" name="rCISSubDABSearchType_update" value="CT" checked="">Common Term</label>
                        <input class="form-control input-lg" type="hidden" name="tCISSUBDABCodeType_update"  id="tCISSUBDABCodeType_update"  value="DAB" tabindex="4" readonly="">

                    </div>
                    <label>Disability</label>
                    <div class="form-group">
                        <input class="form-control input-lg" type="text"  id="tCISSubDABSearch_update" placeholder="Type to search..." tabindex="4" data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <input class="form-control input-lg" type="text"  id="tCISSubDABSearchPersonalised_update" placeholder="Type to search Personalised..." data-search-by-word="true" onkeypress="return blockSpecialChar(event)">
                        <div id="tCISSubDABSearchLoading_update" ></div>
                        <!--                            <input class="form-control input-lg" type="text" name="problem"  id="PProblem32" placeholder="Please Type Disability Name" tabindex="4">
                                                    <div id="mmatch32"></div>-->
                    </div>
                    <div class="form-group">
                        <input class="form-control input-lg" type="hidden" name="uDAB_cd"  id="uDAS_cd" tabindex="4">
                    </div>
                    <label>Disability Date</label>
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="ddate3" id="ddate3" placeholder="On Set Date">
                    </div>
                    <label>Details</label>
                    <div class="form-group">
                        <textarea type="text" name="display_name" id="Pcomment7" class="form-control input-lg" placeholder="Comment.." tabindex="3"></textarea>
                        <input type="hidden" name="jsonId" id="jsonId" class="form-control input-lg" placeholder="Comments" tabindex="4">  
                    </div>
                </div>     
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success btn-block btn-lg" id="updateBtnDAB" role="button">Update</button>
                        </div>
                        <div class="btn-group btn-delete hidden" role="group">
                            <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Update Disability-->

<script src="jsFunction/SearchClinicalTerm.js"></script>

<script src="jsFunction/CIS0101.js"></script>






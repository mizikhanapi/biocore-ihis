

<!--Modal ADD Monitoring-->
<div class="modal fade" id="CIS040007" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Admit to Ward</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <h4 class="modal-title" style="font-weight: bold">Patient is referred from :</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Search Health Facility</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg " type="hidden" name="DateTo" id="hfcOrderDetailADW" placeholder="Hfc Order Detail" readonly="">
                                <input class="form-control input-lg " type="hidden" name="DateTo" id="hfcProviderDetailADW" placeholder="Hfc Provider Detail" >
                                <input class="form-control input-lg " type="hidden" name="DateTo" id="tCIS_ADWHFCreferFromCd" placeholder="Code" readonly="">
                                <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWHFCreferFrom" placeholder="Type to search..." >
                                <div id="tCIS_ADWHFCreferFromLoading" ></div>
                                <br>
                                <div id="matchCIS_ADWreferFrom" class="search-drop"></div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Search Discipline</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg " type="hidden" name="DateTo" id="tCIS_ADWreferFromCd" placeholder="Code" readonly="">
                                <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWreferFrom" placeholder="Type to search...">
                                <div id="matchCIS_ADWreferFrom" class="search-drop"></div>
                                <div id="tCIS_ADWreferFromLoading" ></div>
                            </div>
                        </div>
                    </div>
                </div>
                  <br>
                <div class="row">
                    <h4 class="modal-title" style="font-weight: bold">Admit to discipline :</h4>
                    <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailADW" placeholder="">
                    <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailADW" placeholder="">
                    <input class="form-control input-lg" type="hidden"  id="hfcIdADW">
                </div>
                  <div class="row">
                      <div class="col-md-12">
                          <div class="form-group">
                              <label class="col-md-6 control-label" for="textinput">Search Health Facility</label>
                              <div class="col-md-12">
                                  <input class="form-control input-lg " type="hidden" name="DateTo" id="tCIS_ADWsearchHFCCd" placeholder="Code" readonly="">
                                  <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWsearchHFC" placeholder="Type to search...">
                                  <div id="tCIS_ADWsearchHFCLoading" ></div>
                                  <br>
                                  <div id="matchCIS_ADWreferFrom" class="search-drop"></div>
                              </div>
                          </div>
                      </div>
                  </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Search Discipline</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg " type="hidden" name="DateTo" id="tCIS_ADWsearchDisCd" placeholder="Code" readonly="">
                                <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWsearchDis" placeholder="Type to search...">
                                <div id="tCIS_ADWsearchDisLoading" ></div>
                                <div id="matchCIS_ADWsearchDis" class="search-drop"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <br>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="textinput">Admitted Before :</label>
                            <div class="col-md-9">
                                <label><input  name="rCIS_ADWAB" type="radio"  value="yes" class="rCIS_ADWAB">&nbsp;Yes</label>
                                &nbsp;&nbsp;&nbsp;
                                <label><input name="rCIS_ADWAB" type="radio" value="no" class="rCIS_ADWAB">&nbsp;No</label>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Patient have to be admitted before :</label>
                            <div class="col-md-12 form-inline">
                                <div class="form-group ">
                                    <input class="form-control input-lg DateFromMEC" type="text" name="DateFrom" id="tCIS_ADWdate"  placeholder="DD-MM-YY">  
                                </div>
                                <div class="form-group">
                                    <input class="form-control input-lg num1MEC" type="text" name="num1" id="tCIS_ADWtime" placeholder="Time Start">  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Ward Name</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg " type="hidden" name="DateTo" id="tCIS_ADWwardNameCd" placeholder="Ward Code" readonly="">
                                <input class="form-control input-lg " type="hidden" name="DateTo" id="tCIS_ADWwardClassCd" placeholder="Ward Code" readonly="">
                                <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWwardName" placeholder="Search Ward Name">
                                <div id="tCIS_ADWwardNameLoading"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <h4 class="modal-title" style="font-weight: bold">Admission Reason :</h4>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="col-md-12">
                                <textarea type="text" name="display_name" id="tCIS_ADWreason" class="form-control input-lg" placeholder="Type your reason..." tabindex="3"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnCIS_OE_ADW_SUBMIT" role="button">Submit</button>
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

<!--End ADD Monitoring-->

<!--Modal Update Monitoring-->
<div class="modal fade" id="update_CIS040007" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Admit to Ward</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="form-group">
                        <h4>Admit to discipline :</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWsearchDisCd_Update" placeholder="Search Discipline">
                        <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWsearchDis_Update" placeholder="Search Discipline">
                        <div id="matchCIS_ADWsearchDis_Update"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <h4>Patient is referred from :</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWreferFromCd_Update" placeholder="Search Discipline">
                        <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWreferFrom_Update" placeholder="Search Discipline">
                        <div id="matchCIS_ADWreferFrom_Update"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <h4>Reason :</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <textarea type="text" name="display_name" id="tCIS_ADWreason_Update" class="form-control input-lg" placeholder="Reason...." tabindex="3"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <h4>Admitted Before :</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <label><input  name="rCIS_ADWAB_Update" type="radio"  value="yes" class="rCIS_ADWAB_Update">Yes</label>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <label><input name="rCIS_ADWAB_Update" type="radio" value="no" class="rCIS_ADWAB_Update">No</label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <h4>Patient have to be admitted before :</h4>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg DateFromMEC" type="text" name="DateFrom" id="tCIS_ADWdate_Update"  placeholder="DD-MM-YY">
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="form-group">
                            <input class="form-control input-lg num1MEC" type="text" name="num1" id="tCIS_ADWtime_Update" placeholder="Time Start">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-4 col-sm-4 col-md-4"><h4>Ward Name</h4></div>
                    <div class="col-xs-8 col-sm-8 col-md-8"> 
                        <input class="form-control input-lg " type="hidden" name="DateTo" id="tCIS_ADWwardNameCd_Update" placeholder="Search Ward Name">
                        <input class="form-control input-lg " type="text" name="DateTo" id="tCIS_ADWwardName_Update" placeholder="Search Ward Name">
                        <div id="matchCIS_ADTwardSearch_Update"></div>
                    </div>

                </div>
            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="updateADW" role="button">Accept</button>
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
<!--End Update Monitoring-->


 <script src="jsFunction/CIS040007.js" type="text/javascript"></script>
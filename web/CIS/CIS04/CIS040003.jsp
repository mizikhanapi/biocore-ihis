<%-- 
    Document   : CIS040003
    Created on : 21-Mar-2017, 10:49:39
    Author     : ahmed
--%>

<!--Modal ADD Monitoring-->
<div class="modal fade" id="CIS040003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Monitoring Request</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="hidden" name="codeMON" id="codeMON" class="form-control input-lg"  tabindex="4">
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Search Request Category</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="searchMON"  id="searchMON" placeholder="Type to search..." tabindex="4">
                                <div id="matchMON"></div>   
                            </div>
                        </div>  
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Request Item</label>
                            <div class="col-md-12">
                                <input type="text" name="reqItem" id="reqItem" class="form-control input-lg" placeholder="Request Item" tabindex="4" readonly="">  
                            </div>
                        </div>  
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Test To Be Perform</label>
                            <div class="col-md-12">
                                <input type="text" name="testMON" id="testMON" class="form-control input-lg" placeholder="Test To Be Perform" tabindex="4" readonly=""> 
                            </div>
                        </div>  
                    </div>
                </div>

            </div>
            <div class="modal-header">
                <h3 class="modal-title" id="lineModalLabel">Service Provider</h3>
            </div>
            <div class="modal-body">    

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Search Health Facility</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="searchHFC_MON"  id="searchHFC_MON" placeholder="Search Health Facility"  tabindex="4">
                                <div id="matchHFC_MON"></div>
                                <input class="form-control input-lg" type="hidden"  id="hfcOrderDetailMON" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="hfcProviderDetailMON" placeholder="">
                                <input class="form-control input-lg" type="hidden"  id="hfcIdMON">
                            </div>
                        </div>  
                    </div>
                </div>

                <input type="hidden" name="codeHFC_MON" id="MONHFC_cd" class="form-control input-lg" tabindex="4">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6" for="textinput">Search Discipline</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="searchDIS_MON"  id="searchDIS_MON" placeholder="Type to search..."  tabindex="4">
                                <div id="matchDIS_MON"></div>
                            </div>
                        </div>  
                    </div>
                </div>

            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptMON" role="button">Accept</button>
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
<div class="modal fade" id="update_CIS040003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Update Monitoring Request</h3>
            </div>
            <div class="modal-body">
                <!-- content goes here -->
                <div class="form-group">
                    <input type="text" name="ucodeMON" id="ucodeMON" class="form-control input-lg" tabindex="4">
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="usearchMON"  id="usearchMON" placeholder="Search Request Category" tabindex="4">
                        <div id="umatchMON"></div>
                    </div>   
                </div>

                <!--                <div class="form-group">
                                    <input type="hidden" name="uMONcode" id="uMONcode" class="form-control input-lg" tabindex="4">
                                </div>-->

                <div class="form-group">
                    <input type="text" name="ureqItem" id="ureqItem" class="form-control input-lg" placeholder="Request Item" tabindex="4" readonly="">
                </div>

                <div class="form-group">
                    <input type="text" name="utestMON" id="utestMON" class="form-control input-lg" placeholder="Test To Be Perform" tabindex="4" readonly="">
                </div>
            </div>
            <div class="modal-header">
                <h3 class="modal-title" id="lineModalLabel">Service Provider</h3>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="form-group">
                        <input class="form-control input-lg" type="text" name="usearchHFC_MON"  id="usearchHFC_MON"  tabindex="4">
                        <input type="hidden" name="codeHFC_MON" id="uMONHFC_cd" class="form-control input-lg" tabindex="4">
                        <div id="umatchHFC_MON"></div>
                    </div>   
                </div>

                <!--                <div class="form-group">
                                    <input type="hidden" name="ucodeHFC_MON" id="ucodeHFC_MON" class="form-control input-lg"  tabindex="4">
                                </div>-->

                <input type="hidden" name="codeHFC_MON" id="update_MONHFC_cd" class="form-control input-lg" tabindex="4">
                <div class="form-group">
                    <div class="form-group">

                        <div id="update_matchDIS_MON"></div>
                    </div>   
                </div>

                <div class="form-group">
                    <div class="form-group">
                        <input type="hidden" name="jsonId" id="jsonId" tabindex="4"> 
                        <input class="form-control input-lg" type="text" name="searchDIS_MON"  id="usearchDIS_MON" placeholder="Search Discipline"  tabindex="4">
                        <div id="umatchDIS_MON"></div>

                    </div>   
                </div>

                <!--                <div class="form-group">
                                    <input type="hidden" name="ucodeDIS_MON" id="ucodeDIS_MON" class="form-control input-lg"  tabindex="4">
                                </div>-->




            </div>     
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" id="updateBtnMonitoring_MON" role="button">Update</button>
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



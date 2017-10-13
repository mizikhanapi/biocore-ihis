<%-- 
    Document   : nurseryUse-modal
    Created on : Sep 29, 2017, 4:52:41 PM
    Author     : Shammugam
--%>

<!-- Start Modal -->
<div class="modal fade" id="ong-nurseryUseMaster" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h2 class="modal-title" id="nurseryUseMasterChartModalTitle"></h2>
            </div>
            <div class="modal-body">

                <form autocomplete="off" id="nurseryUseMasterChartModalForm">

                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="ONGNurseryUseMasterChartPmi" >
                            <input type="hidden" id="ONGNurseryUseMasterChartHfc" >
                            <input type="hidden" id="ONGNurseryUseMasterChartEpisodeDate" >
                            <input type="hidden" id="ONGNurseryUseMasterChartEncounterDate">
                            <input type="hidden" id="ONGNurseryUseMasterChartMasterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Master Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalMasterDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Master Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalMasterTime" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Start Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalStartDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">End Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalEndDate" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Name</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md flexdatalist" id="nurseryUseMasterChartModalDrugName" maxlength="100" placeholder="Please Search Drug Name...." 
                                           data-search-by-word="true" 
                                           data-selection-required="true"
                                           > 
                                    <div id="nurseryUseMasterChartModalDrugNameSearchResultDIV" ></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Code</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalDrugCode" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Strength</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalDrugStrength" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Frequency</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalDrugFrequency" readonly> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Drug Route</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseMasterChartModalDrugRoute" readonly> 
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Supply One</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="nurseryUseMasterChartModalDrugSupplyOne" maxlength="3">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Dispensed By</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md flexdatalist" id="nurseryUseMasterChartModalDrugSupplyOneDispensedBy" maxlength="100" placeholder="Please Search Staff Name...." 
                                           data-search-by-word="true" 
                                           data-selection-required="true"
                                           > 
                                    <div id="nurseryUseMasterChartModalDrugSupplyOneDispensedBySearchResultDIV" ></div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <hr/>


                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Supply Two</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="nurseryUseMasterChartModalDrugSupplyTwo" maxlength="3">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Dispensed By</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md flexdatalist" id="nurseryUseMasterChartModalDrugSupplyTwoDispensedBy" maxlength="100" placeholder="Please Search Staff Name...." 
                                           data-search-by-word="true" 
                                           data-selection-required="true"
                                           >  
                                    <div id="nurseryUseMasterChartModalDrugSupplyTwoDispensedBySearchResultDIV" ></div>
                                </div>
                            </div>
                        </div>
                    </div>



                </form>


            </div>


            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="nurseryUseMasterChartModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="nurseryUseMasterChartModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->




<!-- Start Modal -->
<div class="modal fade" id="ong-nurseryUseDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h2 class="modal-title" id="nurseryUseDetailChartModalTitle"></h2>
            </div>
            <div class="modal-body">

                <form autocomplete="off" id="nurseryUseDetailChartModalForm">

                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="ONGNurseryUseDetailChartPmi" >
                            <input type="hidden" id="ONGNurseryUseDetailChartHfc" >
                            <input type="hidden" id="ONGNurseryUseDetailChartEpisodeDate" >
                            <input type="hidden" id="ONGNurseryUseDetailChartEncounterDate">
                            <input type="hidden" id="ONGNurseryUseDetailChartMasterDate">
                            <input type="hidden" id="ONGNurseryUseDetailChartDetailDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Master Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseDetailChartModalMasterDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Master Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseDetailChartModalMasterTime" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Detail Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseDetailChartModalDetailDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Detail Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseDetailChartModalDetailTime" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Description</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryUseDetailChartModalDescription" maxlength="20">
                                </div>
                            </div>
                        </div>
                    </div>



                </form>


            </div>


            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="nurseryUseDetailChartModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="nurseryUseDetailChartModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

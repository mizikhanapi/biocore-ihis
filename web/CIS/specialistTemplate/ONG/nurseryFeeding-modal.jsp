<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>


<!-- Start Modal -->
<div class="modal fade" id="ong-nurseryFeedingChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h2 class="modal-title" id="nurseryFeedingChartModalTitle"></h2>
            </div>
            <div class="modal-body">

                <form autocomplete="off" id="nurseryFeedingChartModalForm">

                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="ONGNurseryFeedingChartPmi" >
                            <input type="hidden" id="ONGNurseryFeedingChartHfc" >
                            <input type="hidden" id="ONGNurseryFeedingChartEpisodeDate" >
                            <input type="hidden" id="ONGNurseryFeedingChartEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalTime" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Strength Of Milk</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalMilkStrength" maxlength="50">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Method Of Feeding</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalFeedingMethod" maxlength="50">
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Aspirate Vomit</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalAspirateVomit" maxlength="50">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Temperature</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="nurseryFeedingChartModalTemperature" maxlength="3">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Respiration</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="nurseryFeedingChartModalRespiration" maxlength="3">
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">PU</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalPU" maxlength="10">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">BO</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="nurseryFeedingChartModalBO" maxlength="10">
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr/>


                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Conscious State & Remarks</label>
                                <div class="col-md-12">
                                    <textarea type="text" name="display_name" id="nurseryFeedingChartModalRemark" class="form-control input-md" placeholder="Add conscious state & remarks.." maxlength="100"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                     <div class="btn-group" role="group" id="nurseryFeedingChartModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="nurseryFeedingChartModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<%-- 
    Document   : chartCirculation
    Created on : Jun 9, 2017, 10:42:38 AM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="circulationChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h2 class="modal-title" id="chartCirculationModalTitle"></h2>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="chartCirculationForm">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWChartCirculationPmi" >
                            <input type="hidden" id="NIWChartCirculationHfc" >
                            <input type="hidden" id="NIWChartCirculationEpisodeDate" >
                            <input type="hidden" id="NIWChartCirculationEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="chartCirculationModalDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="chartCirculationModalTime">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row margin-bottom-30px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Colour</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="chartCirculationModalColour">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Sensation</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="chartCirculationModalSensation">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Hot / Cold</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="HotCold" value="Hot" id="chartCirculationModalHot">
                                        <label for="chartCirculationModalHot">
                                            Hot
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="HotCold" value="Cold" id="chartCirculationModalCold">
                                        <label for="chartCirculationModalCold">
                                            Cold
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Movement</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="chartCirculationModalMovement">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Others</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md" id="chartCirculationModalOthers" ></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="chartCirculationModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="chartCirculationModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
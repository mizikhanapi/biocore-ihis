<%-- 
    Document   : fluidBalance
    Created on : Jun 9, 2017, 5:31:33 PM
    Author     : user
--%>

<div class="modal fade" id="fluidBalanceIntake" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="fluidBalanceIntakeModalTitle"></h4>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="fluidBalanceIntakeModalForm">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWFluidBalanceIntakePmi" >
                            <input type="hidden" id="NIWFluidBalanceIntakeHfc" >
                            <input type="hidden" id="NIWFluidBalanceIntakeEpisodeDate" >
                            <input type="hidden" id="NIWFluidBalanceIntakeEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="fluidBalanceIntakeModalDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="fluidBalanceIntakeModalTime">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <h4 class="modal-title">Oral</h4>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Type</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="fluidBalanceIntakeModalOralType">
                                        <option selected="" disabled="" value=" ">Please Select Oral Type</option>
                                        <option value="Oral 1">Oral 1</option>
                                        <option value="Oral 2">Oral 2</option>
                                        <option value="Oral 3">Oral 3</option>
                                        <option value="Oral 4">Oral 4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Amount</label>
                                <div class="col-md-12">
                                    <input type="number" class="form-control input-md" id="fluidBalanceIntakeModalOralAmount" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <h4 class="modal-title">Intravenous</h4>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Type</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="fluidBalanceIntakeModalIntravenousType">
                                        <option selected="" disabled="" value=" ">Please Select Intravenous Type</option>
                                        <option value="Intravenous 1">Intravenous 1</option>
                                        <option value="Intravenous 2">Intravenous 2</option>
                                        <option value="Intravenous 3">Intravenous 3</option>
                                        <option value="Intravenous 4">Intravenous 4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Amount</label>
                                <div class="col-md-12">
                                    <input type="number" class="form-control input-md" id="fluidBalanceIntakeModalIntravenousAmount">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <h4 class="modal-title">Other (Specify)</h4>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Type</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="fluidBalanceIntakeModalOtherType">
                                        <option selected="" disabled="" value=" ">Please Select Other Type</option>
                                        <option value="Other 1">Other 1</option>
                                        <option value="Other 2">Other 2</option>
                                        <option value="Other 3">Other 3</option>
                                        <option value="Other 4">Other 4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Amount</label>
                                <div class="col-md-12">
                                    <input type="number" class="form-control input-md" id="fluidBalanceIntakeModalOtherAmount">
                                </div>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="fluidBalanceIntakeModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="fluidBalanceIntakeModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="fluidBalanceOutput" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="fluidBalanceOutputModalTitle"></h4>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="fluidBalanceOutputModalForm">

                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWFluidBalanceOutputPmi" >
                            <input type="hidden" id="NIWFluidBalanceOutputHfc" >
                            <input type="hidden" id="NIWFluidBalanceOutputEpisodeDate" >
                            <input type="hidden" id="NIWFluidBalanceOutputEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="fluidBalanceOutputModalDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="fluidBalanceOutputModalTime">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row margin-bottom-30px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Urine</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="fluidBalanceOutputModalUrine">
                                        <option selected="" disabled="" value=" ">Please Select Urine</option>
                                        <option value="Urine 1">Urine 1</option>
                                        <option value="Urine 2">Urine 2</option>
                                        <option value="Urine 3">Urine 3</option>
                                        <option value="Urine 4">Urine 4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Vomitus</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="fluidBalanceOutputModalVomitus">
                                        <option selected="" disabled="" value=" ">Please Select Vomitus</option>
                                        <option value="Vomitus 1">Vomitus 1</option>
                                        <option value="Vomitus 2">Vomitus 2</option>
                                        <option value="Vomitus 3">Vomitus 3</option>
                                        <option value="Vomitus 4">Vomitus 4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-bottom-30px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gastric Suction</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="fluidBalanceOutputModalGastricSuction">
                                        <option selected="" disabled="" value=" ">Please Select Gastric Suction</option>
                                        <option value="Gastric Suction 1">Gastric Suction 1</option>
                                        <option value="Gastric Suction 2">Gastric Suction 2</option>
                                        <option value="Gastric Suction 3">Gastric Suction 3</option>
                                        <option value="Gastric Suction 4">Gastric Suction 4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Other (Specify)</label>
                                <div class="col-md-12">
                                    <textarea class="form-control input-md" id="fluidBalanceOutputModalOthers"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="fluidBalanceOutputModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="fluidBalanceOutputModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
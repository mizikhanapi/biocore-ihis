<%-- 
    Document   : DiabeticChart
    Created on : Jun 9, 2017, 12:41:20 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="DiabeticChart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="diabeticChartModalTitle"></h4>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="diabeticChartForm">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="hidden" id="NIWDiabeticChartPmi" >
                            <input type="hidden" id="NIWDiabeticChartHfc" >
                            <input type="hidden" id="NIWDiabeticChartDate" >
                            <input type="hidden" id="NIWDiabeticChartEncounterDate">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="diabeticChartModalDate" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="diabeticChartModalTime">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Dextrostix</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md" id="diabeticChartModalDextrostix">
                                        <option selected="" disabled="" value=" ">Please Select Dextrostix</option>
                                        <option value="Dextrostix 1">Dextrostix 1</option>
                                        <option value="Dextrostix 2">Dextrostix 2</option>
                                        <option value="Dextrostix 3">Dextrostix 3</option>
                                        <option value="Dextrostix 4">Dextrostix 4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="diabeticChartModal_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="diabeticChartModalReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
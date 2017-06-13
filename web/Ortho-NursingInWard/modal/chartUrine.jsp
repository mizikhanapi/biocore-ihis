<%-- 
    Document   : chartUrine
    Created on : Jun 9, 2017, 4:23:04 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="chartUrine" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Urine Chart</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="date" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-8 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="urinechrt" id="urinechrt1" value="option1">
                                        <label for="urinechrt1">
                                            4
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="urinechrt" id="urinechrt2" value="option2">
                                        <label for="urinechrt2">
                                            8
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="urinechrt" id="urinechrt3" value="option3">
                                        <label for="urinechrt3">
                                            12
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 " style="padding-right: 0px;">
                                    <select class="form-control input-md">
                                        <option>AM</option>
                                        <option>PM</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row">

                        <div class="col-md-6">
                            <button class="btn btn-default btn-block">Add Urine Temperature</button>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-default btn-block">Add Pulse</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="acceptBloodPBtn" role="button">Add Items</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 
    Document   : 4hly
    Created on : Jun 8, 2017, 3:38:25 PM
    Author     : Mizi K (UI)
--%>

<div class="modal fade" id="4hly" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">4 Hourly Observation Chart for Thrombophlebitis</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="dateNIW4hly">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time 4hly Observation</label>
                                <div class="col-md-12 form-inline">
                                    <input type="time" class="form-control input-md" id="timeNIW4hly">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Site of IV Canulation</label>
                                <div class="col-md-12">
                                    <select class="form-control input-md">
                                        <option selected="" disabled="">please select site of canulation</option>
                                        <option value="Vein of the dorsal hand">Vein of the dorsal hand</option>
                                        <option value="Vein of the foot">Vein of the foot</option>
                                        <option value="Vein of the anterior forearm">Vein of the anterior forearm</option>
                                        <option value="External jugular vein">External jugular vein</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Pain Score</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" placeholder="pain scale" id="NIW4hlyps" readonly="">
                                    <button class="btn btn-default btn-block margin-bottom-10px" id="btnNIWaddps" data-toggle="modal" data-target="#CIS020007">Add Pain Score</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Choose..</label>
                                <div class="col-md-12">
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose1" value="option1">
                                        <label for="hourlychoose1">
                                            Slight Redness
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose2" value="option2">
                                        <label for="hourlychoose2">
                                            Redness
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose3" value="option3">
                                        <label for="hourlychoose3">
                                            Swelling
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose4" value="option4">
                                        <label for="hourlychoose4">
                                            Palpable Venous cord
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="hourlychoose" id="hourlychoose5" value="option5">
                                        <label for="hourlychoose5">
                                            Unconscious Pt
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Additive</label>
                                <div class="col-md-12">
                                    <div class="checkbox">
                                        <input type="checkbox" name="radio2" id="Additive1" value="option1">
                                        <label for="Additive1">
                                            Medication
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="radio2" id="Additive2" value="option2">
                                        <label for="Additive2">
                                            Blood Tx
                                        </label>
                                    </div>
                                    <div class="checkbox">
                                        <input type="checkbox" name="radio2" id="Additive3" value="option3">
                                        <label for="Additive3">
                                            Plain I/V drip
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row margin-bottom-10px">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Thrombo phlebitis</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio3" id="Thrombo1" value="option1">
                                        <label for="Thrombo1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio3" id="Thrombo2" value="option2">
                                        <label for="Thrombo2">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">V.I.P. Score</label>
                                <div class="col-md-12 form-inline">
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip1" value="option1">
                                        <label for="vip1">
                                            1
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip2" value="option2">
                                        <label for="vip2">
                                            2
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip3" value="option3">
                                        <label for="vip3">
                                            3
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip4" value="option4">
                                        <label for="vip4">
                                            4
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radio4" id="vip5" value="option5">
                                        <label for="vip5">
                                            5
                                        </label>
                                    </div>
                                </div>
                            </div>
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
<script>
    $(document).ready(function () {
        $('#dateNIW4hly').datepicker({dateFormat:"dd/mm/yy"});
    });
    
        //btn add pain scale
    $('#4hly #btnNIWaddps').on('click', function (e) {
        e.preventDefault();
        $('#actionPS #btnNIWps').show();
        $('#actionPS #acceptPSBtn').hide();
    });
</script>
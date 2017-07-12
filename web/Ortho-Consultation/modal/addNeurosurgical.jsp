<%-- 
    Document   : addNeurosurgical
    Created on : Apr 18, 2017, 10:54:23 AM
    Author     : user
--%>
<div class="modal fade" id="Neurosurgical0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Date & Time</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Date</label>
                                <div class="col-md-12">
                                    <input type="date" id="dateEntry" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" id="timeEntry" class="form-control input-md" >
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="AddItemBtn" role="button">Add Items</button>
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
    $("#AddItemBtn").click(function () {

        var dateEntry = $("#dateEntry").val();
        var timeEntry = $("#timeEntry").val();
        
        alert(dateEntry+" "+timeEntry);

        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_date_observation.jsp",
            type: "post",
            data: {
                dateEntry: dateEntry,
                timeEntry: timeEntry
            },
            timeout: 10000,
            success: function (data) {
                $("#Neurosurgical0").hide();
                $(".modal-backdrop").hide();
                alert("Observation date is saved.");
                $("#getNeuObservation").load("../Ortho-Consultation/neuObservation.jsp");
            },
            error: function (err) {
                alert("Error update!");
            }
        });

    });

//    $("#delete_observation1").click(function () {
//
//        //alert("Are you sure to delete the data?");
//        var r = confirm("Are you sure to delete the data?");
//        if (r == true) {
//            $.ajax({
//                url: "../Ortho-Consultation/modal/action/delete_observation.jsp",
//                type: "post",
//                data: {
//                },
//                timeout: 10000,
//                success: function () {
//                    alert("Observation record is deleted.");
//                    $("#getNeuObservation").load("../Ortho-Consultation/neuObservation.jsp");
//                },
//                error: function (err) {
//                    alert("Error update!");
//                }
//            });
//        } else {
//            //txt = "You pressed Cancel!";
//        }
//
//
//    });

    $(document).ready(function () {
        $("#dateEntry").datepicker({
            dateFormat: 'yy-mm-dd',
            yearRange: '1999:c+1',
            changeMonth: true,
            changeYear: true,
            minDate: new Date(1999, 10 - 1, 25),
            maxDate: '+30Y',
        });
    });
</script>

<div class="modal fade" id="Neurosurgical1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Pupil Size Reaction</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Left</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="quant[1]" class="form-control input-number" value="1" min="1" max="10" id="left_pupil">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Right</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="quant[2]" class="form-control input-number" value="1" min="1" max="10" id="right_pupil">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput"></label>
                                <div class="col-md-12">
                                    <img src="lib/Pupil-Scale-(mm).jpg" alt="" style="width: 100%;" />
                                    <p style="text-align: center; font-weight: 500; margin-bottom: 0px;">Pupil Scale<br/>(mm)</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="addPupilsBtn" role="button">Add Items</button>
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
    $("#addPupilsBtn").click(function () {

        var right_pupil = $("#right_pupil").val();
        var left_pupil = $("#left_pupil").val();


        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_pupil_size.jsp",
            type: "post",
            data: {
                right_pupil: right_pupil,
                left_pupil: left_pupil
            },
            timeout: 10000,
            success: function (data) {
                $("#Neurosurgical1").hide();
                $(".modal-backdrop").hide();
                alert("Pupils size reaction is saved.");
                $("#getNeuObservation").load("../Ortho-Consultation/neuObservation.jsp");
            },
            error: function (err) {
                alert("Error update!");
            }
        });

    });

</script>

<div class="modal fade" id="Neurosurgical2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Limb Movement</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Arm</label>
                                <div class="col-md-12">
                                    <select class="form-control" id="Arm">
                                        <option value="Normal Power">Normal Power</option>
                                        <option value="Mild Weakness<">Mild Weakness</option>
                                        <option value="Severe Weakness">Severe Weakness</option>
                                        <option value="Spastic Flexion">Spastic Flexion</option>
                                        <option value="Extension">Extension</option>
                                        <option value="No Response">No Response</option>
                                    </select>   
                                </div>
                            </div>

                        </div>


                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Legs</label>
                                <div class="col-md-12">
                                    <select class="form-control" id="Legs">
                                        <option value="Normal Power">Normal Power</option>
                                        <option value="Mild Weakness">Mild Weakness</option>
                                        <option value="Severe Weakness">Severe Weakness</option>
                                        <option value="Spastic Flexion">Spastic Flexion</option>
                                        <option value="Extension">Extension</option>
                                        <option value="No Response">No Response</option>
                                    </select>  
                                </div>
                            </div>

                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="addLimbBtn" role="button">Add Items</button>
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
    $("#addLimbBtn").click(function () {

        var e = document.getElementById('Arm');
        var Arm = e.options[e.selectedIndex].value;
        var f = document.getElementById('Legs');
        var Legs = f.options[f.selectedIndex].value;
        //var Arm = $("#Arm").val();
        //var legs = $("#legs").val();

        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_limb.jsp",
            type: "post",
            data: {
                arm: Arm,
                legs: Legs
            },
            timeout: 10000,
            success: function (data) {
                $("#Neurosurgical2").hide();
                $(".modal-backdrop").hide();
                alert("Limb movement is saved.");
                $("#getNeuObservation").load("../Ortho-Consultation/neuObservation.jsp");
            },
            error: function (err) {
                alert("Error update!");
            }
        });

    });

</script>

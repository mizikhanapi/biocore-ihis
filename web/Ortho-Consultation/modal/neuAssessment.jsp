<%-- 
    Document   : neuAssessment
    Created on : Jun 5, 2017, 12:51:45 PM
    Author     : Mizi K (UI)
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>

<div class="modal fade" id="neuAssessment1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                    <input type="date" class="form-control input-md" id="dateEntry1">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Time</label>
                                <div class="col-md-12">
                                    <input type="time" class="form-control input-md" id="timeEntry1">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="AddDateBtn" role="button">Add Items</button>
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
    $("#AddDateBtn").click(function () {

        var dateEntry = $("#dateEntry1").val();
        var timeEntry = $("#timeEntry1").val();


        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_date.jsp",
            type: "post",
            data: {
                dateEntry: dateEntry,
                timeEntry: timeEntry
            },
            timeout: 10000,
            success: function (data) {
                $("#getNeuAssessment").load("../Ortho-Consultation/neuAssessment.jsp");
                $("#encounter").load("encounter_date.jsp");
                $('#encounter').html(data);
                $('#encounter').trigger('contentchanged');
                $('#encounter1').html(data);
                $('#encounter1').trigger('contentchanged');
                $("#neuAssessment1").hide();
                $(".modal-backdrop").hide();
                alert("Assessment date is saved.");
            },
            error: function (err) {
                alert("Error update!");
            }
        });

    });

    $(document).ready(function () {
        $("#dateEntry1").datepicker({
            dateFormat: 'yy-mm-dd',
            yearRange: '1999:c+1',
            changeMonth: true,
            changeYear: true,
            minDate: new Date(1999, 10 - 1, 25),
            maxDate: '+30Y',
        });


    });
</script>

<div class="modal fade" id="neuAssessment2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Muscle Power</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Surface -->
                            <div id="encounter">
                                
                            </div>
                            <h5>Hip</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        SLRT
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo1" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo2" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Extension
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo3" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo4" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Flexion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo5" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo6" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Abduction
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo7" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo8" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Surface -->
                            <h5>Knee</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Extension
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo9" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo10" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Flexion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo11" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo12" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Surface -->
                            <h5>Ankle</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Dorsiflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo13" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo14" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Pantarflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo15" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo16" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Eversion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo17" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo18" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Inversion
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo19" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo20" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Surface -->
                            <h5>Toes</h5>
                            <hr/>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Dorsiflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo21" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo22" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Plantarflex
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo23" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo24" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="addMusclePowerBtn" role="button">Add Items</button>
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
    $("#addMusclePowerBtn").click(function () {

        var pickup_date = document.getElementById("pickup_date");
        var selected_date = pickup_date.options[pickup_date.selectedIndex].value;
        //alert(selected_date);
        //alert(pickup_date);
        var rnNo1 = $("#rnNo1").val();
        var rnNo2 = $("#rnNo2").val();
        var rnNo3 = $("#rnNo3").val();
        var rnNo4 = $("#rnNo4").val();
        var rnNo5 = $("#rnNo5").val();
        var rnNo6 = $("#rnNo6").val();
        var rnNo7 = $("#rnNo7").val();
        var rnNo8 = $("#rnNo8").val();
        var rnNo9 = $("#rnNo9").val();
        var rnNo10 = $("#rnNo10").val();
        var rnNo11 = $("#rnNo11").val();
        var rnNo12 = $("#rnNo12").val();
        var rnNo13 = $("#rnNo13").val();
        var rnNo14 = $("#rnNo14").val();
        var rnNo15 = $("#rnNo15").val();
        var rnNo16 = $("#rnNo16").val();
        var rnNo17 = $("#rnNo17").val();
        var rnNo18 = $("#rnNo18").val();
        var rnNo19 = $("#rnNo19").val();
        var rnNo20 = $("#rnNo20").val();
        var rnNo21 = $("#rnNo21").val();
        var rnNo22 = $("#rnNo22").val();
        var rnNo23 = $("#rnNo23").val();
        var rnNo24 = $("#rnNo24").val();
        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_muscle_power.jsp",
            type: "post",
            data: {
                rnNo1: rnNo1,
                rnNo2: rnNo2,
                rnNo3: rnNo3,
                rnNo4: rnNo4,
                rnNo5: rnNo5,
                rnNo6: rnNo6,
                rnNo7: rnNo7,
                rnNo8: rnNo8,
                rnNo9: rnNo9,
                rnNo10: rnNo10,
                rnNo11: rnNo11,
                rnNo12: rnNo12,
                rnNo13: rnNo13,
                rnNo14: rnNo14,
                rnNo15: rnNo15,
                rnNo16: rnNo16,
                rnNo17: rnNo17,
                rnNo18: rnNo18,
                rnNo19: rnNo19,
                rnNo20: rnNo20,
                rnNo21: rnNo21,
                rnNo22: rnNo22,
                rnNo23: rnNo23,
                rnNo24: rnNo24,
                selected_date: selected_date
            },
            timeout: 10000,
            success: function (data) {
                $("#getNeuAssessment").load("../Ortho-Consultation/neuAssessment.jsp");
                $("#neuAssessment2").hide();
                $(".modal-backdrop").hide();
                alert("Muscle Power Added");

            },
            error: function (err) {
                alert("Error update!");
            }
        });

    });
</script>

<div class="modal fade" id="neuAssessment3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Sensory</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Surface -->
                            <div id="encounter1">
                                
                            </div>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 1
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo25" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo26" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 2
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo27" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo28" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 3
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo29" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo30" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 4
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo31" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo32" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        L 5
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo33" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo34" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        S 1
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo35" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo36" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        S 2
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo37" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo38" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Sacral
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo39" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo40" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Abdominal
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo41" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo42" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Crematenic
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo43" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo44" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        Anal
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo45" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo46" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="col-md-6">
                                        BO
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-6">
                                            <input id="rnNo47" name="rnNo" type="text" placeholder="Left" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                        <div class="col-md-6">
                                            <input id="rnNo48" name="rnNo" type="text" placeholder="Right" class="form-control input-md" style="margin-top: 8px!important;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="addSensoryBtn" role="button">Add Items</button>
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
    $("#addSensoryBtn").click(function () {
        var pickup_date = document.getElementById("pickup_date");
        var selected_date = pickup_date.options[pickup_date.selectedIndex].value;
        alert(selected_date);
        var rnNo25 = $("#rnNo25").val();
        var rnNo26 = $("#rnNo26").val();
        var rnNo27 = $("#rnNo27").val();
        var rnNo28 = $("#rnNo28").val();
        var rnNo29 = $("#rnNo29").val();
        var rnNo30 = $("#rnNo30").val();
        var rnNo31 = $("#rnNo31").val();
        var rnNo32 = $("#rnNo32").val();
        var rnNo33 = $("#rnNo33").val();
        var rnNo34 = $("#rnNo34").val();
        var rnNo35 = $("#rnNo35").val();
        var rnNo36 = $("#rnNo36").val();
        var rnNo37 = $("#rnNo37").val();
        var rnNo38 = $("#rnNo38").val();
        var rnNo39 = $("#rnNo39").val();
        var rnNo40 = $("#rnNo40").val();
        var rnNo41 = $("#rnNo41").val();
        var rnNo42 = $("#rnNo42").val();
        var rnNo43 = $("#rnNo43").val();
        var rnNo44 = $("#rnNo44").val();
        var rnNo45 = $("#rnNo45").val();
        var rnNo46 = $("#rnNo46").val();
        var rnNo47 = $("#rnNo47").val();
        var rnNo48 = $("#rnNo48").val();
        
        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_sensory.jsp",
            type: "post",
            data: {
                rnNo25: rnNo25,
                rnNo26: rnNo26,
                rnNo27: rnNo27,
                rnNo28: rnNo28,
                rnNo29: rnNo29,
                rnNo30: rnNo30,
                rnNo31: rnNo31,
                rnNo32: rnNo32,
                rnNo33: rnNo33,
                rnNo34: rnNo34,
                rnNo35: rnNo35,
                rnNo36: rnNo36,
                rnNo37: rnNo37,
                rnNo38: rnNo38,
                rnNo39: rnNo39,
                rnNo40: rnNo40,
                rnNo41: rnNo41,
                rnNo42: rnNo42,
                rnNo43: rnNo43,
                rnNo44: rnNo44,
                rnNo45: rnNo45,
                rnNo46: rnNo46,
                rnNo47: rnNo47,
                rnNo48: rnNo48,
                selected_date: selected_date
            },
            timeout: 10000,
            success: function (data) {
                $("#getNeuAssessment").load("../Ortho-Consultation/neuAssessment.jsp");
                $("#neuAssessment3").hide();
                $(".modal-backdrop").hide();
                alert("Sensory Added");
            },
            error: function (err) {
                alert("Error update!");
            }
        });

    });
</script>
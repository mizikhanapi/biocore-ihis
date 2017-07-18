<%-- 
    Document   : PIRAssessment
    Created on : Jun 6, 2017, 10:08:26 AM
    Author     : user
--%>
<%
    String user_name = session.getAttribute("USER_NAME").toString();
%>
<div class="modal fade" id="PIRAssessment1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Pressure Injury Risk Assessment</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" name="myForm2" id="myForm2">
                    <div class="row">
                        <div class="col-md-12 tajuk">
                            <h4 class="no-padding">1. Assessment Type (Please Tick)</h4>
                        </div>
                        <div class="col-md-12">
                            <div class="checkbox-inline">
                                <div class="radiobtn">
                                    <input type="radio" id="radio1" name="typeAssessment" value="Admission/Transfer in" checked>
                                    <label for="radio1"></label></div> Admission/Transfer in
                            </div>
                            <div class="checkbox-inline">
                                <div class="radiobtn">
                                    <input type="radio" id="radio2" name="typeAssessment" value="Non ambulatory">
                                    <label for="radio2"></label></div> Non ambulatory
                            </div>
                            <div class="checkbox-inline">
                                <div class="radiobtn">
                                    <input type="radio" id="radio3" name="typeAssessment" value="Non ambulatory">
                                    <label for="radio3"></label></div> Re-assessment
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row margin-top-30px">
                        <div class="col-md-12 tajuk">
                            <h4 class="no-padding">2. Skin Integrity On admission/ Transfer in / Reassessment</h4>
                        </div>

                        <div class="col-md-5">
                            <h5>is there an evidence of pressure ulcer?</h5>
                            <!-- Text input-->
                            <div class="form-group ">
                                <div class="col-md-12">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="radio4" name="pressure_ulcer" value="yes" checked>
                                            <label for="radio4"></label></div> Yes
                                    </div>
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="radio5" name="pressure_ulcer" value="false">
                                            <label for="radio5"></label></div> No
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-7">
                            <h5>Source?</h5>
                            <!-- Text input-->
                            <div class="col-md-12">
                                <div class="checkbox-inline" style="vertical-align: top;">
                                    <div class="radiobtn">
                                        <input type="radio" id="radio6" name="source" value="Hospital acquired">
                                        <label for="radio6"></label></div> Hospital acquired
                                    <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important;">
                                </div>
                                <div class="checkbox-inline" style="vertical-align: top;">
                                    <div class="radiobtn">
                                        <input type="radio" id="radio7" name="source" value="Home / Community">
                                        <label for="radio7"></label></div> Home / Community
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row cek-soalan">
                        <div class="col-md-12 tajuk margin-bottom-30px">
                            <h4 class="no-padding">3. Mobility Assessment</h4>
                            <p>Why patient unable to move himself/herself?</p>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="Obesity" class="mobAssess" value="Obesity"><label for="Obesity"></label></div>
                                    3.1. Obesity
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="Cachexic" class="mobAssess" value="Cachexic / Malnourished"><label for="Cachexic"></label></div>
                                    3.2. Cachexic / Malnourished
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="ventilatory" class="mobAssess" value="On high ventilatory support"><label for="ventilatory"></label></div>
                                    3.3. On high ventilatory support 
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="sedation" class="mobAssess" value="On deep sedation"><label for="sedation"></label></div>
                                    3.4. On deep sedation
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="inotropic" class="mobAssess" value="On high inotropic support"><label for="inotropic"></label></div>
                                    3.5. On high inotropic support
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="Limb" class="mobAssess" value="Limb traction"><label for="Limb"></label></div>
                                    3.6. Limb traction
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 kedua">
                            <!-- Text input-->
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="Spinal" class="mobAssess" value="Spinal injury"><label for="Spinal"></label></div>
                                    3.7. Spinal injury
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="glassgow" class="mobAssess" value="Poor glassgow coma score"><label for="glassgow"></label></div>
                                    3.8. Poor glassgow coma score
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="Paralysed" class="mobAssess" value="Paralysed"><label for="Paralysed"></label></div>
                                    3.9. Paralysed 
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="Neurogicaldeficit" class="mobAssess" value="Neurogical deficit"><label for="Neurogicaldeficit"></label></div>
                                    3.10. Neurogical deficit
                                </div>
                            </div>
                            <div class="form-group soalan">
                                <div class="col-md-12">
                                    <div class="ckbox"><input type="checkbox" id="Others" class="mobAssess" value="Others"><label for="Others"></label></div>
                                    3.11. Others
                                    <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row cek-soalan margin-top-30px">
                        <div class="col-md-12 tajuk ">
                            <h4 class="no-padding">4. Intervention</h4>
                            <p>Skin bundle assessment tool</p>
                        </div>
                        <div class="col-md-6">

                            <!-- Surface -->
                            <h5>4.1. SURFACE</h5>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="radio8" name="surface" value="Ripple Matress" checked="checked">
                                            <label for="radio8"></label></div> Ripple Matress
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="radio9" name="surface" value="false">
                                            <label for="radio9"></label></div> Heel protection devices/pillow
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="radio10" name="surface" value="Seat cushion on chair">
                                            <label for="radio10"></label></div> Seat cushion on chair
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="radio11" name="surface" value="Others">
                                            <label for="radio11"></label></div> Others
                                    </div>
                                </div>
                            </div>

                            <!-- Mobility -->
                            <h5>4.2. MOBILITY</h5>
                            <div class="golongan-soalan margin-bottom-30px">
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Hourlyposition" name="mobility" value="2 Hourly position">
                                            <label for="Hourlyposition"></label></div>
                                        2 Hourly position
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="pelvictwist" name="mobility" value="2 Hourly pelvic twist">
                                            <label for="pelvictwist"></label></div>
                                        2 Hourly pelvic twist
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Passive" name="mobility" value="Passive excercise">
                                            <label for="Passive"></label></div>
                                        Passive excercise
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="tissueManipulation" name="mobility" value="Soft tissue Manipulation">
                                            <label for="tissueManipulation"></label></div>
                                        Soft tissue Manipulation
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="chair" name="mobility" value="Sit on chair">
                                            <label for="chair"></label></div>
                                        Sit on chair
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="mobilityOthers" name="mobility" value="Others">
                                            <label for="mobilityOthers"></label></div>
                                        Others
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important;">
                                    </div>
                                </div>
                            </div>

                            <!-- Nutrition -->
                            <h5>4.3. NUTRITION</h5>
                            <div class="golongan-soalan">
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Malnutrition" name="nutrition" value="Malnutrition Screening Tool">
                                            <label for="Malnutrition"></label></div>
                                        Malnutrition Screening Tool
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="dietitian" name="nutrition" value="Refer dietitian care note (DCN)">
                                            <label for="dietitian"></label></div>
                                        Refer dietitian care note (DCN)
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6 kedua">
                            <!-- Skin Care -->
                            <h5>4.4. SKIN CARE</h5>
                            <div class="golongan-soalan margin-bottom-30px">
                                <p>Barrier product</p>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Cream" name="Barrier" value="Cream">
                                            <label for="Cream"></label></div>
                                        Cream
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Lotion" name="Barrier" value="Lotion">
                                            <label for="Lotion"></label></div>
                                        Lotion
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Spray" name="Barrier" value="Spray">
                                            <label for="Spray"></label></div>
                                        Spray
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Foam" name="Barrier" value="Foam">
                                            <label for="Foam"></label></div>
                                        Foam
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                            </div>

                            <div class="golongan-soalan margin-bottom-30px">
                                <p>Maintain moisture</p>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Moisturizer" name="moisture" value="Moisturizer">
                                            <label for="Moisturizer"></label></div>
                                        Moisturizer
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Emollient" name="moisture" value="Emollient">
                                            <label for="Emollient"></label></div>
                                        Emollient
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Collagen" name="moisture" value="Collagen">
                                            <label for="Collagen"></label></div>
                                        Collagen
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                            </div>

                            <div class="golongan-soalan margin-bottom-30px">
                                <p>Incontinence management</p>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Flexi_seal" name="management" value="Flexi-seal">
                                            <label for="Flexi_seal"></label></div>
                                        Flexi-seal
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="colostomy" name="management" value="Defunctioning colostomy">
                                            <label for="colostomy"></label></div>
                                        Defunctioning colostomy
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Anal" name="management" value="Anal plug">
                                            <label for="Anal"></label></div>
                                        Anal plug
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Diapers" name="management" value="Diapers">
                                            <label for="Diapers"></label></div>
                                        Diapers
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                                <div class="form-group soalan">
                                    <div class="checkbox-inline">
                                        <div class="radiobtn">
                                            <input type="radio" id="Condom" name="management" value="Condom drainage/CBD">
                                            <label for="Condom"></label></div>
                                        Condom drainage/CBD
                                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <br/>
                <hr/>
                <div class="row margin-bottom-10px">
                    <div class="col-md-12">
                        <div class="form-group">
                            <dd class="col-md-11 control-label" for="textinput">Assessment by <strong><%=user_name%></strong></dd>
                            <div class="col-md-1">
                                <div class="ckbox"><input type="checkbox" id="approvedAssessor"><label for="approvedAssessor"></label></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="addPIRbtn" role="button">Add Items</button>
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
    $("#addPIRbtn").click(function () {

        //alert("test");

        var typeAssessment = $('input[name="typeAssessment"]:checked').val();
        var pressure_ulcer = $('input[name="pressure_ulcer"]:checked').val();
        var source = $('input[name="source"]:checked').val();
        var surface = $('input[name=surface]:checked').val();
        var mobility = $('input[name="mobility"]:checked').val();
        var nutrition = $('input[name="nutrition"]:checked').val();
        var barrier = $('input[name="Barrier"]:checked').val();
        var moisture = $('input[name="moisture"]:checked').val();
        var management = $('input[name="management"]:checked').val();

        //alert(surface);
        var chkArray = [];

        $(".mobAssess:checked").each(function () {
            chkArray.push($(this).val());
        });

        var mobility_assessment;
        mobility_assessment = chkArray.join(',') + ",";
        //alert(mobility_assessment);
        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_PIR.jsp",
            type: "post",
            data: {
                typeAssessment: typeAssessment,
                pressure_ulcer: pressure_ulcer,
                source: source,
                surface: surface,
                mobility: mobility,
                nutrition: nutrition,
                Barrier: barrier,
                moisture: moisture,
                management: management,
                mobility_assessment: mobility_assessment

            },
            timeout: 10000,
            success: function (data) {

                $.ajax({
                    url: "../Ortho-Consultation/table/t_PIR_assessment.jsp",
                    type: "post",
                    timeout: 3000,
                    success: function (returnPIR) {
                        $('#getPIRAssessment').html(returnPIR);
                        console.log(returnPIR);
                        $('#getPIRAssessment').trigger('contentchanged');
                        $('#PIRAssessment1').modal('toggle');
                        $("#PIRAssessment1").hide();
                        $(".modal-backdrop").hide();
                        bootbox.alert("Patient injury risk information is saved.");
                    }
                });

//                $("#PIRAssessment1").hide();
//                $(".modal-backdrop").hide();
//                alert("Patient injury risk information is saved.");
//                $("#getPIRAssessment").load("../Ortho-Consultation/PIRAssessment.jsp");
            },
            error: function (err) {
                bootbox.alert("Error update!");
            }
        });

    });
</script>
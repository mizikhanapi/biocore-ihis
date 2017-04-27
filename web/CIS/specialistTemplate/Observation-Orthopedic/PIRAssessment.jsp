<%-- 
    Document   : PIRAssessment
    Created on : Apr 18, 2017, 12:25:09 PM
    Author     : user
--%>

<form class="form-horizontal" name="myForm2" id="myForm2">
    <div class="row margin-top-30px">
        <div class="col-md-12 tajuk">
            <h4>1. Assessment Type (Please Tick)</h4>
        </div>
        <div class="col-md-12">
            <div class="checkbox-inline">
                <!-- Text input-->
                <div class="form-group">
                    <div class="col-md-12">&nbsp;
                        Admission/Transfer in
                        <div class="ckbox"><input type="checkbox" id="Admission"><label for="Admission"></label></div>

                    </div>
                </div>
            </div>
            <div class="checkbox-inline">
                <!-- Text input-->
                <div class="form-group">
                    <div class="col-md-12">&nbsp;
                        <div class="ckbox"><input type="checkbox" id="Ambulatory"><label for="Ambulatory"></label></div>
                        Non ambulatory
                    </div>
                </div>
            </div>
            <div class="checkbox-inline">
                <!-- Text input-->
                <div class="form-group">
                    <div class="col-md-12">&nbsp;
                        <div class="ckbox"><input type="checkbox" id="checkbox1"><label for="checkbox1"></label></div>
                        Re-assessment
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row margin-top-30px">
        <div class="col-md-12 tajuk">
            <h4>2. Skin Integrity On admission/ Transfer in / Reassessment</h4>
        </div>

        <div class="col-md-6">
            <h5>is there an evidence of pressure ulcer?</h5>
            <!-- Text input-->
            <div class="form-group ">
                <div class="col-md-12">
                    <div class="checkbox-inline">
                        <div class="radiobtn">
                            <input type="radio" id="radio1" name="radios" value="all" checked>
                            <label for="radio1"></label></div> Yes
                    </div>
                    <div class="checkbox-inline">
                        <div class="radiobtn">
                            <input type="radio" id="radio2" name="radios" value="false">
                            <label for="radio2"></label></div> No
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <h5>Source?</h5>
            <!-- Text input-->
            <div class="col-md-12">
                <div class="checkbox-inline">
                    <div class="ckbox"><input type="checkbox" id="Hospital"><label for="Hospital"></label></div>&nbsp;
                    Hospital acquired
                    <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important;">
                </div>
                <div class="checkbox-inline" style="vertical-align: top;">
                    <div class="ckbox"><input type="checkbox" id="Community"><label for="Community"></label></div>&nbsp;
                    Home / Community
                </div>
            </div>
        </div>
    </div>

    <div class="row cek-soalan">
        <div class="col-md-12 tajuk margin-bottom-30px">
            <h4>3. Mobility Assessment</h4>
            <p>Why patient unable to move himself/herself?</p>
        </div>
        <div class="col-md-6">
            <!-- Text input-->
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="Obesity"><label for="Obesity"></label></div>
                    1. Obesity
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="Cachexic"><label for="Cachexic"></label></div>
                    2. Cachexic / Malnourished
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="ventilatory"><label for="ventilatory"></label></div>
                    3. On high ventilatory support 
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="sedation"><label for="sedation"></label></div>
                    4. On deep sedation
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="inotropic"><label for="inotropic"></label></div>
                    5. On high inotropic support
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="Limb"><label for="Limb"></label></div>
                    6. Limb traction
                </div>
            </div>
        </div>
        <div class="col-md-6 kedua">
            <!-- Text input-->
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="Spinal"><label for="Spinal"></label></div>
                    7. Spinal injury
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="glassgow"><label for="glassgow"></label></div>
                    8. Poor glassgow coma score
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="Paralysed"><label for="Paralysed"></label></div>
                    9. Paralysed 
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="Neurogicaldeficit"><label for="Neurogicaldeficit"></label></div>
                    10. Neurogical deficit
                </div>
            </div>
            <div class="form-group soalan">
                <div class="col-md-12">
                    <div class="ckbox"><input type="checkbox" id="Others"><label for="Others"></label></div>
                    11. Others
                    <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important;">
                </div>
            </div>
        </div>
    </div>

    <div class="row cek-soalan margin-top-30px">
        <div class="col-md-12 tajuk ">
            <h4>4. Intervention</h4>
            <p>Skin bundle assessment tool</p>
        </div>
        <div class="col-md-6">

            <!-- Surface -->
            <h5>1. SURFACE</h5>
            <div class="golongan-soalan margin-bottom-30px">
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Matress"><label for="Matress"></label></div>
                        Ripple Matress
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Heel"><label for="Heel"></label></div>
                        Heel protection devices/pillow
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="cushion"><label for="cushion"></label></div>
                        Seat cushion on chair
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Otherssurface"><label for="Otherssurface"></label></div>
                        Others
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important;">
                    </div>
                </div>
            </div>

            <!-- Mobility -->
            <h5>2. MOBILITY</h5>
            <div class="golongan-soalan margin-bottom-30px">
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Hourlyposition"><label for="Hourlyposition"></label></div>
                        2 Hourly position
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="pelvictwist"><label for="pelvictwist"></label></div>
                        2 Hourly pelvic twist
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Passive"><label for="Passive"></label></div>
                        Passive excercise
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="tissueManipulation"><label for="tissueManipulation"></label></div>
                        Soft tissue Manipulation
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="chair"><label for="chair"></label></div>
                        Sit on chair
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="mobilityOthers"><label for="mobilityOthers"></label></div>
                        Others
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important;">
                    </div>
                </div>
            </div>

            <!-- Nutrition -->
            <h5>3. NUTRITION</h5>
            <div class="golongan-soalan">
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Malnutrition"><label for="Malnutrition"></label></div>
                        Malnutrition Screening Tool
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="dietitian"><label for="dietitian"></label></div>
                        Refer dietitian care note (DCN)
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-6 kedua">
            <!-- Skin Care -->
            <h5>4. SKIN CARE</h5>
            <div class="golongan-soalan margin-bottom-30px">
                <p>Barrier product</p>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Cream"><label for="Cream"></label></div>
                        Cream
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Lotion"><label for="Lotion"></label></div>
                        Lotion
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Spray"><label for="Spray"></label></div>
                        Spray
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Foam"><label for="Foam"></label></div>
                        Foam
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
            </div>

            <div class="golongan-soalan margin-bottom-30px">
                <p>Maintain moisture</p>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Moisturizer"><label for="Moisturizer"></label></div>
                        Moisturizer
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Emollient"><label for="Emollient"></label></div>
                        Emollient
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Collagen"><label for="Collagen"></label></div>
                        Collagen
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
            </div>

            <div class="golongan-soalan margin-bottom-30px">
                <p>Incontinence management</p>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Flexi-seal"><label for="Flexi-seal"></label></div>
                        Flexi-seal
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="colostomy"><label for="colostomy"></label></div>
                        Defunctioning colostomy
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Anal"><label for="Anal"></label></div>
                        Anal plug
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Diapers"><label for="Diapers"></label></div>
                        Diapers
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
                <div class="form-group soalan">
                    <div class="col-md-12">
                        <div class="ckbox"><input type="checkbox" id="Condom"><label for="Condom"></label></div>
                        Condom drainage/CBD
                        <input id="rnNo" name="rnNo" type="text" placeholder="Specify..." class="form-control input-md" style="margin-top: 8px!important; display: none;">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr/>

    <div class="text-right">
        <button class="btn btn-link btn-lg" type="button" data-toggle="modal" data-target="#queueModal" id="queue">Clear</button>
        <button class="btn btn-primary btn-lg" type="button" data-toggle="modal" data-target="#appointmentModal" id="appointment"> Save</button>
    </div>
</form>
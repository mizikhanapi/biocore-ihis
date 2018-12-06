/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function calcPoint(eor, mr, vr) {
    var tPoint = eor + mr;
    var result;
    tPoint = tPoint + vr;
    if (tPoint <= 8) {
        result = "Severe Brain Injury";
    } else if (tPoint > 8 && tPoint <= 12) {
        result = "Moderate Brain Injury";
    } else if (tPoint > 12 && tPoint <= 14) {
        result = "Minor Brain Injury";
    } else {
        result = "Normal";
    }
    return [result, tPoint];
}

function calcBMI(h, w) {
    var bmi;
    var status;
    bmi = w / h;
    bmi = bmi.toFixed(1);

    if (bmi < 18.5) {
        status = "Underweight";
    } else if (bmi <= 23.9) {
        status = "Healthy Weight";
    } else if (bmi <= 26.9) {
        status = "Overweight";
    } else {
        status = "Obese";
    }
    return [bmi, status];
}

function convertToJSArray(data) {
    data = data.split('|');
    for (i = 0; i < data.length; i++) {

        data[i] = data[i].slice(1, -1);

    }
    return data;

}

function convertArrayToObject(data) {
    var dataArry = data.split(',');
    return dataArry;
}

function populateList() {
    alert("Populate function");
}

function clearID() {
    pitemIDpe0 = "";
    pitemIDpe1 = "";
    pitemIDpe2 = "";
    pitemIDpe3 = "";
    pitemIDpe4 = "";
    pitemIDpe5 = "";
    pitemIDpe6 = "";
    pitemIDpe7 = "";
    pitemIDpe8 = "";
}

//var _data = [];

var notes = "";
var i = 0;
var pitemIDpe0 = "";
var pitemIDpe1 = "";
var pitemIDpe2 = "";
var pitemIDpe3 = "";
var pitemIDpe4 = "";
var pitemIDpe5 = "";
var pitemIDpe6 = "";
var pitemIDpe7 = "";
var pitemIDpe8 = "";
var updateObjCd;

var NotesPE;





$(document).ready(function () {


/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------BLOOD PRESSURE MODEL--------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $('#ortho_actionBloodP').hide();
    $('#btnCIS_O_VTS_BP_ACCEPT').click(function (e) {
        e.preventDefault();

        var _sitBPS = $('#sitS').val();
        var _sitBPD = $('#sitD').val();
        var _sitBPP = $('#sitP').val();

        var _standBPS = $('#standS').val();
        var _standBPD = $('#standD').val();
        var _standBPP = $('#standP').val();

        var _lyingBPS = $('#lyingS').val();
        var _lyingBPD = $('#lyingD').val();
        var _lyingBPP = $('#lyingP').val();

        if (_sitBPS === "" || _sitBPD === "" || _sitBPP === "" || _sitBPS === null || _sitBPD === null || _sitBPP === null) {
            bootbox.alert("Please insert the correct and valid blood pressure");
        } else {

            var items = $('#sitS,#sitD,#sitP,#standS,#standD,#standP,#lyingS,#lyingD,#lyingP');
            var obj1 = {Acode: "VTS"};
            items.each(function () {
                obj1[this.id] = $(this).val();
            });
            _data.push(obj1);

            displayBP(_sitBPS, _sitBPD, _sitBPP, _standBPS, _standBPD, _standBPP, _lyingBPS, _lyingBPD, _lyingBPP);

            //$("#CIS020003").modal('hide');

            $('#sitS').val("");
            $('#sitD').val("");
            $('#sitP').val("");
            $('#standS').val("");
            $('#standD').val("");
            $('#standP').val("");
            $('#lyingS').val("");
            $('#lyingD').val("");
            $('#lyingP').val("");

        }

    });


    $('#tblCIS_Consultation_Table').on('click', '.updateBP', function (e) {

        $("#CIS020003").modal('show');

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#BPidFast').val(id[1]);
        $('#sitSFast').val(updateObj.sitS);
        $('#sitDFast').val(updateObj.sitD);
        $('#sitPFast').val(updateObj.sitP);

//        $('#standS').val(updateObj.standS);
//        $('#standD').val(updateObj.standD);
//        $('#standP').val(updateObj.standP);
//
//        $('#lyingS').val(updateObj.lyingS);
//        $('#lyingD').val(updateObj.lyingD);
//        $('#lyingP').val(updateObj.lyingP);

    });

    $('#updateBloodPBtn').click(function (e) {

        var upObject = _data[$('#BPidFast').val()];
        var rowId = $('#BPidFast').val();

        upObject.sitS = $('#sitSFast').val();
        upObject.sitD = $('#sitDFast').val();
        upObject.sitP = $('#sitPFast').val();

        upObject.standS = "";
        upObject.standD = "";
        upObject.standP = "";

        upObject.lyingS = "";
        upObject.lyingD = "";
        upObject.lyingP = "";


        var sum = ' Sitting: Systolic =' + upObject.sitS + ' mmHg | Diastolic =' + upObject.sitD + ' mmHg | Pulse =' + upObject.sitP + 'mmHg </br> Standing: Systolic =' + upObject.standS + 'mmHg | Diatolic =' + upObject.standD + 'mmHg | Pulse =' + upObject.standP + 'mmHg </br> Lying: Systolic =' + upObject.lyingS + ' mmHg | Diatolic = ' + upObject.lyingD + ' mmHg | Pulse =' + upObject.lyingP + ' mmHg';

        $('#sum' + rowId).html(sum);

        $("#CIS020003").modal('hide');

    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------RESPIRATORY RATE MODEL----------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptRRBtn').click(function (e) {
        e.preventDefault();

        var _rrRate = $('#rrRate').val();

        if (_rrRate === "" || _rrRate === null) {
            bootbox.alert("Please insert the correct and valid respiratory rate");
        } else {

            var items = $('#rrRate');

            var obj1 = {Acode: "VTS"};
            items.each(function () {
                obj1[this.id] = $(this).val();
            });
            _data.push(obj1);
            displayrrRate(_rrRate);

            //$("#CIS020004").modal('hide');
            $('#rrRate').val('');

        }



    });

    $('#tblCIS_Consultation_Table').on('click', '.updateRR', function (e) {

        $("#CIS020004").modal('show');

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#RRidFast').val(id[1]);

        $('#rrRateFast').val(updateObj.rrRate);

    });

    $('#updateRRBtn').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#RRidFast').val()];
        var rowId = $('#RRidFast').val();

        upObject.rrRate = $('#rrRateFast').val();

        var sum = 'Respiratory Rate:' + upObject.rrRate + ' breath/min';
        $('#sum' + rowId).html(sum);
        $("#CIS020004").modal('hide');

    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------OXYGEN SATURATION MODEL----------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptOSBtn').click(function (e) {

        var _OSat = $('#OSat').val();

        if (_OSat === "" || _OSat === null) {
            bootbox.alert("Please insert the correct and valid oxygen saturation");
        } else {

            var items = $('#OSat');
            var obj1 = {Acode: "VTS"};
            items.each(function () {
                obj1[this.id] = $(this).val();
            });

            _data.push(obj1);

            displayOsat(_OSat);

            //$("#CIS020005").modal('hide');

        }

    });

    $('#tblCIS_Consultation_Table').on('click', '.updateOS', function () {

        $('#CIS020005').modal('show');

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#idOSFast').val(id[1]);
        $('#OSatFast').val(updateObj.OSat);

    });

    $('#updateOSBtn').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#idOSFast').val()];
        var rowId = $('#idOSFast').val();

        upObject.OSat = $('#OSatFast').val();
        var sum = upObject.OSat;
        $('#sum' + rowId).html(sum);

        $("#CIS020005").modal('hide');

    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------Body Temperature modal-----------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;



    $('#acceptBTBtn').click(function (e) {
        var title = "Body Temperature";
        var _BTemp = $('#BTemp').val();

        if (_BTemp === "" || _BTemp === null) {
            bootbox.alert("Please insert the correct and valid body temperature");
        } else {

            var items = $('#BTemp');
            var obj1 = {Acode: "VTS"};
            items.each(function () {
                var value = $(this).val().split(" ");
                obj1[this.id] = value[0];
            });
            _data.push(obj1);
            displayBTemp(_BTemp);
            $('#BTemp').val('');
            $("#slider").slider("value", parseInt(1));
            //$("#CIS020006").modal('hide');

        }


    });

    $('#tblCIS_Consultation_Table').on('click', '.updateBT', function () {

        $('#CIS020006').modal('show');

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#BTidFast').val(id[1]);
        $("#BTempFast").val(updateObj.BTemp);
        $("#slider").slider("value", parseInt(updateObj.BTemp));

    });

    $('#updateBTBtn').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#BTidFast').val()];
        var rowId = $('#BTidFast').val();

        var value = $('#BTempFast').val().split(" ");
        upObject.BTemp = value[0];

        var sum = upObject.BTemp + ascii(176) + "C";
        $('#sum' + rowId).html(sum);
        $("#CIS020006").modal('hide');

    });


/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------Others modal-----------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;



    $('#bmiHeightSlider').slider({
        value: 0,
        min: 140,
        max: 220,
        step: 1,
        slide: function (event, ui) {
            $('#bmiHeight').val(ui.value + "");
        }
    });

    $('#bmiHeight').on('change', function (e) {
        var bmiInput = parseInt($('#bmiHeight').val());
        $('#bmiHeightSlider').slider("option", "value", bmiInput);
        $('#bmiHeight').val(bmiInput + "");
    });

    $('#bmiWeightSlider').slider({
        value: 0,
        min: 0,
        max: 150,
        step: 1,
        slide: function (event, ui) {
            $('#bmiWeight').val(ui.value + "");
        }
    });

    $('#bmiWeight').on('change', function (e) {
        var bmiWInput = parseInt($('#bmiWeight').val());
        $('#bmiWeightSlider').slider("option", "value", bmiWInput);
        $('#bmiWeight').val(bmiWInput + "");
    });

    $('#calcBMI').on('click', function (e) {
        var height = $('#bmiHeight').val().split(" ");
        height = parseFloat(height[0]) / 100;
        height = height * height;

        var weight = $('#bmiWeight').val().split(" ");
        weight = parseFloat(weight[0]);

        // result = weight/height;
        //result = parseInt(result)
        var result = calcBMI(height, weight);
        $('#bmi').val(result[0]);
        $('#bmiStatus').val((result[1]));


    });



/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------OTHER MODAL----------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptOtherBtn').click(function (e) {
        var title = "Other";

        var Oheight = $('#bmiHeight').val();
        var Oweight = $('#bmiWeight').val();
        var Obmi = $('#bmi').val();
        var OWeightStatus = $('#bmiStatus').val();
        var OheadCir = $('#headCir').val();
        var OBloodGlucose = $('#bloodGlucose').val();

        if (Oheight === "" || Oheight === null || Oweight === "" || Oweight === null || Obmi === null || Obmi === "" || Obmi === "0") {
            bootbox.alert("Please insert the correct and valid height and weight then press the calculate bmi button");
        } else {

            var items = $('#bmiHeight,#bmiWeight,#bmi,#bmiStatus,#headCir,#bloodGlucose');

            var obj = {
                Acode: "VTS",
                bmiHeight: Oheight,
                bmiWeight: Oweight,
                bmi: Obmi,
                bmiStatus: OWeightStatus,
                headCir: OheadCir,
                bloodGlucose: OBloodGlucose
            }

            _data.push(obj);

            displayOther(Oheight, Oweight, Obmi, OWeightStatus, OheadCir, OBloodGlucose);

            $("#bmiWeightSlider").slider("value", parseInt(1));
            $("#bmiHeightSlider").slider("value", parseInt(1));

            $("#fastTrackVitalSignForm")[0].reset();

        }


    });


    $('#tblCIS_Consultation_Table').on('click', '.updateOther', function () {

        $('#CIS020008').modal('show');

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#otherIdFast').val(id[1]);

        $('#bmiHeightFast').val(updateObj.bmiHeight);
        $('#bmiWeightFast').val(updateObj.bmiWeight);

    });

    $('#updateOtherBtn').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#otherIdFast').val()];
        var rowId = $('#otherIdFast').val();

        var height = $('#bmiHeightFast').val().split(" ");
        var weight = $('#bmiWeightFast').val().split(" ");

        height = parseFloat(height[0]) / 100;
        height = height * height;
        weight = parseFloat(weight[0]);

        var result = calcBMI(height, weight);

        upObject.bmiHeight = $('#bmiHeightFast').val();
        upObject.bmiWeight = $('#bmiWeightFast').val();
        upObject.bmi = result[0];
        upObject.bmiStatus = result[1];
        upObject.headCir = "";
        upObject.bloodGlucose = "";

        var sum = 'Height:' + upObject.bmiHeight + 'cm </br> Weight:' + upObject.bmiWeight + 'kg </br> BMI:' + upObject.bmi + 'kg/m2 </br> Weight Status:' + upObject.bmiStatus + ' </br> Head Circumference:' + upObject.headCir + 'cm </br> Blood Glucose:' + upObject.bloodGlucose + 'mmol/L';
        $('#sum' + rowId).html(sum);
        $("#CIS020008").modal('hide');

    });


});



function convertPEMtoNotes(objPEM) {
    var PEMnotes;

    if (objPEM.pe1.length < 1) {
        PEMnotes = objPEM.pe0;
    } else if (objPEM.pe2.length < 1) {
        PEMnotes = objPEM.pe0 + ', ' + objPEM.pe1;
    } else if (objPEM.pe3.length < 1) {
        PEMnotes = objPEM.pe0 + ', ' + objPEM.pe1 + ', ' + objPEM.pe2;
    } else if (objPEM.pe4.length < 1) {
        PEMnotes = objPEM.pe0 + ', ' + objPEM.pe1 + ', ' + objPEM.pe2 + ',' + objPEM.pe3;
    } else if (objPEM.pe5.length < 1) {
        PEMnotes = objPEM.pe0 + ', ' + objPEM.pe1 + ', ' + objPEM.pe2 + ',' + objPEM.pe3 + ', ' + objPEM.pe4;
    } else if (objPEM.pe6.length < 1) {
        PEMnotes = objPEM.pe0 + ', ' + objPEM.pe1 + ', ' + objPEM.pe2 + ',' + objPEM.pe3 + ', ' + objPEM.pe4 + ', ' + objPEM.pe5;
    } else if (objPEM.pe7.length < 1) {
        PEMnotes = objPEM.pe0 + ', ' + objPEM.pe1 + ', ' + objPEM.pe2 + ',' + objPEM.pe3 + ', ' + objPEM.pe4 + ', ' + objPEM.pe5 + ', ' + objPEM.pe6;
    } else if (objPEM.pe8.length < 1) {
        PEMnotes = objPEM.pe0 + ', ' + objPEM.pe1 + ', ' + objPEM.pe2 + ',' + objPEM.pe3 + ', ' + objPEM.pe4 + ', ' + objPEM.pe5 + ', ' + objPEM.pe6 + ', ' + objPEM.pe7;
    }
    return PEMnotes;
}


function displayBP(_sitBPS, _sitBPD, _sitBPP, _standBPS, _standBPD, _standBPP, _lyingBPS, _lyingBPD, _lyingBPP) {

    //var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Blood Pressure :<p class="summary" id="sum' + i + '">Sitting: Systolic =' + _sitBPS + 'mmHg | Diatolic=' + _sitBPD + 'mmHg | Pulse =' + _sitBPP + 'mmHg  </br> Standing: Systolic =' + _standBPS + 'mmHg | Diatolic =' + _standBPD + 'mmHg | Pulse =' + _standBPP + 'mmHg </br>  Lying: Systolic =' + _lyingBPS + 'mmHg | Diatolic =' + _lyingBPD + ' mmHg | Pulse =' + _lyingBPP + 'mmHg</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Blood Pressure :<p class="summary" id="sum' + i + '">Sitting: Systolic =' + _sitBPS + 'mmHg | Diatolic=' + _sitBPD + 'mmHg | Pulse =' + _sitBPP + 'mmHg  </br> Standing: Systolic =' + _standBPS + 'mmHg | Diatolic =' + _standBPD + 'mmHg | Pulse =' + _standBPP + 'mmHg </br>  Lying: Systolic =' + _lyingBPS + 'mmHg | Diatolic =' + _lyingBPD + ' mmHg | Pulse =' + _lyingBPP + 'mmHg</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBP" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

    $('#BPNotes').append(_tr);

    i = i + 1;
}
function displayrrRate(_rrRate) {

    //var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Respiratory Rate :<p class="summary" id="sum' + i + '">' + _rrRate + ' breath/min</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Respiratory Rate :<p class="summary" id="sum' + i + '">' + _rrRate + ' breath/min</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateRR" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

    $('#RRNotes').append(_tr);

    i = i + 1;
}

function displayOsat(_OSat) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Oxygen Saturation :<p class="summary" id="sum' + i + '">' + _OSat + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateOS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    //var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Oxygen Saturation :<p class="summary" id="sum' + i + '">' + _OSat + '</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

    $('#OSATNotes').append(_tr);
    $('#OSat').val("");

    i = i + 1;
}

function displayBTemp(_BTemp) {

    //var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Body Temperature: <p class="summary" id="sum' + i + '">' + _BTemp + '</p></div></div></td><td></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Body Temperature: <p class="summary" id="sum' + i + '">' + _BTemp + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBT" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

    $('#BTEMPNotes').append(_tr);

    i = i + 1;
}

function displayCholesterol(CholeLDL, CholeTotal, CholeHDL, CholeTri, CholeNon, CholeRatio, CholeLDLUnit, CholeTotalUnit, CholeHDLUnit, CholeTriUnit, CholeNonUnit, CholeRatioUnit) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Cholesterol :<p class="summary" id="sum' + i + '">Total Cholesterol:' + CholeTotal + ' ' + CholeTotalUnit + ' </br> LDL Cholesterol:' + CholeLDL + ' ' + CholeLDLUnit + ' </br> HDL Cholesterol:' + CholeHDL + ' ' + CholeHDLUnit + ' </br> Triglycerides:' + CholeTri + ' ' + CholeTriUnit + ' </br> Non-HDL-C:' + CholeNon + ' ' + CholeNonUnit + '</br> TG to HDL ratio:' + CholeRatio + ' ' + CholeRatioUnit + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateCholesterol" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    //$('#CHOLENotes').append(_tr);

    //i = i + 1;
}

function displayOther(Oheight, Oweight, Obmi, OWeightStatus, OheadCir, OBloodGlucose) {
    //var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Other :<p class="summary" id="sum' + i + '">Height:' + Oheight + ' cm </br> Weight:' + Oweight + ' kg </br> BMI:' + Obmi + ' kg/m2 </br> Weight Status:' + OWeightStatus + ' </br> Head Circumference:' + OheadCir + ' cm</p></div></div></td><td></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Other :<p class="summary" id="sum' + i + '">Height:' + Oheight + ' cm </br> Weight:' + Oweight + ' kg </br> BMI:' + Obmi + ' kg/m2 </br> Weight Status:' + OWeightStatus + ' </br> Head Circumference:' + OheadCir + ' cm</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateOther" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#OTRNotes').append(_tr);

    i = i + 1;
}
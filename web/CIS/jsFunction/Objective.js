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
/// -------------------------------------------------------------GCS MODUL----------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;


    //
    $('#gcsAccept').click(function (e) {
        //alert("gcsAccept");
        var gcsResult = $('#resultMain').val();
        var gcsPoint = $('#pointMain').val();

        var items = $('#resultMain,#pointMain');
        var obj1 = {Acode: "VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);

        displayGCS(gcsResult, gcsPoint);

        $('#resultMain').val('');
        $('#pointMain').val('');
        $('#rowEOR').replaceWith("<tr id='rowEOR'><td>-</td><td>0</td></tr>");
        $('#rowMR').replaceWith("<tr id='rowMR'><td>-</td><td>0</td></tr>");
        $('#rowVR').replaceWith("<tr id='rowVR'><td>-</td><td>0</td></tr>");

        $("#CIS020001").modal('hide');
    });
    $('#tblCIS_Consultation_Table').on('click', '.updateGcs', function () {
        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $("#CIS020001").modal('show');
        $('#actionGSC').hide();
        $('#updateGSC').show();
        //$('#actionGSC #updateBtn').show();
        $('#resultMain').val(updateObj.resultMain);
        $('#pointMain').val(updateObj.pointMain);
        $('#Jsonid').val(id[1]);
    });
    $('#gcsUpdate').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#Jsonid').val()];
        var rowId = $('#Jsonid').val();
        upObject.resultMain = $('#resultMain').val();
        upObject.pointMain = $('#pointMain').val();


        var sum = 'GCS Result:' + upObject.resultMain + '| GCS Point:' + upObject.pointMain;
        $('#sum' + rowId).html(sum);
        $("#CIS020001").modal('toggle');
    });


/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------PGCS MODUL---------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#pgcsAccept').click(function (e) {
        //alert("gcsAccept");
        var pgcsResult = $('#resultpgcsMain').val();
        var pgcsPoint = $('#pointpgcsMain').val();

        var items = $('#resultpgcsMain,#pointpgcsMain');
        var obj1 = {Acode: "VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);

        displayPGCS(pgcsResult, pgcsPoint);
        $('#resultpgcsMain').val('');
        $('#pointpgcsMain').val('');
        $('#rowpEO').replaceWith("<tr id='rowpEO'><td>-</td><td>0</td></tr>");
        $('#rowpMR').replaceWith("<tr id='rowpMR'><td>-</td><td>0</td></tr>");
        $('#rowpVR').replaceWith("<tr id='rowpVR'><td>-</td><td>0</td></tr>");
        $("#CIS020002").modal('hide');

    });

    $('#ortho_actionPGSC').click(function (e) {
        //alert("gcsAccept");
        var pgcsResult = $('#resultpgcsMain').val();
        var pgcsPoint = $('#pointpgcsMain').val();
        var checked = $('input[name="selected"]:checked').val();

        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_pgcs.jsp",
            type: "post",
            data: {
                pgcsResult: pgcsResult,
                pgcsPoint: pgcsPoint,
                encounter_date: checked
            },
            timeout: 10000,
            success: function (data) {

                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    timeout: 3000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);

                        $('#getNeuObservation').trigger('contentchanged');
                        $('#CIS020002').modal('hide');
                        $("#CIS020002").hide();
                        $(".modal-backdrop").hide();
                        bootbox.alert("Pediatric Glasgow Coma Scale is saved.");
                    }
                });
            },
            error: function (err) {
                bootbox.alert("Error update!");
            }
        });
    });

    $('#tblCIS_Consultation_Table').on('click', '.updatePgcs', function () {
        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $("#CIS020002").modal('show');
        $('#actionPGSC').hide();
        $('#updatePGSC').show();
        //$('#actionGSC #updateBtn').show();
        $('#resultpgcsMain').val(updateObj.resultpgcsMain);
        $('#pointpgcsMain').val(updateObj.pointpgcsMain);
        $('#pgcsid').val(id[1]);
    });

    $('#pgcsUpdate').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#pgcsid').val()];
        var rowId = $('#pgcsid').val();
        upObject.resultpgcsMain = $('#resultpgcsMain').val();
        upObject.pointpgcsMain = $('#pointpgcsMain').val();


        var sum = 'PGCS Result:' + upObject.resultpgcsMain + '| PGCS Point:' + upObject.pointpgcsMain;
        $('#sum' + rowId).html(sum);
        $("#CIS020002").modal('hide');
    });

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

        var items = $('#sitS,#sitD,#sitP,#standS,#standD,#standP,#lyingS,#lyingD,#lyingP');
        var obj1 = {Acode: "VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);

        displayBP(_sitBPS, _sitBPD, _sitBPP, _standBPS, _standBPD, _standBPP, _lyingBPS, _lyingBPD, _lyingBPP);

        $("#CIS020003").modal('hide');

        $('#sitS').val("");
        $('#sitD').val("");
        $('#sitP').val("");
        $('#standS').val("");
        $('#standD').val("");
        $('#standP').val("");
        $('#lyingS').val("");
        $('#lyingD').val("");
        $('#lyingP').val("");

    });

    $('#ortho_acceptBloodPBtn').click(function (e) {

        var _sitBPS = $('#sitS').val();
        var _sitBPD = $('#sitD').val();
        var _sitBPP = $('#sitP').val();
        var checked = $('input[name="selected"]:checked').val();
        //alert(checked);
        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_bloodPressure.jsp",
            type: "post",
            data: {
                sitS: _sitBPS,
                sitD: _sitBPD,
                sitP: _sitBPP,
                encounter_date: checked
            },
            timeout: 10000,
            success: function (data) {

                $.ajax({
                    url: "../Ortho-Consultation/table/t_observation.jsp",
                    type: "post",
                    timeout: 3000,
                    success: function (returnObservation) {
                        $('#getNeuObservation').html(returnObservation);

                        $('#getNeuObservation').trigger('contentchanged');
                        $('#sitS').val("");
                        $('#sitD').val("");
                        $('#sitP').val("");
                        $('#CIS020003').modal('hide');
                        $("#CIS020003").hide();
                        $(".modal-backdrop").hide();
                        bootbox.alert("Bllod pressure is saved.");
                    }
                });
            },
            error: function (err) {
                bootbox.alert("Error update!");
            }
        });

    });

    $('#tblCIS_Consultation_Table').on('click', '.updateBP', function (e) {
        $("#CIS020003").modal('show');
        $('#actionBloodP').hide();
        $('#updateBloodP').show();
        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#BPid').val(id[1]);
        $('#sitS').val(updateObj.sitS);
        $('#sitD').val(updateObj.sitD);
        $('#sitP').val(updateObj.sitP);

        $('#standS').val(updateObj.standS);
        $('#standD').val(updateObj.standD);
        $('#standP').val(updateObj.standP);

        $('#lyingS').val(updateObj.lyingS);
        $('#lyingD').val(updateObj.lyingD);
        $('#lyingP').val(updateObj.lyingP);

    });

    $('#updateBloodPBtn').click(function (e) {
        var upObject = _data[$('#BPid').val()];
        var rowId = $('#BPid').val();

        upObject.sitS = $('#sitS').val();
        upObject.sitD = $('#sitD').val();
        upObject.sitP = $('#sitP').val();

        upObject.standS = $('#standS').val();
        upObject.standD = $('#standD').val();
        upObject.standP = $('#standP').val();

        upObject.lyingS = $('#lyingS').val();
        upObject.lyingD = $('#lyingD').val();
        upObject.lyingP = $('#lyingP').val();


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

        var items = $('#rrRate');
        var obj1 = {Acode: "VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayrrRate(_rrRate);

        $("#CIS020004").modal('hide');
        $('#rrRate').val('');
    });

    $('#tblCIS_Consultation_Table').on('click', '.updateRR', function (e) {

        $("#CIS020004").modal('show');
        $('#updateRR').show();
        $('#actionRR').hide();


        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        $('#RRid').val(id[1]);

        $('#rrRate').val(updateObj.rrRate);

    });

    $('#updateRRBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#RRid').val()];
        var rowId = $('#RRid').val();

        upObject.rrRate = $('#rrRate').val();

        var sum = 'Respiratory Rate:' + upObject.rrRate + ' breath/min';
        $('#sum' + rowId).html(sum);
        $("#CIS020004").modal('hide');
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------OXYGEN SATURATION MODEL----------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#acceptOSBtn').click(function (e) {
        var _OSat = $('#OSat').val();

        var items = $('#OSat');
        var obj1 = {Acode: "VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayOsat(_OSat);

        $("#CIS020005").modal('hide');
    });

    $('#tblCIS_Consultation_Table').on('click', '.updateOS', function () {
        $('#CIS020005').modal('show');
        $('#actionOS').hide();
        $('#updateOS').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        $('#idOS').val(id[1]);


    });

    $('#updateOSBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#idOS').val()];
        var rowId = $('#idOS').val();

        upObject.OSat = $('#OSat').val();

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
        $("#CIS020006").modal('hide');
    });

    $('#tblCIS_Consultation_Table').on('click', '.updateBT', function () {
        $('#CIS020006').modal('show');
        $('#actionBT').hide();
        $('#updateBT').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        $('#BTid').val(id[1]);
        $("#BTemp").val(updateObj.BTemp + " " + ascii(176) + "C");
        $("#slider").slider("value", parseInt(updateObj.BTemp));

    });

    $('#updateBTBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#BTid').val()];
        var rowId = $('#BTid').val();

        var value = $('#BTemp').val().split(" ");
        upObject.BTemp = value[0];

        var sum = upObject.BTemp + ascii(176) + "C";
        $('#sum' + rowId).html(sum);
        $("#CIS020006").modal('hide');
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------Blood Glucose modal-----------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;    
    $('#acceptBGluBtn').click(function (e) {
        
        var _BGlu = $('#CIS020016_glucose').val();

        var items = $('#CIS020016_glucose');
        var obj1 = {Acode: "VTS"};
        items.each(function () {
            var value = $(this).val().split(" ");
            obj1[this.id] = value[0];
        });
        _data.push(obj1);
        displayBGlucose(_BGlu);
        $('#CIS020016_glucose').val('');
        
        $("#CIS020016").modal('hide');
    });

    $('#tblCIS_Consultation_Table').on('click', '.updateBGlu', function () {
        $('#CIS020016').modal('show');
        $('#actionBGlu').hide();
        $('#updateBGlu').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];
        console.log("Update Glucose: "+updateObj);
        $('#CIS020016_glucoseID').val(id[1]);
        $("#CIS020016_glucose").val(updateObj.CIS020016_glucose);
        
    });

    $('#updateBGluBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#CIS020016_glucoseID').val()];
        var rowId = $('#CIS020016_glucoseID').val();

        var value = $('#CIS020016_glucose').val().split(" ");
        upObject.CIS020016_glucose = value[0];

        var sum = upObject.CIS020016_glucose + " mmol/L";
        $('#sum' + rowId).html(sum);
        $("#CIS020016").modal('hide');
    });
/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------Pan Scale modal-----------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;


    $('#acceptPSBtn').click(function (e) {
        var title = "Pan Scale";
        var painScale = $('#painScale').val();
        var resultpainScale = $('#resultPanScale').val();

        var items = $('#painScale,#resultPanScale');
        var obj1 = {Acode: "VTS"};
        items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _data.push(obj1);
        displayPanScale(painScale, resultpainScale);
        $('#painScale').val("0");
        $('#resultPanScale').val('');
        $("#CIS020007").modal('hide');
    });

    $('#tblCIS_Consultation_Table').on('click', '.updatePS', function () {
        $('#CIS020007').modal('show');
        $('#actionPS').hide();
        $('#updatePS').show();
        $('#actionPS #btnNIWps').hide();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];


        $('#resultPanScale').val(updateObj.resultPanScale);
        $('#painScale').val(updateObj.painScale);
        $('#PSid').val(id[1]);
    });

    $('#updatePSBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#PSid').val()];
        var rowId = $('#PSid').val();
        upObject.resultPanScale = $('#resultPanScale').val();
        upObject.painScale = $('#painScale').val();

        var sum = 'Scale:' + upObject.painScale + '</br> Result:' + upObject.resultPanScale;
        $('#sum' + rowId).html(sum);
        $("#CIS020007").modal('hide');
    });

    $('#btnNIWps').on('click', function () {
        var painScale = $('#painScale').val();
        $('#NIWOBps').val(painScale);
        $('#NIW4hlyps').val(painScale);
        $("#CIS020007").modal('toggle');

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

//        var obj1 = {Acode: "VTS"};
//        items.each(function () {
//            obj1[this.id] = $(this).val();
//        });
        _data.push(obj);

        displayOther(Oheight, Oweight, Obmi, OWeightStatus, OheadCir, OBloodGlucose);
        console.log(_data);
        $("#CIS020008").modal('hide');
    });


    $('#tblCIS_Consultation_Table').on('click', '.updateOther', function () {

        $('#CIS020008').modal('show');
        $('#actionOther').hide();
        $('#updateOther').show();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#otherId').val(id[1]);

        $('#bmiHeight').val(updateObj.bmiHeight);
        $('#bmiWeight').val(updateObj.bmiWeight);
        $('#bmi').val(updateObj.bmi);
        $('#bmiStatus').val(updateObj.bmiStatus);
        $('#headCir').val(updateObj.headCir);
        $('#bloodGlucose').val(updateObj.bloodGlucose);

    });

    $('#updateOtherBtn').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#otherId').val()];
        var rowId = $('#otherId').val();
        upObject.bmiHeight = $('#bmiHeight').val();
        upObject.bmiWeight = $('#bmiWeight').val();
        upObject.bmi = $('#bmi').val();
        upObject.bmiStatus = $('#bmiStatus').val();
        upObject.headCir = $('#headCir').val();
        upObject.bloodGlucose = $('#bloodGlucose').val();

        var sum = 'Height:' + upObject.bmiHeight + 'cm </br> Weight:' + upObject.bmiWeight + 'kg </br> BMI:' + upObject.bmi + 'kg/m2 </br> Weight Status:' + upObject.bmiStatus + ' </br> Head Circumference:' + upObject.headCir + 'cm </br> Blood Glucose:' + upObject.bloodGlucose + 'mmol/L';
        $('#sum' + rowId).html(sum);
        $("#CIS020008").modal('hide');
    });

    /// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------PUPIL CHECK MODAL-----------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $(".vts-pupil-update").hide();


    $('#CIS0200013').on('hide.bs.modal', function (e) {
        $(".vts-pupil-update").hide();
        $(".vts-pupil-add").show();
        $("#cis-vts-left_pupil").val('1');
        $("#cis-vts-right_pupil").val('1');
        $("#cis-vts-left-reactivity").val('');
        $("#cis-vts-right-reactivity").val('');

    });


    $('#btn_CIS_VTS_Pupil_ADD').click(function (e) {

        var left_pupil = $("#cis-vts-left_pupil").val();
        var right_pupil = $("#cis-vts-right_pupil").val();
        var left_reactivity = $("#cis-vts-left-reactivity").val();
        var right_reactivity = $("#cis-vts-right-reactivity").val();

        var obj1 = {
            Acode: "VTS",
            left_pupil: left_pupil,
            right_pupil: right_pupil,
            left_reactivity: left_reactivity,
            right_reactivity: right_reactivity
        }
        _data.push(obj1);
        displayPupil(obj1);
        console.log(obj1);
        $("#CIS0200013").modal('hide');
    });

    $('#tblCIS_Consultation_Table').on('click', '.updatePupil', function () {

        $('#CIS0200013').modal('show');
        $(".vts-pupil-update").show();
        $(".vts-pupil-add").hide();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#pupil-ID').val(id[1]);
        $("#cis-vts-left_pupil").val(updateObj.left_pupil);
        $("#cis-vts-right_pupil").val(updateObj.right_pupil);
        $("#cis-vts-left-reactivity").val(updateObj.left_reactivity);
        $("#cis-vts-right-reactivity").val(updateObj.right_reactivity);
    });

    $('#btn_CIS_VTS_Pupil_UPDATE').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#pupil-ID').val()];
        var rowId = $('#pupil-ID').val();

        upObject.left_pupil = $("#cis-vts-left_pupil").val();
        upObject.right_pupil = $("#cis-vts-right_pupil").val();
        upObject.left_reactivity = $("#cis-vts-left-reactivity").val();
        upObject.right_reactivity = $("#cis-vts-right-reactivity").val();

        var sum = 'Left Pupil : ' + upObject.left_pupil + ' | Reactivity to Light : ' + upObject.left_reactivity + ' </br>Right Pupil : ' + upObject.right_pupil + ' | Reactivity to Light : ' + upObject.right_reactivity
        $('#sum' + rowId).html(sum);
        $("#CIS0200013").modal('hide');
    });

/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------VISION MODAL----------------------------------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;
    $(".vts-vision-update").hide();

    $('#CIS0200014').on('hide.bs.modal', function (e) {
        $(".vts-vision-update").hide();
        $(".vts-vision-add").show();
        $('#cis-vts-rvs').val('');
        $('#cis-vts-lvs').val('');
        $('#cis-vts-vision-comment').val('');


    })

    $('#btn_CIS_VTS_Vision_ADD').click(function (e) {
        e.preventDefault();
        var left_eye_score = $('#cis-vts-lvs').val();
        var right_eye_score = $('#cis-vts-rvs').val();
        var vision_comment = $('#cis-vts-vision-comment').val();
        var obj1 = {
            Acode: "VTS",
            left_eye_score: left_eye_score,
            right_eye_score: right_eye_score,
            vision_comment: vision_comment
        }
        _data.push(obj1);
        displayVision(obj1);

        $("#CIS0200014").modal('hide');

    });


    $('#tblCIS_Consultation_Table').on('click', '.updateVision', function () {

        $('#CIS0200014').modal('show');
        $(".vts-vision-update").show();
        $(".vts-vision-add").hide();

        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];

        $('#vision-ID').val(id[1]);
        $('#cis-vts-lvs').val(updateObj.left_eye_score);
        $('#cis-vts-rvs').val(updateObj.right_eye_score);
        $('#cis-vts-vision-comment').val(updateObj.vision_comment);

    });

    $('#btn_CIS_VTS_Vision_Update').click(function (e) {
        e.preventDefault();
        var upObject = _data[$('#vision-ID').val()];
        var rowId = $('#vision-ID').val();

        upObject.left_eye_score = $("#cis-vts-lvs").val();
        upObject.right_eye_score = $("#cis-vts-rvs").val();
        upObject.vision_comment = $("#cis-vts-vision-comment").val();


        var sum = 'Left Eye : ' + upObject.left_eye_score + ' |  Right Eye : ' + upObject.right_eye_score + '<br/> Comment : ' + upObject.vision_comment
        $('#sum' + rowId).html(sum);
        $("#CIS0200014").modal('hide');
    });


/// -----------------------------------------------------------------------------------------------------------------------------------------------/////;
/// -------------------------------------------------------------PHYSICAL EXAM MODAL-----------------------------------------------/////;
/// ----------------------------------------------------------------------------------------------------------------------------------------------/////;

    $('#accpetPEBtn').click(function (e) {
        var title = "Physical Examination";
        e.preventDefault();
        var pe0 = $('#pe0 option:selected').text();
        var pe1 = $('#pe1').val();
        var pe2 = $('#pe2').val();
        var pe3 = $('#pe3').val();
        var pe4 = $('#pe4').val();
        var pe5 = $('#pe5').val();
        var pe6 = $('#pe6').val();
        var pe7 = $('#pe7').val();
        var pe8 = $('#pe8').val();
        var PEComment = $('#PEComment').val();

        //var NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6 + ', ' + pe7 + ', ' + pe8;
        if (validationField(pe0, "Please enter the correct Physical Examination")) {
            if (pe1.length < 1) {
                NotesPE = pe0;
            } else if (pe2.length < 1) {
                NotesPE = pe0 + ', ' + pe1;
            } else if (pe3.length < 1) {
                NotesPE = pe0 + ', ' + pe1 + ', ' + pe2;
            } else if (pe4.length < 1) {
                NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3;
            } else if (pe5.length < 1) {
                NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4;
            } else if (pe6.length < 1) {
                NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5;
            } else if (pe7.length < 1) {
                NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6;
            } else if (pe8.length < 1) {
                NotesPE = pe0 + ', ' + pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6 + ', ' + pe7;
            }

            var itemIDpe = [];
            itemIDpe.push(pitemIDpe0);
            itemIDpe.push(pitemIDpe1);
            itemIDpe.push(pitemIDpe2);
            itemIDpe.push(pitemIDpe3);
            itemIDpe.push(pitemIDpe4);
            itemIDpe.push(pitemIDpe5);
            itemIDpe.push(pitemIDpe6);
            itemIDpe.push(pitemIDpe7);
            itemIDpe.push(pitemIDpe8);


            var items = $('#pe1,#pe2,#pe3,#pe4,#pe5,#pe6,#pe7,#pe8,#PEComment');

            var obj1 = {Acode: "PEM", pe0: pe0, id: itemIDpe};
            items.each(function () {
                obj1[this.id] = $(this).val();
            });
            _data.push(obj1);

            displayPEM(NotesPE, PEComment);
            $("#CIS020009").modal('hide');
        }

    });

    $("#ortho_accpetPEBtn").click(function () {

        var pe0 = $('#pe0 option:selected').text();
        var pe1 = $('#pe1').val();
        var pe2 = $('#pe2').val();
        var pe3 = $('#pe3').val();
        var pe4 = $('#pe4').val();
        var pe5 = $('#pe5').val();
        var pe6 = $('#pe6').val();
        var pe7 = $('#pe7').val();
        var pe8 = $('#pe8').val();
        var PEComment = $('#PEComment').val();


        if (pe1.length < 1) {
            NotesPE = '';
        } else if (pe2.length < 1) {
            NotesPE = pe1;
        } else if (pe3.length < 1) {
            NotesPE = pe1 + ', ' + pe2;
        } else if (pe4.length < 1) {
            NotesPE = pe1 + ', ' + pe2 + ',' + pe3;
        } else if (pe5.length < 1) {
            NotesPE = pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4;
        } else if (pe6.length < 1) {
            NotesPE = pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5;
        } else if (pe7.length < 1) {
            NotesPE = pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6;
        } else if (pe8.length < 1) {
            NotesPE = pe1 + ', ' + pe2 + ',' + pe3 + ', ' + pe4 + ', ' + pe5 + ', ' + pe6 + ', ' + pe7;
        }

        $.ajax({
            url: "../Ortho-Consultation/modal/action/save_physical_exam.jsp",
            type: "post",
            data: {
                pe0: pe0,
                NotesPE: NotesPE,
                PEComment: PEComment
            },
            timeout: 10000,
            success: function (data) {

                $.ajax({
                    url: "../Ortho-Consultation/table/t_physicalExam.jsp",
                    type: "post",
                    timeout: 3000,
                    success: function (returnPhysicalExam) {
                        $('#get_physicalExam').html(returnPhysicalExam);

                        $('#get_physicalExam').trigger('contentchanged');
                        $('#CIS020009').modal('hide');
                        $("#ortho_physical_exam").hide();
                        //$("#CIS020009").hide();
                        //$(".modal-backdrop").hide();
                        bootbox.alert("Physical Examination is saved.");
                    }
                });
            },
            error: function (err) {
                bootbox.alert("Error update!");
            }
        });

    });

    $('#tblCIS_Consultation_Table').on('click', '.updatePE', function () {
        $("#CIS020009").modal('show');
        $('#actionPE').hide();
        $('#updatePE').show();


        var idName = $(this).get(0).id;
        var id = idName.split('|');
        var updateObj = _data[id[1]];


        updateObjCd = updateObj.id;

        if (updateObj.pe2 === "") {
            $('#pe2').hide();
            $('#pe3').hide();
            $('#pe4').hide();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe3 === "") {
            $('#pe2').show();
            $('#pe3').hide();
            $('#pe4').hide();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe4 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').hide();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe5 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').hide();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe6 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').show();
            $('#pe6').hide();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe7 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').show();
            $('#pe6').show();
            $('#pe7').hide();
            $('#pe8').hide();
        } else if (updateObj.pe8 === "") {
            $('#pe2').show();
            $('#pe3').show();
            $('#pe4').show();
            $('#pe5').show();
            $('#pe6').show();
            $('#pe7').show();
            $('#pe8').hide();
        }

        $('#idPE').val(id[1]);
        $('#PEComment').val(updateObj.PEComment);

        $('#pe0').val(updateObjCd[0]);
        $('#pe1').val(updateObj.pe1);
        $('#pe2').val(updateObj.pe2);
        $('#pe3').val(updateObj.pe3);
        $('#pe4').val(updateObj.pe4);
        $('#pe5').val(updateObj.pe5);
        $('#pe6').val(updateObj.pe6);
        $('#pe7').val(updateObj.pe7);
        $('#pe8').val(updateObj.pe8);


    });

    $('#modalPE').click(function () {

        $('#actionPE').show();
        $('#updatePE').hide();
        $('#pe1').val('');
        $('#pe0').val('');
        $('#PEComment').val('');
        $('#pe2').hide();
        $('#pe3').hide();
        $('#pe4').hide();
        $('#pe5').hide();
        $('#pe6').hide();
        $('#pe7').hide();
        $('#pe8').hide();

    });

    $('#updatePEBtn').click(function (e) {
        e.preventDefault();

        var upObject = _data[$('#idPE').val()];
        var rowId = $('#idPE').val();

        upObject.pe0 = $('#pe0').val();
        upObject.pe1 = $('#pe1').val();
        upObject.pe2 = $('#pe2').val();
        upObject.pe3 = $('#pe3').val();
        upObject.pe4 = $('#pe4').val();
        upObject.pe5 = $('#pe5').val();
        upObject.pe6 = $('#pe6').val();
        upObject.pe7 = $('#pe7').val();
        upObject.pe8 = $('#pe8').val();
        upObject.PEComment = $('#PEComment').val();

        var itemIDpe = [];

        if (validationField(upObject.pe0, "Please enter the correct Physical Examination")) {
            var NotesPE;
            if (upObject.pe1.length < 1) {
                NotesPE = upObject.pe0;
            } else if (upObject.pe2.length < 1) {
                NotesPE = upObject.pe0 + ', ' + upObject.pe1;

                pitemIDpe2 = "";
                pitemIDpe3 = "";
                pitemIDpe4 = "";
                pitemIDpe5 = "";
                pitemIDpe6 = "";
                pitemIDpe7 = "";
                pitemIDpe8 = "";
            } else if (upObject.pe3.length < 1) {
                NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2;

                pitemIDpe3 = "";
                pitemIDpe4 = "";
                pitemIDpe5 = "";
                pitemIDpe6 = "";
                pitemIDpe7 = "";
                pitemIDpe8 = "";
            } else if (upObject.pe4.length < 1) {
                NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3;

                pitemIDpe4 = "";
                pitemIDpe5 = "";
                pitemIDpe6 = "";
                pitemIDpe7 = "";
                pitemIDpe8 = "";
            } else if (upObject.pe5.length < 1) {
                NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' + upObject.pe4;

                pitemIDpe5 = "";
                pitemIDpe6 = "";
                pitemIDpe7 = "";
                pitemIDpe8 = "";
            } else if (upObject.pe6.length < 1) {
                NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' + upObject.pe4 + ', ' + upObject.pe5;

                pitemIDpe6 = "";
                pitemIDpe7 = "";
                pitemIDpe8 = "";
            } else if (upObject.pe7.length < 1) {
                NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' + upObject.pe4 + ', ' + upObject.pe5 + ', ' + upObject.pe6;

                pitemIDpe7 = "";
                pitemIDpe8 = "";
            } else if (upObject.pe8.length < 1) {
                NotesPE = upObject.pe0 + ', ' + upObject.pe1 + ', ' + upObject.pe2 + ',' + upObject.pe3 + ', ' + upObject.pe4 + ', ' + upObject.pe5 + ', ' + upObject.pe6 + ', ' + upObject.pe7;

                pitemIDpe8 = "";
            }

            itemIDpe.push(pitemIDpe0);
            itemIDpe.push(pitemIDpe1);
            itemIDpe.push(pitemIDpe2);
            itemIDpe.push(pitemIDpe3);
            itemIDpe.push(pitemIDpe4);
            itemIDpe.push(pitemIDpe5);
            itemIDpe.push(pitemIDpe6);
            itemIDpe.push(pitemIDpe7);
            itemIDpe.push(pitemIDpe8);

            upObject.id = itemIDpe;

            var sum = NotesPE + ' </br> Comment:' + upObject.PEComment;
            $('#sum' + rowId).html(sum);
            $("#CIS020009").modal('hide');
        }


    });

    $('#RISResult').on('click', function () {

        $.get("CIS02/CIS020010_1.jsp", function (data) {

            $('#divCIS_O_RIS_RadiologyResult').html(data);

        });
    });

    $("#divCIS_O_RIS_RadiologyResult").on("click", "#risTable #btnCIS_O_ROS_VIEW_RESULT", function (e) {
        e.preventDefault();
        var rowOrder = $(this).closest("tr");
        var orderId = rowOrder.find("#orderId").html();
        var modality_cd = rowOrder.find("#tM_SEARCH_CODE").html();
        var body_system_cd = rowOrder.find("#tBS_SEARCH_CODE").html();
        var procedure_cd = rowOrder.find("#tP_SEARCH_CODE").html();
        $("#CIS040000_RESULT").modal('show');
        $.ajax({
            type: "POST",
            url: "order/RISImageResult.jsp",
            timeout: 3000,
            data: {
                orderNo: orderId,
                bsCode: body_system_cd,
                modCode: modality_cd,
                proCode: procedure_cd
            },
            success: function (e) {

                $("#CIS040000_RESULT_IMG").attr("src", e.trim());
                //$("CIS040000_RESULT_IMG").html(e);
            }

        });
    });

    $('#LISResult').on('click', function () {

        $.get("CIS02/CIS020011_1.jsp", function (data) {

            $('#divCIS_O_LIS_LaboratoryResult').html(data);

        });
    });

    $("#divCIS_O_LIS_LaboratoryResult").on("click", "#lisTable #btnCIS_O_LIO_VIEW_RESULT", function (e) {

        e.preventDefault();
        var rowOrder = $(this).closest("tr");
        var orderId = rowOrder.find("#id_result").html();

        $("#CIS040001_RESULT").modal('show');
        $.ajax({
            type: "POST",
            url: "order/LIOImageResult.jsp",
            timeout: 3000,
            data: {
                id_result: orderId

            },
            success: function (e) {

                $("#CIS040001_RESULT_IMG").attr("src", e.trim());
                //$("CIS040000_RESULT_IMG").html(e);
            }

        });


    });

    $('#OPResult').on('click', function () {

        $.get("CIS02/CIS020012_1.jsp", function (data) {

            $('#divCIS_O_POS_ProcedureResult').html(data);

        });
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


function displayGCS(gcsResult, gcsPoint) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Glasgow Coma Scale :<p class="summary" id="sum' + i + '">GCS Result:' + gcsResult + '</br> GCS Point:' + gcsPoint + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateGcs" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#GCSNotes').append(_tr);

    i = i + 1;
}

function displayPGCS(pgcsResult, pgcsPoint) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Pediatric Glasgow Coma Scale :<p class="summary" id="sum' + i + '">PGCS Result:' + pgcsResult + '</br> PGCS Point:' + pgcsPoint + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updatePgcs" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#PGCSNotes').append(_tr);

    i = i + 1;
}

function displayBP(_sitBPS, _sitBPD, _sitBPP, _standBPS, _standBPD, _standBPP, _lyingBPS, _lyingBPD, _lyingBPP) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Blood Pressure :<p class="summary" id="sum' + i + '">Sitting: Systolic =' + _sitBPS + 'mmHg | Diatolic=' + _sitBPD + 'mmHg | Pulse =' + _sitBPP + 'mmHg  </br> Standing: Systolic =' + _standBPS + 'mmHg | Diatolic =' + _standBPD + 'mmHg | Pulse =' + _standBPP + 'mmHg </br>  Lying: Systolic =' + _lyingBPS + 'mmHg | Diatolic =' + _lyingBPD + ' mmHg | Pulse =' + _lyingBPP + 'mmHg</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBP" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

    $('#BPNotes').append(_tr);

    i = i + 1;
}
function displayrrRate(_rrRate) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Respiratory Rate :<p class="summary" id="sum' + i + '">' + _rrRate + ' breath/min</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateRR" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

    $('#RRNotes').append(_tr);

    i = i + 1;
}

function displayOsat(_OSat) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Oxygen Saturation :<p class="summary" id="sum' + i + '">' + _OSat + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateOS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';

    $('#OSATNotes').append(_tr);

    i = i + 1;
}

function displayPanScale(painScale, resultpainScale) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Pan Scale<p class="summary" id="sum' + i + '">Scale:' + painScale + '</br> Result:' + resultpainScale + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updatePS" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#PSCNotes').append(_tr);

    i = i + 1;
}

function displayBTemp(_BTemp) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Body Temperature: <p class="summary" id="sum' + i + '">' + _BTemp + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBT" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#BTEMPNotes').append(_tr);

    i = i + 1;
}

function displayBGlucose(_BGlu) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Blood Glucose: <p class="summary" id="sum' + i + '">' + _BGlu + ' mmol/L</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateBGlu" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#BLOODGLUCOSENotes').append(_tr);

    i = i + 1;
}

function displayOther(Oheight, Oweight, Obmi, OWeightStatus, OheadCir, OBloodGlucose) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vital Sign - Other :<p class="summary" id="sum' + i + '">Height:' + Oheight + ' cm </br> Weight:' + Oweight + ' kg </br> BMI:' + Obmi + ' kg/m2 </br> Weight Status:' + OWeightStatus + ' </br> Head Circumference:' + OheadCir + ' cm</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateOther" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#OTRNotes').append(_tr);

    i = i + 1;
}

function displayPEM(NotesPE, PEComment) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Physical Examination:<p class="summary" id="sum' + i + '">' + NotesPE + ' </br>Comment:' + PEComment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updatePE" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#PEMNotes').append(_tr);

    i = i + 1;
}

function displayPupil(obj) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Pupil Check:<p class="summary" id="sum' + i + '"> Left Pupil : ' + obj.left_pupil + ' | Reactivity to Light : ' + obj.left_reactivity + ' </br>Right Pupil : ' + obj.right_pupil + ' | Reactivity to Light : ' + obj.right_reactivity + '</br></p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updatePupil" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#PupilNotes').append(_tr);
    i = i + 1;
}
function displayVision(obj) {

    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="CIS_consult_notes"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Vision Test:<p class="summary" id="sum' + i + '"> Left Eye : ' + obj.left_eye_score + ' | Right Eye : ' + obj.right_eye_score + ' </br> Comment : ' + obj.vision_comment + '</p></div></div></td><td><a data-toggle="modal"  data-target="#updateModal" href="" class="updateVision" id="row|' + i + '"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #337ab7;" ></i></a></a></td><td><a href="javascript:;" class="star"><a href="#" class="deleteBtn" id="row|' + i + '"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;font-size: 30px;color: #d9534f;"></i></a></a></td></tr>';
    $('#PupilNotes').append(_tr);
    i = i + 1;
}

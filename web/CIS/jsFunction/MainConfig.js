/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//All global variable here

//declare the consultation data
var _data = [];
var notes = "";
var hfc_cd = "04010101";
var testState = false;

var doctor_id = "SITI";
var doctor_name = "DR. SITI HALIJAH BINTI ABU BAKAR";
var discipline = "001";
var disciplineName = "001";
var subdis = "26";
var subdisName = "26";
var userSetting;
var cisParam = "";

var pmiNo = "";
var episodeDate = "";
var encounterDate = "";
var HFCOrderDetail = [];
var HFCProviderDetail = [];
var dcgIndex = [];

var reloadStat = 0;

var PDIFULL;
var HCS;
var patientCategory = "";
var statusNow = 0;

//declare the consultation row counter
var i = 0;

//declare the Main Consultation Notes
var ConsultationNotes = [];

var HCSContent = [];

//if (reloadStat === 1) {
//    window.onbeforeunload = function () {
//        updateStatus(pmiNo, episodeDate, statusNow);
//        return "You work will be lost";
//    };
//}



function  disableSOAP() {
    bootbox.alert("You need to select the patient");
    return false;
}

$(document).ready(function () {

//    $(window).on('beforeunload', function (e) {
//        if (reloadStat === "1") {
//            updateStatus(pmiNo, episodeDate, statusNow);
//            return "Sure U are?";
//        } else {
//          
//        }
//    });

$(window).bind('beforeunload', function(){
    updateStatus(pmiNo, episodeDate, statusNow);
});

    $('#holdBtn').bind('click', false);
    //loadSetting(doctor_id);

    $('.soap-select').on('click',disableSOAP);

//    $('.soap-select').on('click',function () {
//        bootbox.alert("You need to select the patient");
//        return false;
//    });
    



    $('#settingBtn').click(function () {
        $('#settingModal').modal('toggle');
    });

    $("#acceptSettingBtn").click(function () {
        var setCCN = false;
        var setDGS = false;
        var setDCG = false;
        var setting = $(".setting").val();

        if ($('#setCCN').is(":checked"))
        {
            setCCN = true;
            var param_code = "CCN";
            var param_name = "Chief Complaint";
            var enable = "1";
            var create_by = doctor_id;
            var created_date = getDate();
            setSetting(param_code, param_name, enable, create_by, created_date);

        } else {
            var param_code = "CCN";
            var param_name = "Chief Complaint";
            var enable = "0";
            var create_by = doctor_id;
            var created_date = getDate();
            setSetting(param_code, param_name, enable, create_by, created_date);
        }

        if ($('#setDGS').is(":checked"))
        {
            setDGS = true;
            var param_code = "DGS";
            var param_name = "Diagnosis";
            var enable = "1";
            var create_by = doctor_id;
            var created_date = getDate();
            setSetting(param_code, param_name, enable, create_by, created_date);

        } else {
            setDGS = true;
            var param_code = "DGS";
            var param_name = "Diagnosis";
            var enable = "0";
            var create_by = doctor_id;
            var created_date = getDate();
            setSetting(param_code, param_name, enable, create_by, created_date);
        }
        if ($('#setDCG').is(":checked"))
        {
            setDCG = true;
            var param_code = "DCG";
            var param_name = "Discharge Summary";
            var enable = "1";
            var create_by = doctor_id;
            var created_date = getDate();
            setSetting(param_code, param_name, enable, create_by, created_date);

        } else {
            setDCG = true;
            var param_code = "DCG";
            var param_name = "Discharge Summary";
            var enable = "0";
            var create_by = doctor_id;
            var created_date = getDate();
            setSetting(param_code, param_name, enable, create_by, created_date);
        }
        $('#settingModal').modal('toggle');

    });
   
});


function getDateNext() {
    var d = new Date();
    var month = d.getMonth() + 1;
    var day = d.getDate();
    if (month < 10) {
        month = "0" + month;
    };
    if (day < 10) {
        day = "0" + day;
    }
    var dates = d.getFullYear() + "-" + month + "-" + day;
    return dates;
}

function setSetting(param_code, param_name, enable, create_by, created_date) {
    $.ajax({
        url: 'setting/SaveSetting.jsp',
        method: "POST",
        timeout: 5000,
        data: {
            param_code: param_code,
            param_name: param_name,
            enable: enable,
            createdby: create_by,
            createddate: created_date,
            hfc_cd: hfc_cd,
            user_id: doctor_id
        },
        success: function (result) {
            var r = result.trim();
            if (r === "|1|") {
                alert("Setting has been saved");
            } else if (r === "|2|") {
                alert("Setting cannot be save");
            } else if (r === "|3|") {
                alert("Setting has been updated");
            } else if (r === "|4|") {
                alert("Setting not update");
            }
           
        }
    });
}

function loadSetting(user_id) {
    $.ajax({
        url: 'setting/LoadSetting.jsp',
        method: "POST",
        timeout: 5000,
        data: {
            userId: user_id
        },
        success: function (result) {
            if (result.trim() === "|O|") {
                alert("You not set up your consultation setting yet. You need set up before consult the patient");
                $("#settingModal").modal("toggle");

            } else {
                var setting = result.trim().split("^");
                for (var i = 0; i < setting.length; i++) {
                    var set = setting[i].split("|");
                    if (set[0] === "CCN") {
                        if (set[1] === "1") {
                            $('#setCCN').prop("checked", true);
                        }
                    } else if (set[0] === "DGS") {
                        if (set[1] === "1") {
                            $('#setDGS').prop("checked", true);
                        }
                    } else if (set[0] === "DCG") {
                        if (set[1] === "1") {
                            $('#setDCG').prop("checked", true);
                        }
                    }
                }
            }
        }
    });
}


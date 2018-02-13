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
    bootbox.alert("You need to select a patient from the <b>Queue!</b>");
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

function searchInitialize(id, action){
    if(action === "I"){
        if(id === "CCN"){
            
            searching("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "ccnCode", "search/ResultCCNSearchCode.jsp");
            searching("tCISSubCCNHFCSearchPersonalised", "tCISSubCCNHFCSearchLoading", "search/ResultCCNPersonaliseSearch.jsp", "ccnCode", "search/ResultCCNPersonaliseSearchCode.jsp");
            searching("tCISSubCCNHFCSearchPersonalised_update", "tCISSubCCNHFCSearchLoading_update", "search/ResultCCNPersonaliseSearch.jsp", "uccnCode", "search/ResultCCNPersonaliseSearchCode.jsp");
            
        } else if(id === "PMH"){
            
            searching("tCISSubPMHSearch", "tCISSubPMHSearchLoading", "search/ResultPMHSearch.jsp", "codePMH", "search/ResultPMHSearchCode.jsp");
            searching("tCISSubPMHSearchPersonalised", "tCISSubPMHSearchLoading", "search/ResultPMHPersonaliseSearch.jsp", "codePMH", "search/ResultPMHPersonaliseSearchCode.jsp");
            searching("tCISSubPMHSearchPersonalised_update", "tCISSubPMHSearchLoading_update", "search/ResultPMHPersonaliseSearch.jsp", "ucodePMH", "search/ResultPMHPersonaliseSearchCode.jsp");
            
        } else if(id === "FMH"){
            searching("tCISSubFMHSearch", "tCISSubFMHSearchLoading", "search/ResultPMHSearch.jsp", "fmhCode", "search/ResultPMHSearchCode.jsp");
            searching("tCISSubFMHSearchPersonalised", "tCISSubFMHSearchLoading", "search/ResultFMHPersonaliseSearch.jsp", "fmhCode", "search/ResultFMHPersonaliseSearchCode.jsp");
            searching("tCISSubFMHSearchPersonalised_update", "tCISSubFMHSearchLoading_update", "search/ResultFMHPersonaliseSearch.jsp", "ufmhCode", "search/ResultFMHPersonaliseSearchCode.jsp");
        }else if(id === "SOH"){
            searching("tCISSubSOHSearch", "tCISSubSOHSearchLoading", "search/ResultSOHSearch.jsp", "codeSOH", "search/ResultSOHSearchCode.jsp");
            searching("tCISSubSOHSearchPersonalised", "tCISSubSOHSearchLoading", "search/ResultSOHPersonaliseSearch.jsp", "codeSOH", "search/ResultSOHPersonaliseSearchCode.jsp");
            searching("tCISSubSOHSearchPersonalised_update", "tCISSubSOHSearchLoading_update", "search/ResultSOHPersonaliseSearch.jsp", "usohCode", "search/ResultSOHPersonaliseSearchCode.jsp");
            
        }else if(id === "ALG"){
            searching("tCISSubALGSearch", "tCISSubALGSearchLoading", "search/ResultALGSearch.jsp", "codeALG", "search/ResultALGSearchCode.jsp");
            searching("tCISSubALGSearchPersonalised", "tCISSubALGSearchLoading", "search/ResultALGPersonaliseSearch.jsp", "codeALG", "search/ResultALGPersonaliseSearchCode.jsp");
            searching("tCISSubALGSearchPersonalised_update", "tCISSubALGSearchLoading_update", "search/ResultALGPersonaliseSearch.jsp", "uALG_cd", "search/ResultALGPersonaliseSearchCode.jsp");
            
        }else if(id === "IMU"){
            searching("tCISSubIMUSearch", "tCISSubIMUSearchLoading", "search/ResultIMUSearch.jsp", "codeIMU", "search/ResultIMUSearchCode.jsp");
            searching("tCISSubIMUSearchPersonalised", "tCISSubIMUSearchLoading", "search/ResultIMUPersonaliseSearch.jsp", "codeIMU", "search/ResultIMUPersonaliseSearchCode.jsp");
            searching("tCISSubIMUSearchPersonalised_update", "tCISSubIMUSearchLoading_update", "search/ResultIMUPersonaliseSearch.jsp", "uIMU_cd", "search/ResultIMUPersonaliseSearchCode.jsp");
            
        }else if(id === "DAB"){
            searching("tCISSubDABSearch", "tCISSubDABSearchLoading", "search/ResultDABSearch.jsp", "codeDAB", "search/ResultDABSearchCode.jsp");
            searching("tCISSubDABSearchPersonalised", "tCISSubDABSearchLoading", "search/ResultDABPersonaliseSearch.jsp", "codeDAB", "search/ResultDABPersonaliseSearchCode.jsp");
            searching("tCISSubDABSearchPersonalised_update", "tCISSubDABSearchLoading_update", "search/ResultDABPersonaliseSearch.jsp", "uDAS_cd", "search/ResultDABPersonaliseSearchCode.jsp");
            
        }else if(id === "DGS"){
            searching("tCISSubDGSSearch", "tCISSubDGSSearchLoading", "search/ResultDGSSearch.jsp", "dgsCode", "search/ResultDGSSearchCode.jsp");
            searching("tCISSubDGSSearchPersonalised", "tCISSubDGSSearchLoading", "search/ResultDGSPersonaliseSearch.jsp", "dgsCode", "search/ResultDGSPersonaliseSearchCode.jsp");
            
        }else if(id === "RIS"){
            searching("tCISOEROSProblemName", "tCISOEROSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCode", "search/ResultCCNSearchCode.jsp");
            searchingHFCValue("tCISOEROSHFC", "tCISOEROSHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdROS", "locationROS", "hfcOrderDetail", "hfcProviderDetail", hfc_name);
            searchHFCDetailv2($("#tCISOEROSHFC").val(), "hfcIdROS", "hfcOrderDetail", "hfcProviderDetail", "locationROS");
            $("#tCISOEROSProcedureSearch").prop("disabled", false);
            searchingRISPRO("tCISOEROSProcedureSearch", "tCISOEROSProcedureSearchLoading", "search/ResultRISProcedureSearch.jsp", "search/ResultRISProcedureSearchCode.jsp", "codeROS_2", "modalityROSCode", "modalityROS", "bodySystemROSCode", "bodySystemROS", '')
       
        }else if(id === "LIO"){
            searchingHFC("tCISOELIOHFC", "tCISOELIOHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdLOS", "-", "hfcOrderDetailLIO", "hfcProviderDetailLIO");
            searching("tCISOELIOProblemName", "tCISOELIOProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodeLIO", "search/ResultCCNSearchCode.jsp");
            searchLIO("tCISOELIOSearch", "search/ResultLIOSearch.jsp", "tCISOELIOSearchLoading", "");
            searchingHFCValue("tCISOELIOHFC", "tCISOELIOHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdLOS", "-", "hfcOrderDetailLIO", "hfcProviderDetailLIO", hfc_name);
            searchHFCDetailv2($("#tCISOELIOHFC").val(), "hfcIdLOS", "hfcOrderDetailLIO", "hfcProviderDetailLIO", "-");
        }else if(id === "DTO"){
            searching("tCISOEDTOProblemName", "tCISOEDTOProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodeDTO", "search/ResultCCNSearchCode.jsp");
            searchDTO("tCISOEDTODrugName", "tCISOEDTODrugNameLoading", "");
            $.ajax({
                url: 'search/GetSelectDrugFrequency.jsp',
                type: 'POST',
                timeout: 3000,
                success: function (r) {
                  
                    $("#divSelectDrugFrequency").html(r.trim());
                }
            }); 
//            $.ajax({
//                url: 'search/GetSelectDrugForm.jsp',
//                type: 'POST',
//                timeout: 3000,
//                success: function (r) {
//                    console.log(r);
//                    $("#divSelectDrugForm").html(r.trim());
//                }
//            }); 
            
        }else if(id === "FLU"){
            searchDOCTORValue("tCISPlanFLUDOCSearch_Update", "tCISPlanFLUDOCSearchLoading_Update", hfc_cd, "");
            searchDOCTORValue("tCISPlanFLUDOCSearch", "tCISPlanFLUDOCSearchLoading", hfc_cd, "");
            
        } else if (id === "POS") {
            $("#btnCIS_OE_POS_UPDATE").hide();
            $("#btnCIS_OE_POS_CANCEL").hide();

            $("#div_CIS_OE_POS_LVL1").hide();
            $("#div_CIS_OE_POS_LVL2").hide();

            searching("tCISOEPOSProblemName", "tCISOEPOSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodePOS", "search/ResultCCNSearchCode.jsp");
            searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", "", "0");
            searchPOSCode("tCISOEPOSSearch", "tCISOEPOSSearchLoading", "tCISOEPOS_0_ID", "0");

        } else if(id === "OPT"){
            searchPOSSurgicalCategory("tCISOESPOCategoryName", "tCISOESPOCategoryNameLoading", "");
            searchDOCTOROnlySurgical("tCISOESPOConsultantName", "tCISOESPOConsultantNameLoading", hfc_cd, "");
            searchOTRoomSurgical("tCISOESPOOTRoomName", "tCISOESPOOTRoomNameLoading", "");
            
        }else if(id === "REF"){
            
        }else if(id === "ADW"){
            searchHFCOnly("tCIS_ADWHFCreferFrom", "tCIS_ADWHFCreferFromLoading");
            searchHFCOnly("tCIS_ADWsearchHFC", "tCIS_ADWsearchHFCLoading");
        }
        

       
    } else if(action === "D"){
        
            $("#tCISOEDTODrugName").flexdatalist('destroy');
            $("#tCISOEDTOProblemName").flexdatalist('destroy');
            
            
             if (id === "CCN") {
                 $("#tCISSubCCNHFCSearch").flexdatalist('destroy');
                 $("#tCISSubCCNHFCSearchPersonalised").flexdatalist('destroy');
                 $("#tCISSubCCNHFCSearchPersonalised_update").flexdatalist('destroy');
                 $("#Mild").val('None');
                 $("#Site").val('None');
                 $("#Laterality").val('None');
                 $("#sdur").val('');

        } else if (id === "PMH") {
            
            $("#tCISSubPMHSearch").flexdatalist('destroy');
            $("#tCISSubPMHSearchPersonalised").flexdatalist('destroy');
            $("#tCISSubPMHSearchPersonalised_update").flexdatalist('destroy');
            $("#Status").val('');
            $("#comment1").val('');

        } else if (id === "FMH") {
            
            $("#tCISSubFMHSearch").flexdatalist('destroy');
            $("#tCISSubFMHSearchPersonalised").flexdatalist('destroy');
            $("#tCISSubFMHSearchPersonalised_update").flexdatalist('destroy');
            $("#f_relationship").val('');
            $("#comment2").val('');
            
            
        } else if (id === "SOH") { 
            $("#tCISSubSOHSearch").flexdatalist('destroy');
            $("#tCISSubSOHSearchPersonalised").flexdatalist('destroy');
            $("#tCISSubSOHSearchPersonalised_update").flexdatalist('destroy');
            $("#comment3").val('');
            $("#date").val('');
            

        } else if (id === "ALG") {
            
            $("#tCISSubALGSearch").flexdatalist('destroy');
            $("#tCISSubALGSearchPersonalised").flexdatalist('destroy');
            $("#tCISSubALGSearchPersonalised_update").flexdatalist('destroy');
            
            $("#comment5").val();
            $("#date1").val();
            
            

        } else if (id === "IMU") {
            
            $("#tCISSubIMUSearch").flexdatalist('destroy');
            $("#tCISSubIMUSearchPersonalised").flexdatalist('destroy');
            $("#tCISSubIMUSearchPersonalised_update").flexdatalist('destroy');
            $("#comment6").val('');
            $("#date2").val('');
            
    

        } else if (id === "DAB") {
            
            $("#tCISSubDABSearch").flexdatalist('destroy');
            $("#tCISSubDABSearchPersonalised").flexdatalist('destroy');
            $("#tCISSubDABSearchPersonalised_update").flexdatalist('destroy');
            $("#date3").val('');
            $("#comment7").val('');


        } else if (id === "DGS") {
            $("#tCISOEROSProblemName").flexdatalist('destroy');
            $("#tCISOEROSProcedureSearch").flexdatalist('destroy');

        } else if (id === "RIS") {
            $("#tCISOEROSHFC").flexdatalist('destroy');
            $("#tCISOELIOProblemName").flexdatalist('destroy');
            $("#tCISOEROSProcedureSearch").flexdatalist('destroy');

        } else if (id === "LIO") {
             $("#tCISOELIOHFC").flexdatalist('destroy');
             $("#tCISOELIOProblemName").flexdatalist('destroy');
             $("#tCISOELIOSearch").flexdatalist('destroy');

        } else if (id === "DTO") {
            $("#tCISOEDTOProblemName").flexdatalist('destroy');
            $("#tCISOEDTODrugName").flexdatalist('destroy');

        } else if (id === "FLU") {
            
            $("#tCISPlanFLUDOCSearch").flexdatalist('destroy');
            $("#tCISPlanFLUDOCSearch_Update").flexdatalist('destroy');

        } else if (id === "POS") {

            $("#tCISOEPOSProblemName").flexdatalist('destroy');
            $("#tCISOEPOSSearch").flexdatalist('destroy');
            $("#tCISOEPOSSearch").flexdatalist('destroy');
            

        } else if (id === "OPT") {
    
            $("#tCISOEPOSSearch").flexdatalist('destroy');
            $("#tCISOEPOSProblemName").flexdatalist('destroy');
            $("#tCISOEPOSSearch").flexdatalist('destroy');
            

        } else if (id === "REF") {

        } else if (id === "ADW") {

            $("#tCIS_ADWsearchHFC").flexdatalist('destroy');
            $("#tCIS_ADWHFCreferFrom").flexdatalist('destroy');
            

        }
        
    }

}

function validationField(id,message){
    var val = id;
    if(val === ''){
     bootbox.alert(message) 
     return false
    }else{
        return true
    }
}


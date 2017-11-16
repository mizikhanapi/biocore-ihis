/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var processNotes = "";
var ccn_cd = [];
var dgs_cd = [];
var ORCObj = {};
var finalDiagnosis = "";
var VTSNotes = "";
var dcgVtsObj = {};

var dcg_notes = "";

var hfcDetailOrder = ["a"];
var orderDetail1 = "";
var providerDetail1 = "";
var dischargeModalState = 0;
var VTSObjDCG = {};

var order_data = [];

function goToHome() {
    location.href = '../Entrance/dashboard.jsp';
}
function logOut(){
    location.href = '../Entrance/destroySession.jsp';
}

function clickManageAccount() {
    if (pmiNo === "") {
        window.onbeforeunload = null;
        location.href = '../Entrance/Profile'
    } else {
        bootbox.alert('You need complete the consultation on patient before first');
    }
}
function checkClick(url) {
    if (pmiNo === "") {
        window.onbeforeunload = null;
        location.href = url;
    } else {
        bootbox.alert('You need complete the consultation on patient before first');
    }
}

$(document).ready(function (e) {
    
    $('.btnCIS_LOGOUT').click(function(e){
        e.preventDefault();
        
        if(pmiNo === "" ){
            window.onbeforeunload = null;
            logOut();
        }else{
            bootbox.alert('You need complete the consultation on patient before first');
        }

        
        
    });
    
$("#btnCIS_TEST_BUTTON").click(function(e){
    console.log(_data);
});



    $('.changePatientBtn').unbind('click');

    $('#backBtn').click(function (e) {
        e.preventDefault();
        if (pmiNo === "") {
            window.onbeforeunload = null;
            goToHome();
        } else {
            bootbox.alert('You need complete the consultation on patient before first');
        }
    });

    $('#mainConsultBar').hide();
    var VTSObj = {};
    var vtsCounter = 0;
    //------------------------------------------------------------ DISCHARGE BUTTON
    $('#dischargeBtn').click(function () {

        
        bootbox.confirm({
            message: "Are you sure you want DISCHARGE this patient?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result === true) {
                    getSettingConsult();
                    //storeData(1);
                    reloadStat = 0;
                    statusNow = 1;
                    var pmiNo = $('#pmiNumber').text();
                    dischargeModalState = 1;
                    window.onbeforeunload = null;
                    
                    $("#ong #ONG_2 #divAnteB #divAntenatal").html("<div class='row'><div class='col-xs-3'><dt style='font-size: 18px;'>Blood Profile</dt></div> <div class='col-xs-3'><dd>Blood Group: <strong>-</strong></dd><dd>Rhesus Factor: <strong>-</strong></dd><dd>VDRL: <strong>-</strong></dd></div><div class='col-xs-3'><dd>ATT Injection: <strong>-</strong></dd><dd>Rubella Status: <strong>-</strong></dd><dd>Hepatitis B Antibody: <strong>-</strong></dd><dd>Hepatitis B Antigen: <strong>-</strong></dd></div><div class='col-xs-3'><dd>1st dose: <strong>-</strong></dd><dd>2nd dose: <strong>-</strong></dd><dd>Booster: <strong>-</strong></dd> </div></div>");
                    $('#ong #ONG_2 #divAnteB #tblante tbody').empty();
                    
                    $("#ong #ONG_1 #PIdiv").html("<div class='row'><div class='col-xs-3'><dt style='font-size: 18px;'>Personal Info</dt></div><div class='col-xs-3'><dt style='font-size: 18px;'>Gravida: </dt><dd >Gravida: <strong>-</strong></dd><dd >Parity: <strong>-</strong> </dd><dd >LMP  <strong>-</strong></dd><dd>EDD  <strong>-</strong> </dd><dd >Scan EDD  <strong>-</strong></dd><dd >Period Cycle  <strong>-</strong></dd></div><div class='col-xs-3'><dt style='font-size: 18px;'>Past History: </dt><dd>Past gynaelogical History: <strong>-</strong></dd><dd>Past Medical History: <strong>-</strong></dd><dd>Past Surgical History: <strong>-</strong></dd></div></div>");
                    $('#ong #ONG_1 #divPIpreg #tblPreg tbody').empty();
                    
                    //$('.main .tab-content').hide();
                    $('#tabContent div.none').hide();
                    $('#tabContent div.none').removeClass("active in");
                    
                    $('#tabContent #generic-soap').show();
                    $('#tabContent #generic-soap').addClass("active in");
                    
                } else {
                    bootbox.alert('DISCHARGE Cancel');
                }
            }
        });
        

    });


    $('#mCIS_Discharge_Summary').on('shown.bs.modal', function () {

        //$('#mCIS_Discharge_Summary').modal("show");
        $('#divCIS_Discharge_Summary').html($('#tblCIS_Consultation_Table').html());
        $('#tblCIS_Consultation_Table').html("");
        $('.fa-pencil-square-o').css("display", "none");
        $('.fa-times').css("display", "none");
        //searchHFCcode(hfc_name, "tCIS_DCGHFCOrderDetail", "tCIS_DCGHFCProviderDetail");
        searchHFCDetailv2(hfc_name,"-","tCIS_DCGHFCOrderDetail","tCIS_DCGHFCProviderDetail","-");
        
    });

    $('#CIS040010').on('shown.bs.modal', function () {
        load_DCG_DTO();
        //$('#mCIS_Discharge_Summary').modal("show");
        $('#divCIS_Discharge_P_Summary_P').html($('#tblCIS_Consultation_Table').html());
        $('#tblCIS_Consultation_Table').html("");
        $('.fa-pencil-square-o').css("display", "none");
        $('.fa-times').css("display", "none");
        //searchHFCcode(hfc_name, "tCIS_DCGHFCOrderDetail_P", "tCIS_DCGHFCProviderDetail_P");
        searchHFCDetailv2(hfc_name,"-","tCIS_DCGHFCOrderDetail_P","tCIS_DCGHFCProviderDetail_P","-")
    });
    $('#CIS040010').on('hidden.bs.modal', function () {
        $("#DCGDTONotes").html('');
        $('#tblCIS_Consultation_Table').html($('#divCIS_Discharge_P_Summary_P').html());
        $('.fa-pencil-square-o').css("display", "inline-block");
        $('.fa-times').css("display", "inline-block");
        

    });

    $('#mCIS_Discharge_Summary').on('hidden.bs.modal', function () {

        $('#tblCIS_Consultation_Table').html($('#divCIS_Discharge_Summary').html());
        $('.fa-pencil-square-o').css("display", "inline-block");
        $('.fa-times').css("display", "inline-block");
    });

    $('#update_mCIS_Discharge_Summary').on('hidden.bs.modal', function () {

        $('#tblCIS_Consultation_Table').html($('#update_divCIS_Discharge_Summary').html());
        $('.fa-pencil-square-o').css("display", "inline-block");
        $('.fa-times').css("display", "inline-block");
        searchHFCcode(hfc_name, "update_tCIS_DCGHFCOrderDetail", "update_tCIS_DCGHFCProviderDetail");
        
        $('.ConsultationNotes').on("click", ".deleteBtn", function (e) {
            e.preventDefault();
            var delConfirm = confirm('Are you want to delete this notes? ');
            if (delConfirm === true) {
                var idName = $(this).get(0).id;

                var id = idName.split("|");
                delete _data[id[1]];
                $(this).closest('tr').remove();

            } else {
                return false;
            }
        });
    });




    //------------------------------------------------------------ ON HOLD BUTTON
    $('#holdBtn').click(function () {
        //var c = confirm("Are you sure you want ON HOLD this patient?");
        var pmiNo = $('#pmiNumber').text();
        bootbox.confirm({
            message: "Are you sure you want ON HOLD this patient?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result === true) {
                    getPDI(pmiNo);
                    storeData(2);
                    updateStatus(pmiNo, episodeDate, "2");
                    statusNow = 2;
                    reloadStat = 0;
                    window.onbeforeunload = null;
                    
                    $("#ong #ONG_2 #divAnteB #divAntenatal").html("<div class='row'><div class='col-xs-3'><dt style='font-size: 18px;'>Blood Profile</dt></div> <div class='col-xs-3'><dd>Blood Group: <strong>-</strong></dd><dd>Rhesus Factor: <strong>-</strong></dd><dd>VDRL: <strong>-</strong></dd></div><div class='col-xs-3'><dd>ATT Injection: <strong>-</strong></dd><dd>Rubella Status: <strong>-</strong></dd><dd>Hepatitis B Antibody: <strong>-</strong></dd><dd>Hepatitis B Antigen: <strong>-</strong></dd></div><div class='col-xs-3'><dd>1st dose: <strong>-</strong></dd><dd>2nd dose: <strong>-</strong></dd><dd>Booster: <strong>-</strong></dd> </div></div>");
                    $('#ong #ONG_2 #divAnteB #tblante tbody').empty();
                    
                    $("#ong #ONG_1 #PIdiv").html("<div class='row'><div class='col-xs-3'><dt style='font-size: 18px;'>Personal Info</dt></div><div class='col-xs-3'><dt style='font-size: 18px;'>Gravida: </dt><dd >Gravida: <strong>-</strong></dd><dd >Parity: <strong>-</strong> </dd><dd >LMP  <strong>-</strong></dd><dd>EDD  <strong>-</strong> </dd><dd >Scan EDD  <strong>-</strong></dd><dd >Period Cycle  <strong>-</strong></dd></div><div class='col-xs-3'><dt style='font-size: 18px;'>Past History: </dt><dd>Past gynaelogical History: <strong>-</strong></dd><dd>Past Medical History: <strong>-</strong></dd><dd>Past Surgical History: <strong>-</strong></dd></div></div>");
                    $('#ong #ONG_1 #divPIpreg #tblPreg tbody').empty();
                    
                    
                    //$('.main .tab-content').hide();
                    $('#tabContent div.none').hide();
                    $('#tabContent div.none').removeClass("active in");
                    
                    $('#tabContent #generic-soap').show();
                    $('#tabContent #generic-soap').addClass("active in");
                    
                    
                } else {
                    bootbox.alert('ON HOLD Cancel');
                }
            }
        });
        
        
       


    });

    $("#missingBtn").click(function () {
        
        var pmiNo = $('#pmiNumber').text();
        var c = confirm("Are you sure you want declare this patient are MISSING?");
        
        bootbox.confirm({
            message: "Are you sure you want declare this patient are MISSING?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result === true) {
                     reloadStat = 0;
                    storeData(4);
                    statusNow = 4;
                    updateStatus(pmiNo, episodeDate, "4");
                    window.onbeforeunload = null;
                } else {
                    bootbox.alert('Data not be saved');
                }
            }
        });
        
    });

    $("#nextBtn").click(function () {
        var currentDate = getDateNext();
        var date = currentDate[0];

       
        if (pmiNo === "") {
            nextPatient(currentDate, hfc_cd);
            reloadStat = 1;
            statusNow = 0;
          
        } else {
            bootbox.alert('You need complete the consultation on patient before first');
        }


    });

    function sendOrder1(data) {
        for (var k in data) {
            if (data[k].Acode === "DTO") {
             
                $.ajax({
                    url: 'topMenuFunction/SendOrder.jsp',
                    method: 'POST',
                    timeout: 5000,
                    data: data[k],
                    success: function (result) {
                       
                    }
                });
            } else if (data[k].Acode === "LOS") {
         
                $.ajax({
                    url: 'topMenuFunction/SendOrderLIO.jsp',
                    method: 'POST',
                    timeout: 5000,
                    data: data[k],
                    success: function (result) {
                       
                    }
                });
            }
        }
    }




    function countVTS(data) {
        $.each(data, function (index, value) {
            if (value === undefined) {
                
            } else {
                if (data[index].Acode === "VTS") {
                    vtsCounter += 1;
                }
            }
        });
    }

    function convertPEM(PEMData) {
        var PECodes = PEMData.id;
        var PECounter = 0;
        var PECd = "";
        var newPENotes = ""

        if (PEMData.pe1.length < 1) {
            newPENotes = PEMData.pe0;
        } else if (PEMData.pe2.length < 1) {
            newPENotes = PEMData.pe0 + ', ' + PEMData.pe1;
        } else if (PEMData.pe3.length < 1) {
            newPENotes = PEMData.pe0 + ', ' + PEMData.pe1 + ', ' + PEMData.pe2;
        } else if (PEMData.pe4.length < 1) {
            newPENotes = PEMData.pe0 + ', ' + PEMData.pe1 + ', ' + PEMData.pe2 + ',' + PEMData.pe3;
        } else if (PEMData.pe5.length < 1) {
            newPENotes = PEMData.pe0 + ', ' + PEMData.pe1 + ', ' + PEMData.pe2 + ',' + PEMData.pe3 + ', ' + PEMData.pe4;
        } else if (PEMData.pe6.length < 1) {
            newPENotes = PEMData.pe0 + ', ' + PEMData.pe1 + ', ' + PEMData.pe2 + ',' + PEMData.pe3 + ', ' + PEMData.pe4 + ', ' + PEMData.pe5;
        } else if (PEMData.pe7.length < 1) {
            newPENotes = PEMData.pe0 + ', ' + PEMData.pe1 + ', ' + PEMData.pe2 + ',' + PEMData.pe3 + ', ' + PEMData.pe4 + ', ' + PEMData.pe5 + ', ' + PEMData.pe6;
        } else if (PEMData.pe8.length < 1) {
            newPENotes = PEMData.pe0 + ', ' + PEMData.pe1 + ', ' + PEMData.pe2 + ',' + PEMData.pe3 + ', ' + PEMData.pe4 + ', ' + PEMData.pe5 + ', ' + PEMData.pe6 + ', ' + PEMData.pe7;
        }

        for (var i = 0; i < PECodes.length; i++) {
            if (PECodes[i] !== "") {
                PECd = PECodes[i];
            } else if (PECodes[i] === "") {
              
            }
        }
        var Comment = PEMData.PEComment;
        PEMNotes = "PEM|" + episodeDate + "|^^" + PECd + "^" + newPENotes + "^^" + Comment + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
        return PEMNotes;
    }

    //function convertDCG(data)

    function convertToOrderNotes(data) {
        var ccnProblem = getProblem(ccn_cd);
        var dgsProblem = getProblem(dgs_cd);

        var orderNotesROS = "";
        var orderNotesDTO = "";
        var orderNotesLIO = "";
        var orderNotesPOS = "";
        var orderNotesMON = "";
        var orderNotesADW = "";
        var NotesDCG = "";
        var NotesDCGVTS = "";
        var orcNotesDCGVTS = "";
        for (var x in data) {
            if (data[x].Acode === "DCG") {
                getDCGVTS(data[x].index);
            }

        }
        var NotesDCGVTS_old = convertVTS(dcgVtsObj);
        NotesDCGVTS = NotesDCGVTS_old.replace("<cr>", "");



        for (var key in data) {
            if (data[key].Acode === "ROS") {
                if (orderNotesROS === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12102", "", "", "NO", data[key].priorityROS, getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "06", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");


                    orderNotesROS = orc + "ROS|" + ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|" + data[key].appointmentROS + "|" + data[key].hfcIdROS + "^" + data[key].hfcROS + "^PSDD|038^" + data[key].priorityROScd + "^" + data[key].priorityROS + "|096^" + data[key].patientConditionROSCd + "^" + data[key].patientConditionROS + "|" + data[key].commentROS + "|" + getRRI();
                } else {
                    orderNotesROS += "ROS|" + ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|" + data[key].appointmentROS + "|" + data[key].hfcIdROS + "^" + data[key].hfcROS + "^PSDD|038^" + data[key].priorityROScd + "^" + data[key].priorityROS + "|096^" + data[key].patientConditionROSCd + "^" + data[key].patientConditionROS + "|" + data[key].commentROS + "|" + getRRI();
                }
            } else if (data[key].Acode === "DTO") {
                //                                problem code and desc            request drug code 
                var problemDTO = "DTO|" + finalDiagnosis + "^ICD10|";
                var drug = data[key].drugCode + "^ " + data[key].drugName + "^MDC|";
                var drugForm = data[key].drugForm + "^" + data[key].drugForm + "^MDC|";
                var drugRoute = "0066^" + data[key].drugRoute + "^" + data[key].drugRoute + "|";
                var drugFrequency = "^" + data[key].drugFrequencyDetail + "^SG|";
                var drugFrequecyUnit = data[key].drugFrequency + "|";
                var drugDosage = data[key].drugDose + " " + data[key].drugDoseUnit + "|";
                var drugStrength = data[key].drugStrength + " " + data[key].drugStrengthUnit + "|";
                var drugUOM = "0025^" + data[key].drugStrengthUnit + "^" + data[key].uomCode + "|";
                var drugDuration = data[key].drugDuration + "^" + data[key].drugDurationUnit + "|";
                var quantity = data[key].drugQuantity + "|";
                var theRest = hfc_cd + "^" + hfc_name + "^PSDD|" + data[key].remark + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^" + subdis + "^" + subdisName + "^" + "|" + data[key].comment + "|<cr>\n";

                if (orderNotesDTO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12100", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "04", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");


                    orderNotesDTO = orc + problemDTO + drug + drugForm + drugRoute + drugFrequency + drugFrequecyUnit + drugDosage + drugStrength + drugUOM + drugDuration + quantity + theRest;
                } else {
                    orderNotesDTO += problemDTO + drug + drugForm + drugRoute + drugFrequency + drugFrequecyUnit + drugDosage + drugStrength + drugUOM + drugDuration + quantity + theRest;
                }

            } else if (data[key].Acode === "LOS") {

                if (orderNotesLIO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12101", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesLIO = orc + "LIO|" + finalDiagnosis + "^ICD10|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                } else {
                    orderNotesLIO += "LIO|" + finalDiagnosis + "^ICD10|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                }

            } else if (data[key].Acode === "POS") {

                if (orderNotesPOS === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");


                    var orc = getORC("T12103", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "18", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    orderNotesPOS = orc + "POS|" + finalDiagnosis + "^ICD10|" + "^" + data[key].procedure_cd + "^" + data[key].Problem18 + "^ICD10-PCS||" + data[key].proType + "|||||" + hfc_cd + "|" + hfc_name + "||hfc_cd_receiving|<cr>\n";
                } else {
                    orderNotesPOS += "POS|" + finalDiagnosis + "^ICD10|" + "^" + data[key].procedure_cd + "^" + data[key].Problem18 + "^ICD10-PCS||" + data[key].proType + "|||||" + hfc_cd + "|" + hfc_name + "||hfc_cd_receiving|<cr>\n";
                }

            } else if (data[key].Acode === "MON") {

                if (orderNotesMON === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12107", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesMON = orc + "MOR|" + finalDiagnosis + " | " + data[key].codeMON + "^" + data[key].searchMON + " | " + getDate() + " |  |  | " + doctor_id + "| " + doctor_name + " | | " + discipline + " | " + disciplineName + " | | " + data[key].MONHFC_cd + "|<cr>\n";
                } else {
                    orderNotesMON += "MOR|" + finalDiagnosis + " | " + data[key].codeMON + "^" + data[key].searchMON + " | " + getDate() + " |  |  | " + doctor_id + "| " + doctor_name + "| | " + discipline + " | " + disciplineName + " |  | " + data[key].MONHFC_cd + "|<cr>\n";
                }

            } else if (data[key].Acode === "ADW") {
                if (orderNotesADW === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12111", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "07", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesADW = orc + "ADW|" + episodeDate + "|" + data[key].AdmitDate + " " + data[key].AdmitTime + "^" + data[key].AdmitToDisciplineCd + "^" + data[key].AdmitToDiscipline + "^" + "ST-UD" + "^" + data[key].WardNameCd + "^" + data[key].WardName + "^" + "ST-UD" + "^" + data[key].Reason + "^" + data[key].PatientReferFromCd + "^active^" + data[key].AdmittedBefore + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                } else {
                    orderNotesADW += "ADW|" + episodeDate + "|" + data[key].AdmitDate + " " + data[key].AdmitTime + "^" + data[key].AdmitToDisciplineCd + "^" + data[key].AdmitToDiscipline + "^" + "ST-UD" + "^" + data[key].WardNameCd + "^" + data[key].WardName + "^" + "ST-UD" + "^" + data[key].Reason + "^" + data[key].PatientReferFromCd + "^active^" + data[key].AdmittedBefore + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                }

            } else if (data[key].Acode === "DCG") {

                var lenVTSDCG = NotesDCGVTS.length;
          

                var dataDCG = getDGCItem(data[key].index);
                var dcgVtsNotes = "";


                var message_type = "";
                var vtsLen = getSizeObj(dcgVtsObj);

                for (var i in dataDCG) {
                    var dischargeSummary = "";
                    var currentData = [dataDCG[i]];

                    var dcgGeneralNotes = getGeneralNotesDCG(currentData);
                    var dcgOrderNotes = getOrderNotesDCG(currentData);
                    if (dcgGeneralNotes === "") {
                        var orderData = dcgOrderNotes.split("<cr>");
                        dischargeSummary = orderData[1].trim();
                        //dischargeSummary = dischargeSummary.replace("<cr>","");
                        message_type = dischargeSummary.substr(0, 3);
                    } else if (dcgOrderNotes === "") {
                        dischargeSummary = dcgGeneralNotes.trim();
                        dischargeSummary = dischargeSummary.replace("<cr>", "");
                        message_type = dischargeSummary.substr(0, 3);
                    }
                    if (NotesDCG === "") {
                        var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                        var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                        var orc = getORC("T12115", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                                hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "07", hfcPFDetail[1],
                                hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                        NotesDCG = orc + "DCG|" + episodeDate + "|" + episodeDate + "^" + hfc_cd + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + data[key].date + " " + data[key].time + "^" + data[key].disposition + "^" + data[key].comment + "^" + message_type + "|" + dischargeSummary + "|<cr>\n";
                        orcNotesDCGVTS = "DCG|" + episodeDate + "|" + episodeDate + "^" + hfc_cd + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + data[key].date + " " + data[key].time + "^" + data[key].disposition + "^" + data[key].comment + "^VTS|";
                    } else {
                        NotesDCG += "DCG|" + episodeDate + "|" + episodeDate + "^" + hfc_cd + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + data[key].date + " " + data[key].time + "^" + data[key].disposition + "^" + data[key].comment + "^" + message_type + "|" + dischargeSummary + "|<cr>\n";
                    }

                }
            }
        }


        var vtsDCG = orcNotesDCGVTS + NotesDCGVTS + "|<cr>\n";
        var orderNotes = orderNotesROS + orderNotesDTO + orderNotesLIO + orderNotesPOS + orderNotesMON + orderNotesADW + NotesDCG + vtsDCG;

        orderNotesROS = "";
        orderNotesDTO = "";
        orderNotesLIO = "";
        orderNotesPOS = "";
        orderNotesMON = "";
        orderNotesADW = "";
        NotesDCG = "";
        orcNotesDCGVTS = "";
        return orderNotes;
    }

    function getProblem(data) {
        var problem;
        if (data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                var dataSplit = data[i].split('|');
                problem = dataSplit[0] + "^" + dataSplit[1] + "^";
            }
        } else {
            problem = "";
        }
        return problem;
    }
    function getRRI() {
        var rri = "";
        rri = hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^" + subdis + "^" + subdisName + "^" + "|<cr>\n";
        return rri;
    }

//    function getORC(transectionCode,orderNo,fillerOrderNo,orderStatus, orderPriority, orderDateTime, episodeDate, encounterDateTime, enterBy, verifiedBy, OPD, orderHFC, orderDis, orderSub,orderApp, orderHFCAdd1,
//    orderHFCAdd2, orderHFCAdd3, orderHFCtown, orderHFCDistrict, orderHFCState, orderHFCCountry,orderHFCPostcode, orderHFCPhoneNo, providerHFC, providerDis,providerSub,providerApp, providerAdd1, 
//    providerAdd2,providerAdd3, providerTown,providerDistrict,providerState,providerCountry,providerPostcode,providerPhoneNo, comment){
//        var orc = "";
//        var  orc1 = "ORC|"+transectionCode+"|"+orderNo+"|"+fillerOrderNo+"|"+orderStatus+"|"+orderPriority+"|"+orderDateTime+"|"+episodeDate+"|"+encounterDateTime+"|"+enterBy+"|"+verifiedBy+"|"+OPD+"|"+orderHFC+"|"+orderDis;
//        var orc2  =   "|"+orderSub+"|"+orderSub+"|"+orderApp+"|"+orderHFCAdd1+"|"+orderHFCAdd2+"|"+orderHFCAdd3+"|"+orderHFCtown+"|"+orderHFCDistrict+"|"+orderHFCState+"|"+orderHFCCountry+"|"+orderHFCPostcode;
//        var orc3 = "|"+orderHFCPhoneNo+"|"+providerHFC+"|"+providerDis+"|"+providerSub+"|"+providerApp+"|"+providerAdd1+"|"+providerAdd2+"|"+providerAdd3+"|"+providerTown+ "|"+providerDistrict+"|"+providerState+ "|"+providerCountry+ "|"+providerPostcode+ "|"+providerPhoneNo+ "|"+comment+ "|"+"<cr>\n";
//        orc = orc1+orc2+orc3;
//        return orc;
//    }

    function getDCG() {
        var dcg = "";
        var episodeDate = "DCG|" + episodeDate + "|";
        var dischargeSum = episodeDate + "^" + hfc + "^" + patientCategory + "^" + episodeDate + "^" + getDate() + "^" + "-" + "^" + doctor_id + "^" + "-" + "^" + doctor_id + "^";
        return dcg;
    }




    function convertToNotes(data) {

  
        for (var key in data) {
            if (data[key].Acode === "CCN") {
                //processNotes +=  dataToCCN(episodeDate, data[key].ccnCode,  data[key].problem,  data[key].Mild,  data[key].duration, data[key].sdur,  data[key].Site, data[key].Laterality, data[key].Comment,  getDate(), hfc_cd, doctor_id, doctor_name);
                processNotes += "CCN|" + episodeDate + "|" + data[key].ccnCode + "^" + data[key].problem + "^^" + data[key].Mild + "^" + data[key].duration + " " + data[key].sdur + "^^^^" + data[key].Site + "^^" + data[key].Laterality + "^" + data[key].Comment + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
                ccn_cd.push(data[key].ccnCode + "|" + data[key].problem);
            } else if (data[key].Acode === "HPI") {
                processNotes += "HPI|" + episodeDate + "|" + data[key].details + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PMH") {
                processNotes += "PMH|" + episodeDate + "|" + data[key].codePMH + "^" + data[key].Problem1 + "^^^^" + data[key].comment1 + "^^^" + data[key].Status + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "FMH") {
                processNotes += "FMH|" + episodeDate + "|" + data[key].f_relationship + "^" + data[key].codeFMH + "^" + data[key].Problem3 + "^^^^" + data[key].comment2 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^|<cr>\n";
            } else if (data[key].Acode === "SOH") {
                processNotes += "SOH|" + episodeDate + "|" + data[key].codeSOH + "^" + data[key].Problem4 + "^^^^^^" + data[key].date + "^^^^" + data[key].comment3 + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "BLD") {
                processNotes += "BLD|" + episodeDate + "|" + data[key].blood + "^" + data[key].Rhesus_Type + "^" + data[key].G6PD_Status + "^" + data[key].comment4 + "|<cr>\n";
            } else if (data[key].Acode === "ALG") {
                processNotes += "ALG|" + episodeDate + "|" + data[key].codeALG + "^" + data[key].Problem5 + "^" + data[key].date1 + "^" + data[key].comment5 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "IMU") {
                processNotes += "IMU|" + episodeDate + "|" + data[key].codeIMU + "^" + data[key].Problem6 + "^" + data[key].date2 + "^" + data[key].comment6 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "DAB") {
                processNotes += "DAB|" + episodeDate + "|" + data[key].codeDAB + "^" + data[key].Problem32 + "^" + data[key].date3 + "^" + data[key].comment7 + "^^|<cr>\n";
            } else if (data[key].Acode === "VTS") {
                $.extend(VTSObj, data[key]);
            } else if (data[key].Acode === "PEM") {
                var peFnote = convertPEM(data[key]);
                processNotes += peFnote;
            } else if (data[key].Acode === "DGS") {
                processNotes += "DGS|" + episodeDate + "|" + data[key].TypeDGS + "^^^" + data[key].dateDGS + "^^^" + data[key].dgsCode + "^" + data[key].searchDiag + "^^" + data[key].SeverityDGS + "^^" + data[key].SiteDGS + "^^^^" + data[key].LateralityDGS + "^^^" + data[key].commentDGS + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
                dgs_cd.push(data[key].dgsCode + "|" + data[key].searchDiag);
                finalDiagnosis = data[key].dgsCode + "^" + data[key].searchDiag;
            } else if (data[key].Acode === "PNT") {
                processNotes += "PNT|" + episodeDate + "|" + data[key].PNT + "^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PRI") {
                processNotes += "PRI|" + getDate() + "|^^" + data[key].appREF + "^" + data[key].hfcREFcode + "^" + data[key].REF + "^" + data[key].disREFcode + "^" + data[key].disREF + "^^^^^" + data[key].medicalHisREF + "^^" + getDate() + "^" + data[key].docREFcode + "^" + data[key].docREF + "|<cr>\n";
            } else if (data[key].Acode === "MEC") {
                var ccnProblem = getProblem(ccn_cd);
                var dgsProblem = getProblem(dgs_cd);
                processNotes += "MEC|" + episodeDate + "|" + dgsProblem + "ICD10^^" + ccnProblem + "ICD10^^^" + data[key].num1MEC + "^" + data[key].num2MEC + "^" + data[key].DateFromMEC + "^" + data[key].DateToMEC + "^^^^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "FLU") {

                processNotes += "ARQ|" + episodeDate + "|^^" + data[key].DateFollowUp + "^" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^^^^^" + data[key].commentFLU + "^^" + getDate() + "^" + data[key].docFLUCode + "^" + data[key].searchFLU + "|<cr>\n";
            }

        }

        if (vtsCounter === 0) {
            VTSNotes = '';
        } else {
            VTSNotes = convertVTS(VTSObj);
        }
        processNotes += VTSNotes;
   
        return processNotes;
    }





    function storeData(status) {
     
        var statusDesc;
        if (status === 2) {
            statusDesc = "On Hold";
        } else if (status === 1) {
            statusDesc = "Discharge";
        } else if (status === 0) {
            statusDesc = "Waiting";
        } else if (status === 4) {
            statusDesc = "Missing";
        }

        var msh = getMSH("02", hfc_cd);
        var pdi = PDIInfo + "\n";

        countVTS(_data);
        var SendNotes = getNotesDCG(_data);
        //var ord = getNotesDCG(_data);

        vtsCounter = 0;

        notes = msh + pdi + SendNotes;
        createScreenLoading();

        $.ajax({
            url: "topMenuFunction/discharge.jsp",
            type: "post",
            data: {
                notes: notes,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: status,
            },
            success: function (data) {
                //destroyScreenLoading()
                var d = data.trim();
               
                if (d === '|1|') {
                    clearCIS();
                    //bootbox.alert('Patient has been ' + statusDesc);
                } else if (d === '|3|') {
                    clearCIS();
                    //bootbox.alert('Patient record has been ' + statusDesc);
                }
            },
            error: function (err) {
        
                $('#consultationNotes').html("Error: " + err);
                notes = "";
            }
        });
    }


    function nextPatient(currentDate, hfc) {
        $.ajax({
            url: "topMenuFunction/searchNextPatient.jsp",
            method: "POST",
            timeout: 10000,
            data: {
                date: currentDate,
                hfc: hfc
            },
            success: function (result) {
   
                if (result.trim() === "|O|") {
                    bootbox.alert("No patient in queue");
                } else {

                    var nextPArry = result.trim().split("|");
                    pmiNo = nextPArry[0];
                    episodeDate = nextPArry[1];

                    findPatient(pmiNo, episodeDate);
                    //$('.soap-select').unbind('click');
                    $('.soap-select').off('click',disableSOAP);
                    getPDI(pmiNo);
                    updateStatus(pmiNo, episodeDate, 5);
                    
                }
            }
        })
    }

    function spliceSetting(settingParam) {
        var arrySetting = [];
        if (settingParam.length > 3) {
            arrySetting = settingParam.split("|");
        } else {
            arrySetting.push(settingParam);
        }
        return arrySetting;
    }


    function getSettingConsult() {
        var checkCCN = false;
        var checkDGS = false;
        var checkDCG = false;


        var cisSetting = spliceSetting(cisParam);
   

        for (i in cisSetting) {
            if (cisSetting[i] === "CCN") {
                checkCCN = true;
            } else if (cisSetting[i] === "DGS") {
                checkDGS = true;
            } else if (cisSetting[i] === "DCG") {
                checkDCG = true;
            }
        }


        var dataDischarge = getStatusData(_data);



        //111
        if (checkCCN === true && checkDGS === true && checkDCG === true) {

            if (dataDischarge[0] === true && dataDischarge[1] === true && dataDischarge[2] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                     bootbox.alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false) {
                 bootbox.alert("Need to add Chief Complain");
            } else if (dataDischarge[1] === false) {
                 bootbox.alert("Need to add Diagnosis");
            } else if (dataDischarge[2] === false) {
                 bootbox.alert("Need to add Discharge Summary");
            }
            //011
        } else if (checkCCN === false && checkDGS === true && checkDCG === true) {

            if (dataDischarge[1] === true && dataDischarge[2] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
                }
            } else if (dataDischarge[1] === false) {
                 bootbox.alert("Need to add Diagnosis");
            } else if (dataDischarge[2] === false) {
                 bootbox.alert("Need to add Discharge Summary");
            }
            //001
        } else if (checkCCN === false && checkDGS === false && checkDCG === true) {

            if (dataDischarge[2] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
                }
            } else if (dataDischarge[2] === false) {
                 bootbox.alert("Need to add Discharge Summary");
            }
            //010
        } else if (checkCCN === false && checkDGS === true && checkDCG === false) {

            if (dataDischarge[1] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                     bootbox.alert('Discharge Cancel');
                }
            } else if (dataDischarge[1] === false) {
                 bootbox.alert("Need to add Diagnosis");
            }
            //000
        } else if (checkCCN === true && checkDGS === false && checkDCG === false) {

            if (dataDischarge[0] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                     bootbox.alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false) {
                 bootbox.alert("Need to add Chief Complain");
            }
            //100
        } else if (checkCCN === true && checkDGS === false && checkDCG === true) {

            if (dataDischarge[0] === true && dataDischarge[2] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                     bootbox.alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false) {
                 bootbox.alert("Need to add Chief Complain");
            } else if (dataDischarge[2] === false) {
                 bootbox.alert("Need to add Discharge Summary");
            }
            //101
        } else if (checkCCN === true && checkDGS === true && checkDCG === false) {

            if (dataDischarge[0] === true && dataDischarge[1] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    bootbox.alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false) {
                bootbox.alert("Need to add Chief Complain");
            } else if (dataDischarge[1] === false) {
                 bootbox.alert("Need to add Diagnosis");
            }
            //110
        } else if (checkCCN === false && checkDGS === false && checkDCG === false) {

            var c = confirm("Are you sure you want DISCHARGE this patient?");
            if (c === true) {
                storeData(1);
            } else {
                 bootbox.alert('Discharge Cancel');
            }
        }

    }


    function getStatusData(data) {
        var sCCN = false;
        var sDGS = false;
        var sDCG = false;

        for (var key in data) {
            if (data[key].Acode === "CCN") {
                sCCN = true;
            } else if (data[key].Acode === "DGS") {
                sDGS = true;
            } else if (data[key].Acode === "DCG") {
                sDCG = true;
            }
        }

        return [sCCN, sDGS, sDCG];
    }



    //discharge ada DCG




    function dataToCCN(episodeDate, ccnCode, problem, Mild, duration, sdur, site, Laterality, comment, currentDate, hfc_cd, doctor_id, doctor_name) {
        var ccn = "CCN|" + episodeDate + "|" + ccnCode + "^" + problem + "^^" + Mild + "^" + duration + " " + sdur + "^^^^" + site + "^^" + Laterality + "^" + comment + "^^^" + currentDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
        return ccn;
    }

    function getGeneralNotesDCG(data) {
        var dcgNotes = "";
        for (var key in data) {
            if (data[key].Acode === "CCN") {
                //processNotes +=  dataToCCN(episodeDate, data[key].ccnCode,  data[key].problem,  data[key].Mild,  data[key].duration, data[key].sdur,  data[key].Site, data[key].Laterality, data[key].Comment,  getDate(), hfc_cd, doctor_id, doctor_name);
                dcgNotes += "CCN|" + episodeDate + "|" + data[key].ccnCode + "^" + data[key].problem + "^^" + data[key].Mild + "^" + data[key].duration + " " + data[key].sdur + "^^^^" + data[key].Site + "^^" + data[key].Laterality + "^" + data[key].Comment + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
                ccn_cd.push(data[key].ccnCode + "|" + data[key].problem);
            } else if (data[key].Acode === "HPI") {
                dcgNotes += "HPI|" + episodeDate + "|" + data[key].details + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PMH") {
                dcgNotes += "PMH|" + episodeDate + "|" + data[key].codePMH + "^" + data[key].Problem1 + "^^^^" + data[key].comment1 + "^^^" + data[key].Status + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "FMH") {
                dcgNotes += "FMH|" + episodeDate + "|" + data[key].f_relationship + "^" + data[key].codeFMH + "^" + data[key].Problem3 + "^^^^" + data[key].comment2 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^|<cr>\n";
            } else if (data[key].Acode === "SOH") {
                dcgNotes += "SOH|" + episodeDate + "|" + data[key].codeSOH + "^" + data[key].Problem4 + "^^^^^^" + data[key].date + "^^^^" + data[key].comment3 + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "BLD") {
                dcgNotes += "BLD|" + episodeDate + "|" + data[key].blood + "^" + data[key].Rhesus_Type + "^" + data[key].G6PD_Status + "^" + data[key].comment4 + "|<cr>\n";
            } else if (data[key].Acode === "ALG") {
                dcgNotes += "ALG|" + episodeDate + "|" + data[key].codeALG + "^" + data[key].Problem5 + "^" + data[key].date1 + "^" + data[key].comment5 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "IMU") {
                dcgNotes += "IMU|" + episodeDate + "|" + data[key].codeIMU + "^" + data[key].Problem6 + "^" + data[key].date2 + "^" + data[key].comment6 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "DAB") {
                dcgNotes += "DAB|" + episodeDate + "|" + data[key].codeDAB + "^" + data[key].Problem32 + "^" + data[key].date3 + "^" + data[key].comment7 + "^^|<cr>\n";
            } else if (data[key].Acode === "VTS") {
                $.extend(VTSObjDCG, data[key]);
            } else if (data[key].Acode === "PEM") {
                var peFnote = convertPEM(data[key]);
                dcgNotes += peFnote;
            } else if (data[key].Acode === "DGS") {
                dcgNotes += "DGS|" + episodeDate + "|" + data[key].TypeDGS + "^^^" + data[key].dateDGS + "^^^" + data[key].dgsCode + "^" + data[key].searchDiag + "^^" + data[key].SeverityDGS + "^^" + data[key].SiteDGS + "^^^^" + data[key].LateralityDGS + "^^^" + data[key].commentDGS + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
                dgs_cd.push(data[key].dgsCode + "|" + data[key].searchDiag);
                finalDiagnosis = data[key].dgsCode + "^" + data[key].searchDiag;
            } else if (data[key].Acode === "PNT") {
                dcgNotes += "PNT|" + episodeDate + "|" + data[key].PNT + "^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PRI") {
                dcgNotes += "PRI|" + getDate() + "|^^" + data[key].appREF + "^" + data[key].hfcREFcode + "^" + data[key].REF + "^" + data[key].disREFcode + "^" + data[key].disREF + "^^^^^" + data[key].medicalHisREF + "^^" + getDate() + "^" + data[key].docREFcode + "^" + data[key].docREF + "|<cr>\n";
            } else if (data[key].Acode === "MEC") {
                var ccnProblem = getProblem(ccn_cd);
                var dgsProblem = getProblem(dgs_cd);
                dcgNotes += "MEC|" + episodeDate + "|" + dgsProblem + "ICD10^^" + ccnProblem + "ICD10^^^" + data[key].num1MEC + "^" + data[key].num2MEC + "^" + data[key].DateFromMEC + "^" + data[key].DateToMEC + "^^^^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "FLU") {
                dcgNotes += "ARQ|" + episodeDate + "|^^" + data[key].DateFollowUp + "^" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^^^^^" + data[key].commentFLU + "^^" + getDate() + "^" + data[key].docFLUCode + "^" + data[key].searchFLU + "|<cr>\n";
            }
        }


        return dcgNotes;
    }


    function getOrderNotesDCG(data) {
        var orderNotes = ""

        var ccnProblem = getProblem(ccn_cd);
        var dgsProblem = getProblem(dgs_cd);

        var orderNotesROS = "";
        var orderNotesDTO = "";
        var orderNotesLIO = "";
        var orderNotesPOS = "";
        var orderNotesMON = "";
        var orderNotesADW = "";
        for (var key in data) {
            if (data[key].Acode === "ROS") {
                if (orderNotesROS === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12102", "", "", "NO", data[key].priorityROS, getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "06", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");


                    orderNotesROS = orc + "ROS|" + ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|" + data[key].appointmentROS + "|" + data[key].hfcIdROS + "^" + data[key].hfcROS + "^PSDD|038^" + data[key].priorityROScd + "^" + data[key].priorityROS + "|096^" + data[key].patientConditionROSCd + "^" + data[key].patientConditionROS + "|" + data[key].commentROS + "|" + getRRI();
                } else {
                    orderNotesROS += "ROS|" + ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|" + data[key].appointmentROS + "|" + data[key].hfcIdROS + "^" + data[key].hfcROS + "^PSDD|038^" + data[key].priorityROScd + "^" + data[key].priorityROS + "|096^" + data[key].patientConditionROSCd + "^" + data[key].patientConditionROS + "|" + data[key].commentROS + "|" + getRRI();
                }
            } else if (data[key].Acode === "DTO") {
                //                                problem code and desc            request drug code 
                var problemDTO = "DTO|" + finalDiagnosis + "^ICD10|";
                var drug = data[key].drugCode + "^ " + data[key].drugName + "^MDC|";
                var drugForm = data[key].drugForm + "^" + data[key].drugForm + "^MDC|";
                var drugRoute = "0066^" + data[key].drugRoute + "^" + data[key].drugRoute + "|";
                var drugFrequency = "^" + data[key].drugFrequencyDetail + "^SG|";
                var drugFrequecyUnit = data[key].drugFrequency + "|";
                var drugDosage = data[key].drugDose + " " + data[key].drugDoseUnit + "|";
                var drugStrength = data[key].drugStrength + " " + data[key].drugStrengthUnit + "|";
                var drugUOM = "0025^" + data[key].drugStrengthUnit + "^" + data[key].uomCode + "|";
                var drugDuration = data[key].drugDuration + "^" + data[key].drugDurationUnit + "|";
                var quantity = data[key].drugQuantity + "|";
                var theRest = hfc_cd + "^" + hfc_name + "^PSDD|" + data[key].remark + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^" + subdis + "^" + subdisName + "^" + "|" + data[key].comment + "|<cr>\n";

                if (orderNotesDTO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12100", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "04", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    orderNotesDTO = orc + problemDTO + drug + drugForm + drugRoute + drugFrequency + drugFrequecyUnit + drugDosage + drugStrength + drugUOM + drugDuration + quantity + theRest;
                } else {
                    orderNotesDTO += problemDTO + drug + drugForm + drugRoute + drugFrequency + drugFrequecyUnit + drugDosage + drugStrength + drugUOM + drugDuration + quantity + theRest;
                }

            } else if (data[key].Acode === "LOS") {

                if (orderNotesLIO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12101", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesLIO = orc + "LIO|" + finalDiagnosis + "^ICD10|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                } else {
                    orderNotesLIO += "LIO|" + finalDiagnosis + "^ICD10|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                }

            } else if (data[key].Acode === "POS") {

                if (orderNotesPOS === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");


                    var orc = getORC("T12103", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "18", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    orderNotesPOS = orc + "POS|" + finalDiagnosis + "^ICD10|" + "^" + data[key].procedure_cd + "^" + data[key].Problem18 + "^ICD10-PCS||" + data[key].proType + "|||||" + hfc_cd + "|" + hfc_name + "||hfc_cd_receiving|<cr>\n";
                } else {
                    orderNotesPOS += "POS|" + finalDiagnosis + "^ICD10|" + "^" + data[key].procedure_cd + "^" + data[key].Problem18 + "^ICD10-PCS||" + data[key].proType + "|||||" + hfc_cd + "|" + hfc_name + "||hfc_cd_receiving|<cr>\n";
                }

            } else if (data[key].Acode === "MON") {

                if (orderNotesMON === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12107", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesMON = orc + "MOR|" + finalDiagnosis + " | " + data[key].codeMON + "^" + data[key].searchMON + " | " + getDate() + " |  |  | " + doctor_id + "| " + doctor_name + " | | " + discipline + " | " + disciplineName + " | | " + data[key].MONHFC_cd + "|<cr>\n";
                } else {
                    orderNotesMON += "MOR|" + finalDiagnosis + " | " + data[key].codeMON + "^" + data[key].searchMON + " | " + getDate() + " |  |  | " + doctor_id + "| " + doctor_name + "| | " + discipline + " | " + disciplineName + " |  | " + data[key].MONHFC_cd + "|<cr>\n";
                }

            } else if (data[key].Acode === "ADW") {
                if (orderNotesADW === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");

                    var orc = getORC("T12111", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "07", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesADW = orc + "ADW|" + episodeDate + "|" + data[key].AdmitDate + " " + data[key].AdmitTime + "^" + data[key].AdmitToDisciplineCd + "^" + data[key].AdmitToDiscipline + "^" + "ST-UD" + "^" + data[key].WardNameCd + "^" + data[key].WardName + "^" + "ST-UD" + "^" + data[key].Reason + "^" + data[key].PatientReferFromCd + "^active^" + data[key].AdmittedBefore + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                } else {
                    orderNotesADW += "ADW|" + episodeDate + "|" + data[key].AdmitDate + " " + data[key].AdmitTime + "^" + data[key].AdmitToDisciplineCd + "^" + data[key].AdmitToDiscipline + "^" + "ST-UD" + "^" + data[key].WardNameCd + "^" + data[key].WardName + "^" + "ST-UD" + "^" + data[key].Reason + "^" + data[key].PatientReferFromCd + "^active^" + data[key].AdmittedBefore + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                }

            }
        }
        orderNotes = orderNotesROS + orderNotesDTO + orderNotesLIO + orderNotesPOS + orderNotesMON + orderNotesADW;
        orderNotesROS = "";
        orderNotesDTO = "";
        orderNotesLIO = "";
        orderNotesPOS = "";
        orderNotesMON = "";
        orderNotesADW = ""
        return orderNotes;
    }

    function getDGCItem(index) {
        var dcgData = [];
        for (var x in index) {
            if (_data[index[x]].Acode !== "VTS") {
                dcgData.push(_data[index[x]]);
            }
        }
        return dcgData;
    }

    function getDCGVTS(index) {
        for (var x in index) {
            if (_data[index[x]].Acode === "VTS") {
                $.extend(dcgVtsObj, _data[index[x]]);
            }
        }

    }

    function getSizeObj(Obj) {
        var len = 0;
        for (var o in Obj) {
            len++;
        }
        return len;
    }



});

function load_DCG_DTO(){
    var DTODGCItem = [];
            $.ajax({
            url: "search/ResultORDERDETAILDTOSearch.jsp",
            data: {
                pmi_no: pmiNo,
                episode_date: episodeDate
            },
            timeout: 3000,
            method: "POST",
            success: function (response) {
                var allDetail = response.trim().split("[#-#]");
                allDetail.pop();
                for(var i in allDetail){
                    var dtoA = allDetail[i].split("|");

                    var tempDTOObj = {
                         Acode: 'DTO',
                        drugName: dtoA[1],
                        drugCode: dtoA[0],
                        drugForm: dtoA[4],
                        drugRoute: dtoA[3],
                        drugCaution: "",
                        drugFrequencyDetail: "",
                        drugStrength: dtoA[6],
                        drugStrengthUnit: "",
                        drugDose: dtoA[7],
                        drugDoseUnit: "",
                        drugDuration: dtoA[9],
                        drugDurationUnit: "",
                        drugFrequency: dtoA[2],
                        uomCode: dtoA[8],
                        remark: "",
                        comment: "",
                        drugQuantity: dtoA[10],
                        problemName: "",
                        problemCode: "",
                        priority: "Normal"
                    }
                    displayDTO2( tempDTOObj.drugName, tempDTOObj.drugStrength, tempDTOObj.drugDose, tempDTOObj.drugFrequency, tempDTOObj.drugDuration, tempDTOObj.uomCode, tempDTOObj, tempDTOObj);
                    DTODGCItem.push(tempDTOObj);
                }
            }
        })
}

function displayDTO2( drugName, drugStr, drugDose, drugFreq, drugDur1, unit) {
    var _tr = '<tr data-status="pagado" ><td><div class="ckbox"><input type="checkbox" id="checkbox|' + i + '" name="DTO_DCG"><label for="checkbox|' + i + '"></label></div></td><td><div class="media"><div class="media-body">Drug Ordered :<p class="summary" id="sum' + i + '">' + ' | Drug Name: ' + drugName + ' | Strength: ' + drugStr + ' | Dose: ' + drugDose + ' | Frequency: ' + drugFreq + ' | Duration: ' + drugDur1  +'</p></div></div></td><td></td><td></td></tr>';
    $('#DCGDTONotes').append(_tr);
    i = i + 1;
}

    function clearCIS() {
        $(".loading").fadeOut("slow");
        //location.href = './CIS000000.jsp';
   
        pmiNo = "";
        episodeDate = "";
        PDIInfo = "";
        patientCategory = "";
        fullPatientData = "";
        _data = [];
        _dataDTO = [];
        _dataLIO = [];
        _dataROS = [];
         _dataPOS = [];
         _dataPOSSurgical = [];
        i=0;
        var vital_tab = $("#vital-tab");
        if(vital_tab.hasClass("in")){
            vital_tab.removeClass("in");
        }
        //removeClass("in");
        
        $("#tableOrderDTO").html('');
        $("#patient-detail-dashboard").find("span").html("-");
        $('.soap-select').on('click',disableSOAP);
        $('#tblCIS_Consultation_Table tbody').empty();
        $(".clear-patient").html("");
        
        
        
//        $("#div_CIS_PATIENT_DASHBOARD").load("CIS000000.jsp #div_CIS_PATIENT_DASHBOARD",function(){
//           $("#divCIS_Consultation_Table").load("CIS000000.jsp #divCIS_Consultation_Table");
//            $('.soap-select').on('click',disableSOAP);
//            $(".loading").fadeOut("slow");
//        });
        


        
    }
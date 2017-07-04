/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var processNotes = "";
var ccn_cd = [];
var dgs_cd = [];
var ORCObj  = {};
var finalDiagnosis = "";
var VTSNotes = "";
 var dcgVtsObj = {};

var dcg_notes = "";

var hfcDetailOrder = ["a"];
var orderDetail1 = "";
var providerDetail1 = "";
var dischargeModalState = 0;
var VTSObjDCG= {};

function goToHome() {
    location.href = '../Entrance/dashboard.jsp';
}

$(document).ready(function (e) {

    
    $(window).on('beforeunload', function (e) {
        if (reloadStat === "1") {
            updateStatus(pmiNo, episodeDate, statusNow);
            return "Sure U are?";
        } else {
            console.log("no patient");
        }
    });
    
    $('.changePatientBtn').unbind('click');

    $('#backBtn').click(function (e) {
        e.preventDefault();
        if (pmiNo === "") {
            goToHome();
        } else {
            alert('You need complete the consultation on patient before first');
        }
    });

    $('#mainConsultBar').hide();
    var VTSObj = {};
    var vtsCounter = 0;
    //------------------------------------------------------------ DISCHARGE BUTTON
    $('#dischargeBtn').click(function () {
        getSettingConsult(doctor_id);
        reloadStat = 0;
        //clearCIS();
        var pmiNo = $('#pmiNumber').text();
        dischargeModalState  =1;
     
    });
  
    
        $('#mCIS_Discharge_Summary').on('shown.bs.modal', function () {
            
               //$('#mCIS_Discharge_Summary').modal("show");
                $('#divCIS_Discharge_Summary').html($('#tblCIS_Consultation_Table').html());
                $('#tblCIS_Consultation_Table').html("");
                $('.fa-pencil-square-o').css("display","none");
                $('.fa-times').css("display","none");
                searchHFCcode(hfc_name, "tCIS_DCGHFCOrderDetail", "tCIS_DCGHFCProviderDetail");
       });
    
    $('#mCIS_Discharge_Summary').on('hidden.bs.modal', function () {
               
           $('#tblCIS_Consultation_Table').html($('#divCIS_Discharge_Summary').html());
                $('.fa-pencil-square-o').css("display","inline-block");
             $('.fa-times').css("display","inline-block");
       });
       
           $('#update_mCIS_Discharge_Summary').on('hidden.bs.modal', function () {
               
           $('#tblCIS_Consultation_Table').html($('#update_divCIS_Discharge_Summary').html());
                $('.fa-pencil-square-o').css("display","inline-block");
             $('.fa-times').css("display","inline-block");
              searchHFCcode(hfc_name, "update_tCIS_DCGHFCOrderDetail", "update_tCIS_DCGHFCProviderDetail");
       });
       
       


    //------------------------------------------------------------ ON HOLD BUTTON
    $('#holdBtn').click(function () {
        reloadStat = 0;
        var c = confirm("Are you sure you want ON HOLD this patient?");
        var pmiNo = $('#pmiNumber').text();
        if (c === true) {
            getPDI(pmiNo);
            storeData(2);
            updateStatus(pmiNo, episodeDate, "2");
        } else {
            alert('ON HOLD Cancel');
        }
    });

    $("#missingBtn").click(function () {
        reloadStat = 0;
        alert("Missing Button");
        var pmiNo = $('#pmiNumber').text();
        var c = confirm("Are you sure you want declare this patient are MISSING?");

        if (c === true) {
            storeData(4);
            updateStatus(pmiNo, episodeDate, "4");
        } else {
            alert('Data not be saved');
        }
    });

    $("#nextBtn").click(function () {
        reloadStat = "1";
        console.log(reloadStat);
        var currentDate = getDateNext();
        var date = currentDate[0];
        console.log(currentDate);
        //console.log(date);
        console.log(hfc_cd);
        if (pmiNo === "") {
            nextPatient(currentDate, hfc_cd);
        } else {
            alert('You need complete the consultation on patient before first');
        }


    });

    function sendOrder(data) {
        for (var k in data) {
            if (data[k].Acode === "DTO") {
                console.log(data[k]);
                $.ajax({
                    url: 'topMenuFunction/SendOrder.jsp',
                    method: 'POST',
                    timeout: 5000,
                    data: data[k],
                    success: function (result) {
                        console.log(result);
                    }
                });
            } else  if (data[k].Acode === "LOS") {
                console.log(data[k]);
                $.ajax({
                    url: 'topMenuFunction/SendOrderLIO.jsp',
                    method: 'POST',
                    timeout: 5000,
                    data: data[k],
                    success: function (result) {
                        console.log(result);
                    }
                });
            } 
        }
    }

    
    function convertVTS(VTSData) {

        var d = VTSData;

        if (d.BTemp === undefined) {
            d.BTemp = "";
        }
        if (d.sitS === undefined) {
            d.sitS = "";
        }
        if (d.sitD === undefined) {
            d.sitD = "";
        }
        if (d.lyingS === undefined) {
            d.lyingS = "";
        }
        if (d.lyingD === undefined) {
            d.lyingD = "";
        }
        if (d.standS === undefined) {
            d.standS = "";
        }
        if (d.standD === undefined) {
            d.standD = "";
        }
        if (d.bmiWeight === undefined) {
            d.bmiWeight = "";
        }
        if (d.bmiHeight === undefined) {
            d.bmiHeight = "";
        }
        if (d.headCir === undefined) {
            d.headCir = "";
        }
        if (d.rrate === undefined) {
            d.rrate = "";
        }
        if (d.headCir === undefined) {
            d.headCir = "";
        }
        if (d.pointMain === undefined) {
            d.pointMain = "";
        }
        if (d.resultMain === undefined) {
            d.resultMain = "";
        }
        if (d.pointpgcsMain === undefined) {
            d.pointpgcsMain = "";
        }
        if (d.resultpgcsMain === undefined) {
            d.resultpgcsMain = "";
        }
        if (d.OSat === undefined) {
            d.OSat = "";
        }
        if (d.painScale === undefined) {
            d.painScale = "";
        }
        if (d.bloodGlucose === undefined) {
            d.bloodGlucose = "";
        }

        var vtsNotes = "";
        vtsNotes += "VTS|" + getDate() + "|" + d.BTemp + "^" + d.sitS + "^" + d.sitD + "^" + d.lyingS + "^" + d.lyingD + "^" + d.standS + "^" + d.standD + "^" + d.bmiWeight + "^" + d.bmiHeight + "^" + d.headCir + "^" + d.rrRate + "^" + d.pointMain + "^" + "^^^^^^^^^^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^" + d.pointMain + "^" + d.resultMain + "^" + d.pointpgcsMain + "^" + d.resultpgcsMain + "^" + d.OSat + "^" + d.painScale + "^" + d.bloodGlucose + "^" + d.sitP + "^" + d.lyingP + "^" + d.standP + "|<cr>\n";
        return vtsNotes;
    }

    function countVTS(data) {
        $.each(data, function (index, value) {
            if (value === undefined) {
                console.log("no object");
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
                console.log(PECd);
            }
        }
        var Comment = PEMData.PEComment;
        PEMNotes = "PEM|"+episodeDate+"|^^" + PECd + "^" + newPENotes + "^^" + Comment + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
        return PEMNotes;
    }
    
    //function convertDCG(data)

    function convertToOrderNotes(data) {
      var ccnProblem =   getProblem(ccn_cd);
       var dgsProblem =  getProblem(dgs_cd);
//       console.log(ccn);
//       console.log(dgs);
        var orderNotesROS = "";
        var orderNotesDTO = "";
        var orderNotesLIO = "";
        var orderNotesPOS = "";
          var orderNotesMON = "";
            var orderNotesADW = "";
            var NotesDCG = "";
            var NotesDCGVTS = "";
            var orcNotesDCGVTS = "";
            for(var x in data){
                if(data[x].Acode === "DCG"){
                     getDCGVTS(data[x].index);
                }
              
            }
             var NotesDCGVTS_old = convertVTS(dcgVtsObj);
             NotesDCGVTS = NotesDCGVTS_old.replace("<cr>","");
             
             
            
        for (var key in data) {
            if (data[key].Acode === "ROS") {
                if(orderNotesROS === ""){
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    var orc = getORC("T12102", "", "", "NO", data[key].priorityROS, getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "06", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                            
                            
                            orderNotesROS = orc + "ROS|"+ ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|"+ data[key].appointmentROS +"|"+ data[key].hfcIdROS +"^"+ data[key].hfcROS +"^PSDD|038^" + data[key].priorityROScd +"^" + data[key].priorityROS +"|096^" + data[key].patientConditionROSCd +"^" + data[key].patientConditionROS +"|"+ data[key].commentROS +  "|" + getRRI();
                }else {
                     orderNotesROS += "ROS|"+ ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|"+ data[key].appointmentROS +"|"+ data[key].hfcIdROS +"^"+ data[key].hfcROS +"^PSDD|038^" + data[key].priorityROScd +"^" + data[key].priorityROS +"|096^" + data[key].patientConditionROSCd +"^" + data[key].patientConditionROS +"|"+ data[key].commentROS +  "|" + getRRI();
                }
            } else if (data[key].Acode === "DTO") {
                //                                problem code and desc            request drug code 
                var problemDTO = "DTO|" +finalDiagnosis+ "^ICD10|";
                var drug =  data[key].drugCode + "^ " + data[key].drugName + "^MDC|"; 
                var drugForm = data[key].drugForm+ "^"+data[key].drugForm+"^MDC|";
                var drugRoute =  "0066^" + data[key].drugRoute + "^"+ data[key].drugRoute+"|";
                var drugFrequency = "^" + data[key].drugFrequencyDetail + "^SG|" ;
                var drugFrequecyUnit = data[key].drugFrequency + "|";
                var drugDosage = data[key].drugDose+" "+data[key].drugDoseUnit+"|";
                var drugStrength = data[key].drugStrength+" "+data[key].drugStrengthUnit+"|";
                var drugUOM = "0025^"+data[key].drugStrengthUnit+"^"+data[key].uomCode+"|";
                var drugDuration = data[key].drugDuration+"^"+data[key].drugDurationUnit+"|";
                var quantity = data[key].drugQuantity + "|";
                var theRest = hfc_cd+"^"+hfc_name+"^PSDD|" + data[key].remark + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^"+disciplineName+"^" + subdis + "^"+subdisName+"^" + "|"+data[key].comment+"|<cr>\n";
              
                if (orderNotesDTO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    var orc = getORC("T12100", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "04", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    

                    orderNotesDTO = orc + problemDTO + drug + drugForm+drugRoute+drugFrequency+drugFrequecyUnit+drugDosage+drugStrength+drugUOM+drugDuration+quantity+theRest;
                } else {
                    orderNotesDTO += problemDTO + drug + drugForm+drugRoute+drugFrequency+drugFrequecyUnit+drugDosage+drugStrength+drugUOM+drugDuration+quantity+theRest;
                }

            } else if (data[key].Acode === "LOS") {
                
                if (orderNotesLIO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                        var orc = getORC("T12101", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    
                    orderNotesLIO = orc +  "LIO|"  +finalDiagnosis+ "^ICD10|"+ data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                } else {
                      orderNotesLIO += "LIO|"  +finalDiagnosis+ "^ICD10|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                }
               
            } else if (data[key].Acode === "POS") {
                
                if (orderNotesPOS === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    
                    var orc = getORC("T12103", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "18", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10],hfcPFDetail[12],hfcPFDetail[14],hfcPFDetail[13],hfcPFDetail[8],hfcPFDetail[9], "-");
                    orderNotesPOS = orc +"POS|" +finalDiagnosis+ "^ICD10|"+ "^" + data[key].procedure_cd +"^"+ data[key].Problem18 +  "^ICD10-PCS||"+data[key].proType+"|||||"+hfc_cd+"|"+hfc_name+"||hfc_cd_receiving|<cr>\n";
                } else {
                    orderNotesPOS += "POS|" +finalDiagnosis+ "^ICD10|" + "^" + data[key].procedure_cd +"^"+ data[key].Problem18 +  "^ICD10-PCS||"+data[key].proType+"|||||"+hfc_cd+"|"+hfc_name+"||hfc_cd_receiving|<cr>\n";
                }
               
            }else if (data[key].Acode === "MON") {
                
              if (orderNotesMON === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    var orc = getORC("T12107", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesMON = orc +   "MOR|"+finalDiagnosis+" | "+data[key].codeMON+"^"+data[key].searchMON+" | " +getDate()+" |  |  | "+doctor_id+"| "+doctor_name+" | | "+discipline+" | "+disciplineName+" | | "+data[key].MONHFC_cd+"|<cr>\n";
                } else {
                      orderNotesMON +=  "MOR|"+finalDiagnosis+" | "+data[key].codeMON+"^"+data[key].searchMON+" | " +getDate()+" |  |  | "+doctor_id+"| "+doctor_name+"| | "+discipline+" | "+disciplineName+" |  | "+data[key].MONHFC_cd+"|<cr>\n";
                }
        
            }else if (data[key].Acode === "ADW") {
                 if (orderNotesADW === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                     var orc = getORC("T12111", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "07", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    
                    orderNotesADW = orc +    "ADW|"+episodeDate+"|"+data[key].AdmitDate+" "+data[key].AdmitTime+"^" +data[key].AdmitToDisciplineCd+"^"+data[key].AdmitToDiscipline+"^"+"ST-UD"+"^"+data[key].WardNameCd+"^"+data[key].WardName+"^"+"ST-UD"+"^"+data[key].Reason+"^"+data[key].PatientReferFromCd+"^active^"+data[key].AdmittedBefore+"^"+getDate()+"^"+ hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                } else {
                      orderNotesADW +=   "ADW|"+episodeDate+"|"+data[key].AdmitDate+" "+data[key].AdmitTime+"^" +data[key].AdmitToDisciplineCd+"^"+data[key].AdmitToDiscipline+"^"+"ST-UD"+"^"+data[key].WardNameCd+"^"+data[key].WardName+"^"+"ST-UD"+"^"+data[key].Reason+"^"+data[key].PatientReferFromCd+"^active^"+data[key].AdmittedBefore+"^"+getDate()+"^"+ hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                }
          
            }else if (data[key].Acode === "DCG") {
                
                var lenVTSDCG = NotesDCGVTS.length;
                console.log(lenVTSDCG);
                
                var dataDCG = getDGCItem(data[key].index);
                var dcgVtsNotes = "";
                
               console.log(dcgVtsObj);
                console.log(dataDCG);
                var message_type = "";
                 var vtsLen = getSizeObj(dcgVtsObj);

                for(var i in dataDCG){
                    var dischargeSummary = "";
                    var currentData = [dataDCG[i]];
                     
                   var dcgGeneralNotes = getGeneralNotesDCG(currentData);
                    var dcgOrderNotes = getOrderNotesDCG(currentData);
                    if(dcgGeneralNotes === ""){
                        var orderData = dcgOrderNotes.split("<cr>");
                        dischargeSummary = orderData[1].trim();
                        //dischargeSummary = dischargeSummary.replace("<cr>","");
                        message_type = dischargeSummary.substr(0,3);
                    } else if(dcgOrderNotes === ""){
                        dischargeSummary = dcgGeneralNotes.trim();
                        dischargeSummary = dischargeSummary.replace("<cr>","");
                        message_type = dischargeSummary.substr(0,3);
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
                        NotesDCG += "DCG|" + episodeDate + "|" + episodeDate + "^" + hfc_cd + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + data[key].date + " " + data[key].time + "^" + data[key].disposition + "^" + data[key].comment + "^" + message_type + "|" +dischargeSummary + "|<cr>\n";
                    }
                   
                }
            }
        }
       
        
        var vtsDCG =  orcNotesDCGVTS + NotesDCGVTS + "|<cr>\n";
        var orderNotes = orderNotesROS + orderNotesDTO + orderNotesLIO + orderNotesPOS + orderNotesMON + orderNotesADW + NotesDCG+vtsDCG;
        
        orderNotesROS="";
        orderNotesDTO="";
        orderNotesLIO="";
        orderNotesPOS="";
        orderNotesMON="";
        orderNotesADW = "";
        NotesDCG = "";
        orcNotesDCGVTS = "";
        return orderNotes;
    }
    
    function getProblem(data){
        var problem;
        if (data.length >0){
            for (var i = 0; i < data.length; i++) {
                var dataSplit = data[i].split('|');
                problem = dataSplit[0] + "^" + dataSplit[1] + "^";
            }
        } else {
            problem = "";
        }
        return problem;
    }
    function getRRI(){
        var rri="";
        rri = hfc_cd + "^" + hfc_name + "^" + discipline + "^"+disciplineName+"^" + subdis + "^"+subdisName+"^" + "|<cr>\n";
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
    
    function getDCG(){
        var dcg = "";
        var episodeDate = "DCG|"+episodeDate+"|";
        var dischargeSum = episodeDate+"^"+hfc+"^"+patientCategory+"^"+episodeDate+"^"+getDate()+"^"+"-"+"^"+doctor_id+"^"+"-"+"^"+doctor_id+"^";
        return dcg;
    }
    



    function convertToNotes(data) {

       console.log(ccnProblem);
       console.log(dgsProblem);
        for (var key in data) {
            if (data[key].Acode === "CCN") {
               //processNotes +=  dataToCCN(episodeDate, data[key].ccnCode,  data[key].problem,  data[key].Mild,  data[key].duration, data[key].sdur,  data[key].Site, data[key].Laterality, data[key].Comment,  getDate(), hfc_cd, doctor_id, doctor_name);
              processNotes += "CCN|" + episodeDate + "|" + data[key].ccnCode + "^" + data[key].problem + "^^" + data[key].Mild + "^" + data[key].duration +" "+ data[key].sdur + "^^^^" + data[key].Site + "^^" + data[key].Laterality + "^" + data[key].Comment + "^^^" + getDate() + "^" + hfc_cd + "^"+ doctor_id +"^" + doctor_name + "^^^|<cr>\n";
                ccn_cd.push(data[key].ccnCode+"|"+data[key].problem);
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
                dgs_cd.push(data[key].dgsCode+"|"+data[key].searchDiag);
                finalDiagnosis =  data[key].dgsCode + "^" + data[key].searchDiag;
            } else if (data[key].Acode === "PNT") {
                processNotes += "PNT|" + episodeDate + "|" + data[key].PNT + "^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PRI") {
                processNotes += "PRI|" + getDate() + "|^^" + data[key].appREF + "^"+data[key].hfcREFcode+"^"+data[key].REF+"^"+data[key].disREFcode+"^"+data[key].disREF+"^^^^^"+data[key].medicalHisREF+"^^" + getDate() +  "^" + data[key].docREFcode + "^" + data[key].docREF+"|<cr>\n";
            } else if (data[key].Acode === "MEC") {
                       var ccnProblem =   getProblem(ccn_cd);
                       var dgsProblem =  getProblem(dgs_cd);
                processNotes += "MEC|" + episodeDate+ "|" + dgsProblem +"ICD10^^"+ ccnProblem + "ICD10^^^"+data[key].num1MEC+"^"+data[key].num2MEC+"^"+data[key].DateFromMEC + "^" + data[key].DateToMEC+"^^^^"+hfc_cd + "^" + doctor_id + "^" + doctor_name+"|<cr>\n";
            }else if (data[key].Acode === "FLU") {

                processNotes += "ARQ|" + episodeDate + "|^^" + data[key].DateFollowUp + "^"+hfc_cd+"^"+hfc_name+"^"+discipline+"^"+disciplineName+"^^^^^"+data[key].commentFLU+"^^" + getDate() +  "^" + data[key].docFLUCode + "^" + data[key].searchFLU+"|<cr>\n";
            }

        }
        
        if(vtsCounter === 0){
            VTSNotes = '';
        }else {
            VTSNotes = convertVTS(VTSObj);
        }
        processNotes += VTSNotes;
        console.log(HCSContent);
        return processNotes;
    }
    
    

    function clearCIS() {
        location.href = './CIS000000.jsp';
    }

    function storeData(status) {
         sendOrder(_data);
        var statusDesc;
        if (status === 2) {
            statusDesc = "Oh Hold";
        } else if (status === 1) {
            statusDesc = "Discharge";
        } else if (status === 0) {
            statusDesc = "Waiting";
        } else if (status === 4) {
            statusDesc = "Missing";
        }

        var msh = "MSH|^~|02|" + hfc_cd + "^" + discipline + "^" + subdis + "||" + getDate() + "|||||||||||||<cr>\n";
        var pdi = PDIInfo + "\n";
       
        countVTS(_data);
        var SendNotes = convertToNotes(_data);
        var ord = convertToOrderNotes(_data);

        console.log(vtsCounter);
        vtsCounter = 0;
     
        notes = msh + pdi + SendNotes + ord;
        console.log(notes);

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

                var d = data.trim();
                console.log(data);
                if (d === '|1|') {
                    clearCIS();
                    alert('Patient has been ' + statusDesc);
                } else if (d === '|3|') {
                    clearCIS();
                    alert('Patient record has been ' + statusDesc);
                }
            },
            error: function (err) {
                console.log(err)
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
                //console.log(result);
                if (result.trim() === "|O|") {
                    alert("No patient in queue");
                } else {
                    var nextPArry = result.trim().split("|");
                    pmiNo = nextPArry[0];
                    episodeDate = nextPArry[1];

                    findPatient(pmiNo, episodeDate);
                    $('.soap-select').unbind('click');
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


    function getSettingConsult(user_id) {
        var checkCCN = false;
        var checkDGS = false;
        var checkDCG = false;
        
        console.log(cisParam);
        var cisSetting = spliceSetting(cisParam);
        console.log (cisSetting);
        
        for (i in cisSetting){
            if(cisSetting[i] === "CCN"){
                checkCCN = true;
            } else if(cisSetting[i] === "DGS"){
                checkDGS = true;
            } else if(cisSetting[i] === "DCG"){
                checkDCG = true;
            }
        }
        
       console.log(checkCCN);
       console.log(checkDGS);
       console.log(checkDCG);
        
        var dataDischarge = getStatusData(_data);
        console.log(dataDischarge);
        
        
        //111
        if (checkCCN === true && checkDGS === true && checkDCG === true) {

            if (dataDischarge[0] === true && dataDischarge[1] === true && dataDischarge[2] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false ) {
                alert("Need to add Chief Complain");
            } else if (dataDischarge[1] === false ) {
                alert("Need to add Diagnosis");
            } else if (dataDischarge[2] === false ) {
                alert("Need to add Discharge Summary");
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
                alert("Need to add Diagnosis");
            } else if (dataDischarge[2] === false) {
                alert("Need to add Discharge Summary");
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
            }  else if (dataDischarge[2] === false) {
                alert("Need to add Discharge Summary");
            }
            //010
        }else if (checkCCN === false && checkDGS === true && checkDCG === false) {

            if (dataDischarge[1] === true ) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
                }
            }  else if (dataDischarge[1] === false ) {
                alert("Need to add Diagnosis");
            } 
            //000
        } else if (checkCCN === true && checkDGS === false && checkDCG === false) {

            if (dataDischarge[0] === true ) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false ) {
                alert("Need to add Chief Complain");
            } 
            //100
        } else if (checkCCN === true && checkDGS === false && checkDCG === true) {

            if (dataDischarge[0] === true && dataDischarge[2] === true) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false ) {
                alert("Need to add Chief Complain");
            } else if (dataDischarge[2] === false ) {
                alert("Need to add Discharge Summary");
            }
            //101
        } else if (checkCCN === true && checkDGS === true && checkDCG === false) {

            if (dataDischarge[0] === true && dataDischarge[1] === true ) {
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
                }
            } else if (dataDischarge[0] === false ) {
                alert("Need to add Chief Complain");
            } else if (dataDischarge[1] === false ) {
                alert("Need to add Diagnosis");
            } 
            //110
        }  else if (checkCCN === false && checkDGS === false && checkDCG === false) {
            
                var c = confirm("Are you sure you want DISCHARGE this patient?");
                if (c === true) {
                    storeData(1);
                } else {
                    alert('Discharge Cancel');
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
            }else if (data[key].Acode === "DCG") {
                sDCG = true;
            }
        }

        return [sCCN, sDGS,sDCG];
    }
    
    
    
    //discharge ada DCG
    
    
      
    
function dataToCCN(episodeDate, ccnCode, problem, Mild, duration, sdur, site, Laterality, comment, currentDate, hfc_cd, doctor_id, doctor_name){
    var ccn = "CCN|" + episodeDate + "|" +ccnCode + "^" + problem + "^^" + Mild + "^" + duration +" "+ sdur + "^^^^" + site + "^^" + Laterality + "^" + comment + "^^^" + currentDate + "^" + hfc_cd + "^"+ doctor_id +"^" + doctor_name + "^^^|<cr>\n";
    return ccn;
}

    function getGeneralNotesDCG(data) {
  var dcgNotes = "";
        for (var key in data) {
            if (data[key].Acode === "CCN") {
               //processNotes +=  dataToCCN(episodeDate, data[key].ccnCode,  data[key].problem,  data[key].Mild,  data[key].duration, data[key].sdur,  data[key].Site, data[key].Laterality, data[key].Comment,  getDate(), hfc_cd, doctor_id, doctor_name);
              dcgNotes += "CCN|" + episodeDate + "|" + data[key].ccnCode + "^" + data[key].problem + "^^" + data[key].Mild + "^" + data[key].duration +" "+ data[key].sdur + "^^^^" + data[key].Site + "^^" + data[key].Laterality + "^" + data[key].Comment + "^^^" + getDate() + "^" + hfc_cd + "^"+ doctor_id +"^" + doctor_name + "^^^|<cr>\n";
                ccn_cd.push(data[key].ccnCode+"|"+data[key].problem);
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
                dgs_cd.push(data[key].dgsCode+"|"+data[key].searchDiag);
                finalDiagnosis =  data[key].dgsCode + "^" + data[key].searchDiag;
            } else if (data[key].Acode === "PNT") {
                dcgNotes += "PNT|" + episodeDate + "|" + data[key].PNT + "^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PRI") {
                dcgNotes += "PRI|" + getDate() + "|^^" + data[key].appREF + "^"+data[key].hfcREFcode+"^"+data[key].REF+"^"+data[key].disREFcode+"^"+data[key].disREF+"^^^^^"+data[key].medicalHisREF+"^^" + getDate() +  "^" + data[key].docREFcode + "^" + data[key].docREF+"|<cr>\n";
            } else if (data[key].Acode === "MEC") {
                       var ccnProblem =   getProblem(ccn_cd);
                       var dgsProblem =  getProblem(dgs_cd);
                dcgNotes += "MEC|" + episodeDate+ "|" + dgsProblem +"ICD10^^"+ ccnProblem + "ICD10^^^"+data[key].num1MEC+"^"+data[key].num2MEC+"^"+data[key].DateFromMEC + "^" + data[key].DateToMEC+"^^^^"+hfc_cd + "^" + doctor_id + "^" + doctor_name+"|<cr>\n";
            }else if (data[key].Acode === "FLU") {
                dcgNotes += "ARQ|" + episodeDate + "|^^" + data[key].DateFollowUp + "^"+hfc_cd+"^"+hfc_name+"^"+discipline+"^"+disciplineName+"^^^^^"+data[key].commentFLU+"^^" + getDate() +  "^" + data[key].docFLUCode + "^" + data[key].searchFLU+"|<cr>\n";
            }
        }
        

        return dcgNotes;
    }
    
    
    function getOrderNotesDCG(data) {
        var orderNotes = ""
        
      var ccnProblem =   getProblem(ccn_cd);
       var dgsProblem =  getProblem(dgs_cd);
//       console.log(ccn);
//       console.log(dgs);
        var orderNotesROS = "";
        var orderNotesDTO = "";
        var orderNotesLIO = "";
        var orderNotesPOS = "";
          var orderNotesMON = "";
            var orderNotesADW = "";
        for (var key in data) {
            if (data[key].Acode === "ROS") {
                if(orderNotesROS === ""){
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    var orc = getORC("T12102", "", "", "NO", data[key].priorityROS, getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "06", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                            
                            
                            orderNotesROS = orc + "ROS|"+ ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|"+ data[key].appointmentROS +"|"+ data[key].hfcIdROS +"^"+ data[key].hfcROS +"^PSDD|038^" + data[key].priorityROScd +"^" + data[key].priorityROS +"|096^" + data[key].patientConditionROSCd +"^" + data[key].patientConditionROS +"|"+ data[key].commentROS +  "|" + getRRI();
                }else {
                     orderNotesROS += "ROS|"+ ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|"+ data[key].appointmentROS +"|"+ data[key].hfcIdROS +"^"+ data[key].hfcROS +"^PSDD|038^" + data[key].priorityROScd +"^" + data[key].priorityROS +"|096^" + data[key].patientConditionROSCd +"^" + data[key].patientConditionROS +"|"+ data[key].commentROS +  "|" + getRRI();
                }
            } else if (data[key].Acode === "DTO") {
                //                                problem code and desc            request drug code 
                var problemDTO = "DTO|" +finalDiagnosis+ "^ICD10|";
                var drug =  data[key].drugCode + "^ " + data[key].drugName + "^MDC|"; 
                var drugForm = data[key].drugForm+ "^"+data[key].drugForm+"^MDC|";
                var drugRoute =  "0066^" + data[key].drugRoute + "^"+ data[key].drugRoute+"|";
                var drugFrequency = "^" + data[key].drugFrequencyDetail + "^SG|" ;
                var drugFrequecyUnit = data[key].drugFrequency + "|";
                var drugDosage = data[key].drugDose+" "+data[key].drugDoseUnit+"|";
                var drugStrength = data[key].drugStrength+" "+data[key].drugStrengthUnit+"|";
                var drugUOM = "0025^"+data[key].drugStrengthUnit+"^"+data[key].uomCode+"|";
                var drugDuration = data[key].drugDuration+"^"+data[key].drugDurationUnit+"|";
                var quantity = data[key].drugQuantity + "|";
                var theRest = hfc_cd+"^"+hfc_name+"^PSDD|" + data[key].remark + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^"+disciplineName+"^" + subdis + "^"+subdisName+"^" + "|"+data[key].comment+"|<cr>\n";
              
                if (orderNotesDTO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    var orc = getORC("T12100", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "04", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    orderNotesDTO = orc + problemDTO + drug + drugForm+drugRoute+drugFrequency+drugFrequecyUnit+drugDosage+drugStrength+drugUOM+drugDuration+quantity+theRest;
                } else {
                    orderNotesDTO += problemDTO + drug + drugForm+drugRoute+drugFrequency+drugFrequecyUnit+drugDosage+drugStrength+drugUOM+drugDuration+quantity+theRest;
                }

            } else if (data[key].Acode === "LOS") {
                
                if (orderNotesLIO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                        var orc = getORC("T12101", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesLIO = orc +  "LIO|"  +finalDiagnosis+ "^ICD10|"+ data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                } else {
                      orderNotesLIO += "LIO|"  +finalDiagnosis+ "^ICD10|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                }
               
            } else if (data[key].Acode === "POS") {
                
                if (orderNotesPOS === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    
                    var orc = getORC("T12103", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "18", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10],hfcPFDetail[12],hfcPFDetail[14],hfcPFDetail[13],hfcPFDetail[8],hfcPFDetail[9], "-");
                    orderNotesPOS = orc +"POS|" +finalDiagnosis+ "^ICD10|"+ "^" + data[key].procedure_cd +"^"+ data[key].Problem18 +  "^ICD10-PCS||"+data[key].proType+"|||||"+hfc_cd+"|"+hfc_name+"||hfc_cd_receiving|<cr>\n";
                } else {
                    orderNotesPOS += "POS|" +finalDiagnosis+ "^ICD10|" + "^" + data[key].procedure_cd +"^"+ data[key].Problem18 +  "^ICD10-PCS||"+data[key].proType+"|||||"+hfc_cd+"|"+hfc_name+"||hfc_cd_receiving|<cr>\n";
                }
               
            }else if (data[key].Acode === "MON") {
                
              if (orderNotesMON === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                    var orc = getORC("T12107", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "05", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

                    orderNotesMON = orc +   "MOR|"+finalDiagnosis+" | "+data[key].codeMON+"^"+data[key].searchMON+" | " +getDate()+" |  |  | "+doctor_id+"| "+doctor_name+" | | "+discipline+" | "+disciplineName+" | | "+data[key].MONHFC_cd+"|<cr>\n";
                } else {
                      orderNotesMON +=  "MOR|"+finalDiagnosis+" | "+data[key].codeMON+"^"+data[key].searchMON+" | " +getDate()+" |  |  | "+doctor_id+"| "+doctor_name+"| | "+discipline+" | "+disciplineName+" |  | "+data[key].MONHFC_cd+"|<cr>\n";
                }
        
            }else if (data[key].Acode === "ADW") {
                 if (orderNotesADW === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    
                     var orc = getORC("T12111", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "02", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", "07", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
                    
                    orderNotesADW = orc +    "ADW|"+episodeDate+"|"+data[key].AdmitDate+" "+data[key].AdmitTime+"^" +data[key].AdmitToDisciplineCd+"^"+data[key].AdmitToDiscipline+"^"+"ST-UD"+"^"+data[key].WardNameCd+"^"+data[key].WardName+"^"+"ST-UD"+"^"+data[key].Reason+"^"+data[key].PatientReferFromCd+"^active^"+data[key].AdmittedBefore+"^"+getDate()+"^"+ hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                } else {
                      orderNotesADW +=   "ADW|"+episodeDate+"|"+data[key].AdmitDate+" "+data[key].AdmitTime+"^" +data[key].AdmitToDisciplineCd+"^"+data[key].AdmitToDiscipline+"^"+"ST-UD"+"^"+data[key].WardNameCd+"^"+data[key].WardName+"^"+"ST-UD"+"^"+data[key].Reason+"^"+data[key].PatientReferFromCd+"^active^"+data[key].AdmittedBefore+"^"+getDate()+"^"+ hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
                }
          
            }
        }
        orderNotes = orderNotesROS + orderNotesDTO + orderNotesLIO + orderNotesPOS + orderNotesMON + orderNotesADW;
        orderNotesROS="";
        orderNotesDTO="";
        orderNotesLIO="";
        orderNotesPOS="";
        orderNotesMON="";
        orderNotesADW = ""
        return orderNotes;
    }
    
    function getDGCItem(index){
        var dcgData = [];
            for(var x in index){
                if(_data[index[x]].Acode !== "VTS"){
                     dcgData.push(_data[index[x]]);
                } 
          }
          return dcgData;
    }
    
        function getDCGVTS(index){
            for(var x in index){
                if(_data[index[x]].Acode === "VTS"){
                     $.extend(dcgVtsObj,_data[index[x]]);
                }
          }
           
    }
    
    function getSizeObj(Obj){
        var len = 0;
        for (var o in Obj) {
            len++;
        }
        return len;
    }

    
    
});
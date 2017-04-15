/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var processNotes = "";
var ccn_cd = [];
var dgs_cd = [];
var ORCObj  = {};

var hfcDetailOrder = ["a"];
var orderDetail1 = "";
var providerDetail1 = "";


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
        reloadStat = 0;
//        getORCHFCDetail("04010102", "04010101");
//        console.log(ORCObj);
//       var orc =  getORC("transectionCode","orderNo","fillerOrderNo","orderStatus", "orderPriority", "orderDateTime", "episodeDate", "encounterDateTime", "enterBy", "verifiedBy", "OPD", "orderHFC", "orderDis", "orderSub","orderApp", "orderHFCAdd1",
//        "orderHFCAdd2", "orderHFCAdd3", "orderHFCtown", "orderHFCDistrict", "orderHFCState", "orderHFCCountry","orderHFCPostcode", "orderHFCPhoneNo", "providerHFC", "providerDis","providerSub","providerApp", "providerAdd1", 
//        "providerAdd2","providerAdd3", "providerTown");
//        console.log(orc);
        var pmiNo = $('#pmiNumber').text();
       
        getSettingConsult(doctor_id);
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
        PEMNotes = "PEM|2015-01-16  16:27:58|^^" + PECd + "^" + newPENotes + "^^" + Comment + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
        return PEMNotes;
    }

    function convertToOrderNotes(data) {
      var ccnProblem =   getProblem(ccn_cd);
       var dgsProblem =  getProblem(dgs_cd);
//       console.log(ccn);
//       console.log(dgs);
        var orderNotesROS = "";
        var orderNotesDTO = "";
        var orderNotesLIO = "";
        var orderNotesPOS = "";
        for (var key in data) {
            if (data[key].Acode === "ROS") {
                if(orderNotesROS === ""){
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    var orc = getORC("T12102", "", "", "NO", data[key].priorityROS, getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd,discipline, subdis, "RIS", hfcOFDetail[1],
                            hfcOFDetail[2],hfcOFDetail[3],hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[7],hfcOFDetail[9], hfcPFDetail[0], "-", "", "RIS", hfcPFDetail[1],
                            hfcPFDetail[2],hfcPFDetail[3], hfcPFDetail[10]);
                            orderNotesROS = orc + "ROS|"+ ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|"+ data[key].appointmentROS +"|"+ data[key].hfcIdROS +"^"+ data[key].hfcROS +"^PSDD|038^" + data[key].priorityROScd +"^" + data[key].priorityROS +"|096^" + data[key].patientConditionROSCd +"^" + data[key].patientConditionROS +"|"+ data[key].commentROS +  "|" + getRRI();
                }else {
                     orderNotesROS += "ROS|"+ ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeROS + "^" + data[key].ROS + "^ICD10-PCS|"+ data[key].appointmentROS +"|"+ data[key].hfcIdROS +"^"+ data[key].hfcROS +"^PSDD|038^" + data[key].priorityROScd +"^" + data[key].priorityROS +"|096^" + data[key].patientConditionROSCd +"^" + data[key].patientConditionROS +"|"+ data[key].commentROS +  "|" + getRRI();
                }
            } else if (data[key].Acode === "DTO") {
                var note1 = "DTO|" + ccnProblem + "" + dgsProblem + "CTV3|" + data[key].dtoCode + "^ " + data[key].searchDTO + "^MDC|" + data[key].drugNameDTO;
                var note2 = "^^^MDC|066^^" + data[key].dRouteDTO + "|^" + data[key].drugFrequencyDTO + "^SG|" + data[key].unitDTO + "|" + data[key].doseDTO + "|" + data[key].drugStrDTO;
                var note3 = "|025^^" + data[key].drugInstructionDTO + "|" + data[key].durationDTO + "|" + data[key].drugQtyDTO + "|hfcSendCode^hfcSendName^PSDD|" + data[key].cautionaryDTO + "^" + data[key].commentDTO + "|" + getRRI();
                if (orderNotesDTO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    var orc = getORC("T12100", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "RIS", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[7], hfcOFDetail[9], hfcPFDetail[0], "-", "", "RIS", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10]);
                    orderNotesDTO = orc + note1 + note2 + note3;
                } else {
                    orderNotesDTO += note1 + note2 + note3;
                }

            } else if (data[key].Acode === "LOS") {
                if (orderNotesLIO === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    var orc = getORC("T12102", "", "", "NO", data[key].priority, getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "RIS", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[7], hfcOFDetail[9], hfcPFDetail[0], "-", "", "RIS", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10]);
                    orderNotesLIO = orc +  "LIO|"  + ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                } else {
                      orderNotesLIO += "LIO|"  + ccnProblem + "" + dgsProblem + "CTV3|" + data[key].codeLOS + "^" + data[key].searchLOS + "^ICD10-PCS|" + data[key].appointmentLOS + "|038^" + data[key].priority + "^" + data[key].priorityLOScd + "|096^" + data[key].patientConditionLOScd + "^" + data[key].patientCondition + "|" + data[key].hfcIdLOS + "^" + data[key].hfcLOS + "^PSDD|" + data[key].commentLOS + "|" + getRRI();
                }
                //var search = data[key].catLOS.split("/");
               
            } else if (data[key].Acode === "POS") {
                if (orderNotesPOS === "") {
                    var hfcOFDetail = data[key].hfcOrderDetail.split("|");
                    var hfcPFDetail = data[key].hfcProviderDetail.split("|");
                    var orc = getORC("T12102", "", "", "NO", "-", getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, "RIS", hfcOFDetail[1],
                            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[7], hfcOFDetail[9], hfcPFDetail[0], "-", "", "RIS", hfcPFDetail[1],
                            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10]);
                    orderNotesPOS = orc +"POS|" + ccnProblem + "" +  "CTV3|" + "^" + data[key].procedure_cd +"^"+ data[key].Problem18 +  "^ICD10-PCS||"+data[key].proType+"|||||"+hfc_cd+"|"+hfc_name+"||hfc_cd_receiving|<cr>\n";
                } else {
                    orderNotesPOS += "POS|" + ccnProblem + "" +  "CTV3|" + "^" + data[key].procedure_cd +"^"+ data[key].Problem18 +  "^ICD10-PCS||"+data[key].proType+"|||||"+hfc_cd+"|"+hfc_name+"||hfc_cd_receiving|<cr>\n";
                }
               
            }
        }
        var orderNotes = orderNotesROS+orderNotesDTO+orderNotesLIO+orderNotesPOS;
        orderNotesROS="";
        orderNotesDTO="";
        orderNotesLIO="";
        orderNotesPOS="";
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
    
    function getORC(transectionCode,orderNo,fillerOrderNo,orderStatus, orderPriority, orderDateTime, episodeDate, encounterDateTime, enterBy, verifiedBy, OPD, orderHFC, orderDis, orderSub,orderApp, orderHFCAdd1,
    orderHFCAdd2, orderHFCAdd3, orderHFCtown, orderHFCDistrict, orderHFCState, orderHFCCountry,orderHFCPostcode, orderHFCPhoneNo, providerHFC, providerDis,providerSub,providerApp, providerAdd1, 
    providerAdd2,providerAdd3, providerTown){
        var orc = "";
        var  orc1 = "ORC|"+transectionCode+"|"+orderNo+"|"+fillerOrderNo+"|"+orderStatus+"|"+orderPriority+"|"+orderDateTime+"|"+episodeDate+"|"+encounterDateTime+"|"+enterBy+"|"+verifiedBy+"|"+OPD+"|"+orderHFC+"|"+orderDis;
        var orc2  =   "|"+orderSub+"|"+orderSub+"|"+orderApp+"|"+orderHFCAdd1+"|"+orderHFCAdd2+"|"+orderHFCAdd3+"|"+orderHFCtown+"|"+orderHFCDistrict+"|"+orderHFCState+"|"+orderHFCCountry+"|"+orderHFCPostcode;
        var orc3 = "|"+orderHFCPhoneNo+"|"+providerHFC+"|"+providerDis+"|"+providerSub+"|"+providerApp+"|"+providerAdd1+"|"+providerAdd2+"|"+providerAdd3+"|"+providerTown+ "|<cr>\n";
        orc = orc1+orc2+orc3;
        return orc;
    }
    


    function convertToNotes(data) {

       console.log(ccnProblem);
       console.log(dgsProblem);
        for (var key in data) {
            if (data[key].Acode === "CCN") {
                processNotes += "CCN|" + getDate() + "|^" + data[key].ccnCode + "^" + data[key].problem + "^^" + data[key].Mild + "^" + data[key].duration + "^^" + data[key].sdur + "^^" + data[key].Site + "^^" + data[key].Laterality + "^" + data[key].Comment + "|<cr>\n";
                ccn_cd.push(data[key].ccnCode+"|"+data[key].problem);
            } else if (data[key].Acode === "HPI") {
                processNotes += "HPI|" + getDate() + "|" + data[key].details + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PMH") {
                processNotes += "PMH|" + getDate() + "|" + data[key].codePMH + "^" + data[key].Problem1 + "^^^^" + data[key].comment1 + "^^^" + data[key].Status + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "FMH") {
                processNotes += "FMH|" + getDate() + "|" + data[key].f_relationship + "^" + data[key].codeFMH + "^" + data[key].Problem3 + "^^^^" + data[key].comment2 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^|<cr>\n";
            } else if (data[key].Acode === "SOH") {
                processNotes += "SOH|" + getDate() + "|" + data[key].codeSOH + "^" + data[key].Problem4 + "^^^^^^" + data[key].date + "^^^^" + data[key].comment3 + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "BLD") {
                processNotes += "BLD|" + getDate() + "|" + data[key].blood + "^" + data[key].Rhesus_Type + "^" + data[key].G6PD_Status + "^" + data[key].comment4 + "|<cr>\n";
            } else if (data[key].Acode === "ALG") {
                processNotes += "ALG|" + getDate() + "|" + data[key].codeALG + "^" + data[key].Problem5 + "^" + data[key].date1 + "^" + data[key].comment5 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "IMU") {
                processNotes += "IMU|" + getDate() + "|" + data[key].codeIMU + "^" + data[key].Problem6 + "^" + data[key].date2 + "^" + data[key].comment6 + "^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
            } else if (data[key].Acode === "DAB") {
                processNotes += "DAB|" + getDate() + "|" + data[key].codeDAB + "^" + data[key].Problem32 + "^" + data[key].date3 + "^^^" + data[key].comment7 + "|<cr>\n";
            } else if (data[key].Acode === "VTS") {
                $.extend(VTSObj, data[key]);
            } else if (data[key].Acode === "PEM") {
                var peFnote = convertPEM(data[key]);
                processNotes += peFnote;
            } else if (data[key].Acode === "DGS") {
                processNotes += "DGS|" + getDate() + "|" + data[key].TypeDGS + "^^^" + data[key].dateDGS + "^^^" + data[key].dgsCode + "^" + data[key].searchDiag + "^^" + data[key].SeverityDGS + "^^" + data[key].SiteDGS + "^^^^" + data[key].LateralityDGS + "^^^" + data[key].commentDGS + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
                dgs_cd.push(data[key].dgsCode+"|"+data[key].searchDiag);
            } else if (data[key].Acode === "PNT") {
                processNotes += "PNT|" + getDate() + "|" + data[key].PNT + "^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
            } else if (data[key].Acode === "PRI") {
                processNotes += "PRI|" + getDate() + "|^^" + data[key].appREF + "^"+data[key].hfcREFcode+"^"+data[key].REF+"^"+data[key].disREFcode+"^"+data[key].disREF+"^^^^^"+data[key].medicalHisREF+"^^" + getDate() +  "^" + data[key].docREFcode + "^" + data[key].docREF+"|<cr>\n";
            } else if (data[key].Acode === "MEC") {
                       var ccnProblem =   getProblem(ccn_cd);
                       var dgsProblem =  getProblem(dgs_cd);
                processNotes += "MEC|" + getDate() + "|" + dgsProblem +"ICD10^"+ ccnProblem + "ICD10^^^"+data[key].num1MEC+"^"+data[key].num2MEC+"^"+data[key].DateFromMEC + "^" + data[key].DateToMEC+"^^^^"+hfc_cd + "^" + doctor_id + "^" + doctor_name+"|<cr>\n";
            }else if (data[key].Acode === "FLU") {

                processNotes += "ARQ|" + getDate() + "|^^" + data[key].DateFollowUp + "^"+hfc_cd+"^"+hfc_name+"^"+discipline+"^"+disciplineName+"^^^^^"+data[key].commentFLU+"^^" + getDate() +  "^" + data[key].docFLUCode + "^" + data[key].searchFLU+"|<cr>\n";
            }

        }
        
        if(vtsCounter === 0){
            VTSNotes = '';
        }else {
            var VTSNotes = convertVTS(VTSObj);
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

        var msh = "MSH|^~|CIS|" + hfc_cd + "^" + discipline + "^" + subdis + "||" + getDate() + "|||||||||||||<cr>\n";
        var pdi = PDIInfo + "|<cr>\n";
       
        countVTS(_data);
        var SendNotes = convertToNotes(_data);
        var ord = convertToOrderNotes(_data);

        console.log(vtsCounter);
        vtsCounter = 0;

        console.log(_data);
        


        notes = msh + pdi + SendNotes + ord;
        
        //console.log(ccn_cd);
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


    function getSettingConsult(user_id) {
        var checkCCN = false;
        var checkDGS = false;

        $.ajax({
            url: 'setting/LoadSetting.jsp',
            method: "POST",
            timeout: 5000,
            data: {
                userId: user_id
            },
            success: function (result) {
                if (result.trim() === "|O|") {
                    alert("You not set up your consultation yet. You need set up before consult the patient");
                    $("#settingModal").modal("toggle");
                } else {
                    var Dsetting = result.trim().split("^");

                    for (var i = 0; i < Dsetting.length; i++) {
                        var set = Dsetting[i].split("|");
                        if (set[0] === "CCN") {
                            if (set[1] === "1") {
                                checkCCN = true;
                            }
                        } else if (set[0] === "DGS") {
                            if (set[1] === "1") {
                                checkDGS = true;
                            }
                        }
                    }
                    
                    var dataDischarge = getStatusData(_data);

                    if (checkCCN === true && checkDGS === true) {
                        if (dataDischarge[0] === true && dataDischarge[1] === true) {
                            var c = confirm("Are you sure you want DISCHARGE this patient?");
                            if (c === true) {
                                storeData(1);
                            } else {
                                alert('Discharge Cancel');
                            }

                        } else if (dataDischarge[0] === false && dataDischarge[1] === true) {
                            alert("Need to add CCN");
                        } else if (dataDischarge[0] === true && dataDischarge[1] === false) {
                            alert("Need to add DGS");
                        } else if (dataDischarge[0] === false && dataDischarge[1] === false) {
                            alert("Need to add CCN and DGS");
                        }

                    } else if (checkCCN === false && checkDGS === true) {
                        if (dataDischarge[1] === true) {
                            var c = confirm("Are you sure you want DISCHARGE this patient?");
                            if (c === true) {
                                storeData(1);
                            } else {
                                alert('Discharge Cancel');
                            }
                        } else if (dataDischarge[1] === false) {
                            alert("Need to add DGS");
                        }

                    } else if (checkCCN === true && checkDGS === false) {
                        if (dataDischarge[0] === true) {
                            var c = confirm("Are you sure you want DISCHARGE this patient?");
                            if (c === true) {
                                storeData(1);
                            } else {
                                alert('Discharge Cancel');
                            }
                        } else if (dataDischarge[0] === false) {
                            alert("Need to add CCN");
                        }
                    }
                }
            }
        });
    }


    function getStatusData(data) {
        var sCCN = false;
        var sDGS = false;

        for (var key in data) {
            if (data[key].Acode === "CCN") {
                sCCN = true;
            } else if (data[key].Acode === "DGS") {
                sDGS = true;
            }
        }

        return [sCCN, sDGS];
    }
});
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getMSH(){
    var msh = "MSH|^~|02|" + hfc_cd + "^" + discipline + "^" + subdis + "||" + getDate() + "|||||||||||||<cr>\n";
    return msh;
}

function convertCCN(obj){
    var msg = "CCN|" + episodeDate + "|" + obj.ccnCode + "^" + obj.problem + "^^" + obj.Mild + "^" + obj.duration +" "+ obj.sdur + "^^^^" + obj.Site + "^^" + obj.Laterality + "^" + obj.Comment + "^^^" + getDate() + "^" + hfc_cd + "^"+ doctor_id +"^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertHPI(obj){
    var msg = "HPI|" + episodeDate + "|" + obj.details + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
    return msg;
}

function convertPMH(obj){
    var msg = "PMH|" + episodeDate + "|" + obj.codePMH + "^" + obj.Problem1 + "^^^^" + obj.comment1 + "^^^" + obj.Status + "^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertFMH(obj){
    var msg = "FMH|" + episodeDate + "|" + obj.f_relationship + "^" + obj.codeFMH + "^" + obj.Problem3 + "^^^^" + obj.comment2 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^|<cr>\n";
    return msg;
}

function convertSOH(obj){
  var msg = "SOH|" + episodeDate + "|" + obj.codeSOH + "^" + obj.Problem4 + "^^^^^^" + obj.date + "^^^^" + obj.comment3 + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
  return msg;
}

function convertBLD(obj){
    var msg = "BLD|" + episodeDate + "|" + obj.blood + "^" + obj.Rhesus_Type + "^" + obj.G6PD_Status + "^" + obj.comment4 + "|<cr>\n";
    return msg;
}

function convertALG(obj){
    var msg = "ALG|" + episodeDate + "|" + obj.codeALG + "^" + obj.Problem5 + "^" + obj.date1 + "^" + obj.comment5 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertIMU(obj){
   var msg =  "IMU|" + episodeDate + "|" + obj.codeIMU + "^" + obj.Problem6 + "^" + obj.date2 + "^" + obj.comment6 + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
   return msg;
}

function convertDAB(obj){
   var msg =  "DAB|" + episodeDate + "|" + obj.codeDAB + "^" + obj.Problem32 + "^" + obj.date3 + "^" + obj.comment7 + "^^|<cr>\n";
   return msg;
}

function convertDGS(obj){
    var msg = "DGS|" + episodeDate + "|" + obj.TypeDGS + "^^^" + obj.dateDGS + "^^^" + obj.dgsCode + "^" + obj.searchDiag + "^^" + obj.SeverityDGS + "^^" + obj.SiteDGS + "^^^^" + obj.LateralityDGS + "^^^" + obj.commentDGS + "^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertPNT(obj){
   var msg =  "PNT|" + episodeDate + "|" + obj.PNT + "^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
   return msg;
}

function convertMEC(obj,ccnProblem,dgsProblem){
    
    var msg = "MEC|" + episodeDate+ "|" + dgsProblem +"ICD10^^"+ ccnProblem + "ICD10^^^"+obj.num1MEC+"^"+obj.num2MEC+"^"+obj.DateFromMEC + "^" + obj.DateToMEC+"^^^^"+hfc_cd + "^" + doctor_id + "^" + doctor_name+"|<cr>\n";
    return msg
}

function convertARQ(obj){
    var msg = "ARQ|" + episodeDate + "|^^" + obj.DateFollowUp + "^"+hfc_cd+"^"+hfc_name+"^"+discipline+"^"+disciplineName+"^^^^^"+obj.commentFLU+"^^" + getDate() +  "^" + obj.docFLUCode + "^" + obj.searchFLU+"|<cr>\n";
    return msg;
}

function convertROS(obj){
   var msg =  "ROS|"+ obj.problemCode +"^"+obj.problemName+"^CTV3|" + obj.codeROS + "^" + obj.ROS + "^ICD10-PCS|"+ obj.appointmentROS +"|"+ obj.hfcIdROS +"^"+ obj.hfcROS +"^PSDD|038^" + obj.priorityROScd +"^" + obj.priorityROS +"|096^" + obj.patientConditionROSCd +"^" + obj.patientConditionROS +"|"+ obj.commentROS +  "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^"+disciplineName+"^" + subdis + "^"+subdisName+"^" + "|<cr>\n";
   return msg;
}

function convertLIO(obj){
    var msg = "LIO|"  + obj.problemCode +"^"+obj.problemName+"^CTV3|"+ obj.codeLOS + "^" + obj.searchLOS + "^ICD10-PCS|" + obj.appointmentLOS + "|038^" + obj.priority + "^" + obj.priorityLOScd + "|096^" + obj.patientConditionLOScd + "^" + obj.patientCondition + "|" + obj.hfcIdLOS + "^" + obj.hfcLOS + "^PSDD|" + obj.commentLOS + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^"+disciplineName+"^" + subdis + "^"+subdisName+"^" + "|<cr>\n";
    return msg;
}

function convertPOS(obj){
    var procedureDisplay = getProcedureDisplay(obj.procedure)
    var msg ="POS|"  + obj.problemCode +"^"+obj.problemName+"^CTV3|"+ obj.procedureCode + "^"+procedureDisplay +"^ICD1-PCS|" + obj.date + "|038^" + obj.priority + "^" + obj.priorityCode + "|096^" + obj.patientConditionCode + "^" + obj.patientCondition + "||||" + hfc_cd + "|" + hfc_name + "|" + obj.comment + "|" + hfc_cd;
    return msg;
}

function convertADW(obj){
   var msg = "ADW|"+episodeDate+"|"+obj.AdmitDate+" "+obj.AdmitTime+"^" +obj.AdmitToDisciplineCd+"^"+obj.AdmitToDiscipline+"^"+"ST-UD"+"^"+obj.WardNameCd+"^"+obj.WardName+"^"+"ST-UD"+"^"+obj.Reason+"^"+obj.PatientReferFromCd+"^active^"+obj.AdmittedBefore+"^"+getDate()+"^"+ hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
   return msg;
}

function convertPRI(obj){
    //var msg = "PRI|" + getDate() + "|^^" + obj.appREF + "^"+obj.hfcREFcode+"^"+obj.REF+"^"+obj.disREFcode+"^"+obj.disREF+"^^^^^"+obj.medicalHisREF+"^^" + getDate() +  "^" + obj.docREFcode + "^" + obj.docREF+"|<cr>\n";
    var msg = "PRI|T12105|||"+episodeDate+"|"+encounterDate+"|"+"N|"+obj.priority+"|"+obj.type+"|"+obj.disposition+"|"+obj.category+"|"+obj.reason+"|"+obj.appREF+"||"+obj.medicalHisREF+"|"+obj.hfcREFcode+"^"+obj.REF+"^"+obj.disREFcode+"^"+obj.disREF+"^^^"+"|<cr>\n";
    return msg;
}

function convertMON(obj){
   var msg =  "MOR|" +  + obj.problemCode +"^"+obj.problemName+"^CTV3|"+  obj.codeMON + "^" + obj.searchMON + " | " + getDate() + " |  |  | " + doctor_id + "| " + doctor_name + " | | " + discipline + " | " + disciplineName + " | | " + data[key].MONHFC_cd + "|<cr>\n";
   return msg;
}

function convertDTO(obj){
    var problemDTO = "DTO|"  + obj.problemCode +"^"+obj.problemName+"^CTV3|";
    var drug = obj.drugCode + "^ " + obj.drugName + "^MDC|";
    var drugForm = obj.drugForm + "^" + obj.drugForm + "^MDC|";
    var drugRoute = "0066^" + obj.drugRoute + "^" + obj.drugRoute + "|";
    var drugFrequency = "^" + obj.drugFrequencyDetail + "^SG|";
    var drugFrequecyUnit = obj.drugFrequency + "|";
    var drugDosage = obj.drugDose + " " + obj.drugDoseUnit + "|";
    var drugStrength = obj.drugStrength + " " + obj.drugStrengthUnit + "|";
    var drugUOM = "0025^" + obj.drugStrengthUnit + "^" + obj.uomCode + "|";
    var drugDuration = obj.drugDuration + "^" + obj.drugDurationUnit + "|";
    var quantity = obj.drugQuantity + "|";
    var theRest = hfc_cd + "^" + hfc_name + "^PSDD|" + obj.remark + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^" + subdis + "^" + subdisName + "^" + "|" + obj.comment + "|<cr>\n";
   
    var msg = problemDTO + drug + drugForm+drugRoute+drugFrequency+drugFrequecyUnit+drugDosage+drugStrength+drugUOM+drugDuration+quantity+theRest;  
    return msg;
}

function convertDCG(obj,dischargeSummary){
    var msg = "DCG|" + episodeDate + "|" + episodeDate + "^" + hfc_cd + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + obj.date + " " + obj.time + "^" + obj.disposition + "^" + obj.comment + "^" + dischargeSummary + "|<cr>\n";
    return msg;
}

function convertORC(obj,moduleFrom,moduleTo,transectionCode){
    var hfcOFDetail = obj.hfcOrderDetail.split("|");
    var hfcPFDetail = obj.hfcProviderDetail.split("|");

    var orc = getORC(transectionCode, "", "", "NO", obj.priority, getDate(), episodeDate, encounterDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, moduleFrom, hfcOFDetail[1],
            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", moduleTo, hfcPFDetail[1],
            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
            
    return orc;
}

function getORC(transectionCode,orderNo,fillerOrderNo,orderStatus, orderPriority, orderDateTime, episodeDate, encounterDateTime, enterBy, verifiedBy, OPD, orderHFC, orderDis, orderSub,orderApp, orderHFCAdd1,
    orderHFCAdd2, orderHFCAdd3, orderHFCtown, orderHFCDistrict, orderHFCState, orderHFCCountry,orderHFCPostcode, orderHFCPhoneNo, providerHFC, providerDis,providerSub,providerApp, providerAdd1, 
    providerAdd2,providerAdd3, providerTown,providerDistrict,providerState,providerCountry,providerPostcode,providerPhoneNo, comment){
        var orc = "";
        var  orc1 = "\n ORC|"+transectionCode+"|"+orderNo+"|"+fillerOrderNo+"|"+orderStatus+"|"+orderPriority+"|"+orderDateTime+"|"+episodeDate+"|"+encounterDateTime+"|"+enterBy+"|"+verifiedBy+"|"+OPD+"|"+orderHFC+"|"+orderDis;
        var orc2  =   "|"+orderSub+"|"+orderSub+"|"+orderApp+"|"+orderHFCAdd1+"|"+orderHFCAdd2+"|"+orderHFCAdd3+"|"+orderHFCtown+"|"+orderHFCDistrict+"|"+orderHFCState+"|"+orderHFCCountry+"|"+orderHFCPostcode;
        var orc3 = "|"+orderHFCPhoneNo+"|"+providerHFC+"|"+providerDis+"|"+providerSub+"|"+providerApp+"|"+providerAdd1+"|"+providerAdd2+"|"+providerAdd3+"|"+providerTown+ "|"+providerDistrict+"|"+providerState+ "|"+providerCountry+ "|"+providerPostcode+ "|"+providerPhoneNo+ "|"+comment+ "|"+"<cr>\n";
        orc = orc1+orc2+orc3;
        return orc;
}

function getProcedureDisplay(procedure) {
    var procedureArray = procedure.split("[$-$]");
    var displayProcedure;
    if (procedureArray.length === 3) {
        displayProcedure = procedureArray[0] + "," + procedureArray[1] + "," + procedureArray[2];
    } else if (procedureArray.length === 2) {
        displayProcedure = procedureArray[0] + "," + procedureArray[1];
    } else {
        displayProcedure = procedureArray[0];
    }
    return displayProcedure;
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
         if (d.sitP === undefined) {
           d.sitP = "";
        }
        if (d.lyingP === undefined) {
            d.lyingP = "";
        }
        if (d.lyingS === undefined) {
            d.lyingS = "";
        }
        if (d.lyingD === undefined) {
            d.lyingD = "";
        }
        if (d.standP === undefined) {
            d.standP = "";
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
        if (d.rrRate === undefined) {
            d.rrRate = "";
        }
        
        var vtsNotes = "";
        vtsNotes += "VTS|" + episodeDate + "|" + d.BTemp + "^" + d.sitS + "^" + d.sitD + "^" + d.lyingS + "^" + d.lyingD + "^" + d.standS + "^" + d.standD + "^" + d.bmiWeight + "^" + d.bmiHeight + "^" + d.headCir + "^" + d.rrRate + "^" + d.pointMain + "^" + "^^^^^^^^^^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^" + d.pointMain + "^" + d.resultMain + "^" + d.pointpgcsMain + "^" + d.resultpgcsMain + "^" + d.OSat + "^" + d.painScale + "^" + d.bloodGlucose + "^" + d.sitP + "^" + d.lyingP + "^" + d.standP + "|<cr>\n";
        return vtsNotes;
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
    PEMNotes = "PEM|" + episodeDate + "|^^" + PECd + "^" + newPENotes + "^^" + Comment + "^^^^^" + getDate() + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
    return PEMNotes;
}

function getNotesDCG(data) {
    var dcgNotes = "";
    var objVTS = {};
    var counterVTS = 0;
    var vtsNotes = "";
    for (var key in data) {
        if (data[key].Acode === "CCN") {
            dcgNotes += convertCCN(data[key]);
        } else if (data[key].Acode === "HPI") {
            dcgNotes += convertHPI(data[key]);
        } else if (data[key].Acode === "PMH") {
            dcgNotes += convertPMH(data[key]);
        } else if (data[key].Acode === "FMH") {
            dcgNotes += convertFMH(data[key]);
        } else if (data[key].Acode === "SOH") {
            dcgNotes += convertSOH(data[key]);
        } else if (data[key].Acode === "BLD") {
            dcgNotes += convertBLD(data[key]);
        } else if (data[key].Acode === "ALG") {
            dcgNotes += convertALG(data[key]);
        } else if (data[key].Acode === "IMU") {
            dcgNotes += convertIMU(data[key]);
        } else if (data[key].Acode === "DAB") {
            dcgNotes += convertDAB(data[key]);
        }  else if (data[key].Acode === "PEM") {
            var peFnote = convertPEM(data[key]);
            dcgNotes += peFnote;
        } else if (data[key].Acode === "DGS") {
            dcgNotes += convertDGS(data[key]);
        } else if (data[key].Acode === "PNT") {
            dcgNotes += convertPNT(data[key]);
        }  else if (data[key].Acode === "MEC") {
            var ccnProblem = getCCNProblem(data);
            var dgsProblem = getDGSProblem(data);
            dcgNotes += convertMEC(data[key],ccnProblem,dgsProblem);
        } else if (data[key].Acode === "FLU") {
            dcgNotes += convertARQ(data[key]);
        } else if(data[key].Acode === "VTS"){
            counterVTS += 1;
             $.extend(objVTS, data[key]);
        }
    }
    
    if(counterVTS > 0 ){
        vtsNotes += convertVTS(objVTS);
        dcgNotes += vtsNotes;
    }else{
        dcgNotes;
    }
    
    return dcgNotes;
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

function getCCNProblem(data){
    var ccnProblem;
    var ccnArray = [];
    for(var i in data){
        if(data[i].Acode==="CCN"){
            ccnArray.push(data[i].ccnCode+"|"+data[i].problem);
        }
    }
    ccnProblem = getProblem(ccnArray);
    return ccnProblem;
}

function getDGSProblem(data){
    var dgsProblem;
    var dgsArray = [];
    for(var i in data){
        if(data[i].Acode === "DGS"){
            dgsArray.push(data[i].dgsCode+"|"+data[i].searchDiag);
        }
    }
    dgsProblem = getProblem(dgsArray);
    return dgsProblem;
}

function convertDCGMsgData(data){
    for (var i in data) {
        var NotesDCG = "";
        var dischargeSummary = "";
        var currentData = [data[i]];

        var dcgGeneralNotes = getNotesDCG(currentData);

            dischargeSummary = dcgGeneralNotes.trim();
            dischargeSummary = dischargeSummary.replace("<cr>", "");
            var message_type = dischargeSummary.substr(0, 3);
            NotesDCG += "DCG|" + episodeDate + "|" + episodeDate + "^" + hfc_cd + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + data[key].date + " " + data[key].time + "^" + data[key].disposition + "^" + data[key].comment + "^" + message_type + "|" + dischargeSummary + "|<cr>\n";
    }
    
    return NotesDCG;
}
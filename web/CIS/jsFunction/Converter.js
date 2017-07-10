/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getMSH(){
    var msh = "MSH|^~|02|" + hfc_cd + "^" + discipline + "^" + subdis + "||" + getDate() + "|||||||||||||<cr>\n";
    return msh;
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
    var msg = "PRI|" + getDate() + "|^^" + obj.appREF + "^"+obj.hfcREFcode+"^"+obj.REF+"^"+obj.disREFcode+"^"+obj.disREF+"^^^^^"+obj.medicalHisREF+"^^" + getDate() +  "^" + obj.docREFcode + "^" + obj.docREF+"|<cr>\n";
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
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

function convertORC(obj,moduleFrom,moduleTo){
    var hfcOFDetail = obj.hfcOrderDetail.split("|");
    var hfcPFDetail = obj.hfcProviderDetail.split("|");

    var orc = getORC("T12102", "", "", "NO", obj.priorityROS, getDate(), episodeDate, episodeDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, moduleFrom, hfcOFDetail[1],
            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", moduleTo, hfcPFDetail[1],
            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");
            
    return orc;
}

function getORC(transectionCode,orderNo,fillerOrderNo,orderStatus, orderPriority, orderDateTime, episodeDate, encounterDateTime, enterBy, verifiedBy, OPD, orderHFC, orderDis, orderSub,orderApp, orderHFCAdd1,
    orderHFCAdd2, orderHFCAdd3, orderHFCtown, orderHFCDistrict, orderHFCState, orderHFCCountry,orderHFCPostcode, orderHFCPhoneNo, providerHFC, providerDis,providerSub,providerApp, providerAdd1, 
    providerAdd2,providerAdd3, providerTown,providerDistrict,providerState,providerCountry,providerPostcode,providerPhoneNo, comment){
        var orc = "";
        var  orc1 = "ORC|"+transectionCode+"|"+orderNo+"|"+fillerOrderNo+"|"+orderStatus+"|"+orderPriority+"|"+orderDateTime+"|"+episodeDate+"|"+encounterDateTime+"|"+enterBy+"|"+verifiedBy+"|"+OPD+"|"+orderHFC+"|"+orderDis;
        var orc2  =   "|"+orderSub+"|"+orderSub+"|"+orderApp+"|"+orderHFCAdd1+"|"+orderHFCAdd2+"|"+orderHFCAdd3+"|"+orderHFCtown+"|"+orderHFCDistrict+"|"+orderHFCState+"|"+orderHFCCountry+"|"+orderHFCPostcode;
        var orc3 = "|"+orderHFCPhoneNo+"|"+providerHFC+"|"+providerDis+"|"+providerSub+"|"+providerApp+"|"+providerAdd1+"|"+providerAdd2+"|"+providerAdd3+"|"+providerTown+ "|"+providerDistrict+"|"+providerState+ "|"+providerCountry+ "|"+providerPostcode+ "|"+providerPhoneNo+ "|"+comment+ "|"+"<cr>\n";
        orc = orc1+orc2+orc3;
        return orc;
}
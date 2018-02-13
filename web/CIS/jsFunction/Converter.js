/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//--------------------------------NOTES TO OBJECT
function getObjectCCN(msg) {
    var CNNData = convertNoteToData(msg);
    var ccnsubData = CNNData[4].split(" ");
    var objCCN = {
        Acode: "CCN",
        ccnCode: CNNData[0],
        Laterality: CNNData[10],
        Site: CNNData[8],
        problem: CNNData[1],
        Mild: CNNData[3],
        duration: ccnsubData[0],
        sdur: ccnsubData[1],
        Comment: CNNData[11]
    };
    return objCCN;
}

function getObjectHPI(msg) {
    var HPIData = convertNoteToData(msg);
    var objHPI = {
        Acode: "HPI",
        details: HPIData[0],
        episodeDate: HPIData[1]
    }
    return objHPI;
}

function getObjectPMH(msg) {

    var PMHData = convertNoteToData(msg);
    var objPMH = {
        Acode: "PMH",
        codePMH: PMHData[0],
        Problem1: PMHData[1],
        Status: PMHData[8],
        comment1: PMHData[5]
    };
    return objPMH;
}

function getObjectFMH(msg) {
    var FMHData = convertNoteToData(msg);
    var objFMH = {
        Acode: "FMH",
        Problem3: FMHData[2],
        codeFMH: FMHData[1],
        comment2: FMHData[6],
        f_relationship: FMHData[0]
    };
    return objFMH;
}

function getObjectSOH(msg) {
    var SOHData = convertNoteToData(msg);
    var objSOH = {
        Acode: "SOH",
        Problem4: SOHData[1],
        codeSOH: SOHData[0],
        comment3: SOHData[11],
        date: SOHData[7]
    }
    return objSOH;

}

function getObjectBLD(msg) {

    var BLDData = convertNoteToData(msg);
    var objBLD = {
        Acode: "BLD",
        G6PD_Status: BLDData[2],
        Rhesus_Type: BLDData[1],
        blood: BLDData[0],
        comment4: BLDData[3],
        codeBLD: "BLD"

    };
    return objBLD;

}

function getObjectALG(msg) {

    var ALGData = convertNoteToData(msg);
    var objALG = {
        Acode: "ALG",
        Problem5: ALGData[1],
        codeALG: ALGData[0],
        comment5: ALGData[3],
        date1: ALGData[2]
    };
    return objALG;

}

function getObjectIMU(msg) {

    var IMUData = convertNoteToData(msg);
    var objIMU = {
        Acode: "IMU",
        codeIMU: IMUData[0],
        Problem6: IMUData[1],
        date2: IMUData[2],
        comment6: IMUData[3]
    };
    return objIMU;

}

function getObjectDAB(msg) {

    var DABData = convertNoteToData(msg);
    var objDAB = {
        Acode: "DAB",
        Problem32: DABData[1],
        codeDAB: DABData[0],
        comment7: DABData[5],
        date3: DABData[2]
    };
    return objDAB;
}

function getObjectMEC(msg){
    var MECData1 = msg.split("^ICD10");
    var MECData = MECData1[2].split("^");
    var objMEC = {
        Acode: "MEC",
        DateFromMEC: MECData[5],
        DateToMEC: MECData[6],
        num1MEC: MECData[3],
        num2MEC: MECData[4]
    };

    return objMEC;
}


function getObjectVTS(msg) {
    VTS = disSumNote;
    var VTSData = convertNoteToData(VTS);


    var scalePC = parseInt(VTSData[30]);
    var resultPC;
    if (scalePC === 0) {
        resultPC = "No Pain";
    } else if (scalePC > 0 && scalePC <= 2) {
        resultPC = "Mild";
    } else if (resultPC > 2 && scalePC <= 6) {
        resultPC = "Moderate";
    } else if (scalePC > 6 && scalePC <= 10) {
        resultPC = "Severe";
    }

    if (VTSData[25] !== "" || VTSData[26] !== "") {
        var objGCS = {
            Acode: "VTS",
            pointMain: VTSData[25],
            resultMain: VTSData[26]
        };


        dataObj = objGCS;
        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);
    }


    if (VTSData[27] !== "" || VTSData[27] !== "") {

        var objPGCS = {
            Acode: "VTS",
            pointpgcsMain: VTSData[27],
            resultpgcsMain: VTSData[28]
        };


        dataObj = objPGCS;
        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);

    }
    if (VTSData[4] === "" && VTSData[33] === "undefined" && VTSData[3] === "" && VTSData[2] === "" && VTSData[32] === "undefined" && VTSData[1] === "" && VTSData[6] === "" && VTSData[34] === "undefined" && VTSData[5] === "") {

    } else {

        var objBP = {
            Acode: "VTS",
            lyingD: VTSData[4],
            lyingP: VTSData[33],
            lyingS: VTSData[3],
            sitD: VTSData[2],
            sitP: VTSData[32],
            sitS: VTSData[1],
            standD: VTSData[6],
            standP: VTSData[34],
            standS: VTSData[5]
        };


        dataObj = objBP;
        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);
    }
    if (VTSData[10] === "" || VTSData[10] === "undefined") {
        //("no rrrate");
    } else {
        var objRRate = {
            Acode: "VTS",
            rrRate: VTSData[10]
        };


        dataObj = objRRate;
        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);
    }

    if (VTSData[29] === "" || VTSData[29] === "undefined") {
        //("no osat");
    } else {
        var objOsat = {
            Acode: "VTS",
            OSat: VTSData[29]
        };


        dataObj = objOsat;
        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);

    }

    if (VTSData[0] === "" || VTSData[0] === "undefined") {

    } else {
        var objBTemp = {
            Acode: "VTS",
            BTemp: VTSData[0]
        };


        dataObj = objBTemp;
        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);
    }

    if (VTSData[30] === "" || VTSData[30] === "undefined") {

    } else {
        var objPainScale = {
            Acode: "VTS",
            painScale: VTSData[30],
            resultPanScale: resultPC
        };


        dataObj = objPainScale;
        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);
    }

    if (VTSData[8] === "" && VTSData[7] === "" && VTSData[31] === "") {

    } else {
        var heightO = VTSData[8].split(" ");
        var weightO = VTSData[7].split(" ");
        var heightN = parseFloat(heightO[0]) / 100;
        heightN = heightN * heightN;
        var weightN = parseFloat(weightO[0]);

        var bmi = calcBMI(heightN, weightN);


        var objOther = {
            Acode: "VTS",
            bloodGlucose: VTSData[31],
            bmi: bmi[0],
            bmiHeight: VTSData[8],
            bmiStatus: bmi[1],
            bmiWeight: VTSData[7],
            headCir: VTSData[9]
        };


        dataObj = objOther;

    }

}




//-------------------------------------------OBJECT TO NOTES 
function getMSH(receiveApp, receiveHF) {
    var msh = "MSH|^~|02|" + hfc_cd + "^" + discipline + "^" + subdis + "|" + receiveApp + "|" + hfc_cd + "^" + discipline + "^" + subdis + "|" + getDate() + "||||||||||||<cr>\n";
    return msh;
}

function convertCCN(obj) {
    var msg = "CCN|" + episodeDate + "|" + obj.ccnCode + "^" + obj.problem + "^^" + obj.Mild + "^" + obj.duration + " " + obj.sdur + "^^^^" + obj.Site + "^^" + obj.Laterality + "^" + obj.Comment + "^" + getDate() + "^^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertHPI(obj) {
    var msg = "HPI|" + episodeDate + "|" + obj.details + "^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
    return msg;
}

function convertPMH(obj) {
    var msg = "PMH|" + episodeDate + "|" + obj.codePMH + "^" + obj.Problem1 + "^^^^" + obj.comment1 + "^^^" + obj.Status + "^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertFMH(obj) {
    var msg = "FMH|" + episodeDate + "|" + obj.f_relationship + "^" + obj.codeFMH + "^" + obj.Problem3 + "^^^^" + obj.comment2 + "^^^^^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^|<cr>\n";
    return msg;
}

function convertSOH(obj) {
    var msg = "SOH|" + episodeDate + "|" + obj.codeSOH + "^" + obj.Problem4 + "^^^^^^" + obj.date + "^^^^" + obj.comment3 + "^^^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
    return msg;
}

function convertBLD(obj) {
    var msg = "BLD|" + episodeDate + "|" + obj.blood + "^" + obj.Rhesus_Type + "^" + obj.G6PD_Status + "^" + obj.comment4 + "^" + encounterDate + "^" + doctor_id + "|<cr>\n";
    return msg;
}

function convertALG(obj) {
    var msg = "ALG|" + episodeDate + "|" + obj.codeALG + "^" + obj.Problem5 + "^" + obj.date1 + "^" + obj.comment5 + "^^^^^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertIMU(obj) {
    var msg = "IMU|" + episodeDate + "|" + obj.codeIMU + "^" + obj.Problem6 + "^" + obj.date2 + "^" + obj.comment6 + "^^^^^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertDAB(obj) {
    var msg = "DAB|" + episodeDate + "|" + obj.codeDAB + "^" + obj.Problem32 + "^" + obj.date3 + "^" + obj.comment7 + "^^" + "^" + encounterDate + "^" + doctor_id + "|<cr>\n";
    return msg;
}

function convertDGS(obj) {
    var msg = "DGS|" + episodeDate + "|" + obj.TypeDGS + "^^^" + obj.dateDGS + "^^^" + obj.dgsCode + "^" + obj.searchDiag + "^^" + obj.SeverityDGS + "^^" + obj.SiteDGS + "^^^^" + obj.LateralityDGS + "^^^" + obj.commentDGS + "^^^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^^^|<cr>\n";
    return msg;
}

function convertPNT(obj) {
    var msg = "PNT|" + episodeDate + "|" + obj.PNT + "^^^^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
    return msg;
}

function convertMEC(obj, ccnProblem, dgsProblem) {

    var msg = "MEC|" + episodeDate + "|" + dgsProblem + "ICD10^^" + ccnProblem + "ICD10^^^" + obj.num1MEC + "^" + obj.num2MEC + "^" + obj.DateFromMEC + "^" + obj.DateToMEC + "^^^^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
    return msg
}

function convertARQ(obj) {
    var msg = "ARQ|" + episodeDate + "|^^" + obj.DateFollowUp + "^" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^^^^^" + obj.commentFLU + "^^" + encounterDate + "^" + obj.docFLUCode + "^" + obj.searchFLU + "|<cr>\n";
    return msg;
}

function convertROS(obj) {
    var msg = "ROS|" + obj.problemCode + "^" + obj.problemName + "^CTV3|" + obj.codeROS + "^" + obj.ROS + "^ICD10-PCS|" + obj.appointmentROS + "|" + obj.hfcIdROS + "^" + obj.hfcROS + "^PSDD|038^" + obj.priorityROScd + "^" + obj.priorityROS + "|096^" + obj.patientConditionROSCd + "^" + obj.patientConditionROS + "|" + obj.commentROS + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^" + subdis + "^" + subdisName + "^" + "|<cr>\n";
    return msg;
}

function convertLIO(obj) {
    var msg = "LIO|" + obj.problemCode + "^" + obj.problemName + "^CTV3|" + obj.codeLOS + "^" + obj.searchLOS + "^ICD10-PCS|" + obj.appointmentLOS + "|038^" + obj.priority + "^" + obj.priorityLOScd + "|096^" + obj.patientConditionLOScd + "^" + obj.patientCondition + "|" + obj.hfcIdLOS + "^" + obj.hfcLOS + "^PSDD|" + obj.commentLOS + "|" + hfc_cd + "^" + hfc_name + "^" + discipline + "^" + disciplineName + "^" + subdis + "^" + subdisName + "^" + "|<cr>\n";
    return msg;
}

function convertPOS(obj) {
    var procedureDisplay = getProcedureDisplay(obj.procedure)
    var msg = "POS|" + obj.problemCode + "^" + obj.problemName + "^CTV3|" + obj.procedureCode + "^" + procedureDisplay + "^ICD1-PCS|" + obj.date + "|038^" + obj.priority + "^" + obj.priorityCode + "|096^" + obj.patientConditionCode + "^" + obj.patientCondition + "||||" + hfc_cd + "|" + hfc_name + "|" + obj.comment + "|" + hfc_cd + "|<cr>\n";
    ;
    return msg;
}
function convertPOSSurgical(obj) {
    var startDate = convertDateToDBFormat(obj.startDate);
    var endDate = convertDateToDBFormat(obj.endDate);
    var msg = "POS|" + obj.problemCode + "^" + obj.problemName + "^CTV3|" + obj.cat_Code + "^" + "^" + obj.cat_name + "^" + obj.procedureCode + "^" + obj.procedure + "^ICD1-PCS|" + startDate + "^" + obj.startTime + "^" + endDate + "^" + obj.endTime + "|038^" + obj.priority + "^" + obj.priorityCode + "|096^" + obj.patientConditionCode + "^" + obj.patientCondition + "||||" + hfc_cd + "|" + hfc_name + "|" + obj.comment + "|" + hfc_cd + "|" + obj.consultantCode + "^" + obj.consultantName + "|" + obj.otRoomCode + "^" + obj.otRoom + "|<cr>\n";
    ;
    ;
    return msg;
}

function convertADW(obj) {
    var msg = "ADW|" + episodeDate + "|" + obj.AdmitDate + " " + obj.AdmitTime + "^" + obj.AdmitToDisciplineCd + "^" + obj.AdmitToDiscipline + "^" + "ST-UD" + "^" + obj.WardNameCd + "^" + obj.WardClassCd + "^" + obj.WardClass + "^" + "ST-UD" + "^" + obj.Reason + "^" + obj.PatientReferFromCd + "^active^" + obj.AdmittedBefore + "^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "|<cr>\n";
    return msg;
}

function convertPRI(obj) {
    //var msg = "PRI|" + getDate() + "|^^" + obj.appREF + "^"+obj.hfcREFcode+"^"+obj.REF+"^"+obj.disREFcode+"^"+obj.disREF+"^^^^^"+obj.medicalHisREF+"^^" + getDate() +  "^" + obj.docREFcode + "^" + obj.docREF+"|<cr>\n";
    var msg = "PRI|T12105|||" + episodeDate + "|" + encounterDate + "|" + "N|" + obj.priority + "|" + obj.type + "|" + obj.disposition + "|" + obj.category + "|" + obj.reason + "|" + obj.appREF + "||" + obj.medicalHisREF + "|" + obj.hfcREFcode + "^" + obj.REF + "^" + obj.disREFcode + "^" + obj.disREF + "^^^" + "|<cr>\n";
    return msg;
}

function convertMON(obj) {
    var msg = "MOR|" + +obj.problemCode + "^" + obj.problemName + "^CTV3|" + obj.codeMON + "^" + obj.searchMON + " | " + encounterDate + " |  |  | " + doctor_id + "| " + doctor_name + " | | " + discipline + " | " + disciplineName + " | | " + data[key].MONHFC_cd + "|<cr>\n";
    return msg;
}

function convertDTO(obj) {
    var problemDTO = "DTO|" + obj.problemCode + "^" + obj.problemName + "^CTV3|";
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

    var msg = problemDTO + drug + drugForm + drugRoute + drugFrequency + drugFrequecyUnit + drugDosage + drugStrength + drugUOM + drugDuration + quantity + theRest;
    return msg;
}

function convertDCG(obj, dischargeSummary) {
    var messageType = dischargeSummary.substring(0, 3);
    var msg = "DCG|" + episodeDate + "|" + encounterDate + "^" + hfc_cd + "^" + hfc_name + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + obj.date + " " + obj.time + "^" + obj.disposition + "^" + obj.comment + "^" + messageType + "|" + dischargeSummary + "|<cr>\n";
    return msg;
}

function convertORC(obj, moduleFrom, moduleTo, transectionCode) {
    var hfcOFDetail = obj.hfcOrderDetail.split("|");
    var hfcPFDetail = obj.hfcProviderDetail.split("|");
    if(obj.priority === "undefined"){
        obj.priority = "-";
    }

    var orc = getORC(transectionCode, "", "", "NO", obj.priority, getDate(), episodeDate, encounterDate, doctor_id, doctor_id, "", hfc_cd, discipline, subdis, moduleFrom, hfcOFDetail[1],
            hfcOFDetail[2], hfcOFDetail[3], hfcOFDetail[10], hfcOFDetail[12], hfcOFDetail[14], hfcOFDetail[13], hfcOFDetail[8], hfcOFDetail[9], hfcPFDetail[0], "-", "", moduleTo, hfcPFDetail[1],
            hfcPFDetail[2], hfcPFDetail[3], hfcPFDetail[10], hfcPFDetail[12], hfcPFDetail[14], hfcPFDetail[13], hfcPFDetail[8], hfcPFDetail[9], "-");

    return orc;
}

function getORC(transectionCode, orderNo, fillerOrderNo, orderStatus, orderPriority, orderDateTime, episodeDate, encounterDateTime, enterBy, verifiedBy, OPD, orderHFC, orderDis, orderSub, orderApp, orderHFCAdd1,
        orderHFCAdd2, orderHFCAdd3, orderHFCtown, orderHFCDistrict, orderHFCState, orderHFCCountry, orderHFCPostcode, orderHFCPhoneNo, providerHFC, providerDis, providerSub, providerApp, providerAdd1,
        providerAdd2, providerAdd3, providerTown, providerDistrict, providerState, providerCountry, providerPostcode, providerPhoneNo, comment) {
    var orc = "";
    var orc1 = "\n ORC|" + transectionCode + "|" + orderNo + "|" + fillerOrderNo + "|" + orderStatus + "|" + orderPriority + "|" + orderDateTime + "|" + episodeDate + "|" + encounterDateTime + "|" + enterBy + "|" + verifiedBy + "|" + OPD + "|" + orderHFC + "|" + orderDis;
    var orc2 = "|" + orderSub + "|" + orderSub + "|" + orderApp + "|" + orderHFCAdd1 + "|" + orderHFCAdd2 + "|" + orderHFCAdd3 + "|" + orderHFCtown + "|" + orderHFCDistrict + "|" + orderHFCState + "|" + orderHFCCountry + "|" + orderHFCPostcode;
    var orc3 = "|" + orderHFCPhoneNo + "|" + providerHFC + "|" + providerDis + "|" + providerSub + "|" + providerApp + "|" + providerAdd1 + "|" + providerAdd2 + "|" + providerAdd3 + "|" + providerTown + "|" + providerDistrict + "|" + providerState + "|" + providerCountry + "|" + providerPostcode + "|" + providerPhoneNo + "|" + comment + "|" + "<cr>\n";
    orc = orc1 + orc2 + orc3;
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
    if (d.CIS020016_glucose === undefined) {
        d.CIS020016_glucose = "";
    }
    if (d.rrRate === undefined) {
        d.rrRate = "";
    }
    if (d.left_pupil === undefined) {
        d.left_pupil = "";
    }
    if (d.right_pupil === undefined) {
        d.right_pupil = "";
    }
    if (d.resultPanScale === undefined) {
        d.resultPanScale = "";
    }
    if (d.left_eye_score === undefined) {
        d.left_eye_score = "";
    }
    if (d.right_eye_score === undefined) {
        d.right_eye_score = "";
    }
    if (d.vision_comment === undefined) {
        d.vision_comment = "";
    }
        if (d.left_reactivity === undefined) {
        d.left_reactivity = "";
    }
        if (d.right_reactivity === undefined) {
        d.right_reactivity = "";
    }


    // VTS|Episode_Date | <Temperature (NM)> ^ <BP-sitting-sys (NM)> ^ <BP-sitting-diag (NM)> ^ <BP-supine-sys (NM)> ^ <BP-supine-diag (NM)> ^ <BP-standing-sys (NM)> ^ <BP-standing-diag (NM)> ^ 
    // <weight (NM)> ^ <Height (NM)> ^ <Head circumference (NM)> ^ <Respiratory rate (NM)> ^ <GCS (NM)> ^ <Pulse rate (NM)> ^ <left pupil condition (NM)> ^ <left pupil option (NM)> ^ 
    // <Left pupil size (ST)> ^ <left light reflex (ST)> ^ <Right light reflex (ST)> ^ <left accom reflex (ST)> ^ <Right accom reflex (ST)> ^ <Heart rate (ST)> ^ <encounter date (TS)> ^
    //  <hfc cd (ST)> ^ <doctor id (ST)> ^ <doctor name (ST)> ^ <gcs point> ^ <gcs result> ^ <pgcs point> ^ <pgcs result> ^ <so2> ^ <pain scale> ^ <blood glucose> ^ <sitting-pulse> ^ 
    //  <supine-pulse> ^ <standing-pulse> ^ <right-pupil-condition> ^ <right-pupil-option> ^ <right-pupil-size> ^ <vision-type> ^ <left-eye-score> ^ <right-eye-score> ^ <colour-vision> ^ 
    //  <vision comment> ^ <pain scale result>

    var vtsNotes = "";  //                      0               1               2               3               4               5               6               7                       8                   9               10              11           121314 15       16       17 181920    21                    22             23               24                   25                   26                   27                       28                    29                30                    31                32              33               34      35 36      37         38      39                        40                         41          42                   43                        
    vtsNotes += "VTS|" + episodeDate + "|" + d.BTemp + "^" + d.sitS + "^" + d.sitD + "^" + d.lyingS + "^" + d.lyingD + "^" + d.standS + "^" + d.standD + "^" + d.bmiWeight + "^" + d.bmiHeight + "^" + d.headCir + "^" + d.rrRate ;
    vtsNotes +="^" + d.pointMain + "^^^^" + d.left_pupil + "^" + d.left_reactivity + "^" + d.right_reactivity + "^^^";
    vtsNotes +="^" + encounterDate + "^" + hfc_cd + "^" + doctor_id + "^" + doctor_name + "^" + d.pointMain + "^" + d.resultMain + "^" + d.pointpgcsMain + "^" + d.resultpgcsMain + "^" + d.OSat + "^" + d.painScale;
    vtsNotes +="^" + d.CIS020016_glucose + "^" + d.sitP + "^" + d.lyingP + "^" + d.standP + "^^^" + d.right_pupil + "^^" + d.left_eye_score + "^" + d.right_eye_score + "^^" + d.vision_comment + "^" + d.resultPanScale + "|<cr>\n";


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
        } else if (data[key].Acode === "PEM") {
            var peFnote = convertPEM(data[key]);
            dcgNotes += peFnote;
        } else if (data[key].Acode === "DGS") {
            dcgNotes += convertDGS(data[key]);
        } else if (data[key].Acode === "PNT") {
            dcgNotes += convertPNT(data[key]);
        } else if (data[key].Acode === "MEC") {
            var ccnProblem = getCCNProblem(data);
            var dgsProblem = getDGSProblem(data);
            dcgNotes += convertMEC(data[key], ccnProblem, dgsProblem);
        } else if (data[key].Acode === "FLU") {
            dcgNotes += convertARQ(data[key]);
        } else if (data[key].Acode === "VTS") {
            counterVTS += 1;
            $.extend(objVTS, data[key]);
        } else if (data[key].Acode === "DCG") {

            var dataDCG = getDGCItem(data[key].index);
            var msg = getNotesDCG(dataDCG);
            var msgArray = msg.split("<cr>");
            msgArray.pop();
            var dcgMsg = "";
            for (var i in msgArray) {
                var dischargeSummary = msgArray[i].trim();
                dcgMsg += convertDCG(data[key], dischargeSummary);

            }
            dcgNotes += dcgMsg;
        }
    }

    if (counterVTS > 0) {
        vtsNotes += convertVTS(objVTS);
        dcgNotes += vtsNotes;
    } else {
        dcgNotes;
    }

    return dcgNotes;
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

function getCCNProblem(data) {
    var ccnProblem;
    var ccnArray = [];
    for (var i in data) {
        if (data[i].Acode === "CCN") {
            ccnArray.push(data[i].ccnCode + "|" + data[i].problem);
        }
    }
    ccnProblem = getProblem(ccnArray);
    return ccnProblem;
}

function getDGSProblem(data) {
    var dgsProblem;
    var dgsArray = [];
    for (var i in data) {
        if (data[i].Acode === "DGS") {
            dgsArray.push(data[i].dgsCode + "|" + data[i].searchDiag);
        }
    }
    dgsProblem = getProblem(dgsArray);
    return dgsProblem;
}

function convertDCGMsgData(data) {
    for (var i in data) {
        var NotesDCG = "";
        var dischargeSummary = "";
        var currentData = [data[i]];

        var dcgGeneralNotes = getNotesDCG(currentData);

        dischargeSummary = dcgGeneralNotes.trim();
        dischargeSummary = dischargeSummary.replace("<cr>", "");
        var message_type = dischargeSummary.substr(0, 3);
        NotesDCG += "DCG|" + episodeDate + "|" + encounterDate + "^" + hfc_cd + "^" + patientCategory + "^" + doctor_id + "^" + doctor_name + "^" + doctor_id + "^" + doctor_name + "^" + data[key].date + " " + data[key].time + "^" + data[key].disposition + "^" + data[key].comment + "^" + message_type + "|" + dischargeSummary + "|<cr>\n";
    }

    return NotesDCG;
}

function convertDateToDBFormat(date) {
    var dateArray = date.split("-");
    var newDate = dateArray[2] + "-" + dateArray[1] + "-" + dateArray[0];
    return newDate;
}
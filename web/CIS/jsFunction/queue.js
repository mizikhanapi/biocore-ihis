/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var EHRrecord = "";
var DGCArryData = [];
var DCGhfcDetail;
$(document).ready(function () {

    //-------------------------------QUEUE MODAL

    $('#btnCIS_MAIN_QUEUE').click(function (e) {
        e.preventDefault();
        $('#listQueue').load('queue/QueueModal.jsp');
        $('#queueModal').modal('toggle');
    });


    var fullPatientData = "";
    var PDIInfo = "";





    $('#listQueue').on('click', '#consultBtn', function (e) {

        var row = $(this).closest('tr');
        var user_idList = row.find('#user_idQueue_List').text();
        statusBe4 = row.find('#status').text();

        if (statusBe4 === 'On Hold') {

            if (user_idList !== doctor_id) {

                alert("Patient has been consult by another doctor. Please select another waiting patient");

            } else {

                if (pmiNo === "" && episodeDate === "") {

                    reloadStat = "1";

                    e.preventDefault();
                    $('#mainConsultBar').show();

                    pmiNo = row.find('#pmiNumber').text();
                    episodeDate = row.find('#epiDate').text();
                    status = row.find('#status').text();

                    if (statusBe4 === 'On Hold') {

                        statusNow = 2;

                    } else if (statusBe4 === 'Waiting') {

                        statusNow = 0;

                    } else if (statusBe4 === 'Missing') {

                        statusNow = 4;

                    } else if (statusBe4 === 'Discharge') {

                        statusNow = 1;

                    }

                    var updateConsult = updateStatus(pmiNo, episodeDate, 5);

                    var patient = findPatient(pmiNo, episodeDate);
                    var getPDIInfo = getPDI(pmiNo, episodeDate);

                    encounterDate = getDate();

                    if (status === 'On Hold') {

                        getEHRPatient(pmiNo, episodeDate);

                    }

                    $('#queueModal').modal('toggle');
                    $('.soap-select').unbind('click');


                } else {

                    alert('You need complete the consultation on patient before first');

                }
//
            }
        } else {

            if (pmiNo === "" && episodeDate === "") {

                reloadStat = "1";

                e.preventDefault();
                $('#mainConsultBar').show();

                pmiNo = row.find('#pmiNumber').text();
                episodeDate = row.find('#epiDate').text();
                status = row.find('#status').text();

                if (statusBe4 === 'On Hold') {

                    statusNow = 2;

                } else if (statusBe4 === 'Waiting') {

                    statusNow = 0;

                } else if (statusBe4 === 'Missing') {

                    statusNow = 4;

                } else if (statusBe4 === 'Discharge') {

                    statusNow = 1;

                }

                //Kept comment for a while
//                var updateConsult = updateStatus(pmiNo, episodeDate, 5);
//
//                var patient = findPatient(pmiNo, episodeDate);
//                var getPDIInfo = getPDI(pmiNo, episodeDate);

                updateStatus_2(pmiNo, episodeDate, 5, statusNow);

                encounterDate = getDate();

                $('#queueModal').modal('toggle');
                $('.soap-select').off('click', disableSOAP);
                //$('.soap-select').unbind('click');


            } else {

                alert('You need complete the consultation on patient before first');

            }
//
        }





    });
});

function findPatient(pmiNo, episodeDate) {

    $.ajax({
        url: 'search/searchPatient.jsp',
        method: 'POST',
        data: {
            pmiNo: pmiNo,
            episodeDate: episodeDate
        },
        timeout: 10000,
        success: function (result) {

            var DataArry = result.split("|");
            $('#pName').html(DataArry[1]);
            $('#pName2').html("(" + DataArry[1] + ")");
            $('#pPMINo').html(DataArry[0]);
            $('#pAddress').html(DataArry[12]);
            $('#pBirthDayDate').html(DataArry[13]);
            $('#pIC').html(DataArry[0].trim());
            $('#pIC_2').html(DataArry[2].trim());
            $('#pBloodType').html(DataArry[3]);
            $('#pSex').html(DataArry[4]);
            $('#pIdType').html(DataArry[5]);
            $('#pAllergy').html(DataArry[8]);
            $('#pAge').html(DataArry[6]);
            $('#pRace').html(DataArry[7]);
            patientCategory = DataArry[9];
            fullPatientData = DataArry[10];
            $('#gambarpesakitdisini').html('<img class="img-responsive" width="100" height="100" src="' + DataArry[11] + '" />');


        }
    });
}


function getPDI(pmiNo, episodeDate) {
    //alert(pmiNo+"   /  "+episodeDate);
    $.ajax({
        url: 'search/getPDI.jsp',
        method: 'POST',
        data: {
            pmiNo: pmiNo,
            episodeDate: episodeDate
        },
        timeout: 10000,
        success: function (result) {
            PDIInfo = result.trim();
        },
        error: function (err) {
            alert("Get PDI error: " + err);
        }
    });
}

function updateStatus(pmiNo, episodeDate, status) {
    $.ajax({
        url: 'search/changeStatus.jsp',
        method: 'POST',
        data: {
            status: status,
            pmiNo: pmiNo,
            episodeDate: episodeDate
        },
        success: function (result) {

        },
        error: function (err) {
            console.log(err);
        }
    });
}

//------------ update status to handle multiple user in selecting the same patient------
function updateStatus_2(pmiNo, episodeDate, status, preStatus) {

    $.ajax({
        url: 'search/changeStatus_2.jsp',
        method: 'POST',
        data: {
            status: status,
            pmiNo: pmiNo,
            episodeDate: episodeDate,
            preStatus: preStatus
        },
        success: function (result) {

            if (result.trim() === "|1|") {

                var patient = findPatient(pmiNo, episodeDate);
                var getPDIInfo = getPDI(pmiNo, episodeDate);
                reloadStat = "1";

            } else {

                //pmiNo = "";
                bootbox.alert("The patient has been taken by other doctor.");
                clearCIS();

            }

        },
        error: function (err) {

            console.log(err);

        }
    });
}



function getEHRPatient(pmiNo, episodeDate) {
    $.ajax({
        url: 'search/getEHRRecord.jsp',
        method: 'POST',
        data: {
            pmiNo: pmiNo,
            episodeDate: episodeDate
        },
        success: function (result) {
            EHRrecord = result.trim();

            convertEHR(EHRrecord);
            if (DGCArryData.length > 0) {
                lexerDCG(DGCArryData);

            }


        },
        error: function (err) {
            console.log(err);
        }
    });
}

function convertNoteToData(noteAr) {

    note = noteAr.split("|");
    noteNotes = note[2];
    noteData = noteNotes.split('^');
    return noteData;
}

function convertPEMId(idAry) {
    var newIdAry = [];
    var id = "";
    var size = idAry.length;
    for (var i = 0; i < size; i++) {
        if (id === "") {
            id = id + idAry[i];
        } else {
            id = id + "," + idAry[i];
        }
        newIdAry.push(id);
    }

    return newIdAry;
}
function getHFCDetail(orc) {
    var orcArry = orc.split("|");
    var hfcOrderDetail = orcArry[12] + "|" + orcArry[17] + "|" + orcArry[18] + "|" + orcArry[19] + "|" + "-" + "|" + "-" + "|" + "-" + "|" + "-" + "|" + orcArry[24] + "|" + orcArry[25] + "|" + orcArry[20] + "|" + "-" + "|" + orcArry[21] + "|" + orcArry[23] + "|" + orcArry[22];
    var hfcProviderDetail = orcArry[26] + "|" + orcArry[30] + "|" + orcArry[31] + "|" + orcArry[32] + "|" + "-" + "|" + "-" + "|" + "-" + "|" + "-" + "|" + orcArry[37] + "|" + orcArry[38] + "|" + orcArry[33] + "|" + "-" + "|" + orcArry[34] + "|" + orcArry[36] + "|" + orcArry[35];

    return [hfcOrderDetail, hfcProviderDetail];
}

function getROSDetail(id, hfc_cd, objROS) {

    $.ajax({
        method: 'POST',
        url: 'search/searchRISProcedure_EHR.jsp',
        data: {
            id: id,
            hfc_cd: hfc_cd
        },
        timeout: 5000,
        success: function (result) {
            var detailROS = result.split("|");
            objROS.bodySystemROS = detailROS[4];
            objROS.bodySystemROSCode = detailROS[2];
            objROS.locationROS = detailROS[5];
            objROS.modalityROS = detailROS[3];
            objROS.modalityROSCode = detailROS[2];

            displayROS(objROS.codeROS, objROS.ROS, objROS.commentROS, objROS.modalityROS,
                    objROS.modalityROScode, objROS.bodySystemROS, objROS.bodySystemROS, objROS.bodySystemROSCode,
                    objROS.hfcROS, objROS.hfcROScode, objROS.locationROS, objROS.appointmentROS, objROS.patientConditionROS);
        }
    });
}

function getLIODetail(id, objLIO) {
    $.ajax({
        method: 'post',
        url: 'search/searchLOS_EHR.jsp',
        data: {
            name: id
        },
        timeout: 5000,
        success: function (result) {


            var LIODetail = result.trim().split("|");

            objLIO.catLOS = LIODetail[2]
            objLIO.containerLOS = LIODetail[4]
            objLIO.sourceLOS = LIODetail[3],
                    objLIO.spclLOS = LIODetail[6].trim(),
                    objLIO.volumeLOS = LIODetail[5],
                    displayLOS(objLIO.searchLOS, objLIO.codeLOS, objLIO.catLOS, objLIO.sourceLOS, objLIO.containerLOS, objLIO.volumeLOS, objLIO.spclLOS, objLIO.commentLOS, objLIO.appointmentLOS, objLIO.priorityLOS, objLIO.hfcLOS, objLIO.hfcIdLOS)
        },
        error: function (err) {

        }
    });
}
function convertEHR(ehr) {
    var EHRArry = ehr.split("<cr>");
    var PDI;
    var CCN;
    var HPI;

    var ROSORC = 0;
    var DTOORC = 0;
    var LOSORC = 0;
    var POSORC = 0;
    var MONORC = 0;
    var ADWORC = 0;
    var DCGORC = 0;


    for (var i = 0; i < EHRArry.length; i++) {
        var EHRD = EHRArry[i].trim();
        var header = EHRD.substring(0, 3);
        if (header === "ORC") {

            var EHRD1 = EHRArry[i + 1].trim();
            var header1 = EHRD1.substring(0, 3);
            if (header1 === "ROS") {
                ROSORC = i;
            } else if (header1 === "DTO") {
                DTOORC = i;
            } else if (header1 === "LIO") {
                LOSORC = i;
            } else if (header1 === "POS") {
                POSORC = i;
            } else if (header1 === "MOR") {
                MONORC = i;
            } else if (header1 === "ADW") {
                ADWORC = i;
            } else if (header1 === "DCG") {
                DCGORC = i;
            }
        }

    }

    for (var i = 0; i < EHRArry.length; i++) {
        var EHRD = EHRArry[i].trim();
        var header = EHRD.substring(0, 3);

        if (header === "CCN") {
            CCN = EHRArry[i];

            var CNNData = convertNoteToData(CCN);
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

            _data.push(objCCN);
            displayCCN(objCCN.problem, objCCN.Mild, objCCN.Site, objCCN.duration, objCCN.sdur, objCCN.Laterality, objCCN.Comment);


        } else if (header === "HPI") {
            HPI = EHRArry[i];
            var HPIData = convertNoteToData(HPI);
            var objHPI = {
                Acode: "HPI",
                details: HPIData[0],
                episodeDate: HPIData[1]
            }
            _data.push(objHPI);
            displayHPI(objHPI.details);


        } else if (header === "PMH") {
            PMH = EHRArry[i];
            var PMHData = convertNoteToData(PMH);

            var objPMH = {
                Acode: "PMH",
                codePMH: PMHData[0],
                Problem1: PMHData[1],
                Status: PMHData[8],
                comment1: PMHData[5]
            };
            _data.push(objPMH);
            displayPMH(objPMH.Problem1, objPMH.Status, objPMH.comment1);


        } else if (header === "FMH") {
            FMH = EHRArry[i];
            var FMHData = convertNoteToData(FMH);

            var objFMH = {
                Acode: "FMH",
                Problem3: FMHData[2],
                codeFMH: FMHData[1],
                comment2: FMHData[6],
                f_relationship: FMHData[0]
            };
            _data.push(objFMH);
            displayFMH(objFMH.Problem3, objFMH.f_relationship, objFMH.comment2);


        } else if (header === "SOH") {
            SOH = EHRArry[i];
            var SOHData = convertNoteToData(SOH);
            var objSOH = {
                Acode: "SOH",
                Problem4: SOHData[1],
                codeSOH: SOHData[0],
                comment3: SOHData[11],
                date: SOHData[7]
            }
            _data.push(objSOH);
            displaySOH(objSOH.Problem4, objSOH.date, objSOH.comment3);


        } else if (header === "BLD") {
            BLD = EHRArry[i];
            var BLDData = convertNoteToData(BLD);
            var objBLD = {
                Acode: "BLD",
                G6PD_Status: BLDData[2],
                Rhesus_Type: BLDData[1],
                blood: BLDData[0],
                comment4: BLDData[3],
                codeBLD: "BLD"

            };
            _data.push(objBLD);
            displayBLD(objBLD.blood, objBLD.Rhesus_Type, objBLD.G6PD_Status, objBLD.comment4);

        } else if (header === "ALG") {
            ALG = EHRArry[i];
            var ALGData = convertNoteToData(ALG);
            var objALG = {
                Acode: "ALG",
                Problem5: ALGData[1],
                codeALG: ALGData[0],
                comment5: ALGData[3],
                date1: ALGData[2]
            };
            _data.push(objALG);
            displayAllergy(objALG.Problem5, objALG.date1, objALG.comment5);

        } else if (header === "IMU") {
            IMU = EHRArry[i];
            var IMUData = convertNoteToData(IMU);
            var objIMU = {
                Acode: "IMU",
                codeIMU: IMUData[0],
                Problem6: IMUData[1],
                date2: IMUData[2],
                comment6: IMUData[3]
            };
            _data.push(objIMU);
            displayIMU(objIMU.Problem6, objIMU.date2, objIMU.comment6);

        } else if (header === "DAB") {
            DAB = EHRArry[i];
            var DABData = convertNoteToData(DAB);
            var strCom = DABData[1].replace(/'/g, '\\\'');
            DABData[1] = strCom;

            var objDAB = {
                Acode: "DAB",
                Problem32: DABData[1],
                codeDAB: DABData[0],
                comment7: DABData[5],
                date3: DABData[2]
            };
            _data.push(objDAB);
            displayDAB(objDAB.Problem32, objDAB.date3, objDAB.comment7);


        } else if (header === "VTS") {
            VTS = EHRArry[i];
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
                _data.push(objGCS);
                displayGCS(objGCS.resultMain, objGCS.pointMain);
            }


            if (VTSData[27] !== "" || VTSData[27] !== "") {

                var objPGCS = {
                    Acode: "VTS",
                    pointpgcsMain: VTSData[27],
                    resultpgcsMain: VTSData[28]
                };
                _data.push(objPGCS);
                displayPGCS(objPGCS.resultpgcsMain, objPGCS.pointpgcsMain);

            }
            if (VTSData[4] === "" && VTSData[33] === "" && VTSData[3] === "" && VTSData[2] === "" && VTSData[32] === "" && VTSData[1] === "" && VTSData[6] === "" && VTSData[34] === "" && VTSData[5] === "") {

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
                _data.push(objBP);

                displayBP(objBP.sitS, objBP.sitD, objBP.sitP, objBP.standS, objBP.standD, objBP.standP, objBP.lyingS, objBP.lyingD, objBP.lyingP);
            }
            if (VTSData[10] === "" || VTSData[10] === "undefined") {

            } else {
                var objRRate = {
                    Acode: "VTS",
                    rrRate: VTSData[10]
                };
                _data.push(objRRate);
                displayrrRate(objRRate.rrRate);
            }

            if (VTSData[29] === "" || VTSData[29] === "undefined") {

            } else {
                var objOsat = {
                    Acode: "VTS",
                    OSat: VTSData[29]
                };
                _data.push(objOsat);
                displayOsat(objOsat.OSat);

            }

            if (VTSData[0] === "" || VTSData[0] === "undefined") {

            } else {
                var objBTemp = {
                    Acode: "VTS",
                    BTemp: VTSData[0]
                };
                _data.push(objBTemp);
                displayBTemp(objBTemp.BTemp);
            }

            if (VTSData[30] === "" || VTSData[30] === "undefined") {

            } else {
                var objPainScale = {
                    Acode: "VTS",
                    painScale: VTSData[30],
                    resultPanScale: VTSData[43]
                };
                _data.push(objPainScale);
                displayPanScale(objPainScale.painScale, objPainScale.resultPanScale);
            }

            if (VTSData[31] !== "") {
                var objBGlu = {
                    Acode: "VTS",
                    CIS020016_glucose: VTSData[31]
                };

                _data.push(objBGlu);
                displayBGlucose(objBGlu.CIS020016_glucose);
            }

            if (VTSData[8] === "" && VTSData[7] === "") {

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
                // heightNew = 
                _data.push(objOther);

                displayOther(heightO[0], weightO[0], objOther.bmi, objOther.bmiStatus, objOther.headCir, objOther.bloodGlucose);
            }
            if (VTSData[15] === "" && VTSData[37] === "") {

            } else {
                var objPupil = {
                    Acode: "VTS",
                    left_pupil: VTSData[15],
                    right_pupil: VTSData[37],
                    left_reactivity: VTSData[16],
                    right_reactivity: VTSData[17]
                };

                _data.push(objPupil);

                displayPupil(objPupil);
            }
            if (VTSData[39] === "" && VTSData[40] === "" && VTSData[42] === "") {

            } else {
                var objVision = {
                    Acode: "VTS",
                    left_eye_score: VTSData[39],
                    right_eye_score: VTSData[40],
                    vision_comment: VTSData[42]
                };
                console.log(objVision);
                _data.push(objVision);

                displayVision(objVision);
            }

        } else if (header === "PEM") {
            PEM = EHRArry[i];

            var PEMData = convertNoteToData(PEM);
            var idArr = PEMData[2].split(",");
            var pe0t8 = PEMData[3].split(',');
            var pe0 = pe0t8[0];
            var pe1 = pe0t8[1];
            var pe2 = pe0t8[2];
            var pe3 = pe0t8[3];
            var pe4 = pe0t8[4];
            var pe5 = pe0t8[5];
            var pe6 = pe0t8[6];
            var pe7 = pe0t8[7];
            var pe8 = pe0t8[8];
            var newIdAry = convertPEMId(idArr);
            if (pe0t8[1] === undefined) {
                pe1 = "";
            }
            if (pe0t8[2] === undefined) {
                pe2 = "";
            }
            if (pe0t8[3] === undefined) {
                pe3 = "";
            }
            if (pe0t8[4] === undefined) {
                pe4 = "";
            }
            if (pe0t8[5] === undefined) {
                pe5 = "";
            }
            if (pe0t8[6] === undefined) {
                pe6 = "";
            }
            if (pe0t8[7] === undefined) {
                pe7 = "";
            }
            if (pe0t8[8] === undefined) {
                pe8 = "";
            }

            var objPEM = {
                Acode: "PEM",
                PEComment: PEMData[5],
                id: newIdAry,
                pe0: pe0,
                pe1: pe1,
                pe2: pe2,
                pe3: pe3,
                pe4: pe4,
                pe5: pe5,
                pe6: pe6,
                pe7: pe7,
                pe8: pe8

            };
            var PEMNotes = convertPEMtoNotes(objPEM);
            _data.push(objPEM);

            displayPEM(PEMNotes, objPEM.PEComment);

        } else if (header === "DGS") {
            DGS = EHRArry[i];
            var DGSData = convertNoteToData(DGS);
            var objDGS = {
                Acode: "DGS",
                LateralityDGS: DGSData[15],
                SeverityDGS: DGSData[9],
                SiteDGS: DGSData[11],
                TypeDGS: DGSData[0],
                commentDGS: DGSData[18],
                dateDGS: DGSData[3],
                dgsCode: DGSData[6],
                searchDiag: DGSData[7]
            };
            _data.push(objDGS);
            displayDGS(objDGS.TypeDGS, objDGS.dateDGS, objDGS.searchDiag, objDGS.SeverityDGS, objDGS.SiteDGS, objDGS.LateralityDGS, objDGS.commentDGS)

        } else if (header === "PNT") {
            PNT = EHRArry[i];
            var PNTData = convertNoteToData(PNT);
            var objPNT = {
                Acode: "PNT",
                PNT: PNTData[0],
                codePNT: "PNT"
            };
            _data.push(objPNT);
            displayPNT(objPNT.PNT);

        } else if (header === "ROS") {
            ROS = EHRArry[i];



            var ROSData1 = ROS.split("|");
            var imgInv = ROSData1[2].split("^");
            var hfcAry = ROSData1[4].split("^");
            var patientConditionAry = ROSData1[6].split("^");
            var priorityAry = ROSData1[5].split("^");

            ORC = EHRArry[ROSORC];

            var hfcDetail = getHFCDetail(ORC);


            var objROS = {
                Acode: "ROS",
                ROS: imgInv[1],
                appointmentROS: ROSData1[3],
                //bodySystemROS:detailROS[4],
                //bodySystemROSCode:detailROS[2],
                codeROS: imgInv[0],
                commentROS: ROSData1[7],
                hfcIdROS: hfcAry[0],
                hfcROS: hfcAry[1],
                priorityROS: priorityAry[2],
                priorityROScd: priorityAry[1],
                //locationROS:detailROS[5],
                //modalityROS:detailROS[3],
                //modalityROSCode:detailROS[2],
                patientConditionROS: patientConditionAry[2],
                patientConditionROScd: patientConditionAry[1],
                hfcOrderDetail: hfcDetail[0],
                hfcProviderDetail: hfcDetail[1]
            };

            $.when(getROSDetail(imgInv[1], hfcAry[0], objROS)).done(function () {
                _data.push(objROS);

            });


        } else if (header === "LIO") {
            LIO = EHRArry[i];
            ORC = EHRArry[LOSORC];
            var hfcDetail = getHFCDetail(ORC);

            var LIOData = LIO.split("|");

            var labAry = LIOData[2].split("^");
            var prioAry = LIOData[5].split("^");
            var hfcAry = LIOData[6].split("^");

            var objLIO = {
                Acode: "LOS",
                appointmentLOS: LIOData[3],
                // catLOS: LIODetail[2],
                codeLOS: labAry[0],
                commentLOS: LIOData[7],
                //containerLOS: LIODetail[4],
                hfcIdLOS: hfcAry[0],
                hfcLOS: hfcAry[1],
                priorityLOS: prioAry[1],
                searchLOS: labAry[1],
                //sourceLOS: LIODetail[3],
                //spclLOS: LIODetail[6].trim(),
                // volumeLOS: LIODetail[5],
                hfcOrderDetail: hfcDetail[0],
                hfcProviderDetail: hfcDetail[1]
            };

            $.when(getLIODetail(labAry[1], objLIO)).done(function () {
                _data.push(objLIO);
            })



        } else if (header === "DTO") {
            DTO = EHRArry[i];
            ORC = EHRArry[DTOORC];
            var hfcDetail = getHFCDetail(ORC);

            var DTOData1 = DTO.split("|");

            var drugArry = DTOData1[2].split("^");
            var drugFormArry = DTOData1[3].split("^");
            var drugRouteArry = DTOData1[4].split("^");
            var drugFrequencyDetailArry = DTOData1[5].split("^");
            var drugDoseArry = DTOData1[7].split(" ");
            var drugStrengthArry = DTOData1[8].split(" ");
            var uomCode = DTOData1[9].split("^");
            var durationArry = DTOData1[10].split(" ");

// 
            var objDTO = {
                Acode: 'DTO',
                drugName: drugArry[0],
                drugCode: drugArry[1],
                drugForm: drugFormArry[0],
                drugRoute: drugRouteArry[0],
                drugCaution: "",
                drugFrequencyDetail: drugFrequencyDetailArry[1],
                drugStrength: drugStrengthArry[0],
                drugStrengthUnit: drugStrengthArry[1],
                drugDose: drugDoseArry[0],
                drugDoseUnit: drugDoseArry[1],
                drugDuration: durationArry[0],
                drugDurationUnit: durationArry[1],
                drugFrequency: DTOData1[6],
                uomCode: uomCode[2],
                remark: DTOData1[13],
                comment: DTOData1[15],
                drugQuantity: DTOData1[11],
                hfcOrderDetail: hfcDetail[0],
                hfcProviderDetail: hfcDetail[1]
            };

            _data.push(objDTO);
            displayDTO(objDTO.drugName, objDTO.drugForm, objDTO.drugStrength + " " + objDTO.drugStrengthUnit, objDTO.drugDose + " " + objDTO.drugDoseUnit, objDTO.drugFrequency, objDTO.drugDuration + " " + objDTO.drugDurationUnit, objDTO.drugFrequency, objDTO.drugCaution, objDTO.remark, objDTO.comment);
        } else if (header === "POS") {
            POS = EHRArry[i];
            ORC = EHRArry[POSORC];
            var hfcDetail = getHFCDetail(ORC);

            var POSData1 = POS.split("|");
            var POSData = POSData1[2].split("^");

            var objPOS = {
                Acode: "POS",
                Problem18: POSData[1],
                proType: POSData1[4],
                procedure_cd: POSData[0],
                hfcOrderDetail: hfcDetail[0],
                hfcProviderDetail: hfcDetail[1]
            };

            _data.push(objPOS);
            displayPOS(objPOS.Problem18, objPOS.proType, objPOS.procedure_cd);
        } else if (header === "MEC") {
            MEC = EHRArry[i];
            console.log(MEC);
            var MECData1 = MEC.split("ICD10");
            var MECData = MECData1[2].split("^");

            var objMEC = {
                Acode: "MEC",
                DateFromMEC: MECData[5],
                DateToMEC: MECData[6],
                num1MEC: MECData[3],
                num2MEC: MECData[4]
            };
            _data.push(objMEC);

            displayMCTS(objMEC.DateFromMEC, objMEC.DateToMEC, objMEC.num1MEC, objMEC.num2MEC);
        } else if (header === "PRI") {
            PRI = EHRArry[i];
            var PRIData = convertNoteToData(PRI);

            var objPRI = {
                Acode: "PRI",
                REF: PRIData[4],
                appREF: PRIData[2],
                disREF: PRIData[6],
                disREFcode: PRIData[5],
                docREFcode: PRIData[14],
                docREF: PRIData[15],
                hfcREFcode: PRIData[3],
                medicalHisRef: PRIData[11]
            };
            _data.push(objPRI);

            displayPRI(objPRI.REF, objPRI.hfcREFcode, objPRI.disREF, objPRI.disREFcode, objPRI.docREF, objPRI.appREF, objPRI.medicalHisRef);
        } else if (header === "ARQ") {
            ARQ = EHRArry[i];
            var ARQData = convertNoteToData(ARQ);

            var objARQ = {
                Acode: "FLU",
                DateFollowUp: ARQData[2],
                commentFLU: ARQData[11],
                docFLUCode: ARQData[14],
                searchFLU: ARQData[15]
            };
            _data.push(objARQ);

            displayFLU(objARQ.searchFLU, objARQ.DateFollowUp, objARQ.commentFLU);
        } else if (header === "MOR") {
            MOR = EHRArry[i];
            ORC = EHRArry[MONORC];
            var hfcDetail = getHFCDetail(ORC);

            var monArry = MOR.split("|");
            var monArryInfo = monArry[1].split("^");
            var monArryTest = monArry[2].split("^");
            var monArryHfc = monArry[3].split("^");

            var objMON = {
                Acode: "MON",
                codeMON: monArryInfo[0],
                searchMON: monArryTest[1],
                reqItem: monArryTest[0],
                testMON: monArryTest[0],
                MONHFC_cd: monArry[12].trim(),
                searchHFC_MON: monArry[12],
                searchDIS_MON: monArry[10],
                hfcOrderDetail: hfcDetail[0],
                hfcProviderDetail: hfcDetail[1]
            };
            //getObjectORCHFCDetailMON(hfc_cd, objMON.MONHFC_cd,objMON);

            _data.push(objMON);

            displayMON(objMON.searchMON, objMON.searchHFC_MON, objMON.searchDIS_MON);
        } else if (header === "ADW") {
            ADW = EHRArry[i];
            ORC = EHRArry[ADWORC];
            var hfcDetail = getHFCDetail(ORC);

            var adwArry = ADW.split("|");
            var adwInfo = adwArry[2].split("^");
            var adwDateTime = adwInfo[11].split(" ");


            var objADW = {
                Acode: "ADW",
                AdmitDate: adwDateTime[0],
                AdmitTime: adwDateTime[1],
                AdmitToDiscipline: adwInfo[2],
                AdmitToDisciplineCd: adwInfo[1],
                AdmittedBefore: adwInfo[10],
                PatientReferFrom: disciplineName,
                PatientReferFromCd: discipline,
                Reason: adwInfo[7],
                WardName: adwInfo[5],
                WardNameCd: adwInfo[4],
                hfcOrderDetail: hfcDetail[0],
                hfcProviderDetail: hfcDetail[1]

            };
            //getObjectORCHFCDetail(hfc_cd, hfc_cd,objADW);
            displayADW(objADW.AdmitToDiscipline, objADW.PatientReferFrom, objADW.Reason, objADW.AdmitDate, objADW.AdmitTime, objADW.WardName)


            _data.push(objADW);

            // displayMON(objMON.searchMON,objMON.searchHFC_MON, objMON.searchDIS_MON);
        } else if (header === "DCG") {
            DCG = EHRArry[i];
            ORC = EHRArry[DCGORC];
            DCGhfcDetail = getHFCDetail(ORC);

            DGCArryData.push(DCG);


        }

    }

}



function lexerDCG(data) {
    var indexArry = [];

    //for loop add object from ehr data
    for (var x in data) {
        var dataArry = data[x].trim().split("|");
        var message_type = dataArry[3];
        var seperator = "^" + message_type + "|";
        var disSum = data[x].trim().split(seperator);
        var disSumNote = disSum[1];
        var msg_code = disSumNote.substring(0, 3);
        var dataObj = {};

        if (msg_code === "CCN") {

            CCN = disSumNote;
            //(CCN);
            var CNNData = convertNoteToData(CCN);
            var ccnsubData = CNNData[4].split(" ");
            //(CNNData);
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
            dataObj = objCCN;

        } else if (msg_code === "HPI") {
            HPI = disSumNote
            var HPIData = convertNoteToData(HPI);
            var objHPI = {
                Acode: "HPI",
                details: HPIData[0],
                episodeDate: HPIData[1]
            }
            dataObj = objHPI;


        } else if (msg_code === "PMH") {
            PMH = disSumNote
            var PMHData = convertNoteToData(PMH);

            var objPMH = {
                Acode: "PMH",
                codePMH: PMHData[0],
                Problem1: PMHData[1],
                Status: PMHData[8],
                comment1: PMHData[5]
            };
            dataObj = objPMH;

        } else if (msg_code === "FMH") {
            FMH = disSumNote
            var FMHData = convertNoteToData(FMH);

            var objFMH = {
                Acode: "FMH",
                Problem3: FMHData[2],
                codeFMH: FMHData[1],
                comment2: FMHData[6],
                f_relationship: FMHData[0]
            };
            dataObj = objFMH;

        } else if (msg_code === "SOH") {
            SOH = disSumNote
            var SOHData = convertNoteToData(SOH);
            var objSOH = {
                Acode: "SOH",
                Problem4: SOHData[1],
                codeSOH: SOHData[0],
                comment3: SOHData[11],
                date: SOHData[7]
            }
            dataObj = objSOH;

        } else if (msg_code === "BLD") {
            BLD = disSumNote
            var BLDData = convertNoteToData(BLD);
            var objBLD = {
                Acode: "BLD",
                G6PD_Status: BLDData[2],
                Rhesus_Type: BLDData[1],
                blood: BLDData[0],
                comment4: BLDData[3],
                codeBLD: "BLD"

            };
            dataObj = objBLD;

        } else if (msg_code === "ALG") {
            ALG = disSumNote
            var ALGData = convertNoteToData(ALG);
            var objALG = {
                Acode: "ALG",
                Problem5: ALGData[1],
                codeALG: ALGData[0],
                comment5: ALGData[3],
                date1: ALGData[2]
            };
            dataObj = objALG;

        } else if (msg_code === "IMU") {
            IMU = disSumNote
            var IMUData = convertNoteToData(IMU);
            var objIMU = {
                Acode: "IMU",
                codeIMU: IMUData[0],
                Problem6: IMUData[1],
                date2: IMUData[2],
                comment6: IMUData[3]
            };
            dataObj = objIMU;

        } else if (msg_code === "DAB") {
            DAB = disSumNote;
            var DABData = convertNoteToData(DAB);
            var objDAB = {
                Acode: "DAB",
                Problem32: DABData[1],
                codeDAB: DABData[0],
                comment7: DABData[5],
                date3: DABData[2]
            };
            dataObj = objDAB;

        } else if (msg_code === "VTS") {
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

            if (VTSData[31] !== "") {
                var objBGlu = {
                    Acode: "VTS",
                    CIS020016_glucose: VTSData[31]
                };

                dataObj = objBGlu;
            }

            if (VTSData[8] === "" && VTSData[7] === "") {

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

        } else if (msg_code === "PEM") {
            console.log(msg_code);
            console.log(msg_code);
            PEM = disSumNote;
            console.log(PEM);
            var PEMData = convertNoteToData(PEM);
            var idArr = PEMData[2].split(",");
            var pe0t8 = PEMData[3].split(',');
            var pe0 = pe0t8[0];
            var pe1 = pe0t8[1];
            var pe2 = pe0t8[2];
            var pe3 = pe0t8[3];
            var pe4 = pe0t8[4];
            var pe5 = pe0t8[5];
            var pe6 = pe0t8[6];
            var pe7 = pe0t8[7];
            var pe8 = pe0t8[8];
            var newIdAry = convertPEMId(idArr);
            if (pe0t8[1] === undefined) {
                pe1 = "";
            }
            if (pe0t8[2] === undefined) {
                pe2 = "";
            }
            if (pe0t8[3] === undefined) {
                pe3 = "";
            }
            if (pe0t8[4] === undefined) {
                pe4 = "";
            }
            if (pe0t8[5] === undefined) {
                pe5 = "";
            }
            if (pe0t8[6] === undefined) {
                pe6 = "";
            }
            if (pe0t8[7] === undefined) {
                pe7 = "";
            }
            if (pe0t8[8] === undefined) {
                pe8 = "";
            }

            var objPEM = {
                Acode: "PEM",
                PEComment: PEMData[5],
                id: newIdAry,
                pe0: pe0,
                pe1: pe1,
                pe2: pe2,
                pe3: pe3,
                pe4: pe4,
                pe5: pe5,
                pe6: pe6,
                pe7: pe7,
                pe8: pe8

            };
            var PEMNotes = convertPEMtoNotes(objPEM);
            dataObj = objPEM;

        } else if (msg_code === "DGS") {
            DGS = disSumNote;
            var DGSData = convertNoteToData(DGS);
            var objDGS = {
                Acode: "DGS",
                LateralityDGS: DGSData[15],
                SeverityDGS: DGSData[9],
                SiteDGS: DGSData[11],
                TypeDGS: DGSData[0],
                commentDGS: DGSData[18],
                dateDGS: DGSData[3],
                dgsCode: DGSData[6],
                searchDiag: DGSData[7]
            };
            dataObj = objDGS;
        } else if (msg_code === "PNT") {
            PNT = disSumNote;
            var PNTData = convertNoteToData(PNT);
            var objPNT = {
                Acode: "PNT",
                PNT: PNTData[0],
                codePNT: "PNT"
            };
            dataObj = objPNT;

        } else if (msg_code === "ROS") {
            ROS = disSumNote;

            var ROSData1 = ROS.split("|");
            var imgInv = ROSData1[2].split("^");
            var hfcAry = ROSData1[4].split("^");
            var patientConditionAry = ROSData1[6].split("^");
            var priorityAry = ROSData1[5].split("^");

            var objROS = {
                Acode: "ROS",
                ROS: imgInv[1],
                appointmentROS: ROSData1[3],
                codeROS: imgInv[0],
                commentROS: ROSData1[7],
                hfcIdROS: hfcAry[0],
                hfcROS: hfcAry[1],
                priorityROS: priorityAry[2],
                priorityROScd: priorityAry[1],
                patientConditionROS: patientConditionAry[2],
                patientConditionROScd: patientConditionAry[1],
            };

            dataObj = objROS;

        } else if (msg_code === "LIO") {
            LIO = disSumNote;

            var LIOData = LIO.split("|");

            var labAry = LIOData[2].split("^");
            var prioAry = LIOData[5].split("^");
            var hfcAry = LIOData[6].split("^");

            var objLIO = {
                Acode: "LOS",
                appointmentLOS: LIOData[3],
                codeLOS: labAry[0],
                commentLOS: LIOData[7],
                hfcIdLOS: hfcAry[0],
                hfcLOS: hfcAry[1],
                priorityLOS: prioAry[1],
                searchLOS: labAry[1],
            };
            dataObj = objLIO;

        } else if (msg_code === "DTO") {
            DTO = disSumNote;
            var DTOData1 = DTO.split("|");

            //var DTOData = DTOData1[1].split("^");
            var drugArry = DTOData1[2].split("^");
            var drugFormArry = DTOData1[3].split("^");
            var drugRouteArry = DTOData1[4].split("^");
            var drugFrequencyDetailArry = DTOData1[5].split("^");
            var drugDoseArry = DTOData1[7].split(" ");
            var drugStrengthArry = DTOData1[8].split(" ");
            var uomCode = DTOData1[9].split("^");
            var durationArry = DTOData1[10].split(" ");

            var objDTO = {
                Acode: 'DTO',
                drugName: drugArry[0],
                drugCode: drugArry[1],
                drugForm: drugFormArry[0],
                drugRoute: drugRouteArry[0],
                drugCaution: "",
                drugFrequencyDetail: drugFrequencyDetailArry[1],
                drugStrength: drugStrengthArry[0],
                drugStrengthUnit: drugStrengthArry[1],
                drugDose: drugDoseArry[0],
                drugDoseUnit: drugDoseArry[1],
                drugDuration: durationArry[0],
                drugDurationUnit: durationArry[1],
                drugFrequency: DTOData1[6],
                uomCode: uomCode[2],
                remark: DTOData1[13],
                comment: DTOData1[15],
                drugQuantity: DTOData1[11]
            };
            dataObj = objDTO;

        } else if (msg_code === "POS") {
            POS = disSumNote;

            var POSData1 = POS.split("|");
            var POSData = POSData1[2].split("^");

            var objPOS = {
                Acode: "POS",
                Problem18: POSData[1],
                proType: POSData1[4],
                procedure_cd: POSData[0]

            };
            dataObj = objPOS;
        } else if (msg_code === "MEC") {
            MEC = EHRArry[i];
            var MECData1 = MEC.split("^ICD10");
            var MECData = MECData1[2].split("^");

            var objMEC = {
                Acode: "MEC",
                DateFromMEC: MECData[5],
                DateToMEC: MECData[6],
                num1MEC: MECData[3],
                num2MEC: MECData[4]
            };
            dataObj = objMEC;
        } else if (msg_code === "PRI") {
            PRI = disSumNote;
            var PRIData = convertNoteToData(PRI);

            var dataPRI = {
                Acode: "PRI",
                REF: PRIData[4],
                appREF: PRIData[2],
                disREF: PRIData[6],
                disREFcode: PRIData[5],
                docREFcode: PRIData[14],
                docREF: PRIData[15],
                hfcREFcode: PRIData[3],
                medicalHisRef: PRIData[11]
            };
            dataObj = dataPRI;
        } else if (msg_code === "ARQ") {
            ARQ = disSumNote;
            var ARQData = convertNoteToData(ARQ);

            var objARQ = {
                Acode: "FLU",
                DateFollowUp: ARQData[2],
                commentFLU: ARQData[11],
                docFLUCode: ARQData[14],
                searchFLU: ARQData[15]
            };
            dataObj = objARQ;
        } else if (msg_code === "MOR") {
            MOR = disSumNote;

            var monArry = MOR.split("|");
            var monArryInfo = monArry[1].split("^");
            var monArryTest = monArry[2].split("^");
            var monArryHfc = monArry[3].split("^");

            var objMON = {
                Acode: "MON",
                codeMON: monArryInfo[0],
                searchMON: monArryTest[1],
                reqItem: monArryTest[0],
                testMON: monArryTest[0],
                MONHFC_cd: monArry[12].trim(),
                searchHFC_MON: monArry[12],
                searchDIS_MON: monArry[10]

            };
            dataObj = objMON;
        } else if (msg_code === "ADW") {
            ADW = disSumNote;

            var adwArry = ADW.split("|");
            var adwInfo = adwArry[2].split("^");
            var adwDateTime = adwInfo[11].split(" ");

            var objADW = {
                Acode: "ADW",
                AdmitDate: adwDateTime[0],
                AdmitTime: adwDateTime[1],
                AdmitToDiscipline: adwInfo[2],
                AdmitToDisciplineCd: adwInfo[1],
                AdmittedBefore: adwInfo[10],
                PatientReferFrom: disciplineName,
                PatientReferFromCd: discipline,
                Reason: adwInfo[7],
                WardName: adwInfo[5],
                WardNameCd: adwInfo[4]
            };
            dataObj = objADW;
        }

        var index = getDCGItemIndex(_data, dataObj);
        indexArry.push(index);

    }


    var dcgDetail = data[0].split("|");
    var dischargeInfo = dcgDetail[2].split("^");
    var dateTimeA = dischargeInfo[7].split(" ");
    var date = dateTimeA[0];
    var time = dateTimeA[1];
    var disposition = dischargeInfo[8];
    var comment = dischargeInfo[9];

    indexArry.pop();

    var objDCG = {
        Acode: "DCG",
        comment: comment,
        date: date,
        time: time,
        disposition: disposition,
        index: indexArry,
        hfcOrderDetail: DCGhfcDetail[0],
        hfcProviderDetail: DCGhfcDetail[1]
    };
    _data.push(objDCG);
    var id = _data.length - 1;
    displayDCGId(date, time, disposition, comment, id);



}

function getDCGItemIndex(data, dcgObj) {
    var index;

    for (var k in data) {

        if (data[k].Acode === "ROS") {
            if (data[k].codeROS === dcgObj.codeROS) {
                index = k;
            }
        } else if (data[k].Acode === "DTO") {
            if (data[k].drugCode === dcgObj.drugCode) {
                index = k;
            }
        } else if (data[k].Acode === "POS") {
            if (data[k].procedure_cd === dcgObj.procedure_cd) {
                index = k;
            }
        } else if (data[k].Acode === "LOS") {
            if (data[k].codeLOS === dcgObj.codeLOS) {
                index = k;
            }
        } else if (data[k].Acode === "MON") {
            if (data[k].searchMON === dcgObj.searchMON) {
                index = k;
            }
        } else if (data[k].Acode === "ADW") {
            if (data[k].Reason === dcgObj.Reason) {
                index = k;
            }
        } else if (JSON.stringify(data[k]) === JSON.stringify(dcgObj)) {

            index = k;
        }
    }

    return index;
}
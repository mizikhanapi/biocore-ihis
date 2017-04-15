/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var EHRrecord = "";
$(document).ready(function () {

    var fullPatientData = "";
    var PDIInfo = "";



    $('#listQueue').on('click', '#consultBtn', function (e) {
        if(pmiNo === "" && episodeDate === ""){
            reloadStat = "1";
            console.log(reloadStat);
            e.preventDefault();
            $('#mainConsultBar').show();
            var row = $(this).closest('tr');
            pmiNo = row.find('#pmiNumber').text();
            episodeDate = row.find('#epiDate').text();
            status = row.find('#status').text();
            statusBe4 = row.find('#status').text();
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
            console.log(PDIInfo);

            if (status === 'On Hold') {
                getEHRPatient(pmiNo, episodeDate);
            }

            $('#queueModal').modal('toggle');
            $('.soap-select').unbind('click');
        } else {
            alert('You need complete the consultation on patient before first');
        }



    });
});

function findPatient(pmiNo,episodeDate) {
    $.ajax({
        url: 'search/searchPatient.jsp',
        method: 'POST',
        data: {
            pmiNo: pmiNo,
            episodeDate:episodeDate
        },
        timeout: 10000,
        success: function (result) {
            // console.log(result);
            var DataArry = result.split("|");
            $('#pName').html(DataArry[1]);
            $('#pIC').html(DataArry[0].trim());
            $('#pBloodType').html(DataArry[3]);
            $('#pSex').html(DataArry[4]);
            $('#pIdType').html(DataArry[5]);
            $('#pAllergy').html(DataArry[8]);
            $('#pAge').html(DataArry[6]);
            $('#pRace').html(DataArry[7]);
            fullPatientData = DataArry[9];


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
            episodeDate:episodeDate
        },
        timeout: 10000,
        success: function (result) {
            PDIInfo = result.trim();
        },
        error: function (err) {
            alert(err);
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
            //console.log(result);
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
            //console.log(EHRrecord);
            convertEHR(EHRrecord);
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

function convertPEMId(idAry){
    var newIdAry = [];
    var id = "";
    var size = idAry.length;
    for(var i = 0; i<size; i++){
        if (id === ""){
            id = id + idAry[i] ;
        } else{
            id = id +","+ idAry[i] ;
        }
        newIdAry.push(id);  
    }
    console.log(newIdAry);
    return newIdAry;
}

function convertEHR(ehr) {
    var EHRArry = ehr.split("<cr>");
    var PDI;
    var CCN;
    var HPI;

    for (var i = 0; i < EHRArry.length; i++) {
        var EHRD = EHRArry[i].trim();
        var header = EHRD.substring(0, 3);
        //console.log(header);
        if (header === "CCN") {
            CCN = EHRArry[i];
            var CNNData = convertNoteToData(CCN);
            var objCCN = {
                Acode: "CCN",
                ccnCode: CNNData[1],
                Laterality:CNNData[11],
                Site:CNNData[9],
                problem: CNNData[2],
                Mild: CNNData[4],
                duration: CNNData[5],
                sdur: CNNData[7],
                Comment: CNNData[12]
            };

            _data.push(objCCN);
            displayCCN(objCCN.problem,objCCN.Mild,objCCN.Site,objCCN.duration,objCCN.sdur,objCCN.Laterality,objCCN.Comment);
           //console.log(CNNData);

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
            // console.log(_data);

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
            displayPMH(objPMH.Problem1,objPMH.Status,objPMH.comment1);
            ///  console.log(_data);

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
            displayFMH(objFMH.Problem3,objFMH.f_relationship,objFMH.comment2);
            // console.log(_data);

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
            displaySOH(objSOH.Problem4,objSOH.date,objSOH.comment3);
            // console.log(SOHData);
            // console.log(_data);

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
             displayBLD(objBLD.blood,objBLD.Rhesus_Type,objBLD.G6PD_Status,objBLD.comment4);

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
             displayAllergy(objALG.Problem5,objALG.date1,objALG.comment5);

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
            displayIMU(objIMU.Problem6,objIMU.date2,objIMU.comment6);
            
        } else if (header === "DAB") {
            DAB = EHRArry[i];
            var DABData = convertNoteToData(DAB);
            var objDAB = {
                Acode: "DAB",
                Problem32: DABData[1],
                codeDAB: DABData[0],
                comment7: DABData[5],
                date3: DABData[2]
            };
            _data.push(objDAB);
            displayDAB(objDAB.Problem32,objDAB.date3,objDAB.comment7);
            //console.log(DABData);

        } else if (header === "VTS") {
            VTS = EHRArry[i];
            var VTSData = convertNoteToData(VTS);
            console.log(VTSData);

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
            
            if(VTSData[25] !== "" || VTSData[26] !==""){
                var objGCS = {
                    Acode: "VTS",
                    pointMain: VTSData[25],
                    resultMain: VTSData[26]
                };
                _data.push(objGCS);
                displayGCS(objGCS.resultMain, objGCS.pointMain);
            } 
            
         
           if(VTSData[27] !== ""|| VTSData[27] !==""){
               
                var objPGCS = {
                    Acode: "VTS",
                    pointpgcsMain: VTSData[27],
                    resultpgcsMain: VTSData[28]
                };
                _data.push(objPGCS);
                displayPGCS(objPGCS.resultpgcsMain, objPGCS.pointpgcsMain);

            } 
            if(VTSData[4] === "" && VTSData[33] === "undefined" && VTSData[3] === "" && VTSData[2] === ""&& VTSData[32] === "undefined" && VTSData[1] === ""&& VTSData[6] === "" && VTSData[34] === "undefined" && VTSData[5] === ""){
                console.log("no BP");
            }else{
                
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
                console.log()
               displayBP(objBP.sitS, objBP.sitD, objBP.sitP, objBP.standS, objBP.standD, objBP.standP, objBP.lyingS, objBP.lyingD, objBP.lyingP);
            }
               if(VTSData[10] === "" || VTSData[10]==="undefined"){
                   console.log("no rrrate");
               }else{
                 var objRRate = {
                    Acode: "VTS",
                    rrRate: VTSData[10]
                };
                _data.push(objRRate);
                displayrrRate(objRRate.rrRate);
               }

                if(VTSData[29]==="" || VTSData[29]==="undefined"){
                    console.log("no osat");
                }else{
                   var objOsat = {
                    Acode: "VTS",
                    OSat: VTSData[29]
                };
                _data.push(objOsat);
                displayOsat(objOsat.OSat);
                
                }

                if(VTSData[0]==="" || VTSData[0] ==="undefined"){

                }else{
                  var objBTemp = {
                    Acode: "VTS",
                    BTemp: VTSData[0]
                };
                _data.push(objBTemp);
                displayBTemp(objBTemp.BTemp);
                }

                if(VTSData[30] === "" || VTSData[30] ==="undefined"){
                    
                }else{
                  var objPainScale = {
                    Acode: "VTS",
                    painScale: VTSData[30],
                    resultPanScale: resultPC
                };
                _data.push(objPainScale);
                displayPanScale(objPainScale.painScale, objPainScale.resultPanScale);
                }
                
                if(VTSData[8] === "" && VTSData[7] ==="" && VTSData[31] === ""  ){
                    
                }else{
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
                       console.log(objOther);
                       displayOther(heightO[0], weightO[0], objOther.bmi, objOther.bmiStatus, objOther.headCir, objOther.bloodGlucose);
                }






        } else if (header === "PEM") {
            PEM = EHRArry[i];
            console.log(PEM);
            var PEMData = convertNoteToData(PEM);
            var idArr = PEMData[2].split(",");
            var pe0t8 = PEMData[3].split(',');
            var pe0 = pe0t8[0];
            var pe1 = pe0t8[1];
            var pe2 =pe0t8[2];
            var pe3 =pe0t8[3];
            var pe4 =  pe0t8[4];
            var pe5 =  pe0t8[5];
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
           if(pe0t8[5] === undefined){
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
                Acode:"PEM",
                PEComment:PEMData[5],
                id:newIdAry,
                pe0:pe0,
                pe1:pe1,
                pe2:pe2,
                pe3:pe3,
                pe4:pe4,
                pe5:pe5,
                pe6:pe6,
                pe7:pe7,
                pe8:pe8
                
            };
             var PEMNotes =    convertPEMtoNotes(objPEM);
           _data.push(objPEM);
           console.log(objPEM);
           displayPEM(PEMNotes,objPEM.PEComment);
            
        }else if (header === "DGS") {
            DGS = EHRArry[i];
            var DGSData = convertNoteToData(DGS);
            var objDGS = {
                Acode: "DGS",
                LateralityDGS:DGSData[15],
                SeverityDGS:DGSData[9],
                SiteDGS:DGSData[11],
                TypeDGS:DGSData[0],
                commentDGS:DGSData[18],
                dateDGS:DGSData[3],
                dgsCode:DGSData[6],
                searchDiag:DGSData[7]
            };
            _data.push(objDGS);
            displayDGS(objDGS.TypeDGS,objDGS.dateDGS,objDGS.searchDiag,objDGS.SeverityDGS,objDGS.SiteDGS,objDGS.LateralityDGS,objDGS.commentDGS)
           //console.log(DGSData);
        } else if (header === "PNT") {
            PNT = EHRArry[i];
            var PNTData = convertNoteToData(PNT);
            var objPNT = {
                Acode: "PNT",
                PNT:PNTData[0],
                codePNT:"PNT"
            };
            _data.push(objPNT);
            displayPNT(objPNT.PNT);
   
        } else if (header === "ROS") {
            ROS = EHRArry[i];
            var ROSData1 = ROS.split("|");
            var imgInv = ROSData1[2].split("^");
            var hfcAry = ROSData1[4].split("^");
            var prioyAry = ROSData1[6].split("^");
            
//            var ROSData = ROSData1[1].split("^");
//            var ROSData = convertNoteToData(ROS);
         console.log(ROSData1);

            $.ajax({
                method:'POST',
                url:'search/searchRISProcedure_EHR.jsp',
                data:{
                    id:imgInv[1],
                    hfc_cd:hfcAry[0]
                },
                timeout:5000,
                success:function(result){
                    
                    var detailROS = result.split("|");
                    //console.log(detailROS);
                    var objROS = {
                        Acode: "ROS",
                        ROS: imgInv[1],
                        appointmentROS:ROSData1[3],
                        bodySystemROS:detailROS[4],
                        bodySystemROSCode:detailROS[2],
                        codeROS: imgInv[0],
                        commentROS: ROSData1[7],
                        hfcIdROS:hfcAry[0],
                        hfcROS: hfcAry[1],
                        locationROS:detailROS[5],
                        modalityROS:detailROS[3],
                        modalityROSCode:detailROS[2],
                        priorityROS:prioyAry[2]
                    };
                    _data.push(objROS);
                    displayROS(objROS.codeROS, objROS.ROS, objROS.commentROS, objROS.modalityROS, objROS.modalityROScode, objROS.bodySystemROS, objROS.bodySystemROS, objROS.bodySystemROSCode, objROS.hfcROS, objROS.hfcROScode,objROS.locationROS,objROS.appointmentROS,objROS.priorityROS);
                }
                
            });


        } else if (header === "LIO") {
            LIO = EHRArry[i];
            var LIOData = LIO.split("|");
            console.log(LIOData);
//            var LIOData = LIOData_2[1].split("^");
            var labAry = LIOData[2].split("^");
            var prioAry = LIOData[5].split("^");
            var hfcAry = LIOData[6].split("^");
            

          $.ajax({
              method:'post',
              url:'search/searchLOS_EHR.jsp',
              data:{
                  name:labAry[1]
              },
              timeout:5000,
              success:function(result){
                  var LIODetail = result.trim().split("|");
                  //console.log(LIODetail);
                    var objLIO = {
                        Acode: "LOS",
                        appointmentLOS: LIOData[3],
                        catLOS: LIODetail[2],
                        codeLOS: labAry[0],
                        commentLOS: LIOData[7],
                        containerLOS: LIODetail[4],
                        hfcIdLOS: hfcAry[0],
                        hfcLOS: hfcAry[1],
                        priorityLOS: prioAry[1],
                        searchLOS: labAry[1],
                        sourceLOS: LIODetail[3],
                        spclLOS: LIODetail[6].trim(),
                        volumeLOS: LIODetail[5]
                    };
                    _data.push(objLIO);
                    console.log(objLIO);
                    displayLOS(objLIO.searchLOS, objLIO.codeLOS, objLIO.catLOS, objLIO.sourceLOS, objLIO.containerLOS, objLIO.volumeLOS, objLIO.spclLOS, objLIO.commentLOS, objLIO.appointmentLOS, objLIO.priorityLOS,objLIO.hfcLOS,objLIO.hfcIdLOS)
              },
              error:function(err){
                  console.log(err);
              }
          });
 

        }else if (header === "DTO") {
            DTO = EHRArry[i];
            var DTOData1 = DTO.split("|");
            //var DTOData = DTOData1[1].split("^");
            var reqDrugAry = DTOData1[2].split("^");
            var reqDrugFormAry = DTOData1[3].split("^");
            var reqDrugRouteAry = DTOData1[4].split("^");
            var reqDrugFreqAry = DTOData1[5].split("^");
            var reqDrugUOMAry = DTOData1[9].split("^");
            var hfcDeliverAry = DTOData1[12].split("^");
            var commentAry = DTOData1[5].split("^");
            console.log(DTOData1);
 
            var objDTO = {
                Acode: "DTO",
                cautionaryDTO:commentAry[0],
                commentDTO:commentAry[1],
                doseDTO:DTOData1[7],
                drugFrequencyDTO:reqDrugFreqAry[1],
                drugInstructionDTO:reqDrugUOMAry[2],
                drugNameDTO:reqDrugFormAry[0],
                drugQtyDTO:DTOData1[11],
                drugStrDTO:DTOData1[8],
                dtoCode:reqDrugAry[0],
                durationDTO:DTOData1[10],
                searchDTO:reqDrugAry[1],
                unitDTO:DTOData1[6]
            };
            _data.push(objDTO);
           displayDTO(objDTO.searchDTO, objDTO.drugNameDTO, objDTO.drugStrDTO, objDTO.doseDTO, objDTO.drugFrequencyDTO, objDTO.durationDTO, objDTO.unitDTO, objDTO.drugInstructionDTO, objDTO.cautionaryDTO, objDTO.commentDTO) ;
        }else if (header === "POS") {
            POS = EHRArry[i];
            var POSData1 = POS.split("|");
            var POSData = POSData1[2].split("^");
           console.log(POSData1);
            var objPOS = {
                Acode:"POS",
                Problem18:POSData[1],
                proType: POSData1[4],
                procedure_cd:POSData[0]
            };
            _data.push(objPOS);
           displayPOS(objPOS.Problem18, objPOS.proType, objPOS.procedure_cd) ;
       }else if (header === "MEC") {
            MEC = EHRArry[i];
            var MECData1 = MEC.split("^ICD10");
            var MECData = MECData1[2].split("^");
           
            var objMEC = {
                Acode:"MEC",
                DateFromMEC:MECData[5],
                DateToMEC: MECData[6],
                num1MEC:MECData[3],
                num2MEC:MECData[4]
            };
            _data.push(objMEC);
             console.log(objMEC);
          displayMCTS(objMEC.DateFromMEC, objMEC.DateToMEC, objMEC.num1MEC, objMEC.num2MEC);
       }else if (header === "PRI") {
            PRI = EHRArry[i];
            var PRIData = convertNoteToData(PRI);
            //console.log(PRIData);
            var objPRI = {
                Acode:"PRI",
                REF:PRIData[4],
                appREF: PRIData[2],
                disREF:PRIData[6],
                disREFcode:PRIData[5],
                docREFcode:PRIData[14],
                docREF:PRIData[15],
                hfcREFcode:PRIData[3],
                medicalHisRef:PRIData[11]
            };
            _data.push(objPRI);
             //console.log(objPRI);
         displayPRI(objPRI.REF, objPRI.hfcREFcode, objPRI.disREF, objPRI.disREFcode, objPRI.docREF, objPRI.appREF, objPRI.medicalHisRef);
       } else if (header === "ARQ") {
            ARQ = EHRArry[i];
            var ARQData = convertNoteToData(ARQ);
            console.log(ARQData);
            var objARQ = {
                Acode:"FLU",
                DateFollowUp:ARQData[2],
                commentFLU:ARQData[11],
                docFLUCode:ARQData[14],
                searchFLU:ARQData[15]
            };
            _data.push(objARQ);
           //  console.log(objPRI);
         displayFLU(objARQ.searchFLU, objARQ.DateFollowUp, objARQ.commentFLU)
       }
    }
    console.log(_data);
}
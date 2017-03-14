/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var processNotes = "";

$(document).ready(function (e) {
    
    $('#mainConsultBar').hide();

    var VTSObj = {};
    var vtsCounter = 0;

    //------------------------------------------------------------ DISCHARGE BUTTON
    $('#dischargeBtn').click(function () {
        
       
       var pmiNo = $('#pmiNumber').text();
       
       getSettingConsult(doctor_id);
       
    });

    //------------------------------------------------------------ ON HOLD BUTTON
    $('#holdBtn').click(function () {
        var c = confirm("Are you sure you want ON HOLD this patient?");
        var pmiNo = $('#pmiNumber').text();
        if (c === true) {
            getPDI(pmiNo);
            storeData(2);
        } else {
            alert('ON HOLD Cancel');
        }
});

$("#missingBtn").click(function(){
    alert("Missing Button");
     var pmiNo = $('#pmiNumber').text();
       var c = confirm("Are you sure you want declare this patient are MISSING?");       
       
       if(c === true){
           storeData(4);
       } else {
           alert('Data not be saved');
       }
});

$("#nextBtn").click(function(){
        var currentDate = getDateNext();
        var date = currentDate[0];
        console.log(currentDate);
        //console.log(date);
        console.log(hfc_cd);

        nextPatient(currentDate, hfc_cd);
});


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
        vtsNotes += "VTS|" + getDate() + "|" + d.BTemp + "^" + d.sitS + "^" + d.sitD + "^" + d.lyingS + "^" + d.lyingD + "^" + d.standS + "^" + d.standD + "^" + d.bmiWeight + "^" + d.bmiHeight + "^" + d.headCir + "^" + d.rrRate + "^" + d.pointMain + "^" + "^^^^^^^^^^" +hfc_cd +"^"+doctor_id+"^"+doctor_name+"^" + d.pointMain + "^" + d.resultMain + "^" + d.pointpgcsMain + "^" + d.resultpgcsMain + "^" + d.OSat + "^" + d.painScale + "^" + d.bloodGlucose + "^" +d.sitP+"^"+d.lyingP+"^"+d.standP+ "|<cr>\n";
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

        for (var i = 0; i < PECodes.length; i++) {
            if (PECodes[i] !== "") {
                PECd = PECodes[i];
            } else if (PECodes[i] === "") {
                console.log(PECd);
            }
        }

        var Comment = PEMData.PEComment;
        PEMNotes = "PEM|2015-01-16  16:27:58|^^" + PECd + "^" + NotesPE + "^^" + Comment + "^^^^^"+getDate()+"^"+hfc_cd+"^"+doctor_id+"^"+doctor_name+"|<cr>\n";

        return PEMNotes;
    }
    
    function convertToOrderNotes(data){
         var orderNotes = "ORC|OK||||<cr>\n";
        for(var key in data){
            if (data[key].Acode === "ROS") {
                orderNotes += "ROS|" + getDate() + "|"+ data[key].codeROS+"^" + data[key].ROS+"^"+ data[key].commentROS+"^"+ "|<cr>\n";
            } else if (data[key].Acode === "DTO") {
                var note1 = data[key].drugFrequencyDTO+"^"+data[key].drugInstructionDTO+"^"+data[key].unitDTO+"^"+data[key].doseDTO;
               var note2 = "^"+data[key].drugStrDTO+"^^^^"+data[key].durationDTO+"^"+data[key].drugQtyDTO+"^^"+data[key].cautionaryDTO+"^"+data[key].commentDTO;
               var note3 = "^"+hfc_cd+"^^" + discipline + "^^"+ subdis + "^^" + "|<cr>\n";
                orderNotes += "DTO|" + getDate() + "|^"+data[key].dtoCode+"^ "+data[key].searchDTO+"^^"+data[key].drugNameDTO+"^^" + note1 + note2 + note3;
            } else if (data[key].Acode === "LOS") {
                var search = data[key].catLOS.split("/");
                 orderNotes += "LIO|" + getDate() + "|"+search[0]+"^"+search[1]+"^"+data[key].sourceLOS+"^"+data[key].codeLOS+"^"+data[key].searchLOS+"^"+data[key].containerLOS+"^^^^^^"+data[key].volumeLOS+"^"+data[key].commentLOS+"^"+hfc_cd+"^^" + discipline + "^^"+ subdis + "^^" + "|<cr>\n";
            } else if (data[key].Acode === "POS") {
                 orderNotes += "POS|" + getDate() + "|^^"+data[key].Problem18+"^"+data[key].procedure_cd+"^"+data[key].proType+"^^^^^^^^^^^"+hfc_cd+"|<cr>\n";
            } 
        }
        return orderNotes;
    }

    function convertToNotes(data) {
        for (var key in data) {
            if (data[key].Acode === "CCN") {
                processNotes += "CCN|" + getDate() + "|^" + data[key].ccnCode + "^" + data[key].problem + "^^" + data[key].Mild + "^" + data[key].duration + "^^" + data[key].sdur + "^^"+data[key].Site+"^^"+data[key].Laterality+"^" + data[key].Comment + "|<cr>\n";          
            } else if (data[key].Acode === "HPI") {
                processNotes += "HPI|" + getDate() + "|" + data[key].details + "^" + getDate() + "^"+hfc_cd+"^"+doctor_id+"^"+doctor_name+"|<cr>\n";
            } else if (data[key].Acode === "PMH") {
                processNotes += "PMH|" + getDate() + "|"+ data[key].codePMH+"^" + data[key].Problem1 + "^^^^"+data[key].comment1+"^^^"+data[key].Status+"^"+getDate()+"^"+hfc_cd+"^"+doctor_id+"^"+doctor_name+"^^^|<cr>\n";
            } else if (data[key].Acode === "FMH") {
                processNotes += "FMH|" + getDate() + "|" + data[key].f_relationship + "^" + data[key].codeFMH +"^" + data[key].Problem3 + "^^^^"+ data[key].comment2 +"^^^^^"  + getDate() + "^" +hfc_cd+"^"+doctor_id+"^"+doctor_name+"^|<cr>\n";
            } else if (data[key].Acode === "SOH") {
                processNotes += "SOH|" + getDate() + "|" +data[key].codeSOH + "^" + data[key].Problem4 + "^^^^^^"  + data[key].date + "^^^^"+ data[key].comment3 +"^^^" + getDate() +  "^" +hfc_cd+"^"+doctor_id+"^"+doctor_name +"|<cr>\n";
            } else if (data[key].Acode === "BLD") {
                processNotes += "BLD|" + getDate() + "|" + data[key].blood + "^" + data[key].Rhesus_Type + "^" + data[key].G6PD_Status + "^"+data[key].comment4+"|<cr>\n";
            } else if (data[key].Acode === "ALG") {
                processNotes += "ALG|" + getDate() + "|" + data[key].codeALG + "^" + data[key].Problem5 + "^" + data[key].date1 + "^" + data[key].comment5 + "^^^^^"+getDate()+"^" +hfc_cd+"^"+doctor_id+"^"+doctor_name+"^^^|<cr>\n";
            } else if (data[key].Acode === "IMU") {
                processNotes += "IMU|" + getDate() + "|" + data[key].codeIMU + "^" + data[key].Problem6 + "^" + data[key].date2 + "^" + data[key].comment6 + "^^^^"+getDate()+"^" +hfc_cd+"^"+doctor_id+"^"+doctor_name+"^^^|<cr>\n";
            } else if (data[key].Acode === "DAB") {
                processNotes += "DAB|" + getDate() + "|" + data[key].codeDAB + "^" + data[key].Problem32 + "^" + data[key].date3 + "^^^"+data[key].comment7+"|<cr>\n";
            } else if (data[key].Acode === "VTS") {
                $.extend(VTSObj, data[key]);
            } else if (data[key].Acode === "PEM") {
                var peFnote = convertPEM(data[key]);
                processNotes += peFnote;
            } else if (data[key].Acode === "DGS") {
                processNotes += "DGS|" + getDate() + "|" + data[key].TypeDGS + "^^^" + data[key].dateDGS + "^^^"+data[key].dgsCode+"^"+data[key].searchDiag+"^^"+data[key].SeverityDGS+"^^"+data[key].SiteDGS+"^^^^"+data[key].LateralityDGS+"^^^"+data[key].commentDGS+"^^^"+getDate()+"^"+hfc_cd+"^"+doctor_id+"^"+doctor_name+"^^^|<cr>\n";
            } else if (data[key].Acode === "PNT") {
                processNotes += "PNT|" + getDate() + "|" + data[key].PNT + "^^^^" + getDate() +"^"+hfc_cd+"^"+doctor_id+"^"+doctor_name+"|<cr>\n";
            }

        }
        var VTSNotes = convertVTS(VTSObj);
        processNotes +=VTSNotes;
        console.log(HCSContent);

        return processNotes;
    }

    function clearCIS() {
      location.href = './CIS000000.jsp';
    }
    
    function storeData(status){
        var statusDesc;
        if(status === 2){
            statusDesc = "Oh Hold";
        } else if(status === 1){
            statusDesc = "Discharge";
        } else if(status === 0){
            statusDesc = "Waiting";
        } else if(status === 4){
            statusDesc = "Missing";
        } 
       
        var msh = "MSH|^~|CIS|"+hfc_cd+"^"+discipline+"^"+subdis+"|" + getDate() + "|||||<cr>\n";
        var pdi = PDIInfo+"|<cr>\n";
        var ord = convertToOrderNotes(_data);
        countVTS(_data);

        //console.log(vtsCounter);
        vtsCounter = 0;

        console.log(_data);
        var SendNotes = convertToNotes(_data);
           
           notes = msh + pdi + SendNotes+ord;
           console.log(episodeDate);
           console.log(pmiNo)
           
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
                if(d === '|1|'){

                    clearCIS();
                    alert('Patient has been '+ statusDesc);
                } else  if(d==='|3|'){
                  clearCIS();
                    alert('Patient record has been '+ statusDesc);
                }
            },
            error: function (err) {
                console.log(err)
                $('#consultationNotes').html("Error: " + err);
                notes = "";
            }
        });
    }

    

     
    function nextPatient(currentDate, hfc){

        $.ajax({
            url:"topMenuFunction/searchNextPatient.jsp",
            method:"POST",
            timeout:10000,
            data:{
                date:currentDate,
                hfc:hfc
            },
            success:function(result){
                //console.log(result);
                if(result.trim() === "|O|"){
                    alert("No patient in queue");
                }else {
                    var nextPArry = result.trim().split("|");
                    pmiNo = nextPArry[0];
                    episodeDate = nextPArry[1];

                    findPatient(pmiNo);
                    $('.soap-select').unbind('click');
                    getPDI(pmiNo);
                    updateStatus(pmiNoN,epiDate,5);
                }
              
             

            }
        })
    }
 
 
 function getSettingConsult(user_id){
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
            if(result.trim() === "|O|"){
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
 
 
 function getStatusData(data){
     var sCCN = false;
     var sDGS = false;
     
     for(var key in data){
             if (data[key].Acode === "CCN") {
                 sCCN = true;
             } else  if (data[key].Acode === "DGS") {
                 sDGS = true;
             }
     }
     
     return [sCCN,sDGS];
 }
  });
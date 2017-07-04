/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    var _dataROS = [];
    var updateIndex;
    var updateObj;
    var rowId;
    var hfcRISCode = "";
    var rowDataTr;
    $("#tCISOEROSProcedureSearch").prop("disabled", true);
    
    searchingHFC( "tCISOEROSHFC", "tCISOEROSHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdROS", "locationROS", "hfcOrderDetail", "hfcProviderDetail");
    
    searching("tCISOEROSProblemName","tCISOEROSProblemNameLoading","search/ResultCCNSearch.jsp","problemCode","search/ResultCCNSearchCode.jsp");
    
    $("#tCISOEROSHFC").on('change',function(){
        $("#tCISOEROSProcedureSearch").prop("disabled", false);
        searchingRISPRO("tCISOEROSProcedureSearch", "tCISOEROSProcedureSearchLoading", "search/ResultRISProcedureSearch.jsp", "search/ResultRISProcedureSearchCode.jsp", "codeROS_2", "modalityROSCode", "modalityROS", "bodySystemROSCode", "bodySystemROS",'')
    });
     $("#btnCIS_OE_ROS_UPDATE").hide();
     $("#btnCIS_OE_ROS_CANCEL").hide();
     
     $("#btnCIS_OE_ROS_SUBMIT").click(function(e){
        e.preventDefault();
        console.log(_dataROS);

        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var msh = getMSH();
            var pdi = PDIInfo;
            var orc = convertORC(_dataROS[0], "02", "06");
            for (var i in _dataROS) {
                msg += convertROS(_dataROS[i]);
            }
            fullmsg = msh + pdi + orc + msg;
            
            $.ajax({
                type:"POST",
                timeout:3000,
                url:"topMenuFunction/SendOrder.jsp",
                data:{
                    msg: fullmsg,
                    pmino: pmiNo,
                    episodedate: episodeDate,
                    status: "1"
                },
                success:function(response){
                    console.log(response);
                }
            })
            

        } else {
            return false;
        }
        
//        console.log(msh);
//        console.log(pdi);
//        console.log(orc);
//        console.log(msg);
     });
    
    $("#btnCIS_OE_ROS_ADD").click(function(e){
        e.preventDefault();
        var index;
        
        var ROS = $('#tCISOEROSProcedureSearch').val();
        var codeROS = $('#codeROS_2').val();
        var problemCode = $('#problemCode').val();
        var problemName = $('#tCISOEROSProblemName').val();
        var commentROS = $('#commentROS').val();
        var modalityROS = $('#modalityROS').val();
        var modalityROScode = $('#modalityROSCode').val();
        var bodysysROS = $('#bodySystemROS').val();
        var bodysysROScode = $('#bodySystemROSCode').val();
        var hfcROS = $('#tCISOEROSHFC').val();
        var hfcROScode = $('#hfcIdROS').val();
        var locationHFCROS = $('#locationROS').val();
        var appointmentROS = $('#appointmentROS').val();
        var patientConditionROS = $('#priorityROS').val();
        var patientCondition =  $('#patientConditionROSCd  :selected').text().trim();
        var priority =  $('#priorityROScd :selected').text().trim();
        

        var $items = $('#commentROS,#modalityROS,#modalityROSCode,#bodySystemROS,#bodySystemROSCode,#hfcIdROS,#locationROS,#appointmentROS,#patientConditionROSCd,#priorityROScd,#hfcOrderDetail,#hfcProviderDetail');
        var obj1 = {
            Acode: 'ROS',
            ROS:ROS,
            patientConditionROS:patientCondition,
            priorityROS: priority,
            codeROS:codeROS,
            hfcROS:hfcROS,
            problemCode:problemCode,
            problemName:problemName
           };
           
        $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _dataROS.push(obj1);
        index = _dataROS.lastIndexOf(obj1);
        console.log(index);
        appendOrderROS(obj1,index);
        clearROSField();
    });
    
    $("#tableOrderROS").on("click",".btnDelete",function(e){
        e.preventDefault();
        rowDataTr = $(this).closest("tr");
        var delId = $(this).get(0).id;
        var delIdA = delId.split("|");
        var delIndex = parseInt(delIdA[1]);
        var delConfirm = confirm('Are you want to delete this Order? ');
        if (delConfirm === true) {
            delete _dataROS[delIndex];
            $(this).closest('tr').remove();
            console.log(_dataROS);
        } else {
            return false;
        }
    })
    
    $("#tableOrderROS").on("click",".btnUpdate",function(e){
        e.preventDefault();
        $("#btnCIS_OE_ROS_UPDATE").show();
        $("#btnCIS_OE_ROS_CANCEL").show();
        $("#btnCIS_OE_ROS_ADD").hide();
        rowDataTr = $(this).closest("tr");
       rowId = $(this).get(0).id;
       var index = rowId.split('|');
       index = parseInt(index[1]);
       updateIndex = index;
       updateObj = _dataROS[index];
       console.log(updateObj);
       retrieveDataSearchingHFC("tCISOEROSHFC", "tCISOEROSHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdROS", "locationROS", "hfcOrderDetail", "hfcProviderDetail",updateObj.hfcROS,updateObj.ROS);
        searchingRetrieve("tCISOEROSProblemName", "tCISOEROSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCode", "search/ResultCCNSearchCode.jsp",updateObj.problemName);
        searchingRISPRO("tCISOEROSProcedureSearch", "tCISOEROSProcedureSearchLoading", "search/ResultRISProcedureSearch.jsp", "search/ResultRISProcedureSearchCode.jsp", "codeROS_2", "modalityROSCode", "modalityROS", "bodySystemROSCode", "bodySystemROS",updateObj.ROS);
        $("#locationROS").val(updateObj.locationROS);
       $("#hfcProviderDetail").val(updateObj.hfcProviderDetail);
       $("#hfcOrderDetail").val(updateObj.hfcOrderDetail);
       $('#hfcIdROS').val(updateObj.hfcIdROS);
       
       $('#commentROS').val(updateObj.commentROS);
       $('#hfcProviderDetail').val(updateObj.hfcProviderDetail);
       $('#hfcOrderDetail').val(updateObj.hfcOrderDetail);
        $('#problemCode').val(updateObj.problemCode);
        $('#modalityROS').val(updateObj.modalityROS);
        $('#modalityROSCode').val(updateObj.modalityROSCode);
        $('#bodySystemROS').val(updateObj.bodySystemROS);
        $('#bodySystemROSCode').val(updateObj.bodySystemROSCode);
        $('#hfcROS').val(updateObj.hfcROS);
        $('#hfcIdROS').val(updateObj.hfcIdROS);
        $('#locationROS').val(updateObj.locationROS);
        $('#appointmentROS').val(updateObj.appointmentROS);
        $('#patientConditionROSCd').val(updateObj.patientConditionROSCd);
        $('#priorityROScd').val(updateObj.priorityROScd);
       
        console.log(rowDataTr)
    })
    $("#btnCIS_OE_ROS_CANCEL").click(function(e){
        e.preventDefault();
        $("#btnCIS_OE_ROS_UPDATE").hide();
        $("#btnCIS_OE_ROS_CANCEL").hide();
        $("#btnCIS_OE_ROS_ADD").show();
        clearROSField();
    });
    $("#btnCIS_OE_ROS_UPDATE").click(function(e){
        e.preventDefault();
       console.log(updateIndex);
       console.log(updateObj);
       console.log(rowDataTr);
       
       updateObj.ROS = $("#tCISOEROSProcedureSearch").val();
       updateObj.appointmentROS = $("#appointmentROS").val();
       updateObj.bodySystemROS = $("#bodySystemROS").val();
       updateObj.bodySystemROSCode = $("#bodySystemROSCode").val();
       updateObj.codeROS = $("#codeROS_2").val();
       updateObj.commentROS = $("#commentROS").val();
       updateObj.hfcIdROS = $("#hfcIdROS").val();
       updateObj.hfcOrderDetail = $("#hfcOrderDetail").val();
       updateObj.hfcProviderDetail = $("#hfcProviderDetail").val();
       updateObj.hfcROS = $("#tCISOEROSHFC").val();
       updateObj.locationROS = $("#locationROS").val();
       updateObj.modalityROS = $("#modalityROS").val();
       updateObj.modalityROSCode = $("#modalityROSCode").val();
       updateObj.patientConditionROS = $('#patientConditionROSCd  :selected').text().trim();
       updateObj.patientConditionROSCd = $("#patientConditionROSCd").val();
       updateObj.priorityROS = $('#priorityROScd :selected').text().trim();
       updateObj.priorityROScd = $("#priorityROScd").val();
       updateObj.problemCode = $('#problemCode').val();
       console.log(rowId);
       updateOrderROSTable(updateObj,updateIndex);
    })
    
    //function searching Radiology Procedure
    function searchingRISPRO(fieldId, loadingDivId, urlData, urlCode, codeFieldId, modalityCode, modality, bodySystemCode, bodySystem, value) {
        var keywordSearch = $("#" + fieldId).val();
        console.log(hfcRISCode);
        $('#' + fieldId).val(value).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 2000,
            url: urlData,
            cache: true,
            params: {
                timeout: 3000,
                success: function (result) {
                    console.log(result);
                    if (result === undefined) {
                        $('#' + loadingDivId).html('No Record');
                    }
                }
            }
        });

        $("#" + fieldId).on('before:flexdatalist.data', function (response) {
            $('#' + loadingDivId).html('<img src="img/LoaderIcon.gif" />');
        });
        $("#" + fieldId).on('after:flexdatalist.data', function (response) {
            $('#' + loadingDivId).html('');
        });
        $("#" + fieldId).on('select:flexdatalist', function (response) {
            var hfc_name = $("#" + fieldId).val();
            $.ajax({
                type: "post",
                url: urlCode,
                timeout: 3000,
                data: {id: hfc_name},
                success: function (response) {
                    var array_data = String(response).split("|");
                    var urosCode = array_data[0];
                    var modalityCODE = array_data[1];
                    var bodySystem1 = array_data[2];
                    var modalityName = array_data[3];
                    var bodySystemName = array_data[4];

                    $('#codeROS_2').val(urosCode.trim());
                    $('#' + modality).val(modalityName.trim());
                    $('#' + bodySystem).val(bodySystemName.trim());
                    $('#' + modalityCode).val(modalityCODE.trim());
                    $('#' + bodySystemCode).val(bodySystem1.trim());
                    $('#' + codeFieldId).val(urosCode.trim());

                }
            });

        });
    }


    
    function updateOrderROSTable(obj,index){
        console.log(rowId);
        var redcolor = '';
        if (obj.priorityROScd === 'P02') {
            redcolor = 'style="background-color:#ff9999"';
        }
        var _tr ='<td>'+obj.bodySystemROS+' </td><td>'+obj.modalityROS+'</td><<td>'+obj.ROS+'</td><td>'+obj.commentROS+'</td><td>'+obj.appointmentROS+'</td><td><a id="row|'+index+'" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|'+index+'" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
        $(rowDataTr).html(_tr);

    }
    
    function appendOrderROS(obj,index){
       
        var redcolor = '';
        if (obj.priorityROScd === 'P02'){
            redcolor = 'style="background-color:#ff9999"';
        }
        
        var _tr = '<tr '+redcolor+'  id="tr_row|'+index+'" ><td>'+obj.bodySystemROS+' </td><td>'+obj.modalityROS+'</td><<td>'+obj.ROS+'</td><td>'+obj.commentROS+'</td><td>'+obj.appointmentROS+'</td><td><a id="row|'+index+'" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|'+index+'" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderROS").append(_tr);
    }
    
    function clearROSField(){
        
        retrieveDataSearchingHFC("tCISOEROSHFC", "tCISOEROSHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "UhfcIdROS", "UlocationROS", "UhfcOrderDetail", "UhfcProviderDetail",'','');
        $("#tCISOEROSProcedureSearch").prop("disabled", true);
        searchingRetrieve("tCISOEROSProblemName", "tCISOEROSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCode", "search/ResultCCNSearchCode.jsp", "");
        $("#tCISOEROSProcedureSearch").val("");
        $('#codeROS_2').val('');
        $('#commentROS').val('');
        $('#modalityROS').val('');
        $('#modalityROSCode').val('');
        $('#bodySystemROS').val('');
        $('#bodySystemROSCode').val('');
        $('#problemCode').val('');
        $('#hfcIdROS').val('');
        $('#locationROS').val('');
        $('#appointmentROS').val('');
        $('#priorityROS').val('');
        $('#patientConditionROSCd').val('PC01');
        $('#priorityROScd').val('P01')
    }
    
    
    function retrieveDataSearchingHFC(fieldId, loadingDivId, urlData, urlCode, codeFieldId, locationField, hfcOrderDetail, hfcProviderDetail, currentHfc, currentRISProcedure) {
        $('#' + fieldId).val(currentHfc).flexdatalist({
            minLength: 3,
            searchIn: 'name',
            searchDelay: 2000,
            url: urlData,
            cache: true,
            params: {
                timeout: 3000,
                success: function (result) {
                    console.log(result);
                    if (result === undefined) {
                        $('#' + loadingDivId).html('No Record');
                    }
                }
            }
        });

        $("#" + fieldId).on('before:flexdatalist.data', function (response) {
            console.log("Start - " + getDate());
            $('#' + loadingDivId).html('<img src="img/LoaderIcon.gif" />');
        });
        $("#" + fieldId).on('after:flexdatalist.data', function (response) {
            console.log("End - " + getDate());
            $('#' + loadingDivId).html('');
        });
        $("#" + fieldId).on('select:flexdatalist', function (response) {
            var hfc_name = $("#" + fieldId).val();
            $.ajax({
                type: "post",
                url: urlCode,
                timeout: 3000,
                data: {
                    id: hfc_name,
                    orderCode: "ROS"
                },
                success: function (response) {
                    console.log(response);
                    var hfc_detail_array = response.split("[#-#]");
                    var hfc_location = hfc_detail_array[0].split("|");
                    
                    $('#' + codeFieldId).val(hfc_location[0].trim());
                    $('#' + locationField).val(hfc_location[1].trim());
                    $('#' + hfcOrderDetail).val(hfc_detail_array[1].trim());
                    $('#' + hfcProviderDetail).val(hfc_detail_array[2].trim());
                    $("#tCISOEROSProcedureSearch").prop("disabled", false);
                     searchingRISPRO("tCISOEROSProcedureSearch", "tCISOEROSProcedureSearchLoading", "search/ResultRISProcedureSearch.jsp", "search/ResultRISProcedureSearchCode.jsp", "codeROS_2", "modalityROSCode", "modalityROS", "bodySystemROSCode", "bodySystemROS",'');
                 }
            });
            
        });
    }

})
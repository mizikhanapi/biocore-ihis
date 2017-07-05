/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    var _dataDTO = [];
    var indexDTO;
    var updateDTOIndex;
    var updateDTOObj;
    var rowDTOId;
    var rowDTODataTR;
    
    $("#btnCIS_OE_DTO_UPDATE").hide();
    $("#btnCIS_OE_DTO_CANCEL").hide();
    
    searching("tCISOEDTOProblemName","tCISOEDTOProblemNameLoading","search/ResultCCNSearch.jsp","problemCodeDTO","search/ResultCCNSearchCode.jsp");
    searchDTO("tCISOEDTODrugName", "tCISOEDTODrugNameLoading", "");
    
    $("#btnCIS_OE_DTO_SUBMIT").click(function(e){
        
        e.preventDefault();
        console.log(_dataDTO);
        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var msh = getMSH();
            var pdi = PDIInfo;
            var orc = convertORC(_dataDTO[0], "02", "04");
            for (var i in _dataDTO) {
                msg += convertDTO(_dataDTO[i]);
            }
            fullmsg = msh + pdi + orc + msg;
            console.log(fullmsg);
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            }
            //sendOrder(data, "tableOrderLIO");
        } else {
            return false;
        }
        
    });
    
    
    $("#btnCIS_OE_DTO_ADD").click(function(e){
        
        e.preventDefault();
        var drugName = $('#tCISOEDTODrugName').val();
        var drugCode = $('#tCIS_DTODrugCode').val();
        var drugForm = $('#tCIS_DTODrugForm').val();
        var drugRoute = $('#tCIS_DTODrugRoute').val();
        var drugCaution = $('#tCIS_DTODrugCaution').val();
        var drugFrequencyDetail = $('#tCIS_DTODrugFrequencyDetail').val();
        var drugStrength = $('#tCIS_DTODrugStrength').val();
        var drugStrengthUnit = $('#tCIS_DTODrugStrengthUnit').val();
        var uomCode = $('#tCIS_DTODrugStrengthUnit option:selected').text();
        var drugDose = $('#tCIS_DTODrugDose').val();
        var drugDoseUnit = $('#tCIS_DTODrugDoseUnit').val();
        var drugDuration = $('#tCIS_DTODrugDuration').val();
        var drugDurationUnit = $('#tCIS_DTODrugUnit').val();
        var drugFrequency = $('#tCIS_DTODrugFrequency').val();
        var drugQuantity = $("#tCIS_DTOQuantity").val();
        var remark = $('#tCIS_DTORemark').val();
        var comment = $('#tCIS_DTOCommentArea').val();
        var hfcOrderDetail = $('#hfcOrderDetailDTO').val();
        var hfcProviderDetail = $('#hfcProviderDetailDTO').val();
        var problemCode = $("#problemCodeDTO").val();
        var problemName = $("#tCISOEDTOProblemName").val();
        
        var obj1 = {

            Acode: 'DTO',
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            drugName: drugName,
            drugCode: drugCode,
            drugForm: drugForm,
            drugRoute: drugRoute,
            drugCaution: drugCaution,
            drugFrequencyDetail: drugFrequencyDetail,
            drugStrength: drugStrength,
            drugStrengthUnit: drugStrengthUnit,
            drugDose: drugDose,
            drugDoseUnit: drugDoseUnit,
            drugDuration: drugDuration,
            drugDurationUnit: drugDurationUnit,
            drugFrequency: drugFrequency,
            uomCode: uomCode,
            remark: remark,
            comment: comment,
            drugQuantity: drugQuantity,
            problemName:problemName,
            problemCode:problemCode

        };
        
        _dataDTO.push(obj1);
        indexDTO = _dataDTO.lastIndexOf(obj1);
        appendOrderDTO(obj1, indexDTO);
        clearFieldDTO();
        
        console.log(_dataDTO);

    });
    
    $("#tableOrderDTO").on("click",".btnUpdate",function(e){
       
        e.preventDefault();
        $("#btnCIS_OE_DTO_UPDATE").show();
        $("#btnCIS_OE_DTO_CANCEL").show();
        $("#btnCIS_OE_DTO_ADD").hide();
        
        rowDTODataTR = $(this).closest("tr");
        rowDTOId = $(this).get(0).id;
        var index = rowDTOId.split("|");
        index = parseInt(index[1]);
        updateDTOIndex = indexDTO;
        updateDTOObj = _dataDTO[index];
        
        searchingRetrieve("tCISOELIOProblemName", "tCISOELIOProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodeLIO", "search/ResultCCNSearchCode.jsp",updateDTOObj.problemName);
        searchDTO("tCISOEDTODrugName", "tCISOEDTODrugNameLoading", updateDTOObj.drugName);
        
        
        $('#tCIS_DTODrugCode').val(updateDTOObj.drugCode);
        $('#tCIS_DTODrugForm').val(updateDTOObj.drugForm);
        $('#tCIS_DTODrugRoute').val(updateDTOObj.drugRoute);
        $('#tCIS_DTODrugCaution').val(updateDTOObj.drugCaution);
        $('#tCIS_DTODrugFrequencyDetail').val(updateDTOObj.drugFrequencyDetail);
        $('#tCIS_DTODrugStrength').val(updateDTOObj.drugStrength);
        $('#tCIS_DTODrugStrengthUnit').val(updateDTOObj.drugStrengthUnit);
        
        $('#tCIS_DTODrugDose').val(updateDTOObj.drugDose);
        $('#tCIS_DTODrugDoseUnit').val(updateDTOObj.drugDoseUnit);
        $('#tCIS_DTODrugDuration').val(updateDTOObj.drugDuration);
        $('#tCIS_DTODrugUnit').val(updateDTOObj.drugDurationUnit);
        $('#tCIS_DTODrugFrequency').val(updateDTOObj.drugFrequency);
        $("#tCIS_DTOQuantity").val(updateDTOObj.drugQuantity);
        $('#tCIS_DTORemark').val(updateDTOObj.remark);
        $('#tCIS_DTOCommentArea').val(updateDTOObj.comment);
        $('#hfcOrderDetailDTO').val(updateDTOObj.hfcOrderDetail);
        $('#hfcProviderDetailDTO').val(updateDTOObj.hfcProviderDetail);
        $("#problemCodeDTO").val(updateDTOObj.problemCode);
       
        
    });
    
    $("#btnCIS_OE_DTO_UPDATE").click(function(e){
        
        e.preventDefault();
        updateDTOObj.hfcOrderDetail = $("#hfcOrderDetailDTO").val();
        updateDTOObj.hfcProviderDetail = $("#hfcProviderDetailDTO").val();
        updateDTOObj.drugName = $("#tCISOEDTODrugName").val();
        updateDTOObj.drugCode = $("#tCIS_DTODrugCode").val();
        updateDTOObj.drugForm = $("#tCIS_DTODrugForm").val();
        updateDTOObj.drugRoute = $("#tCIS_DTODrugRoute").val();
        updateDTOObj.drugCaution = $("#tCIS_DTODrugCaution").val();
        updateDTOObj.drugFrequencyDetail = $("#tCIS_DTODrugFrequencyDetail").val();
        updateDTOObj.drugStrength = $("#tCIS_DTODrugStrength").val();
        updateDTOObj.drugStrengthUnit = $("#tCIS_DTODrugStrengthUnit").val();
        updateDTOObj.drugDose = $("#tCIS_DTODrugDose").val();
        updateDTOObj.drugDoseUnit = $("#tCIS_DTODrugDoseUnit").val();
        updateDTOObj.drugDuration = $("#tCIS_DTODrugDuration").val();
        updateDTOObj.drugDurationUnit = $("#tCIS_DTODrugUnit").val();
        updateDTOObj.drugFrequency = $("#tCIS_DTODrugFrequency").val();
        updateDTOObj.uomCode = $("tCIS_DTODrugStrengthUnit option:selected").text();
        updateDTOObj.remark = $("#tCIS_DTORemark").val();
        updateDTOObj.comment = $("#tCIS_DTOCommentArea").val();
        updateDTOObj.drugQuantity = $("#tCIS_DTOQuantity").val();
        updateDTOObj.problemName = $("#problemCodeDTO").val();
        updateDTOObj.problemCode = $("#tCISOEDTOProblemName").val();
        updateOrderDTOTable(updateDTOObj,updateDTOIndex);
        $("#btnCIS_OE_DTO_UPDATE").hide();
        $("#btnCIS_OE_DTO_CANCEL").hide();
        $("#btnCIS_OE_DTO_ADD").show();
        clearFieldDTO();
        console.log(_dataDTO);
       
    });
    
    $("#btnCIS_OE_DTO_CANCEL").click(function(e){
        
        e.preventDefault();
        $("#btnCIS_OE_DTO_UPDATE").hide();
        $("#btnCIS_OE_DTO_CANCEL").hide();
        $("#btnCIS_OE_DTO_ADD").show();
        clearFieldDTO();
        
    });
    
    $("#tableOrderDTO").on("click", ".btnDelete", function (e) {
        
        e.preventDefault();
        rowDTODataTR = $(this).closest("tr");
        var delId = $(this).get(0).id;
        var delIdA = delId.split("|");
        var delIndex = parseInt(delIdA[1]);
        var delConfirm = confirm('Are you want to delete this Order? ');
        if (delConfirm === true) {
            delete _dataDTO[delIndex];
            $(this).closest('tr').remove();
            console.log(_dataDTO);
        } else {
            return false;
        }
        
    });
    
    
    $('#tCISOEDTODrugName').on('change:flexdatalist', function (value) {
        
        value = $(this).val();
        $('#codeLOS').val(value);

    });
    $("#tCISOEDTODrugName").on('before:flexdatalist.data', function (response) {
        
        console.log("Start - " + getDate());
        $('#tCISOEDTODrugNameLoading').html('<img src="img/LoaderIcon.gif" />');
        
    });
    $("#tCISOEDTODrugName").on('after:flexdatalist.data', function (response) {
        
        console.log("End - " + getDate());
        $('#tCISOEDTODrugNameLoading').html('');
        
    });
    $("#tCISOEDTODrugName").on('select:flexdatalist', function (response) {
        
        var drugName = $("#codeLOS").val();
        $.ajax({
            type: "post",
            url: "search/ResultDTOSearchCode.jsp",
            timeout: 3000,
            data: {
                keyword: drugName
            },
            success: function (response) {
                
                var array_data = String(response).split("|");
                $('#tCIS_DTODrugCode').val(array_data[0].trim());
                $('#tCIS_DTODrugForm').val(array_data[7].trim());
                $('#tCIS_DTODrugRoute').val(array_data[6].trim());
                $('#tCIS_DTODrugCaution').val(array_data[8].trim());
                $('#tCIS_DTODrugFrequencyDetail').val(array_data[9].trim());
                console.log(response);
            
            }
        });
    });
    
    function appendOrderDTO(obj, index) {

        var _tr = '<tr id="trDTO_row|' + index + '" ><td>'+obj.drugName+'</td><td>'+ obj.drugStrength+' '+ obj.drugStrengthUnit+'</td><td>'+ obj.drugFrequency+'</td><td>'+ obj.drugDuration+' '+ obj.drugDurationUnit+ '</td><td>'+obj.drugQuantity+'</td><td>'+obj.remark+'</td><td>'+obj.comment+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderDTO").append(_tr);
        
    }
    function updateOrderDTOTable(obj, index) {

         var _tr = '<td>'+obj.drugName+'</td><td>'+ obj.drugStrength+' '+ obj.drugStrengthUnit+'</td><td>'+ obj.drugFrequency+'</td><td>'+ obj.drugDuration+' '+ obj.drugDurationUnit+ '</td><td>'+obj.drugQuantity+'</td><td>'+obj.remark+'</td><td>'+obj.comment+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
       $(rowDTODataTR).html(_tr);
    }
    
    function clearFieldDTO(){
        
        searchingRetrieve("tCISOEDTOProblemName", "tCISOEDTOProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodeDTO", "search/ResultCCNSearchCode.jsp", "");
        searchDTO("tCISOEDTODrugName", "tCISOEDTODrugNameLoading", "");
        $('#tCIS_DTODrugCode').val('');
        $('#tCIS_DTODrugForm').val('');
        $('#tCIS_DTODrugRoute').val('');
        $('#tCIS_DTODrugCaution').val('');
        $('#tCIS_DTODrugFrequencyDetail').val('');
        $('#tCIS_DTODrugStrength').val('');
        $('#tCIS_DTODrugStrengthUnit').val('');
        $('#tCIS_DTODrugStrengthUnit option:selected').text('');
        $('#tCIS_DTODrugDose').val('');
        $('#tCIS_DTODrugDoseUnit').val('');
        $('#tCIS_DTODrugDuration').val('');
        $('#tCIS_DTODrugUnit').val('');
        $('#tCIS_DTODrugFrequency').val('');
        $("#tCIS_DTOQuantity").val('');
        $('#tCIS_DTORemark').val('');
        $('#tCIS_DTOCommentArea').val('');
        $('#hfcOrderDetailDTO').val('');
        $('#hfcProviderDetailDTO').val('');
        $("#problemCodeDTO").val('');
        
    }
});

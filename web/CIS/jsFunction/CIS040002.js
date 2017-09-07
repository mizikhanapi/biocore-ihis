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
    
    $("#btnCIS_OE_DTO_SEARCH_CLEAR").click(function (e) {
        $("#divCIS_OE_DTO_OrderSearchResult").html('');
    })
    
    $("#divCIS_OE_DTO_OrderSearchResult").on("click","#tblODTO #btnCIS_OE_DTO_SEARCH_ADD",function(e){
         e.preventDefault();
        var rowOrder = $(this).closest("tr");
        var orderId = rowOrder.find("#orderId").html();
        var drug_cd = rowOrder.find("#drug_cd").html();
        var hfc_to = rowOrder.find("#providerId").html();

        $.ajax({
            timeout: 3000,
            url: "order/RetrieveOrderDetailDTO.jsp",
            type: "POST",
            data: {
                orderId: orderId,
                drug_cd:drug_cd,
                hfc_to:hfc_to
            },
            success: function (e) {
           

                var orderDetailArray = e.trim();
                orderDetailArray = e.split("|");
              
                searchDTO("tCISOEDTODrugName", "tCISOEDTODrugNameLoading", orderDetailArray[4]);
                searchDTOInfo(orderDetailArray[4]);

                $('#DTO_NEW a[href="#drugOrder1"]').tab('show');




            }
        })
     })
    
    
    $("#btnCIS_OE_DTO_SEARCH_ORDER").click(function (e) {
        e.preventDefault();
        var order_id = $("#tCIS_OE_DTO_SEARCH_ORDER_ID").val();
        if (order_id === "") {
            order_id = "-";
        }
        var todayDate = getDate();
        todayDate = todayDate.split(" ");
        todayDate = todayDate[0];
        var type = $("#selectCIS_OE_DTO_SEARCH_TYPE option:selected").val();


        var data = {
            pmiNo: pmiNo,
            todayDate: todayDate,
            type: type,
            orderId: order_id
        }
        console.log(data);

        $.ajax({
            url: "order/ResultSearchOrderDTO.jsp",
            timeout: 3000,
            type: "POST",
            data: data,
            success: function (e) {

                $("#divCIS_OE_DTO_OrderSearchResult").html(e);
            }
        })

    });
    
    $("#btnCIS_OE_DTO_SUBMIT").click(function(e){
        
        e.preventDefault();

        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var providerDetail = _dataDTO[0].hfcProviderDetail.split("|");
            
            var msh = getMSH("04",providerDetail[0]);
            var pdi = PDIInfo;
            var orc = convertORC(_dataDTO[0], "02", "04","T12100");
            for (var i in _dataDTO) {
                msg += convertDTO(_dataDTO[i]);
                //displayDTO( _dataDTO[i].drugName, _dataDTO[i].drugStrength, _dataDTO[i].drugDose, _dataDTO[i].drugFrequency, _dataDTO[i].drugDuration, _dataDTO[i].uomCode,  _dataDTO[i].drugCaution, _dataDTO[i].comment);
            }
            fullmsg = msh + pdi + orc + msg;
       
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            }
            sendOrder(data, "tableOrderDTO");
            _dataDTO = [];
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
        
        if(drugStrengthUnit === null){
            drugStrengthUnit = " ";
        }
        
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
            problemCode:problemCode,
            priority:"Normal"

        };
        if (drugName === '' && drugStrength === '' && drugDose === '' && drugDuration === ''&& drugQuantity === '') {
            alert("You not enter the Drug name, drug strength, drug duration and drug quantity");
        } else if (drugName === '' && drugStrength === '' && drugDose === '' && drugDuration === '') {
            alert("You not enter the Drug name, drug strength and drug duration");
        } else if (drugName === '' && drugStrength === '' && drugDose === '' && drugQuantity === '') {
            alert("You not enter the Drug name, drug strength and drug quantity");
        } else if (drugName === '' && drugStrength === '' && drugDuration === ''&& drugQuantity === '') {
            alert("You not enter the Drug name, drug strength, drug duration and drug quantity");
        } else if (drugName === ''  && drugDose === '' && drugDuration === ''&& drugQuantity === '') {
            alert("You not enter the Drug name, drug strength, drug duration and drug quantity");
        } else if ( drugStrength === '' && drugDose === '' && drugDuration === ''&& drugQuantity === '') {
            alert("You not enter the drug strength, drug duration, drug dose and drug quantity");
        } else if (drugName === '' && drugStrength === '' && drugDose === '' ) {
            alert("You not enter the drug name, drug strength and durg dose");
        }else if (drugName === ''  && drugDuration === ''&& drugQuantity === '') {
            alert("You not enter the drug name, drug duration and drug quantity");
        }else if (  drugDose === '' && drugDuration === ''&& drugQuantity === '') {
            alert("You not enter the drug dose, durg duration and drug quantity");
        }else if (drugName === '' && drugStrength === '' ) {
            alert("You not enter the drug name and drug strength");
        }else if (drugName === '' && drugQuantity === '') {
            alert("You not enter the drug name and drug quantity");
        } else if (drugDuration === ''&& drugQuantity === '') {
            alert("You not enter the duration");
        }else if (drugName === '' ) {
            alert("You not enter the drug name");
        }else if (drugQuantity === '') {
            alert("You not enter the drug quantity");
        }else if ( drugDose === '') {
            alert("You not enter the drug dose");
        }else if (drugDuration === '') {
            alert("You not enter the drug duration");
        }else if (drugStrength === '') {
            alert("You not enter the drug strength");
        }else{
            
            if (checkOrderCode(_dataDTO, obj1.drugCode)) {
                alert("This order already been added");
            } else{
                _dataDTO.push(obj1);
                indexDTO = _dataDTO.lastIndexOf(obj1);
                appendOrderDTO(obj1, indexDTO);
                clearFieldDTO();
            }

        
        }

  

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
          
        } else {
            return false;
        }
        
    });
    
    
    $('#tCISOEDTODrugName').on('change:flexdatalist', function (value) {
        
        value = $(this).val();
        $('#codeLOS').val(value);

    });
    $("#tCISOEDTODrugName").on('before:flexdatalist.data', function (response) {
        
        $('#tCISOEDTODrugNameLoading').html('<img src="img/LoaderIcon.gif" />');
        
    });
    $("#tCISOEDTODrugName").on('after:flexdatalist.data', function (response) {
        
        $('#tCISOEDTODrugNameLoading').html('');
        
    });
    $("#tCISOEDTODrugName").on('select:flexdatalist', function (response) {
        
        var drugName = $("#codeLOS").val();
        searchDTOInfo(drugName);

    });
    
    function appendOrderDTO(obj, index) {

        var _tr = '<tr id="trDTO_row|' + index + '" ><td>'+obj.drugName+'</td><td>'+ obj.drugStrength+' '+ obj.drugStrengthUnit+'</td><td>'+ obj.drugFrequency+'</td><td>'+ obj.drugDuration+' '+ obj.drugDurationUnit+ '</td><td>'+obj.drugQuantity+'</td><td>'+obj.remark+'</td><td>'+obj.comment+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderDTO").append(_tr);
        
    }
    function updateOrderDTOTable(obj, index) {

         var _tr = '<td>'+obj.drugName+'</td><td>'+ obj.drugStrength+' '+ obj.drugStrengthUnit+'</td><td>'+ obj.drugFrequency+'</td><td>'+ obj.drugDuration+' '+ obj.drugDurationUnit+ '</td><td>'+obj.drugQuantity+'</td><td>'+obj.remark+'</td><td>'+obj.comment+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
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
//        $('#hfcOrderDetailDTO').val('');
//        $('#hfcProviderDetailDTO').val('');
        $("#problemCodeDTO").val('');
        
    }
    
    function searchDTOInfo(drugName){
                $.ajax({
            type: "post",
            url: "search/ResultDTOSearchCode.jsp",
            timeout: 3000,
            data: {
                keyword: drugName
            },
            success: function (response) {
                console.log(response);
                var array_data = String(response).split("|");
                $('#tCIS_DTODrugCode').val(array_data[0].trim());
                $('#tCIS_DTODrugForm').val(array_data[7].trim());
                $('#tCIS_DTODrugRoute').val(array_data[6].trim());
                $('#tCIS_DTODrugCaution').val(array_data[8].trim());
                $('#tCIS_DTODrugFrequencyDetail').val(array_data[9].trim());
                $('#tCIS_DTODrugFrequency').val(array_data[9].trim());
                $('#tCIS_DTODrugStrength').val(array_data[4].trim())
                $('#tCIS_DTODrugStrengthUnit').val("");
                $('#tCIS_DTODrugDuration').val(array_data[11].trim());
                $('#tCIS_DTODrugUnit').val(array_data[12].trim());
                //$("#tCIS_DTOQuantity").val(array_data[5].trim()+" "+array_data[10].trim());
                $('#tCIS_DTODrugDose').val(array_data[5].trim()+" "+array_data[10].trim());
            }
        });
    }
    
    function checkOrderCode(data, code) {
        var already = false;
        for (var i in data) {
            if (data[i].drugCode === code) {
                already = true;
            }
        }
        return already;
    }
});

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    var _dataMON = [];
    var indexMON;
    var updateMONIndex;
    var updateMONObj;
    var rowMONId;
    var rowMONDataTR;
    
    $("#btnCIS_OE_MON_UPDATE").hide();
    $("#btnCIS_OE_MON_CANCEL").hide();
    searchingHFC("searchHFC_MON", "searchHFC_MONLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdMON", "-", "hfcOrderDetailMON", "hfcProviderDetailMON");
    searching("tCISOEMONProblemName","tCISOEMONProblemNameLoading","search/ResultCCNSearch.jsp","tCISOEMONProblemNameCode","search/ResultCCNSearchCode.jsp");
    searching("searchMON","searchMONLoading","search/ResultMONSearch.jsp","codeMON","search/ResultMONSearchCode.jsp");
    $("#searchHFC_MON").on("select:flexdatalist",function(){
        var hfc_name = $(this).val();
        $('#searchDIS_MON').show();
        getHFCCode(hfc_name,"hfcIdMON","hfcProviderDetailMON","searchDIS_MON","searchDIS_MONLoading");
            
    });
    
    $("#searchDIS_MON").on("select:flexdatalist",function(){
        var hfc_cd = $("#hfcIdMON").val();
        console.log(hfc_cd);
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: $(this).val()
            },
            success: function (response) {
                console.log(response);
                //this ajax will response discipline Code for hfc patient admit to;
                $("#searchDIS_MONCode").val(response.trim());
                

            }
        })
    })
    
    
    
    $("#btnCIS_OE_MON_ADD").click(function (e) {
        e.preventDefault();
        var index;

        var monitoring = $("#searchMON").val();
        var monitoringCode = $("#codeMON").val();
        var requestItem = $("#reqItem").val();
        var requestCode = $("#reqItemCode").val();
        var testToBePerform = $("#testMON").val();
        var testCode = $("#testMONCode").val();
        var hfcProvider = $("#searchHFC_MON").val();
        var hfcProviderCode = $("#hfcIdMON").val();
        var disProvider = $("#searchDIS_MONCode").val();
        var disProviderCode = $("#searchDIS_MON").val();
        var hfcOrderDetail = $("#hfcOrderDetailMON").val();
        var hfcProviderDetail = $("#hfcProviderDetailMON").val();
        var problemName = $("#tCISOEMONProblemName").val();
        var problemCode = $("#tCISOEMONProblemNameCode").val();
        

        var obj1 = {
            monitoring:monitoring,
            monitoringCode:monitoringCode,
            requestItem:requestItem,
            requestCode:requestCode,
            testToBePerform:testToBePerform,
            testCode:testCode,
            hfcProvider:hfcProvider,
            hfcProviderCode:hfcProviderCode,
            disProvider:disProvider,
            disProviderCode:disProviderCode,
            hfcOrderDetail:hfcOrderDetail,
            hfcProviderDetail:hfcProviderDetail,
            problemName:problemName,
            problemCode:problemCode
        };


        _dataMON.push(obj1);
        index = _dataMON.lastIndexOf(obj1);
        console.log(index);
        appendOrderMON(obj1, index);
        clearMONField();
    });
    
    $("#tableOrderMON").on("click", ".btnDelete", function (e) {

        e.preventDefault();
        rowMONDataTR = $(this).closest("tr");
        var delId = $(this).get(0).id;
        var delIdA = delId.split("|");
        var delIndex = parseInt(delIdA[1]);
        var delConfirm = confirm('Are you want to delete this Order? ');
        if (delConfirm === true) {
            delete _dataMON[delIndex];
            $(this).closest('tr').remove();
            console.log(_dataMON);
        } else {
            return false;
        }

    });
    
    function clearMONField(){
        
        retrieveDataSearchingHFC("searchHFC_MON", "searchHFC_MONLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdMON", "-", "hfcOrderDetailMON", "hfcProviderDetailMON", '', '');
        $("#tCISOEROSProcedureSearch").prop("disabled", true);
        searchingRetrieve("tCISOEMONProblemName", "tCISOEMONProblemNameLoading", "search/ResultCCNSearch.jsp", "tCISOEMONProblemNameCode", "search/ResultCCNSearchCode.jsp", "");
        searchingRetrieve("searchMON", "searchMONLoading", "search/ResultMONSearch.jsp", "codeMON", "search/ResultMONSearchCode.jsp", "");
        

       $("#codeMON").val('');
       $("#reqItem").val('');
       $("#reqItemCode").val('');
       $("#testMON").val();
       $("#testMONCode").val('');
        $("#searchHFC_MON").val('');
        $("#hfcIdMON").val('');
        $("#searchDIS_MON").hide();
        $("#searchDIS_MONCode").val('');
       $("#hfcOrderDetailMON").val('');
        $("#hfcProviderDetailMON").val('');

        
    }
    
    function appendOrderMON(obj, index) {
        
        var _tr = '<tr id="trLIO_row|' + index + '" ><td>' + obj.monitoring + '</td><td>' + obj.requestItem + '</td><td>' + obj.testToBePerform + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
       $("#tableOrderMON").append(_tr);
       
    }
    
    function updateOrderMONTable(obj, index) {

        var _tr = '<td>' + obj.monitoring + '</td><td>' + obj.requestItem + '</td><td>' + obj.testToBePerform + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>'
        $(rowMONDataTR).html(_tr);
        
    }
    
});
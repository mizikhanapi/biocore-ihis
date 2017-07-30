/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    var _dataMON = [];
    var indexMON;
    var updateMONIndex;
    var updateMONObj;
    var rowMONId;
    var rowMONDataTR;

    $("#btnCIS_OE_MON_UPDATE").hide();
    $("#btnCIS_OE_MON_CANCEL").hide();
    searchingHFC("searchHFC_MON", "searchHFC_MONLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdMON", "-", "hfcOrderDetailMON", "hfcProviderDetailMON");
    searching("tCISOEMONProblemName", "tCISOEMONProblemNameLoading", "search/ResultCCNSearch.jsp", "tCISOEMONProblemNameCode", "search/ResultCCNSearchCode.jsp");
    searching("searchMON", "searchMONLoading", "search/ResultMONSearch.jsp", "codeMON", "search/ResultMONSearchCode.jsp");
    $("#searchHFC_MON").on("select:flexdatalist", function () {
        var hfc_name = $(this).val();
        $('#searchDIS_MON').show();
        getHFCCode(hfc_name, "hfcIdMON", "hfcProviderDetailMON", "searchDIS_MON", "searchDIS_MONLoading");

    });

    $("#searchDIS_MON").on("select:flexdatalist", function () {
        var hfc_cd = $("#hfcIdMON").val();
  
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: $(this).val()
            },
            success: function (response) {
             
                //this ajax will response discipline Code for hfc patient admit to;
                $("#searchDIS_MONCode").val(response.trim());


            }
        })
    })

    $("#btnCIS_OE_MON_CANCEL").click(function (e) {
        e.preventDefault();
        $("#btnCIS_OE_MON_UPDATE").hide();
        $("#btnCIS_OE_MON_CANCEL").hide();
        $("#btnCIS_OE_MON_ADD").show();
        clearMONField();
    });
    
    $("#btnCIS_OE_MON_SUBMIT").click(function(e){
       e.preventDefault();
        e.preventDefault();
  
        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var msh = getMSH();
            var providerDetail = _dataMON[0].hfcProviderDetail.split("|");
            var msh = getMSH("05", providerDetail[0]);
            var pdi = PDIInfo;
            var orc = convertORC(_dataMON[0], "02", "05", "T12107");
            for (var i in _dataMON) {
                msg += convertMON(_dataMON[i]);
            }
            fullmsg = msh + pdi + orc + msg;
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            }
            sendOrder(data, "tableOrderMON");
        } else {
            return false;
        }
    });

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
        var disProvider = $("#searchDIS_MON").val();
        var disProviderCode = $("#searchDIS_MONCode").val();
        var hfcOrderDetail = $("#hfcOrderDetailMON").val();
        var hfcProviderDetail = $("#hfcProviderDetailMON").val();
        var problemName = $("#tCISOEMONProblemName").val();
        var problemCode = $("#tCISOEMONProblemNameCode").val();


        var obj1 = {
            monitoring: monitoring,
            monitoringCode: monitoringCode,
            requestItem: requestItem,
            requestCode: requestCode,
            testToBePerform: testToBePerform,
            testCode: testCode,
            hfcProvider: hfcProvider,
            hfcProviderCode: hfcProviderCode,
            disProvider: disProvider,
            disProviderCode: disProviderCode,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            problemName: problemName,
            problemCode: problemCode
        };


        _dataMON.push(obj1);
        index = _dataMON.lastIndexOf(obj1);
     
        appendOrderMON(obj1, index);
        clearMONField();
    });
    
    
    $("#btnCIS_OE_MON_UPDATE").click(function(e){
        e.preventDefault();
        var monitoring = $("#searchMON").val();
        var monitoringCode = $("#codeMON").val();
        var requestItem = $("#reqItem").val();
        var requestCode = $("#reqItemCode").val();
        var testToBePerform = $("#testMON").val();
        var testCode = $("#testMONCode").val();
        var hfcProvider = $("#searchHFC_MON").val();
        var hfcProviderCode = $("#hfcIdMON").val();
        var disProvider = $("#searchDIS_MON").val();
        var disProviderCode = $("#searchDIS_MONCode").val();
        var hfcOrderDetail = $("#hfcOrderDetailMON").val();
        var hfcProviderDetail = $("#hfcProviderDetailMON").val();
        var problemName = $("#tCISOEMONProblemName").val();
        var problemCode = $("#tCISOEMONProblemNameCode").val();
        
            updateMONObj.monitoring= monitoring;
            updateMONObj.monitoringCode= monitoringCode;
            updateMONObj.requestItem= requestItem;
            updateMONObj.requestCode= requestCode;
            updateMONObj.testToBePerform= testToBePerform;
            updateMONObj.testCode= testCode;
            updateMONObj.hfcProvider= hfcProvider;
            updateMONObj.hfcProviderCode=hfcProviderCode;
            updateMONObj.disProvider= disProvider;
            updateMONObj.disProviderCode= disProviderCode;
            updateMONObj.hfcOrderDetail= hfcOrderDetail;
            updateMONObj.hfcProviderDetail= hfcProviderDetail;
            updateMONObj.problemName= problemName;
            updateMONObj.problemCode= problemCode;
            
        $("#btnCIS_OE_MON_UPDATE").hide();
        $("#btnCIS_OE_MON_CANCEL").hide();
        $("#btnCIS_OE_MON_ADD").show();
        updateOrderMONTable(updateMONObj,updateMONIndex);
        clearMONField();
        
        
    })
    

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
      
        } else {
            return false;
        }

    });
    $("#tableOrderMON").on("click", ".btnUpdate", function (e) {
        e.preventDefault();
        $("#btnCIS_OE_MON_UPDATE").show();
        $("#btnCIS_OE_MON_CANCEL").show();
        $("#btnCIS_OE_MON_ADD").hide();

        rowMONDataTR = $(this).closest("tr");
        rowMONId = $(this).get(0).id;
        var index = rowMONId.split("|");
        index = parseInt(index[1]);
        updateMONIndex = indexMON;
        updateMONObj = _dataMON[index];

        retrieveDataSearchingHFC("searchHFC_MON", "searchHFC_MONLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdMON", "-", "hfcOrderDetailMON", "hfcProviderDetailMON", updateMONObj.hfcProvider, '');
        searchingRetrieve("tCISOEMONProblemName", "tCISOEMONProblemNameLoading", "search/ResultCCNSearch.jsp", "tCISOEMONProblemNameCode", "search/ResultCCNSearchCode.jsp", updateMONObj.problemName);
        searchingRetrieve("searchMON", "searchMONLoading", "search/ResultMONSearch.jsp", "codeMON", "search/ResultMONSearchCode.jsp", updateMONObj.monitoring);
        retrieveDisciplineOnly("searchDIS_MON", "searchDIS_MONLoading",updateMONObj.hfcProviderCode,updateMONObj.disProvider) ;
        $("#codeMON").val(updateMONObj.monitoringCode);
        $("#reqItem").val(updateMONObj.requestItem);
        $("#reqItemCode").val(updateMONObj.requestItem);
        $("#testMON").val(updateMONObj.testToBePerform);
        $("#testMONCode").val(updateMONObj.testCode);
        $("#hfcIdMON").val(updateMONObj.hfcProviderCode);
        $("#searchDIS_MONCode").val(updateMONObj.disProviderCode);
        $("#hfcOrderDetailMON").val(updateMONObj.hfcOrderDetail);
        $("#hfcProviderDetailMON").val(updateMONObj.hfcProviderDetail);

    })

    function clearMONField() {

        retrieveDataSearchingHFC("searchHFC_MON", "searchHFC_MONLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdMON", "-", "hfcOrderDetailMON", "hfcProviderDetailMON", '', '');
        $("#tCISOEROSProcedureSearch").prop("disabled", true);
        searchingRetrieve("tCISOEMONProblemName", "tCISOEMONProblemNameLoading", "search/ResultCCNSearch.jsp", "tCISOEMONProblemNameCode", "search/ResultCCNSearchCode.jsp", "");
        searchingRetrieve("searchMON", "searchMONLoading", "search/ResultMONSearch.jsp", "codeMON", "search/ResultMONSearchCode.jsp", "");
         retrieveDisciplineOnly("searchDIS_MON", "searchDIS_MONLoading", "","") ;   

        $("#codeMON").val('');
        $("#reqItem").val('');
        $("#reqItemCode").val('');
        $("#testMON").val();
        $("#testMONCode").val('');
        $("#searchHFC_MON").val('');
        $("#hfcIdMON").val('');
      
        $("#searchDIS_MONCode").val('');
        $("#hfcOrderDetailMON").val('');
        $("#hfcProviderDetailMON").val('');


    }

    function appendOrderMON(obj, index) {

        var _tr = '<tr id="trLIO_row|' + index + '" ><td>' + obj.monitoring + '</td><td>' + obj.requestItem + '</td><td>' + obj.testToBePerform + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderMON").append(_tr);

    }

    function updateOrderMONTable(obj, index) {

        var _tr = '<td>' + obj.monitoring + '</td><td>' + obj.requestItem + '</td><td>' + obj.testToBePerform + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pancil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>'
        $(rowMONDataTR).html(_tr);

    }

});
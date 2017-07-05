/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    var _dataLIO = [];
    var indexLIO;
    var updateLIOIndex;
    var updateLIOObj;
    var rowLIOId;
    var rowLIODataTR;

    var losIdObject = {
        searchLOS:'searchLOS',
        catLOS:'catLOS',
        sourceLOS:'sourceLOS',
        containerLOS:'containerLOS',
        volumeLOS:'volumeLOS',
        spclLOS:'spclLOS'
    }
    $("#btnCIS_OE_LIO_UPDATE").hide();
    $("#btnCIS_OE_LIO_CANCEL").hide();
    searchingHFC( "tCISOELIOHFC", "tCISOELIOHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdLOS", "-", "hfcOrderDetailLIO", "hfcProviderDetailLIO");
    searching("tCISOELIOProblemName","tCISOELIOProblemNameLoading","search/ResultCCNSearch.jsp","problemCodeLIO","search/ResultCCNSearchCode.jsp");
    searchLIO("tCISOELIOSearch","search/ResultLIOSearch.jsp","tCISOELIOSearchLoading","");
    
    $("#btnCIS_OE_LIO_SUBMIT").click(function(e){
        
        e.preventDefault();
        console.log(_dataLIO);
        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var msh = getMSH();
            var pdi = PDIInfo;
            var orc = convertORC(_dataLIO[0], "02", "05");
            for (var i in _dataLIO) {
                msg += convertLIO(_dataLIO[i]);
            }
            fullmsg = msh + pdi + orc + msg;
            var data = {
                    msg: fullmsg,
                    pmino: pmiNo,
                    episodedate: episodeDate,
                    status: "1"
                }
            sendOrder(data,"tableOrderLIO");
        } else {
            return false;
        }

     });
     
    $("#btnCIS_OE_LIO_ADD").click(function(e){
        
        var searchLOS = $('#searchLOS').val();
        var codeLOS = $('#codeLOS').val();
        var catLOS = $('#catLOS').val();
        var sourceLOS = $('#sourceLOS').val();
        var containerLOS = $('#containerLOS').val();
        var volumeLOS = $('#volumeLOS').val();
        var spclLOS = $('#spclLOS').val();
        var commentLOS = $('#commentLOS').val();
        var appointmentLOS = $('#appointmentLOS').val();
        var priorityLOS = $('#priorityLOS').val();
        var hfcLOS = $('#hfcLOS').val();
        var hfcIdLOS = $('#hfcIdLOS').val();
        var pcVal = $('#patientConditionLOScd').val();
        var patientCondition = $("#patientConditionLOScd  option:selected").text();
        var priVal = $("#priorityLOScd").val();
        var priority = $("#priorityLOScd  option:selected").text();
        var hfcOrderDetail = $('#hfcOrderDetailLIO').val();
        var hfcProviderDetail = $('#hfcProviderDetailLIO').val();
        var hfcLOS = $('#tCISOELIOHFC').val();
        var problemCode = $("#problemCodeLIO").val();
        var problemName = $("#tCISOELIOProblemName").val();

        var $items = $('#codeLOS, #catLOS,#sourceLOS,#containerLOS,#volumeLOS,#spclLOS,#commentLOS,#appointmentLOS,#priorityLOS,#hfcIdLOS,#patientConditionLOScd,#priorityLOScd');
        var obj1 = {
            Acode: 'LOS',
            searchLOS:searchLOS,
            patientCondition: patientCondition,
            priority: priority,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            hfcLOS:hfcLOS,
            problemCode:problemCode,
            problemName:problemName
        };
       $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _dataLIO.push(obj1);
        indexLIO = _dataLIO.lastIndexOf(obj1);
        appendOrderLIO(obj1, indexLIO)
        clearFieldLIO();
        console.log(_dataLIO);
    });
    
    $("#btnCIS_OE_LIO_UPDATE").click(function(e){
        
        updateLIOObj.searchLOS = $('#searchLOS').val();
        updateLIOObj.appointmentLOS = $('#appointmentLOS').val();
        updateLIOObj.catLOS =$('#catLOS').val();
        updateLIOObj.codeLOS = $('#codeLOS').val();
        updateLIOObj.commentLOS = $('#commentLOS').val();
        updateLIOObj.containerLOS = $('#containerLOS').val();
        updateLIOObj.hfcIdLOS = $('#hfcIdLOS').val();
        updateLIOObj.hfcLOS = $('#tCISOELIOHFC').val();
        updateLIOObj.hfcOrderDetail = $('#hfcOrderDetailLIO').val();
        updateLIOObj.hfcProviderDetail = $('#hfcProviderDetailLIO').val();
        updateLIOObj.patientConditionLOScd = $('#patientConditionLOScd').val();
        updateLIOObj.patientCondition = $('#patientConditionLOScd :selected').text().trim();
        updateLIOObj.priorityLOScd = $('#priorityLOScd').val();
        updateLIOObj.priority = $('#priorityLOScd :selected').text().trim();
        updateLIOObj.sourceLOS = $('#sourceLOS').val();
        updateLIOObj.spclLOS = $('#spclLOS').val();
        updateLIOObj.volumeLOS = $('#volumeLOS').val();
        updateLIOObj.problemCode = $('#problemCode').val();
        updateLIOObj.problemName = $('problemName').val();
        updateOrderLIOTable(updateLIOObj,updateLIOIndex);
        $("#btnCIS_OE_LIO_UPDATE").hide();
        $("#btnCIS_OE_LIO_CANCEL").hide();
        $("#btnCIS_OE_LIO_ADD").show();
        clearFieldLIO();
        console.log(_dataLIO);
    });
    
   
    $('#tableOrderLIO').on("click",".btnUpdate",function(e){
        
        e.preventDefault();
        $("#btnCIS_OE_LIO_UPDATE").show();
        $("#btnCIS_OE_LIO_CANCEL").show();
        $("#btnCIS_OE_LIO_ADD").hide();
        
        rowLIODataTR = $(this).closest("tr");
        rowLIOId = $(this).get(0).id;
        var index = rowLIOId.split("|");
        index = parseInt(index[1]);
        updateLIOIndex = indexLIO;
        updateLIOObj = _dataLIO[index];
        searchLIO("tCISOELIOSearch","search/ResultLIOSearch.jsp","tCISOELIOSearchLoading",updateLIOObj.searchLOS);
        retrieveDataSearchingHFC("tCISOELIOHFC", "tCISOELIOHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "UhfcIdROS", "-", "hfcOrderDetailLIO", "hfcProviderDetailLIO",updateLIOObj.hfcLOS,'');
        searchingRetrieve("tCISOELIOProblemName", "tCISOELIOProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodeLIO", "search/ResultCCNSearchCode.jsp",updateLIOObj.problemName);
        $('#searchLOS').val(updateLIOObj.searchLOS);
        $('#appointmentLOS').val(updateLIOObj.appointmentLOS);
        $('#catLOS').val(updateLIOObj.catLOS);
        $('#codeLOS').val(updateLIOObj.codeLOS);
        $('#commentLOS').val(updateLIOObj.commentLOS);
        $('#containerLOS').val(updateLIOObj.containerLOS);
        $('#searchLOS').val(updateLIOObj.hfcIdLOS);
        $('#hfcOrderDetailLIO').val(updateLIOObj.hfcOrderDetail);
        $('#hfcProviderDetailLIO').val(updateLIOObj.hfcProviderDetail);
        $('#patientConditionLOScd').val(updateLIOObj.patientConditionLOScd);
        $('#priorityLOScd').val(updateLIOObj.priorityLOScd);
        $('#sourceLOS').val(updateLIOObj.sourceLOS);
        $('#spclLOS').val(updateLIOObj.spclLOS);
        $('#volumeLOS').val(updateLIOObj.volumeLOS);
    });
    
    $('#tCISOELIOSearch').on('change:flexdatalist', function (value) {
        value = $(this).val();
        $('#codeLOS').val(value);
        
    });
    $("#tCISOELIOSearch").on('before:flexdatalist.data', function (response) {
        console.log("Start - " + getDate());
        $('#tCISOELIOSearchLoading').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#tCISOELIOSearch").on('after:flexdatalist.data', function (response) {
        console.log("End - " + getDate());
        $('#tCISOELIOSearchLoading').html('');
    });
    $("#tCISOELIOSearch").on('select:flexdatalist', function (response) {
        var codeLIO = $("#codeLOS").val();
        
        $.ajax({
            type: "post",
            url: "search/ResultLIOSearchCode.jsp",
            timeout: 3000,
            data: {code: codeLIO},
            success: function (response) {
  
                var arrayLIO = response.trim().split("|");
                $('#searchLOS').val(arrayLIO[1]);
                $('#catLOS').val(arrayLIO[2]);
                $('#sourceLOS').val(arrayLIO[3]);
                $('#containerLOS').val(arrayLIO[4]);
                $('#volumeLOS').val(arrayLIO[5]);
                $('#spclLOS').val(arrayLIO[6]);
            }
        });
    });
    
    $("#btnCIS_OE_LIO_CANCEL").click(function (e) {
        e.preventDefault();
        $("#btnCIS_OE_LIO_UPDATE").hide();
        $("#btnCIS_OE_LIO_CANCEL").hide();
        $("#btnCIS_OE_LIO_ADD").show();
        clearFieldLIO();
    });
    
    function clearFieldLIO(){
        retrieveDataSearchingHFC("tCISOELIOHFC", "tCISOELIOHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "UhfcIdROS", "-", "hfcOrderDetailLIO", "hfcProviderDetailLIO",'','');
        searchingRetrieve("tCISOELIOProblemName", "tCISOELIOProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodeLIO", "search/ResultCCNSearchCode.jsp", "");
        searchLIO("tCISOELIOSearch", "search/ResultLIOSearch.jsp", "tCISOELIOSearchLoading", '');
        $('#searchLOS').val('');
        $('#appointmentLOS').val('');
        $('#catLOS').val('');
        $('#codeLOS').val('');
        $('#commentLOS').val('');
        $('#containerLOS').val('');
        $('#searchLOS').val('');
        $('#hfcOrderDetailLIO').val('');
        $('#hfcProviderDetailLIO').val('');
        $('#patientConditionLOScd').val();
        $('#priorityLOScd').val('');
        $('#sourceLOS').val('');
        $('#spclLOS').val('');
        $('#volumeLOS').val('');
        $('#hfcLOS').val('');
        $('#hfcIdLOS').val('');
    }
  
    $(function () {
        $('#appointmentLOS').datepicker({dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true});
    });

    function appendOrderLIO(obj, index) {

        var redcolor = '';
        if (obj.priorityLOScd === 'P02') {
            redcolor = 'style="background-color:#ff9999"';
        }
        var _tr = '<tr ' + redcolor + '  id="trLIO_row|' + index + '" ><td>'+obj.searchLOS+'</td><td>'+obj.sourceLOS+'</td><td>'+obj.containerLOS+'</td><td>'+obj.volumeLOS+'</td><td>'+obj.commentLOS+'</td><td>'+obj.appointmentLOS+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        //var _tr = '<tr ' + redcolor + '  id="tr_row|' + index + '" ><td>' + obj.bodySystemROS + ' </td><td>' + obj.modalityROS + '</td><<td>' + obj.ROS + '</td><td>' + obj.commentROS + '</td><td>' + obj.appointmentROS + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderLIO").append(_tr);
    }
    function updateOrderLIOTable(obj,index){
        var redcolor = '';
        if (obj.priorityROScd === 'P02') {
            redcolor = 'style="background-color:#ff9999"';
        }
        var _tr = '<td>'+obj.searchLOS+'</td><td>'+obj.sourceLOS+'</td><td>'+obj.containerLOS+'</td><td>'+obj.volumeLOS+'</td><td>'+obj.commentLOS+'</td><td>'+obj.appointmentLOS+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
        $(rowLIODataTR).html(_tr);
    }

    function searchLIO(searchFieldId, url, loadingId,currentValue) {
        $('#' + searchFieldId).val(currentValue).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 2000,
            selectionRequired: true,
            valueProperty: 'code',
            visibleProperties: ["name", "source"],
            url: url,
            cache: true,
            params: {
                timeout: 3000,
                success: function (result) {
                    //console.log(result);
                    if (result === undefined) {
                        $('#' + loadingId).html('No Record');
                    }
                }
            }
        });
    }

});
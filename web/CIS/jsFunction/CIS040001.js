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

    
    $("#CIS040001").on("show.bs.modal",function(e){
        searchInitialize("LIO", "I");
    });
    $("#btnCIS_OE_LIO_SEARCH_CLEAR").click(function (e) {
        $("#divCIS_OE_LIO_OrderSearchResult").html('');
    });
    
    $("#divCIS_OE_LIO_OrderSearchResult").on("click","#tblOLIO #btnCIS_OE_LIO_VIEW_RESULT",function(e){
      
        
         var rowOrder = $(this).closest("tr");
         var orderId = rowOrder.find("#id_result").html();

         $("#CIS040001_RESULT").modal('show');
         $.ajax({
             type:"POST",
             url:"order/LIOImageResult.jsp",
             timeout:3000,
             data:{
                 id_result:orderId

             },
             success:function(e){
               
                 $("#CIS040001_RESULT_IMG").attr("src",e.trim());
                 //$("CIS040000_RESULT_IMG").html(e);
             }
             
         })

         
     });
    
     $("#divCIS_OE_LIO_OrderSearchResult").on("click","#tblOLIO #btnCIS_OE_LIO_SEARCH_ADD",function(e){
         e.preventDefault();
        var rowOrder = $(this).closest("tr");
        var orderId = rowOrder.find("#orderId").html();
        var item_cd = rowOrder.find("#item_cd").html();
        var hfc_to = rowOrder.find("#providerId").html();
       

        $.ajax({
            timeout: 3000,
            url: "order/RetrieveOrderDetailLIO.jsp",
            type: "POST",
            data: {
                orderId: orderId,
                item_cd:item_cd,
                hfc_to:hfc_to
            },
            success: function (e) {
                

                var orderDetailArray = e.trim();
                orderDetailArray = e.split("|");
                
                var codeLIO = orderDetailArray[3];
                searchLIO("tCISOELIOSearch","search/ResultLIOSearch.jsp","tCISOELIOSearchLoading",orderDetailArray[4]);
                $('#LIO_NEW a[href="#laboratoryRequest1"]').tab('show');
                searchLIOInfo(codeLIO);



            }
        })
     })
    $("#btnCIS_OE_LIO_SEARCH_ORDER").click(function (e) {
        e.preventDefault();
        var order_id = $("#tCIS_OE_LIO_SEARCH_ORDER_ID").val();
        if (order_id === "") {
            order_id = "-";
        }
        var todayDate = getDate();
        todayDate = todayDate.split(" ");
        todayDate = todayDate[0];
        var type = $("#selectCIS_OE_LIO_SEARCH_TYPE option:selected").val();

        var data = {
                pmiNo: pmiNo,
                todayDate: todayDate,
                type: type,
                orderId: order_id
            }
           
         
        $.ajax({
            url: "order/ResultSearchOrderLIO.jsp",
            timeout: 3000,
            type: "POST",
            data: data,
            success: function (e) {
                
                $("#divCIS_OE_LIO_OrderSearchResult").html(e);
            }
        })

    });
    $("#btnCIS_OE_LIO_SUBMIT").click(function(e){
        
        e.preventDefault();
   
        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var msh = getMSH("05",_dataLIO[0].hfcIdLOS);
            var pdi = PDIInfo;
            var orc = convertORC(_dataLIO[0], "02", "05","T12101");
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
            _dataLIO = [];
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
        
        if (searchLOS === '' && appointmentLOS === '' && commentLOS === '') {
            alert("You not enter the Laboratory Procedure, Comment and Appointment Date");
        } else if (searchLOS === '' && appointmentLOS === '') {
            alert("You not enter the Laboratory Procedure and Appointment date");
        } else if (searchLOS === '' && commentLOS === '') {
            alert("You not enter the Laboratory Procedure and Comment");
        } else if (appointmentLOS === '' && commentLOS === '') {
            alert("You not enter the Appointment Date and Comment");
        } else if (commentLOS === '') {
            alert("You not enter the Comment");
        } else if (searchLOS === '') {
            alert("You not enter the Laboratory Procedure");
        } else if (appointmentLOS === '') {
            alert("You not enter the Appointment Date");
        } else{
            var $items = $('#codeLOS, #catLOS,#sourceLOS,#containerLOS,#volumeLOS,#spclLOS,#commentLOS,#appointmentLOS,#priorityLOS,#hfcIdLOS,#patientConditionLOScd,#priorityLOScd');
            var obj1 = {
                Acode: 'LOS',
                searchLOS: searchLOS,
                patientCondition: patientCondition,
                priority: priority,
                hfcOrderDetail: hfcOrderDetail,
                hfcProviderDetail: hfcProviderDetail,
                hfcLOS: hfcLOS,
                problemCode: problemCode,
                problemName: problemName
            };
            $items.each(function () {
                obj1[this.id] = $(this).val();
            });
            
            if (checkOrderCode(_dataLIO, obj1.codeLOS)) {
                alert("This order already been added");
            } else{
                _dataLIO.push(obj1);
                indexLIO = _dataLIO.lastIndexOf(obj1);
                appendOrderLIO(obj1, indexLIO)
                clearFieldLIO();
            }

        }


 
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
     
        $('#tCISOELIOSearchLoading').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#tCISOELIOSearch").on('after:flexdatalist.data', function (response) {
      
        $('#tCISOELIOSearchLoading').html('');
    });
    $("#tCISOELIOSearch").on('select:flexdatalist', function (response) {
        var codeLIO = $("#codeLOS").val();
        searchLIOInfo(codeLIO);
    });
    
    $("#btnCIS_OE_LIO_CANCEL").click(function (e) {
        e.preventDefault();
        $("#btnCIS_OE_LIO_UPDATE").hide();
        $("#btnCIS_OE_LIO_CANCEL").hide();
        $("#btnCIS_OE_LIO_ADD").show();
        clearFieldLIO();
    });
    $("#tableOrderLIO").on("click", ".btnDelete", function (e) {
        
        e.preventDefault();
        rowLIODataTR = $(this).closest("tr");
        var delId = $(this).get(0).id;
        var delIdA = delId.split("|");
        var delIndex = parseInt(delIdA[1]);
        var delConfirm = confirm('Are you want to delete this Order? ');
        if (delConfirm === true) {
            delete _dataLIO[delIndex];
            $(this).closest('tr').remove();
            
        } else {
            return false;
        }
        
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
            redcolor = 'style="color:#f5707a; font-weight: 500;"';
        }
        var _tr = '<tr ' + redcolor + '  id="trLIO_row|' + index + '" ><td>'+obj.searchLOS+'</td><td>'+obj.sourceLOS+'</td><td>'+obj.containerLOS+'</td><td>'+obj.volumeLOS+'</td><td>'+obj.commentLOS+'</td><td>'+obj.appointmentLOS+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        //var _tr = '<tr ' + redcolor + '  id="tr_row|' + index + '" ><td>' + obj.bodySystemROS + ' </td><td>' + obj.modalityROS + '</td><<td>' + obj.ROS + '</td><td>' + obj.commentROS + '</td><td>' + obj.appointmentROS + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderLIO").append(_tr);
    }
    function updateOrderLIOTable(obj,index){
        var redcolor = '';
        if (obj.priorityROScd === 'P02') {
            redcolor = 'style="color:#f5707a; font-weight: 500;"';
        }
        var _tr = '<td>'+obj.searchLOS+'</td><td>'+obj.sourceLOS+'</td><td>'+obj.containerLOS+'</td><td>'+obj.volumeLOS+'</td><td>'+obj.commentLOS+'</td><td>'+obj.appointmentLOS+'</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
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
                    
                    if (result === undefined) {
                        $('#' + loadingId).html('No Record');
                    }
                }
            }
        });
    }
    
    function searchLIOInfo(codeLIO){
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
    }
    
    function checkOrderCode(data, code) {
        var already = false;
        for (var i in data) {
            if (data[i].codeLOS === code) {
                already = true;
            }
        }
        return already;
    }

});
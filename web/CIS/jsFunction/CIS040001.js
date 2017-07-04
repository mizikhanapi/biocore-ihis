/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    var _dataLIO = [];
    var indexLIO;
    var updateIndex;
    var updateObj;
    var rowId;
    $("#btnCIS_OE_LIO_UPDATE").hide();
    $("#btnCIS_OE_LIO_CANCEL").hide();
    searchingHFC( "tCISOELIOHFC", "tCISOELIOHFCSearchLoading", "search/ResultHFCSearch.jsp", "search/ResultHFCSearchCode.jsp", "hfcIdLOS", "-", "hfcOrderDetailLIO", "hfcProviderDetailLIO");
    
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


        var $items = $('#codeLOS, #catLOS,#sourceLOS,#containerLOS,#volumeLOS,#spclLOS,#commentLOS,#appointmentLOS,#priorityLOS,#hfcLOS,#hfcIdLOS,#patientConditionLOScd,#priorityLOScd');
        var obj1 = {
            Acode: 'LOS',
            searchLOS:searchLOS,
            patientCondition: patientCondition,
            priority: priority,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail
        };
       $items.each(function () {
            obj1[this.id] = $(this).val();
        });
        _dataLIO.push(obj1);
        indexLIO = _dataLIO.lastIndexOf(obj1);
        appendOrderLIO(obj1, indexLIO)
        console.log(_dataLIO);
        
    });
    
    //searching("tCISOELIOSearch","tCISOELIOSearchLoading","search/ResultLIOSearch.jsp","codeLOS","search/ResultLIOSearchCode.jsp");
    $('#tCISOELIOSearch').flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay:2000,
            selectionRequired: true,
            valueProperty: 'code',
            visibleProperties: ["name","source"],
            url:"search/ResultLIOSearch.jsp",
            cache:true,
            params:{
                timeout:3000,
                success:function(result){
                    //console.log(result);
                    if(result === undefined){
                        $('#tCISOELIOSearchLoading').html('No Record');
                    }
                }
            }
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


});
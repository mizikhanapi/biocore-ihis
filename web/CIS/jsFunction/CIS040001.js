/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    var _dataLIO = [];
    var updateIndex;
    var updateObj;
    var rowId;
    //searching("tCISOELIOSearch","tCISOELIOSearchLoading","search/ResultLIOSearch.jsp","codeLOS","search/ResultLIOSearchCode.jsp");
            $('#tCISOELIOSearch').flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay:2000,
            selectionRequired: true,
            visibleProperties: ["name", "source"],
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
    $(function () {
        $('#appointmentLOS').datepicker({dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true});
    });


    function appendOrderLIO(obj, index) {

        var redcolor = '';
        if (obj.priorityROScd === 'P02') {
            redcolor = 'style="background-color:#ff9999"';
        }

        var _tr = '<tr ' + redcolor + '  id="tr_row|' + index + '" ><td>' + obj.bodySystemROS + ' </td><td>' + obj.modalityROS + '</td><<td>' + obj.ROS + '</td><td>' + obj.commentROS + '</td><td>' + obj.appointmentROS + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderROS").append(_tr);
    }


});
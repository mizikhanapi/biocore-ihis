/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//$(document).ready(function(){

//    searching("tCISSubCCNHFCSearch","tCISSubCCNHFCSearchLoading","search/ResultCCNSearch.jsp","ccnCode","search/ResultCCNSearchCode.jsp");
//    searching("tCISSubPMHSearch","tCISSubPMHSearchLoading","search/ResultPMHSearch.jsp","codePMH","search/ResultPMHSearchCode.jsp");
//    searching("tCISSubFMHSearch","tCISSubFMHSearchLoading","search/ResultPMHSearch.jsp","fmhCode","search/ResultPMHSearchCode.jsp");
//    searching("tCISSubSOHSearch","tCISSubSOHSearchLoading","search/ResultSOHSearch.jsp","codeSOH","search/ResultSOHSearchCode.jsp");
//    searching("tCISSubALGSearch","tCISSubALGSearchLoading","search/ResultALGSearch.jsp","codeALG","search/ResultALGSearchCode.jsp");
//    searching("tCISSubIMUSearch","tCISSubIMUSearchLoading","search/ResultIMUSearch.jsp","codeIMU","search/ResultIMUSearchCode.jsp");
//    searching("tCISSubDABSearch","tCISSubDABSearchLoading","search/ResultDABSearch.jsp","codeDAB","search/ResultDABSearchCode.jsp");
    //function searching Chief complaint
    function searching(fieldId,loadingDivId,urlData,codeFieldId,urlCode){
        $('#'+fieldId).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay:2000,

            url:urlData,
            cache:true,
            params:{
                timeout:3000,
                success:function(result){
                    //console.log(result);
                    if(result === undefined){
                        $('#'+loadingDivId).html('No Record');
                    }
                }
            }
         });

        $("#"+fieldId).on('before:flexdatalist.data',function(response){
            console.log("Start - "+getDate());
            $('#'+loadingDivId).html('<img src="img/LoaderIcon.gif" />');
        });
        $("#"+fieldId).on('after:flexdatalist.data',function(response){
            console.log("End - "+getDate());
            $('#'+loadingDivId).html('');
        });
        $("#" + fieldId).on('select:flexdatalist', function (response) {
            var searchName = $("#" + fieldId).val();
            console.log(searchName);
            $.ajax({
                type:"post",
                url:urlCode,
                timeout:3000,
                data:{id:searchName},
                success:function(response){
                console.log(response);
                   $("#" + codeFieldId).val(response.trim());

                }
            });

        });
    }

    function searchingRetrieve(fieldId, loadingDivId, urlData, codeFieldId, urlCode,currentValue) {
    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        //data:arrayDGSDataAjax,
        url: urlData,
        cache: true,
        params: {
            timeout: 3000,
            success: function (result) {
                //console.log(result);
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
        var searchName = $("#" + fieldId).val();
        console.log(searchName);
        $.ajax({
            type: "post",
            url: urlCode,
            timeout: 3000,
            data: {id: searchName},
            success: function (response) {
                console.log(response);
                $("#" + codeFieldId).val(response.trim());

            }
        });

    });
}
    
        //function Searching Health Facility code and Health Facility name
function searchingHFC(fieldId, loadingDivId, urlData, urlCode, codeFieldId, locationField, hfcOrderDetail, hfcProviderDetail) {


    $('#' + fieldId).flexdatalist({
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
                var hfc_detail_array = response.split("[#-#]");
                var hfc_location = hfc_detail_array[0].split("|");
                $('#' + codeFieldId).val(hfc_location[0].trim());

                if (hfcOrderDetail !== "-") {
                    $('#' + hfcOrderDetail).val(hfc_detail_array[1].trim());
                }
                if (hfcProviderDetail !== "-") {
                    $('#' + hfcProviderDetail).val(hfc_detail_array[2].trim());
                }
                if (locationField !== "-") {
                    $('#' + locationField).val(hfc_location[1].trim());
                }


            }
        });

    });
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

                var hfc_detail_array = response.split("[#-#]");
                var hfc_location = hfc_detail_array[0].split("|");
                $('#' + codeFieldId).val(hfc_location[0].trim());

                if (hfcOrderDetail !== "-") {
                    $('#' + hfcOrderDetail).val(hfc_detail_array[1].trim());
                }
                if (hfcProviderDetail !== "-") {
                    $('#' + hfcProviderDetail).val(hfc_detail_array[2].trim());
                }
                if (locationField !== "-") {
                    $('#' + locationField).val(hfc_location[1].trim());
                }
               
            }
        });

    });
}

function searchLIO(searchFieldId, url, loadingId, currentValue) {
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
function searchDTO(searchFieldId, loadingId, currentValue) {
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: "search/ResultDTOSearch.jsp",
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

function sendOrder(data,tableId){
    $.ajax({
        type: "POST",
        timeout: 3000,
        url: "topMenuFunction/SendOrder.jsp",
        data:data ,
        success: function (response) {
            if (response.trim() === "|-SUCCESS-|") {
                $("#"+tableId).html('');
            }
        }
    })
}
//});
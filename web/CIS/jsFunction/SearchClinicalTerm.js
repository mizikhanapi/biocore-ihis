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
            data: {
                id: hfc_name,
                orderCode: "ROS"
            },
            success: function (response) {
                console.log(response);
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

function searchHFCOnly(fieldId,loadingDivId){
    
        $('#' + fieldId).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultHFCSearch.jsp",
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
}

function searchDisciplineOnly(fieldId, loadingDivId,hfc_code) {

    $('#' + fieldId).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultDISCIPLINESearch.jsp?hfc_code="+hfc_code,
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
}

function retrieveDisciplineOnly(fieldId, loadingDivId, hfc_code,currentValue) {

    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultDISCIPLINESearch.jsp?hfc_code=" + hfc_code,
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
}

function getHFCCode(hfc_name,codeFieldId,detailField,discplineField,disciplineCode){
    
     $.ajax({
            type: "post",
            url: "search/ResultHFCSearchCodeOnly.jsp",
            timeout: 3000,
            data: {
                id: hfc_name
            },
            success: function (response) {
                //console.log(response);
                $("#"+codeFieldId).val(response.trim());
            if (detailField !== "-") {
                getHFCOrderProviderDetail(response.trim(),detailField);
            }
                
                searchDisciplineOnly(discplineField, disciplineCode,response.trim());

            }
        });
}
function getHFCOrderProviderDetail(orderHfc,detailField){
    
    $.ajax({
        type:"POST",
        url:"search/ResultHFCDetailSearch.jsp",
        timeout:3000,
        data:{
            OrderHfc:orderHfc,
            
        },
        success:function(response){
            //console.log(response);
            $("#"+detailField).val(response.trim());
        }
    })
    
}

function searchWard(fieldId,loadingDivId,hfc_cd,discipline_cd,currentValue){
    
        $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultWARDSearch.jsp?hfc_code="+hfc_cd+"&discipline_cd="+discipline_cd,
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

function searchPOS(searchFieldId, loadingId, currentValue, level) {
    var urlSearch;
    if (level === "0") {
        urlSearch = "search/ResultPOSSearch.jsp"
    } else if (level === "1") {
        urlSearch = "search/ResultPOS1Search.jsp"
    } else if (level === "2") {
        urlSearch = "search/ResultPOS2Search.jsp"
    }
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: urlSearch,
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
function searchPOS1(searchFieldId, loadingId, currentValue, level) {
    var urlSearch;
    if (level === "0") {
        urlSearch = "search/ResultPOSSearch.jsp"
    } else if (level === "1") {
        urlSearch = "search/ResultPOS1Search.jsp"
    } else if (level === "2") {
        urlSearch = "search/ResultPOS2Search.jsp"
    }
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: urlSearch,
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
function searchPOS2(searchFieldId, loadingId, currentValue, level) {
    var urlSearch;
    if (level === "0") {
        urlSearch = "search/ResultPOSSearch.jsp"
    } else if (level === "1") {
        urlSearch = "search/ResultPOS1Search.jsp"
    } else if (level === "2") {
        urlSearch = "search/ResultPOS2Search.jsp"
    }
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: urlSearch,
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
function searchPOSCode(searchField,loadingField,codeField,level){
    var currentlevel = level;
    var nextLevel = parseInt(level)+1;
    nextLevel.toString();
     $("#"+searchField).on('before:flexdatalist.data', function (response) {

        $('#'+loadingField).html('<img src="img/LoaderIcon.gif" />');
        
    });
    $("#"+searchField).on('after:flexdatalist.data', function (response) {

        $('#'+loadingField).html('');
        
    });
    $("#"+searchField).on('select:flexdatalist', function (response) {
        
        var procedureName = $("#"+searchField).val();
        $.ajax({
            type: "post",
            url: "search/ResultPOSSearchCode.jsp",
            timeout: 3000,
            data: {
                keyword: procedureName,
                level:level
            },
            success: function (response) {
                console.log(response);
                checkPOSLevel(response.trim(),nextLevel);
                $("#"+codeField).val(response.trim());
                searchPOS1("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", "", "1");
                searchPOSCode1("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", "tCISOEPOS_1_ID", "1");
            
            }
        });
    });
}
function searchPOSCode1(searchField, loadingField, codeField, level) {
    var currentlevel = level;
    var nextLevel = parseInt(level) + 1;
    nextLevel.toString();
    $("#" + searchField).on('before:flexdatalist.data', function (response) {

        $('#' + loadingField).html('<img src="img/LoaderIcon.gif" />');

    });
    $("#" + searchField).on('after:flexdatalist.data', function (response) {

        $('#' + loadingField).html('');

    });
    $("#" + searchField).on('select:flexdatalist', function (response) {

        var procedureName = $("#" + searchField).val();
        $.ajax({
            type: "post",
            url: "search/ResultPOSSearchCode.jsp",
            timeout: 3000,
            data: {
                keyword: procedureName,
                level: level
            },
            success: function (response) {
                console.log(response);
                checkPOSLevel(response.trim(), nextLevel);
                $("#" + codeField).val(response.trim());
                searchPOS2("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", "","2");
                searchPOSCode2("tCISOEPOS2Search","tCISOEPOS2SearchLoading","tCISOEPOS_2_ID","2");

            }
        });
    });
}
function searchPOSCode2(searchField, loadingField, codeField, level) {
    var currentlevel = level;
    var nextLevel = parseInt(level) + 1;
    nextLevel.toString();
    $("#" + searchField).on('before:flexdatalist.data', function (response) {

        $('#' + loadingField).html('<img src="img/LoaderIcon.gif" />');

    });
    $("#" + searchField).on('after:flexdatalist.data', function (response) {

        $('#' + loadingField).html('');

    });
    $("#" + searchField).on('select:flexdatalist', function (response) {

        var procedureName = $("#" + searchField).val();
        $.ajax({
            type: "post",
            url: "search/ResultPOSSearchCode.jsp",
            timeout: 3000,
            data: {
                keyword: procedureName,
                level: level
            },
            success: function (response) {
                console.log(response);
                checkPOSLevel(response.trim(), nextLevel);
                $("#" + codeField).val(response.trim());
//                searchPOS2("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", "", "2");
//                searchPOSCode2("tCISOEPOS2Search", "tCISOEPOS2SearchLoading", "tCISOEPOS_2_ID", "2");

            }
        });
    });
}
function checkPOSLevel(code,level){
        var pos_0_cd = code;
        console.log(level);
        $.ajax({
            url:"search/ResultPOSCheckProcedureLevel.jsp",
            type:"POST",
            timeout:3000,
            data:{
                keyword:pos_0_cd,
                level:level.toString()
            },
            success:function(response){
                console.log(response);
                if (response.trim() === "true"){
                    $("#div_CIS_OE_POS_LVL"+level).show();
                }else{
                     $("#div_CIS_OE_POS_LVL"+level).hide();
                     
                }
            }
            
        });
}

function searchDOCTOROnly(fieldId, loadingDivId, hfc_code) {

    $('#' + fieldId).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultDOCTORSearch.jsp?hfc_code=" + hfc_code,
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
}

function sendOrder(data,tableId){
    
    $.ajax({
        type: "POST",
        timeout: 3000,
        url: "topMenuFunction/SendOrder.jsp",
        data:data ,
        success: function (response) {
            if (response.trim() === "|-SUCCESS-|") {
                if(tableId === "-"){
                    
                }else{
                    $("#"+tableId).html('');
                }
                
            }
        }
    })
}
//});
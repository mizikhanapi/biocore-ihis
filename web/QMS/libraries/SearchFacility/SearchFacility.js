/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var directory = "libraries/SearchFacility/";

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

function searchingHFCValue(fieldId, loadingDivId, urlData, urlCode, codeFieldId, locationField, hfcOrderDetail, hfcProviderDetail, currentHFCName) {
    console.log("searchHFCValue");

    $('#' + fieldId).val(currentHFCName).flexdatalist({
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

function searchHFCDetailv2(hfcName, codeFieldId, hfcOrderDetail, hfcProviderDetail, locationField) {
    var hfc_name = hfcName
    $.ajax({
        type: "post",
        url: directory+"Result/ResultHFCSearchCode.jsp",
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
}


function searchHFCOnly(fieldId, loadingDivId) {

    $('#' + fieldId).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory+"Result/ResultHFCSearch.jsp",
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
}
function searchHFCDefault(fieldId, loadingDivId,value) {

    $('#' + fieldId).val(value).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory+"Result/ResultHFCSearch.jsp",
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
}



function searchDisciplineOnly(fieldId, loadingDivId, hfc_code) {

    $('#' + fieldId).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory+"Result/ResultDISCIPLINESearch.jsp?hfc_code=" + hfc_code,
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
}

function retrieveDisciplineOnly(fieldId, loadingDivId, hfc_code, currentValue) {

    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory+"Result/ResultDISCIPLINESearch.jsp?hfc_code=" + hfc_code,
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
}

function getHFCCode(hfc_name, codeFieldId, detailField, discplineField, disciplineLoading) {
   
    $.ajax({
        type: "post",
        url: directory+"Result/ResultHFCSearchCodeOnly.jsp",
        timeout: 3000,
        data: {
            id: hfc_name
        },
        success: function (response) {
            console.log(response);
            $("#" + codeFieldId).val(response.trim());
            if (detailField !== "-") {
                getHFCOrderProviderDetail(response.trim(), detailField);
            }

            searchDisciplineOnly(discplineField, disciplineLoading, response.trim());

        }
    });
}
function getHFCOrderProviderDetail(orderHfc, detailField) {

    $.ajax({
        type: "POST",
        url: directory+"Result/ResultHFCDetailSearch.jsp",
        timeout: 3000,
        data: {
            OrderHfc: orderHfc,

        },
        success: function (response) {
            //console.log(response);
            $("#" + detailField).val(response.trim());
        }
    })
    
    

}

function searchWard(fieldId, loadingDivId, hfc_cd, discipline_cd, currentValue, wardClass) {

    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory+"Result/ResultWARDSearch.jsp?hfc_code=" + hfc_cd + "&discipline_cd=" + discipline_cd + "&class=" + wardClass,
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
}

function searchWardClass(fieldId, loadingDivId, hfc_cd, discipline_cd, currentValue) {

    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory+"ResultWARDCLASSSearch.jsp?hfc_code=" + hfc_cd + "&discipline_cd=" + discipline_cd,
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

function getDisciplineCode(hfc_cd, discipline_name, discipline_code_id, subdiscipline_name_id, subdiscipline_loading_id){
           
        
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: directory+"Result/ResultDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: discipline_name
            },
            success: function (response) {
                console.log(response);
                //this ajax will response discipline Code for hfc patient admit to;
                $("#"+discipline_code_id).val(response.trim());
                searchSubdiscipline(hfc_cd, response.trim(), subdiscipline_name_id, subdiscipline_loading_id);
                
                
            }
        })
}

function searchSubdiscipline(hfc_cd,discipline_cd,subdiscipline_name_id, subdiscipline_loading_id){
    
    $('#' + subdiscipline_name_id).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory + "Result/ResultSUBDISCIPLINESearch.jsp?hfc_code=" + hfc_cd + "&dis_code=" + discipline_cd,
        cache: true,
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                console.log(hfc_cd);
                console.log(discipline_cd);
                if (result === undefined) {
                    $('#' + subdiscipline_loading_id).html('No Record');
                }
            }
        }
    });
    $("#" + subdiscipline_name_id).on('before:flexdatalist.data', function (response) {
        $('#' + subdiscipline_loading_id).html('<img src="img/LoaderIcon.gif" />');
    });
    $("#" + subdiscipline_name_id).on('after:flexdatalist.data', function (response) {
        $('#' + subdiscipline_loading_id).html('');
    });
}

function getSubDisciplineCode(hfc_cd,discipline_code, subdiscipline_name, subdiscipline_code_id){
           
        
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: directory+"Result/ResultSUBDISCIPLINESearchCode.jsp?hfc_cd=" + hfc_cd,
            data: {
                name: subdiscipline_name,
                discipline_cd:discipline_code
            },
            success: function (response) {
                console.log(response);
                //this ajax will response discipline Code for hfc patient admit to;
                $("#"+subdiscipline_code_id).val(response.trim());
               
                
                
            }
        })
}


function searchDisciplineValue(fieldId, loadingDivId, hfc_code, value) {

    $('#' + fieldId).val(value).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory+"Result/ResultDISCIPLINESearch.jsp?hfc_code=" + hfc_code,
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
}

function searchSubdisciplineValue(hfc_cd,discipline_cd,subdiscipline_name_id, subdiscipline_loading_id, value){
    
    $('#' + subdiscipline_name_id).val(value).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: directory + "Result/ResultSUBDISCIPLINESearch.jsp?hfc_code=" + hfc_cd + "&dis_code=" + discipline_cd,
        cache: true,
        params: {
            timeout: 3000,
            success: function (result) {

                if (result === undefined) {
                    $('#' + subdiscipline_loading_id).html('No Record');
                }
            }
        }
    });
    $("#" + subdiscipline_name_id).on('before:flexdatalist.data', function (response) {
        
    });
    $("#" + subdiscipline_name_id).on('after:flexdatalist.data', function (response) {
        $('#' + subdiscipline_loading_id).html('');
    });
}

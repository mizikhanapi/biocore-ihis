/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function searching(fieldId, loadingDivId, urlData, codeFieldId, urlCode) {

    $('#' + fieldId).flexdatalist({
        minLength: 3,
        searchIn: 'name',
        //searchDelay:3000,
        url: urlData,
        cache: false, // must set to false because default is true
        searchContain: true,
        params: {
            timeout: 3000,
            success: function (result) {

                if (result === undefined) {
                    $('#' + loadingDivId).html('No Record');
                }
            }
        }
    });

    $("#" + fieldId).on('change:flexdatalist', function (event, set, options) {
        // console.log($("#"+fieldId).val());
        $("#" + fieldId + "-flexdatalist").val($("#" + fieldId).val().toLowerCase());
        //console.log(set.text);
    });

    $("#" + fieldId).on('before:flexdatalist.data', function (response) {

        $('#' + loadingDivId).html('<img src="img/LoaderIcon.gif" />');
    });
    $("#" + fieldId).on('after:flexdatalist.data', function (response) {

        $('#' + loadingDivId).html('');
    });
    $("#" + fieldId).on('select:flexdatalist', function (response) {
        var searchName = $("#" + fieldId).val();

        $.ajax({
            type: "post",
            url: urlCode,
            timeout: 3000,
            data: {id: searchName},
            success: function (response) {

                $("#" + codeFieldId).val(response.trim());

            }
        });

    });
}

function searchingRetrieve(fieldId, loadingDivId, urlData, codeFieldId, urlCode, currentValue) {
    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        //data:arrayDGSDataAjax,
        url: urlData,
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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
        var searchName = $("#" + fieldId).val();

        $.ajax({
            type: "post",
            url: urlCode,
            timeout: 3000,
            data: {id: searchName},
            success: function (response) {

                $("#" + codeFieldId).val(response.trim());

            }
        });

    });
}

//function Searching Health Facility code and Health Facility name
function searchingHFC(fieldId, loadingDivId, urlData, urlCode, codeFieldId, locationField, hfcOrderDetail, hfcProviderDetail) {


    $('#' + fieldId).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: urlData,
        cache: false,
        searchByWord: true,
        params: {
            timeout: 3000,
            success: function (result) {

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


    $('#' + fieldId).val(currentHFCName).flexdatalist({
        minLength: 3,
        searchIn: 'name',
        searchDelay: 2000,
        url: urlData,
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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
    var hfc_name = hfcName;
    $.ajax({
        type: "post",
        url: "search/ResultHFCSearchCode.jsp",
        timeout: 3000,
        data: {
            id: hfc_name,
        },
        success: function (response) {

            var hfc_detail_array = response.split("[#-#]");
            var hfc_location = hfc_detail_array[0].split("|");
            if (codeFieldId !== "-") {
                $('#' + codeFieldId).val(hfc_location[0].trim());
            }
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
        url: "search/ResultHFCSearch.jsp",
        cache: false,
        searchByWord: true,
        params: {
            timeout: 3000,
            success: function (result) {

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

function searchHFCDefault(fieldId, loadingDivId, value) {

    $('#' + fieldId).val(value).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultHFCSearch.jsp",
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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
        url: "search/ResultDISCIPLINESearch.jsp?hfc_code=" + hfc_code,
        cache: false,
        searchByWord: true,
        params: {
            timeout: 3000,
            success: function (result) {

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
        url: "search/ResultDISCIPLINESearch.jsp?hfc_code=" + hfc_code,
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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

function getHFCCode(hfc_name, codeFieldId, detailField, discplineField, disciplineCode) {

    $.ajax({
        type: "post",
        url: "search/ResultHFCSearchCodeOnly.jsp",
        timeout: 3000,
        data: {
            id: hfc_name
        },
        success: function (response) {

            $("#" + codeFieldId).val(response.trim());
            if (detailField !== "-") {
                getHFCOrderProviderDetail(response.trim(), detailField);
            }

            searchDisciplineOnly(discplineField, disciplineCode, response.trim());

        }
    });
}
function getHFCOrderProviderDetail(orderHfc, detailField) {

    $.ajax({
        type: "POST",
        url: "search/ResultHFCDetailSearch.jsp",
        timeout: 3000,
        data: {
            OrderHfc: orderHfc,
        },
        success: function (response) {

            $("#" + detailField).val(response.trim());
        }
    })

}

function searchWard(fieldId, loadingDivId, hfc_cd, discipline_cd, currentValue, wardClass) {

    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultWARDSearch.jsp?hfc_code=" + hfc_cd + "&discipline_cd=" + discipline_cd + "&class=" + wardClass,
        cache: false,
        searchByWord: true,
        params: {
            timeout: 3000,
            success: function (result) {

                if (result === undefined) {
                    $('#' + loadingDivId).html('No Record');
                }
            }
        }
    });
}

function searchWardClass(fieldId, loadingDivId, hfc_cd, discipline_cd, currentValue) {

    $('#' + fieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultWARDCLASSSearch.jsp?hfc_code=" + hfc_cd + "&discipline_cd=" + discipline_cd,
        cache: false,
        searchByWord: true,
        params: {
            timeout: 3000,
            success: function (result) {

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
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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
        cache: false,
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
function searchDTO(searchFieldId, loadingId, currentValue) {
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 1000,
        selectionRequired: true,
        url: "search/ResultDTOSearch.jsp",
        valueProperty: 'value',
        cache: false,
        maxShownResults: 50,
        debug: false,
        params: {
            success: function (result) {
                console.log(result);
                if (result === undefined) {
                    $('#' + loadingId).html('No Record');
                }
            }
        }
    });
}

function searchPOS(searchFieldId, loadingId, currentValue, level, parentCode) {
    var urlSearch;
    if (level === "0") {
        urlSearch = "search/ResultPOSSearch.jsp"
    } else if (level === "1") {
        urlSearch = "search/ResultPOS1Search.jsp?p=" + parentCode;
    } else if (level === "2") {
        urlSearch = "search/ResultPOS2Search.jsp?p1=" + parentCode;
    }
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: urlSearch,
        cache: false,
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
function searchPOS1(searchFieldId, loadingId, currentValue, level, parentCode) {
    var urlSearch;
    if (level === "0") {
        urlSearch = "search/ResultPOSSearch.jsp"
    } else if (level === "1") {
        urlSearch = "search/ResultPOS1Search.jsp?p=" + parentCode;
    } else if (level === "2") {
        urlSearch = "search/ResultPOS2Search.jsp?p1=" + parentCode;
    }
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: urlSearch,
        cache: false,
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
function searchPOS2(searchFieldId, loadingId, currentValue, level, parentCode) {
    var urlSearch;
    if (level === "0") {
        urlSearch = "search/ResultPOSSearch.jsp"
    } else if (level === "1") {
        urlSearch = "search/ResultPOS1Search.jsp?p=" + parentCode;
    } else if (level === "2") {
        urlSearch = "search/ResultPOS2Search.jsp?p1=" + parentCode;
    }
    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: urlSearch,
        cache: false,
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
function searchPOSCode(searchField, loadingField, codeField, level) {
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

                checkPOSLevel(response.trim(), nextLevel);
                $("#" + codeField).val(response.trim());
                searchPOS1("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", "", "1", response.trim());
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

                checkPOSLevel(response.trim(), nextLevel);
                $("#" + codeField).val(response.trim());
                searchPOS2("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", "", "2", response.trim());
                searchPOSCode2("tCISOEPOS2Search", "tCISOEPOS2SearchLoading", "tCISOEPOS_2_ID", "2");

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

                checkPOSLevel(response.trim(), nextLevel);
                $("#" + codeField).val(response.trim());
//                searchPOS2("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", "", "2");
//                searchPOSCode2("tCISOEPOS2Search", "tCISOEPOS2SearchLoading", "tCISOEPOS_2_ID", "2");

            }
        });
    });
}
function checkPOSLevel(code, level) {
    var pos_0_cd = code;

    $.ajax({
        url: "search/ResultPOSCheckProcedureLevel.jsp",
        type: "POST",
        timeout: 3000,
        data: {
            keyword: pos_0_cd,
            level: level.toString()
        },
        success: function (response) {

            if (response.trim() === "true") {
                $("#div_CIS_OE_POS_LVL" + level).show();
            } else {

                $("#tCISOEPOS_" + level.toString() + "_ID").val("");
                if (level !== 3) {
                    $("#tCISOEPOS_2_ID").val("");
                    $("#div_CIS_OE_POS_LVL2").hide();
                }

                $("#div_CIS_OE_POS_LVL" + level).hide();


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
        cache: false,
        searchByWord: true,
        params: {
            timeout: 3000,
            success: function (result) {

                if (result === undefined) {
                    $('#' + loadingDivId).html('No Record');
                }
            }
        }
    });
}

function searchDOCTORValue(fieldId, loadingDivId, hfc_code, value) {

    $('#' + fieldId).val(value).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultDOCTORSearch.jsp?hfc_code=" + hfc_code,
        cache: false,
        valueProperty: 'name',
        visibleProperties: ['name', "role", "discipline", "subdiscipline"],
        params: {
            timeout: 3000,
            success: function (result) {

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

function searchDOCTOROnlySurgical(fieldId, loadingDivId, hfc_code, value) {

    $('#' + fieldId).val(value).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultDOCTORSurgicalSearch.jsp?hfc_code=" + hfc_code,
        valueProperty: 'name',
        visibleProperties: ['name', "role", "discipline", "subdiscipline"],
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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
function searchOTRoomSurgical(fieldId, loadingDivId, value) {

    $('#' + fieldId).val(value).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        url: "search/ResultOTRoomSearch.jsp",
        valueProperty: 'value',
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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
function sendOrder(data, tableId) {

    $.ajax({
        type: "POST",
        timeout: 3000,
        url: "topMenuFunction/SendOrder.jsp",
        data: data,
        success: function (response) {
            if (response.trim() === "|-SUCCESS-|") {
                if (tableId === "-") {

                } else {
                    $("#" + tableId).html('');
                }

            }
        }
    })
}
function searchPOSSurgicalCategory(searchFieldId, loadingId, currentValue) {

    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: "search/ResultPOSSurgicalCategorySearch.jsp",
        cache: false,
        valueProperty: 'name',
        params: {
            timeout: 3000,
            success: function (result) {

                if (result === undefined) {
                    $('#' + loadingId).html('No Record');
                }
            }
        }
    });

    $("#" + searchFieldId).on('before:flexdatalist.data', function (response) {
        $('#' + loadingId).html('<img src="img/LoaderIcon.gif" />');
    });
    $("#" + searchFieldId).on('after:flexdatalist.data', function (response) {
        $('#' + loadingId).html('');
    });
}
function searchPOSSurgicalProcedure(searchFieldId, loadingId, currentValue, catCode) {

    $('#' + searchFieldId).val(currentValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        selectionRequired: true,
        url: "search/ResultPOSSurgicalSearch.jsp?cat_cd=" + catCode,
        cache: false, //must set to false because default is true.
        params: {
            timeout: 3000,
            success: function (result) {

                if (result === undefined) {
                    $('#' + loadingId).html('No Record');
                }
            }
        }
    });
    $("#" + searchFieldId).on('before:flexdatalist.data', function (response) {
        $('#' + loadingId).html('<img src="img/LoaderIcon.gif" />');
    });
    $("#" + searchFieldId).on('after:flexdatalist.data', function (response) {
        $('#' + loadingId).html('');
    });
}

function retriveDataSearchingSubjective(fieldId, loadingDivId, urlData, urlCode, codeFieldId, retriveValue) {
    $('#' + fieldId).val(retriveValue).flexdatalist({
        minLength: 1,
        searchIn: 'name',
        searchDelay: 2000,
        //data:arrayDGSDataAjax,
        url: urlData,
        cache: false,
        params: {
            timeout: 3000,
            success: function (result) {

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
        var searchName = $("#" + fieldId).val();

        $.ajax({
            type: "post",
            url: urlCode,
            timeout: 3000,
            data: {id: searchName},
            success: function (response) {

                $("#" + codeFieldId).val(response.trim());

            }
        });

    });
}

function addPersonalisedTerm(dataPersonalised) {
    $.ajax({
        type: 'POST',
        url: 'search/InsertPersonalised.jsp',
        data: dataPersonalised,
        timeout: 3000,
        success: function (response) {
            console.log(response);
            var data_response = response.trim().split("[-|-]");
            var status = data_response[0];
            if (status === "ALREADY") {
                bootbox.alert("The clinical term already added in your personalised. Please search in personalise to select the term")
                retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
            } else {
                retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
                bootbox.alert("The clinical term successfully added in your personalised. Please search in personalise to select the term");
            }

        }
    });
}

//});

function blockSpecialChar(e) {
    var k = e.keyCode;

    return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 46 && k <= 57) || k == 32);
}

        
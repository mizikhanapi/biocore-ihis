/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {

    $('#squarespaceModal2').on('show.bs.modal', function (e) {
        searchInitialize("DGS", "I");
        $("#tCISSubDGSSearchPersonalised-flexdatalist").hide();
    });

    $('#squarespaceModal2').on('hide.bs.modal', function (e) {
        searchInitialize("DGS", "D");
        $("#tCISSubDGSSearchPersonalised-flexdatalist").hide();
    });

    $('#update_CIS030001').on('show.bs.modal', function (e) {
        searchInitialize("DGS", "I");
        $("#tCISSubDGSSearchPersonalised_update-flexdatalist").hide();
    });

    $('#update_CIS030001').on('hide.bs.modal', function (e) {
        searchInitialize("DGS", "D");
        $("#tCISSubDGSSearchPersonalised_update-flexdatalist").hide();
    });


    $('input[name="rCISSubDGSSearchType"]').on('click', function () {
        var type = $(this).val();
        if (type === 'CT') {
            $("#btnCISSubDGSAddPersonalised").show();
            $("#tCISSubDGSSearchPersonalised-flexdatalist").hide();

            $("#tCISSubDGSSearch-flexdatalist").show();
        } else {
            $("#tCISSubDGSSearchPersonalised-flexdatalist").show();
            $("#tCISSubDGSSearch-flexdatalist").hide();
            $("#btnCISSubDGSAddPersonalised").hide();

        }
    });


    $('input[name="rCISSubDGSSearchType_update"]').on('click', function () {
        var type = $(this).val();
        if (type === 'CT') {
            $("#btnCISSubDGSAddPersonalised_update").show();
            $("#tCISSubDGSSearchPersonalised_update-flexdatalist").hide();

            $("#tCISSubDGSSearch_update-flexdatalist").show();
        } else {
            $("#tCISSubDGSSearchPersonalised_update-flexdatalist").show();
            $("#tCISSubDGSSearch_update-flexdatalist").hide();
            $("#btnCISSubDGSAddPersonalised_update").hide();

        }
    });

    //$('#btnCISSubDGSAddPersonalised').click(function (e) {
    $('#btnCISSubDGSAddPersonalised').off('click').on('click', function (e) {
        e.preventDefault();

        var search_by = $('input[name="rCISSubDGSSearchType"]').val();
        var term_name = term_name = $("#tCISSubDGSSearch").val();
        var term_code = $("#dgsCode").val();
        var code_type = $("#tCISSUBDGSCodeType").val();
        var code_valid = $("#tCISSubDGSSearch").val();

        if (term_code === "") {
            bootbox.alert("You need enter valid Diagnosis Term");
        } else if (code_valid === "") {
            bootbox.alert("Please search and select a diagnosis before pressing the add button !!!");
        } else {

            var dataPersonalised = {
                term_name: term_name,
                term_code: term_code,
                code_type: code_type
            }

            addPersonalisedTermDGS(dataPersonalised);

        }

    });



    //function searching Diagnosis Ajax
    function searching(fieldId, loadingDivId, urlData, urlCode, codeFieldId) {
        $('#' + fieldId).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 2000,
            //data:arrayDGSDataAjax,
            url: urlData,
            cache: true,
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
});


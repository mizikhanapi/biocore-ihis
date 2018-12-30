//validate max length of input
var methodType;

$("#modalSaya #appointmentModal #divIDType").hide();
$("#modalSaya #appointmentModal #divDate").hide();
$("#modalSaya #appointmentModal #OM_selectDate").hide();
$("#modalSaya #appointmentModal #selectdateDua").hide();

$("#modalSaya #appointmentModal #searchBy").on('change', function () {
    var searchBy = $("#modalSaya #appointmentModal #searchBy").val();
    if (searchBy === "id") {
        $("#modalSaya #appointmentModal #divIDType").show();
        $("#modalSaya #appointmentModal #divDate").hide();
    } else {
        $("#modalSaya #appointmentModal #divIDType").hide();
        $("#modalSaya #appointmentModal #divDate").show();
    }
});

$("#modalSaya #appointmentModal #bydateSel").on('change', function () {
    var datsel = $(this).val();
    if (datsel === "custom") {
        $("#modalSaya #appointmentModal #OM_selectDate").show();
    } else {
        $("#modalSaya #appointmentModal #OM_selectDate").hide();

    }

});
$('#modalSaya #appointmentModal #idTypeApp').on('change', function () {
    var id = $('#modalSaya #appointmentModal #idTypeApp').val();
    if (id === "001") {
        $('#modalSaya #appointmentModal #idInputApp').attr('maxlength', '13');
    } else if (id === "002") {
        $('#modalSaya #appointmentModal #idInputApp').attr('maxlength', '12');
    } else if (id === "003") {
        $('#modalSaya #appointmentModal #idInputApp').attr('maxlength', '8');
    } else {
        $('#modalSaya #appointmentModal #idInputApp').attr('maxlength', '10');
    }
});

function searchApp(method) {
    var valueParameters;
    var typeParameter;
    var fromDateParameter;
    var toDateParameter;
    var inputApp = $('#modalSaya #appointmentModal #idInputApp').val();
    var typeApp = $('#modalSaya #appointmentModal #idTypeApp').val();

    var searchBy = $('#modalSaya #appointmentModal #searchBy').val();

    var bydateSel = $('#modalSaya #appointmentModal #bydateSel').val();

    var OM_DateFrom = $("#modalSaya #appointmentModal #OM_DateFrom").val();
    var OM_DateTo = $("#modalSaya #appointmentModal #OM_DateTo").val();
    if (searchBy === null || searchBy === "") {
        bootbox.alert({message: "Please select Search by first", title: "Information"});
    } else {
        if (searchBy === "id") {

            typeParameter = typeApp;
            valueParameters = inputApp;
            fromDateParameter = "-";
            toDateParameter = "-";

        } else if (searchBy === "date") {
            switch (bydateSel) {
                case "today":
                    typeParameter = bydateSel;
                    fromDateParameter = "-";
                    toDateParameter = "-";
                    valueParameters = "-";
                    break;
                case "yesterday":
                    typeParameter = bydateSel;
                    fromDateParameter = "-";
                    toDateParameter = "-";
                    valueParameters = "-";
                    break;
                case "30":
                    typeParameter = bydateSel;
                    fromDateParameter = "-";
                    toDateParameter = "-";
                    valueParameters = "-";
                    break;
                case "60":
                    typeParameter = bydateSel;
                    fromDateParameter = "-";
                    toDateParameter = "-";
                    valueParameters = "-";
                    break;
                case "custom":
                    typeParameter = bydateSel;
                    fromDateParameter = OM_DateFrom;
                    toDateParameter = OM_DateTo;
                    valueParameters = "-";
                    break;
                default:
            }
        }
        var datas = {idType: typeParameter,
            idInput: valueParameters,
            fromDate: fromDateParameter,
            toDate: toDateParameter};

        //console.log(datas);
        console.log("method", method);
        var loading = "<div class='loading'></div>";

        if (method === "appointment") {
            $('#modalSaya #appointmentModal #modalBodyAppointment').html(loading);
            $.ajax({
                type: "POST",
                data: datas,
                url: "controller/listApp.jsp",
                timeout: 10000,
                success: function (list) {
                    //console.log(list);
                    $('#modalSaya #appointmentModal #modalBodyAppointment').html(list);
                },
                error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    bootbox.alert(err.Message);
                    $('.loading').hide();
                }
            });
            $('#modalSaya #appointmentModal #myFormApp')[0].reset();
            $("#modalSaya #appointmentModal #divIDType").hide();
            $("#modalSaya #appointmentModal #divDate").hide();
            $("#modalSaya #appointmentModal #OM_selectDate").hide();
        } else if (method === "referral") {
            $('#modalSaya #appointmentModal #modalBodyReferral').html(loading);
            $.ajax({
                type: "POST",
                data: datas,
                url: "controller/listRef.jsp", // call the php file ajax/tuto-autocomplete.php
                timeout: 10000,
                success: function (list) {
                    //console.log(list);
                    $('#modalSaya #appointmentModal #modalBodyReferral').html(list);
                },
                error: function (xhr, status, error) {

                    bootbox.alert(error);
                    $('.loading').hide();

                }
            });
            $('#modalSaya #appointmentModal #myFormApp')[0].reset();
            $("#modalSaya #appointmentModal #divIDType").hide();
            $("#modalSaya #appointmentModal #divDate").hide();
            $("#modalSaya #appointmentModal #OM_selectDate").hide();
        }
    }








}
;

$('#modalSaya #appointmentModal #searchApp').on('click', function () {
    methodType = $("#divMethodType #methodType").val();
    searchApp(methodType);

});

//event when press ENTER after inserting the ID
$("#modalSaya #appointmentModal #idInputApp").on("keydown", function (e) {
    var code = e.keyCode;

    if (code === 13) {
        e.preventDefault();
        methodType = $("#divMethodType #methodType").val();
        searchApp(methodType);

    }
});

$('#modalSaya #appointmentModal #clearApp').click(function () {
    $('#modalSaya #appointmentModal #myFormApp')[0].reset();
    $("#modalSaya #appointmentModal #listAppointment tbody").empty();
    $("#modalSaya #appointmentModal #listReferralTbl tbody").empty();
    $("#modalSaya #appointmentModal #divIDType").hide();
    $("#modalSaya #appointmentModal #divDate").hide();
    $("#modalSaya #appointmentModal #OM_selectDate").hide();
//         
});
$("#modalSaya #appointmentModal").on("hidden.bs.modal", function () {
    $('#modalSaya #appointmentModal #myFormApp')[0].reset();
    $("#modalSaya #appointmentModal #listAppointment tbody").empty();
    $("#modalSaya #appointmentModal #listReferralTbl tbody").empty();
    $("#modalSaya #appointmentModal #divIDType").hide();
    $("#modalSaya #appointmentModal #divDate").hide();
    $("#modalSaya #appointmentModal #OM_selectDate").hide();
});

//--- initialise datepicker for from ----
//    $("#modalSaya #appointmentModal #OM_selectDate #OM_DateFrom").datepicker();
//    $("#modalSaya #appointmentModal #OM_selectDate #OM_DateTo").datepicker();
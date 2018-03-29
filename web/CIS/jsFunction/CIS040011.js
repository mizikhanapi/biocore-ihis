/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#btnCIS_OE_POSSurgical_UPDATE").hide();
    $("#btnCIS_OE_POSSurgical_CANCEL").hide();
    $("#btnCIS_OE_POSSurgical_ADD").show();
    var _dataPOSSurgical = [];
    var indexPOSSurgical;
    var updatePOSSurgicalIndex;
    var updatePOSSurgicalObj;
    var rowPOSSurgicalId;
    var rowPOSSurgicalDataTR;

    $("#CIS040011").on('show.bs.modal', function () {
        searchPOSSurgicalCategory("tCISOESPOCategoryName", "tCISOESPOCategoryNameLoading", "");
        searchDOCTOROnlySurgical("tCISOESPOConsultantName", "tCISOESPOConsultantNameLoading", hfc_cd, "");
        searchOTRoomSurgical("tCISOESPOOTRoomName", "tCISOESPOOTRoomNameLoading", "");
    });



    $(".CIS-OE-SPO-DATE").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });

    $('.CIS-OE-SPO-TIME').timepicker({
        timeFormat: 'H:mm ',
        interval: 60,
        minTime: '00:00',
        maxTime: '23:59',
        defaultTime: '13:00',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true
    });

    $(".CIS-OE-SPO-DATE").datepicker("setDate", new Date());

    $("#tCISOESPOSearch").prop("disabled", true);

    //searching("tCISOESPOProblemName", "tCISOESPOProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodeSPO", "search/ResultCCNSearchCode.jsp");


    $("#tCISOESPOOTRoomName").on('select:flexdatalist', function (value) {
        $.ajax({
            type: 'POST',
            timeout: 3000,
            url: "search/ResultOTRoomSearchCode.jsp",
            data: {
                room_name: $(this).val()
            },
            success: function (e) {

                $("#tCISOESPOOTRoomCode").val(e.trim());
            }
        });
    });

    $("#tCISOESPOConsultantName").on('select:flexdatalist', function (value) {
        $.ajax({
            type: 'POST',
            timeout: 3000,
            url: 'search/ResultDOCTORSearchCode.jsp',
            data: {
                name: $(this).val(),
                hfc_code: hfc_cd
            },
            success: function (e) {

                console.log(e);
                $("#tCISOESPOConsultantCode").val(e.trim());
            }
        });
    });

    $("#tCISOESPOCategoryName").on("select:flexdatalist", function (value) {

        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultPOSSurgicalCategorySearchCode.jsp",
            data: {
                name: $(this).val()
            },
            success: function (e) {
                $("#tCISOESPOSearch").prop("disabled", false);
                $("#tCISOESPOCategoryCode").val(e.trim());
                searchPOSSurgicalProcedure("tCISOESPOSearch", "tCISOESPOSearchLoading", "", e.trim());
            }
        });


    });

    $("#tCISOESPOSearch").on("select:flexdatalist", function (value) {
        var name = $(this).val();
        var cat_cd = $("#tCISOESPOCategoryCode").val();
        var data = {
            name: name,
            cat_cd: cat_cd
        };

        $.ajax({
            type: "POST",
            url: "search/ResultPOSSurgicalSearchCode.jsp",
            timeout: 3000,
            data: data,
            success: function (e) {

                $("#tCISOESPOSearch_Code").val(e.trim());
            }
        });
    });

    $("#btnCIS_OE_POSSurgical_SUBMIT").click(function (e) {
        e.preventDefault();

        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var providerDetail = _dataPOSSurgical[0].hfcProviderDetail.split("|");
            var msh = getMSH("19", providerDetail[0]);

            var pdi = PDIInfo;
            var orc = convertORC(_dataPOSSurgical[0], "02", "19", "T12103");
            for (var i in _dataPOSSurgical) {
                msg += convertPOSSurgical(_dataPOSSurgical[i]);
            }
            fullmsg = msh + pdi + orc + msg;
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            };
            sendOrder(data, "tableOrderPOSSurgical");
            _dataPOSSurgical = [];
        } else {
            return false;
        }
    });

    $("#btnCIS_OE_POSSurgical_ADD").click(function (e) {
        e.preventDefault();
        var cat_cd = $("#tCISOESPOCategoryCode").val();
        var cat_name = $("#tCISOESPOCategoryName").val();
        var procedure_cd = $("#tCISOESPOSearch_Code").val();
        var procedure = $("#tCISOESPOSearch").val();
        var hfcOrderDetail = $("#hfcOrderDetailSPO").val();
        var hfcProviderDetail = $("#hfcProviderDetailSPO").val();

        var consultantName = $("#tCISOESPOConsultantName").val();
        var consultant_cd = $("#tCISOESPOConsultantCode").val();
        var otRoom_cd = $("#tCISOESPOOTRoomCode").val();
        var otRoom = $("#tCISOESPOOTRoomName").val();
        var problemCode = "";
        var problemName = "";
        var priority = "";
        var priorityCode = "";
        var patientCondition = "";
        var patientConditionCd = "";

        var startDate = $("#tCISOESPOStartDate").val();
        var startTime = $("#tCISOESPOStartTime").val();
        var endDate = $("#tCISOESPOENDDate").val();
        var endTime = $("#tCISOESPOEndTime").val();
        var commentArea = $("#tCIS_POSSurgicalCommentArea").val();



        var obj = {
            procedure: procedure,
            procedureCode: procedure_cd,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            problemCode: problemCode,
            problemName: problemName,
            priority: priority,
            priorityCode: priorityCode,
            patientCondition: patientCondition,
            patientConditionCode: patientConditionCd,
            startDate: startDate,
            startTime: startTime,
            endDate: endDate,
            endTime: endTime,
            comment: commentArea,
            cat_Code: cat_cd,
            cat_name: cat_name,
            consultantName: consultantName,
            consultantCode: consultant_cd,
            otRoom: otRoom,
            otRoomCode: otRoom_cd
        };

        if (procedure_cd === "" && commentArea === "" && consultantName === "" && otRoom === "") {
            alert("You not enter procedure, comment, consultant and OT Room");
        } else if (procedure_cd === "" && commentArea === "" && consultantName === "") {
            alert("You not enter procedure, comment and consultant name");
        } else if (procedure_cd === "" && commentArea === "" && otRoom === "") {
            alert("You not enter the procedure comment, and OT Room");
        } else if (procedure_cd === "" && consultantName === "" && otRoom === "") {
            alert("You not enter procedure consultant and OT Room");
        } else if (commentArea === "" && consultantName === "" && otRoom === "") {
            alert("You not enter the comment, consultant and OT Room");
        } else if (procedure_cd === "" && commentArea === "") {
            alert("You not enter procedure and comment");
        } else if (procedure_cd === "" && otRoom === "") {
            alert("You not enter the procedure and OT Room");
        } else if (consultantName === "" && otRoom === "") {
            alert("You not enter the consultant name and OT Room");
        } else if (procedure_cd === "") {
            alert("You not enter the procedure");
        } else if (commentArea === "") {
            alert("You not enter the comment");
        } else if (consultantName === "") {
            alert("You not enter the consultant");
        } else if (otRoom === "") {
            alert("You not enter the OT Room");
        } else {
            if (checkOrderCode(_dataPOSSurgical, obj.procedureCode)) {
                alert("This order already been added");
            } else {
                _dataPOSSurgical.push(obj);
                indexPOSSurgical = _dataPOSSurgical.lastIndexOf(obj);
                appendOrderPOSSurgical(obj, indexPOSSurgical);
                clearFieldPOSSurgical();
            }

        }



    });

    $("#tableOrderPOSSurgical").on("click", ".btnUpdate", function () {
        $("#tCISOESPOSearch").prop("disabled", false);
        $("#btnCIS_OE_POS_UPDATE").show();
        $("#btnCIS_OE_POS_CANCEL").show();
        $("#btnCIS_OE_POS_ADD").hide();

        rowPOSSurgicalDataTR = $(this).closest("tr");
        rowPOSSurgicalId = $(this).get(0).id;
        var index = rowPOSSurgicalId.split("|");
        index = parseInt(index[1]);
        updatePOSSurgicalIndex = indexPOSSurgical;
        updatePOSSurgicalObj = _dataPOSSurgical[index];

        searchPOSSurgicalCategory("tCISOESPOCategoryName", "tCISOESPOCategoryNameLoading", updatePOSSurgicalObj.cat_name);
        searchDOCTOROnlySurgical("tCISOESPOConsultantName", "tCISOESPOConsultantNameLoading", hfc_cd, updatePOSSurgicalObj.consultantName);
        searchOTRoomSurgical("tCISOESPOOTRoomName", "tCISOESPOOTRoomNameLoading", updatePOSSurgicalObj.otRoom);
        searchPOSSurgicalProcedure("tCISOESPOSearch", "tCISOESPOSearchLoading", updatePOSSurgicalObj.procedure, updatePOSSurgicalObj.cat_cd);
        $("#tCISOESPOCategoryCode").val(updatePOSSurgicalObj.cat_Code);
        $("#tCISOESPOSearchCode").val(updatePOSSurgicalObj.procedure_cd);
        $("#tCISOESPOConsultantCode").val(updatePOSSurgicalObj.consultantCode);
        $("#tCISOESPOOTRoomCode").val(updatePOSSurgicalObj.otRoomCode);

        $("#tCISOESPOStartDate").val(updatePOSSurgicalObj.startDate);
        $("#tCISOESPOStartTime").val(updatePOSSurgicalObj.startTime);
        $("#tCISOESPOENDDate").val(updatePOSSurgicalObj.endDate);
        $("#tCISOESPOEndTime").val(updatePOSSurgicalObj.endTime);
    });

    $("#tableOrderPOSSurgical").on("click", ".btnDelete", function (e) {

        e.preventDefault();
        rowPOSSurgicalDataTR = $(this).closest("tr");
        var delId = $(this).get(0).id;
        var delIdA = delId.split("|");
        var delIndex = parseInt(delIdA[1]);
        var delConfirm = confirm('Are you want to delete this Order? ');
        if (delConfirm === true) {
            delete _dataPOSSurgical[delIndex];
            $(this).closest('tr').remove();

        } else {
            return false;
        }

    });

    $("#btnCIS_OE_POSSurgical_UPDATE").click(function (e) {
        e.preventDefault();
        var cat_cd = $("#tCISOESPOCategoryCode").val();
        var cat_name = $("#tCISOESPOCategoryName").val();
        var procedure_cd = $("#tCISOESPOSearchCode").val();
        var procedure = $("#tCISOESPOSearch").val();
        var consultantName = $("#tCISOESPOConsultantName").val();
        var consultant_cd = $("#tCISOESPOConsultantCode").val();
        var otRoom_cd = $("#tCISOESPOOTRoomCode").val();
        var otRoom = $("#tCISOESPOOTRoomName").val();
        var startDate = $("#tCISOESPOStartDate").val();
        var startTime = $("#tCISOESPOStartTime").val();
        var endDate = $("#tCISOESPOENDDate").val();
        var endTime = $("#tCISOESPOEndTime").val();
        var commentArea = $("#tCIS_POSSurgicalCommentArea").val();

        updatePOSSurgicalObj.procedure = procedure;
        updatePOSSurgicalObj.procedureCode = procedure_cd;
        updatePOSSurgicalObj.startDate = startDate;
        updatePOSSurgicalObj.startTime = startTime;
        updatePOSSurgicalObj.endDate = endDate;
        updatePOSSurgicalObj.endTime = endTime;
        updatePOSSurgicalObj.comment = commentArea;
        updatePOSSurgicalObj.cat_Code = cat_cd;
        updatePOSSurgicalObj.cat_name = cat_name;
        updatePOSSurgicalObj.consultantName = consultantName;
        updatePOSSurgicalObj.consultantCode = consultant_cd;
        updatePOSSurgicalObj.otRoom = otRoom;
        updatePOSSurgicalObj.otRoomCode = otRoom_cd;

        updateOrderPOSTableSurgical(updatePOSSurgicalObj, updatePOSSurgicalIndex);
        $("#btnCIS_OE_POSSurgical_UPDATE").hide();
        $("#btnCIS_OE_POSSurgical_CANCEL").hide();
        $("#btnCIS_OE_POSSurgical_ADD").show();
        clearFieldPOSSurgical();

    });

    $("#btnCIS_OE_POSSurgical_SEARCH_ORDER").click(function (e) {
        e.preventDefault();
        var order_id = $("#tCIS_OE_POSSurgical_SEARCH_ORDER_ID").val();
        if (order_id === "") {
            order_id = "-";
        }
        var todayDate = getDate();
        todayDate = todayDate.split(" ");
        todayDate = todayDate[0];
        var type = $("#selectCIS_OE_POSSurgical_SEARCH_TYPE option:selected").val();

        var data = {
            pmiNo: pmiNo,
            todayDate: todayDate,
            type: type,
            orderId: order_id
        };

        $.ajax({
            url: "order/ResultSearchOrderPOSSurgical.jsp",
            timeout: 3000,
            type: "POST",
            data: data,
            success: function (e) {
                $("#divCIS_OE_POSSurgical_OrderSearchResult").html(e);
            }
        });
    });

    $("#divCIS_OE_POSSurgical_OrderSearchResult").on("click", "#tblOPOSSurgical #btnCIS_OE_POSSurgical_SEARCH_ADD", function (e) {
        e.preventDefault();
        var rowOrder = $(this).closest("tr");
        var cat_cd = rowOrder.find("#cat_cd").html();
        var categoryName = rowOrder.find("#categoryName").html();
        var procedure_cd = rowOrder.find("#procedure_cd").html();
        var procedureName = rowOrder.find("#procedureName").html();
        var ot_room_no = rowOrder.find("#ot_room_no").html();
        var ot_roomName = rowOrder.find("#ot_roomName").html();
        var consultant_id = rowOrder.find("#consultant_id").html();
        var consultantName = rowOrder.find("#consultantName").html();

        $("#tCISOESPOSearch").prop("disabled", false);

        searchPOSSurgicalCategory("tCISOESPOCategoryName", "tCISOESPOCategoryNameLoading", categoryName);
        searchDOCTOROnlySurgical("tCISOESPOConsultantName", "tCISOESPOConsultantNameLoading", hfc_cd, consultantName);
        searchOTRoomSurgical("tCISOESPOOTRoomName", "tCISOESPOOTRoomNameLoading", ot_roomName);
        searchPOSSurgicalProcedure("tCISOESPOSearch", "tCISOESPOSearchLoading", procedureName, cat_cd);

        $("#tCISOESPOCategoryCode").val(cat_cd);
        $("#tCISOESPOSearch_Code").val(procedure_cd);
        $("#tCISOESPOConsultantCode").val(consultant_id);
        $("#tCISOESPOOTRoomCode").val(ot_room_no);
        $('#POSSurgical_NEW a[href="#surgicalProcedure1"]').tab('show');

    });

    //clear the order array
    $('#nextBtn').on('click', function () {
        _dataPOSSurgical = [];
        $('#btnCIS_OE_POS_SEARCH_CLEAR').click();

    });

    $('#listQueue').on('click', '#consultBtn', function (e) {
        _dataPOSSurgical = [];
        $('#btnCIS_OE_POS_SEARCH_CLEAR').click();

    });

    //remind user to submit or cancel order before leaving the modal
    $('#CIS040011').on('hidden.bs.modal', function () {

        var gotItem = false;

        for (var i = 0; i < _dataPOSSurgical.length; i++) {
            if (typeof _dataPOSSurgical[i] != 'undefined') {
                gotItem = true;
                break;
            }
        }

        if (gotItem) {
            bootbox.confirm({
                title: "Submit Order?",
                message: "You are closing the order form with unsubmitted order. Do you want to submit the order?",
                buttons: {
                    cancel: {
                        label: '<i class="fa fa-times"></i> Ignore',
                        className: 'btn-danger'
                    },
                    confirm: {
                        label: '<i class="fa fa-check"></i> Submit Order',
                        className: 'btn-success'
                    }
                },
                callback: function (result) {
                    if (result) {
                        $('#btnCIS_OE_POSSurgical_SUBMIT').click();
                    } else {
                        bootbox.alert("<b class='text-danger'>WARNING!</b> <br>You did not submit the order. Do not forget to submit it later.");
                    }
                }
            });
        }

    });

}); // end document ready

function clearFieldPOSSurgical() {
    $("#tCISOESPOSearch").val("");
    $("#tCISOESPOSearch").prop("disabled", true);
    searchPOSSurgicalCategory("tCISOESPOCategoryName", "tCISOESPOCategoryNameLoading", "");
    $("#tCISOESPOSearch").prop("disabled", true);
    $("#tCIS_POSSurgicalCommentArea").val("");
    searchDOCTOROnlySurgical("tCISOESPOConsultantName", "tCISOESPOConsultantNameLoading", hfc_cd, "");
    searchOTRoomSurgical("tCISOESPOOTRoomName", "tCISOESPOOTRoomNameLoading", "");
}


function appendOrderPOSSurgical(obj, index) {
    var _tr = '<tr id="trPOS_row|' + index + '" ><td class="col-md-2">' + obj.cat_name + '</td><td class="col-md-2">' + obj.procedure + '</td><td class="col-md-2">' + obj.otRoom + '</td><td class="col-md-2">' + obj.consultantName + '</td><td class="col-md-2">' + obj.startDate + ' ' + obj.startTime + '</td><td class="col-md-2">' + obj.endDate + ' ' + obj.endTime + '</td><td class="col-md-2">' + obj.comment + '</td><td class="col-md-2"><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
    $("#tableOrderPOSSurgical").append(_tr);
}


function updateOrderPOSTableSurgical(obj, index) {

    var _tr = '<td class="col-md-2">' + obj.cat_name + '</td><td class="col-md-2">' + obj.procedure + '</td><td class="col-md-2">' + obj.otRoom + '</td><td class="col-md-2">' + obj.consultantName + '</td><td class="col-md-2">' + obj.startDate + ' ' + obj.startTime + '</td><td class="col-md-2">' + obj.endDate + ' ' + obj.endTime + '</td><td class="col-md-2">' + obj.comment + '</td><td class="col-md-2"><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
    $("#rowPOSSurgicalDataTR").html(_tr);
}

function checkOrderCode(data, code) {
    var already = false;
    for (var i in data) {
        if (data[i].procedureCode === code) {
            already = true;
        }
    }
    return already;
}


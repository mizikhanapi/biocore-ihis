/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    var _dataPOS = [];
    var indexPOS;
    var updatePOSIndex;
    var updatePOSObj;
    var rowPOSId;
    var rowPOSDataTR;

    $("#CIS040006").on('show.bs.modal', function () {
        searchInitialize("POS", "I");
    });

    $("#update_CIS040006").on('show.bs.modal', function () {
        searchInitialize("POS", "I");
    });
    $("#CIS040006").on('hide.bs.modal', function () {
        searchInitialize("POS", "D");
    });

    $("#update_CIS040006").on('hide.bs.modal', function () {
        searchInitialize("POS", "D");
    })

    $("#divCIS_OE_POS_OrderSearchResult").on("click", "#tblOPOS #btnCIS_OE_POS_SEARCH_ADD", function (e) {
        e.preventDefault();
        var rowOrder = $(this).closest("tr");
        var orderId = rowOrder.find("#orderId").html();
        var procedure_cd = rowOrder.find("#procedure_cd").html();
        var lvlA = procedure_cd.split(".");
        var hfc_to = rowOrder.find("#providerId").html();
        var level = lvlA.length;
        var data = {
            orderId: orderId,
            procedure_cd: procedure_cd,
            hfc_to: hfc_to,
            level: level - 1
        }
        $.ajax({
            timeout: 3000,
            url: "order/RetrieveOrderDetailPOS.jsp",
            type: "POST",
            data: data,
            success: function (e) {

                var posDetail = e.trim();
                posDetail = e.split("|");
                if (level == 3) {
                    $("#tCISOEPOS_2_ID").val(posDetail[6]);
                    $("#tCISOEPOS_1_ID").val(posDetail[4]);
                    $("#tCISOEPOS_0_ID").val(posDetail[2]);
                    searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", posDetail[3], "0");
                    searchPOS1("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", posDetail[5], "1", posDetail[2]);
                    searchPOS2("tCISOEPOS2Search", "tCISOEPOS2SearchLoading", posDetail[7], "2", posDetail[4]);
                    $("#div_CIS_OE_POS_LVL2").show();
                    $("#div_CIS_OE_POS_LVL1").show();
                } else if (level == 2) {

                    $("#tCISOEPOS_1_ID").val(posDetail[4]);
                    $("#tCISOEPOS_0_ID").val(posDetail[2]);
                    searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", posDetail[3], "0");
                    searchPOS1("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", posDetail[5], "1", posDetail[2]);
                    $("#div_CIS_OE_POS_LVL1").show();

                } else if (level == 1) {

                    $("#tCISOEPOS_0_ID").val(posDetail[2]);
                    searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", posDetail[3], "0");

                }

                $('#POS_NEW a[href="#procedureOrder1"]').tab('show');

            }
        })
    })


    $("#btnCIS_OE_POS_SEARCH_ORDER").click(function (e) {
        e.preventDefault();
        var order_id = $("#tCIS_OE_POS_SEARCH_ORDER_ID").val();
        if (order_id === "") {
            order_id = "-";
        }
        var todayDate = getDate();
        todayDate = todayDate.split(" ");
        todayDate = todayDate[0];
        var type = $("#selectCIS_OE_POS_SEARCH_TYPE option:selected").val();

        var data = {
            pmiNo: pmiNo,
            todayDate: todayDate,
            type: type,
            orderId: order_id
        }


        $.ajax({
            url: "order/ResultSearchOrderPOS.jsp",
            timeout: 3000,
            type: "POST",
            data: data,
            success: function (e) {

                $("#divCIS_OE_POS_OrderSearchResult").html(e);
            }
        })

    });

    $("#btnCIS_OE_POS_SUBMIT").click(function (e) {

        e.preventDefault();

        var submitConfirm = confirm('Confirm All Order');
        if (submitConfirm === true) {
            var msg = '';
            var fullmsg;
            var providerDetail = _dataPOS[0].hfcProviderDetail.split("|");
            var msh = getMSH("18", providerDetail[0]);

            var pdi = PDIInfo;
            var orc = convertORC(_dataPOS[0], "02", "18", "T12114");
            for (var i in _dataPOS) {
                msg += convertPOS(_dataPOS[i]);
            }
            fullmsg = msh + pdi + orc + msg;
            var data = {
                msg: fullmsg,
                pmino: pmiNo,
                episodedate: episodeDate,
                status: "1"
            };
            sendOrder(data, "tableOrderPOS");
            _dataPOS = [];
        } else {
            return false;
        }

    });



    $("#btnCIS_OE_POS_ADD").click(function () {

        var pc2 = $("#tCISOEPOS_2_ID").val();
        var pc1 = $("#tCISOEPOS_1_ID").val();
        var pc0 = $("#tCISOEPOS_0_ID").val();

        var procedureCode = pc0;
        var procedure = $("#tCISOEPOSSearch").val() + "[$-$]" + $("#tCISOEPOS1Search").val() + "[$-$]" + $("#tCISOEPOS2Search").val();
        var hfcOrderDetail = $('#hfcOrderDetailPOS').val();
        var hfcProviderDetail = $('#hfcProviderDetailPOS').val();
        var problemCode = $('#problemCodePOS').val();
        var problemName = $("#tCISOEPOSProblemName").val();
        var commentArea = $("#tCIS_POSCommentArea").val();
        var priority = $("#priorityPOScd  option:selected").text();
        var priorityCode = $("#priorityPOScd").val();
        var patientCondition = $("#patientConditionPOScd option:selected").text();
        var patientConditionCd = $("#patientConditionPOScd").val();
        var date = $("#appointmentPOS").val();

        if (pc2 !== "") {
            procedure = $("#tCISOEPOSSearch").val() + "[$-$]" + $("#tCISOEPOS1Search").val() + "[$-$]" + $("#tCISOEPOS2Search").val();
            procedureCode = pc2;
        } else if (pc1 !== "") {
            procedure = $("#tCISOEPOSSearch").val() + "[$-$]" + $("#tCISOEPOS1Search").val();
            procedureCode = pc1;
        } else if (pc0 !== "") {
            procedure = $("#tCISOEPOSSearch").val() + "[$-$]";
            procedureCode = pc0;
        }

        var obj = {
            procedure: procedure,
            procedureCode: procedureCode,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            problemCode: problemCode,
            problemName: problemName,
            priority: priority,
            priorityCode: priorityCode,
            patientCondition: patientCondition,
            patientConditionCode: patientConditionCd,
            date: date,
            comment: commentArea
        }

        if (procedureCode === "" && date === "" && commentArea === "") {
            alert("You not enter the procedure, date and comment");
        } else if (procedureCode === "" && date === "") {
            alert("You not enter the procedure and date");
        } else if (date === "" && commentArea === "") {
            alert("You not enter date and comment area");
        } else if (procedureCode === "" && commentArea === "") {
            alert("You not enter procedure and comment area");
        } else if (procedureCode === "") {
            alert("You not enter the procedure")
        } else if (date === "") {
            alert("You not enter the date")
        } else if (commentArea === "") {
            alert("You not enter the comment");
        } else {
            if (checkOrderCode(_dataPOS, obj.procedureCode)) {
                alert("This order already been added");
            } else {
                _dataPOS.push(obj);
                indexPOS = _dataPOS.lastIndexOf(obj);
                appendOrderPOS(obj, indexPOS);
                clearFieldPOS();
            }

        }



    });

    $("#btnCIS_OE_POS_UPDATE").click(function (e) {

        e.preventDefault();
        var pc2 = $("#tCISOEPOS_2_ID").val();
        var pc1 = $("#tCISOEPOS_1_ID").val();
        var pc0 = $("#tCISOEPOS_0_ID").val();
        var procedureCode = $("#tCISOEPOS_2_ID").val();
        var procedure = $("#tCISOEPOSSearch").val() + "[$-$]" + $("#tCISOEPOS1Search").val() + "[$-$]" + $("#tCISOEPOS2Search").val();
        var hfcOrderDetail = $('#hfcOrderDetailPOS').val();
        var hfcProviderDetail = $('#hfcProviderDetailPOS').val();
        var problemCode = $('#problemCodePOS').val();
        var problemName = $("#tCISOEPOSProblemName").val();
        var commentArea = $("#tCIS_POSCommentArea").val();
        var priority = $("#priorityPOScd  option:selected").text();
        var priorityCode = $("#priorityPOScd").val();
        var patientCondition = $("#patientConditionPOScd option:selected").text();
        var patientConditionCd = $("#patientConditionPOScd").val();
        var date = $("#appointmentPOS").val();

        if (pc2 === "") {
            procedure = $("#tCISOEPOSSearch").val() + "[$-$]" + $("#tCISOEPOS1Search").val()
            procedureCode = pc1;
        } else if (pc1 === "") {
            procedure = $("#tCISOEPOSSearch").val() + "[$-$]";
            procedureCode = pc0;
        }

        updatePOSObj.procedure = procedure;
        updatePOSObj.procedureCode = procedureCode;
        updatePOSObj.hfcOrderDetail = hfcOrderDetail;
        updatePOSObj.hfcProviderDetail = hfcProviderDetail;
        updatePOSObj.problemCode = problemCode;
        updatePOSObj.problemName = problemName;
        updatePOSObj.comment = commentArea;
        updatePOSObj.priority = priority;
        updatePOSObj.priorityCode = priorityCode;
        updatePOSObj.patientCondition = patientCondition;
        updatePOSObj.patientConditionCode = patientConditionCd;
        updatePOSObj.date = date;
        updatePOSObj.comment = commentArea;

        if (procedureCode === "" && date === "" && commentArea === "") {
            alert("You not enter the procedure, date and comment");
        } else if (procedureCode === "" && date === "") {
            alert("You not enter the procedure and date");
        } else if (date === "" && commentArea === "") {
            alert("You not enter date and comment area");
        } else if (procedureCode === "" && commentArea === "") {
            alert("You not enter procedure and comment area");
        } else if (procedureCode === "") {
            alert("You not enter the procedure")
        } else if (date === "") {
            alert("You not enter the date")
        } else if (commentArea === "") {
            alert("You not enter the comment");
        } else {
            updateOrderPOSTable(updatePOSObj, updatePOSIndex);
            $("#btnCIS_OE_POS_UPDATE").hide();
            $("#btnCIS_OE_POS_CANCEL").hide();
            $("#btnCIS_OE_POS_ADD").show();
            clearFieldPOS();
        }

    });

    $("#btnCIS_OE_POS_CANCEL").click(function (e) {

        e.preventDefault();
        $("#btnCIS_OE_POS_UPDATE").hide();
        $("#btnCIS_OE_POS_CANCEL").hide();
        $("#btnCIS_OE_POS_ADD").show();
        clearFieldPOS();

    });


    $("#tableOrderPOS").on("click", ".btnUpdate", function () {

        $("#btnCIS_OE_POS_UPDATE").show();
        $("#btnCIS_OE_POS_CANCEL").show();
        $("#btnCIS_OE_POS_ADD").hide();

        rowPOSDataTR = $(this).closest("tr");
        rowPOSId = $(this).get(0).id;
        var index = rowPOSId.split("|");
        index = parseInt(index[1]);
        updatePOSIndex = indexPOS;
        updatePOSObj = _dataPOS[index];

        var levelProcedureCode = updatePOSObj.procedure.split("[$-$]");
        if (levelProcedureCode.length === 3) {

            $("#div_CIS_OE_POS_LVL1").show();
            $("#div_CIS_OE_POS_LVL2").show();

            var level = levelProcedureCode[0];
            var level1 = levelProcedureCode[1];
            var level2 = levelProcedureCode[2];
            getProcedurePOS(level2, "2");
            getProcedurePOS(level1, "1");
            getProcedurePOS(level, "0");

        } else if (levelProcedureCode.length === 2) {

            $("#div_CIS_OE_POS_LVL1").show();
            var level = levelProcedureCode[0];
            var level1 = levelProcedureCode[1];

            getProcedurePOS(level1, "1");
            getProcedurePOS(level, "0");

        } else {

            var level = levelProcedureCode[0];
            getProcedurePOS(level, "0");
        }

        searchingRetrieve("tCISOEPOSProblemName", "tCISOEPOSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodePOS", "search/ResultCCNSearchCode.jsp", updatePOSObj.problemName);

        $("#problemCodePOS").val(updatePOSObj.problemCode);
        $("#tCIS_POSCommentArea").val(updatePOSObj.comment);
        $("#priorityPOScd").val(updatePOSObj.priorityCode);
        $("#patientConditionPOScd").val(updatePOSObj.patientConditionCode);
        $("#appointmentPOS").val(updatePOSObj.date);


    });

    $("#tableOrderPOS").on("click", ".btnDelete", function (e) {

        e.preventDefault();
        rowPOSDataTR = $(this).closest("tr");
        var delId = $(this).get(0).id;
        var delIdA = delId.split("|");
        var delIndex = parseInt(delIdA[1]);
        var delConfirm = confirm('Are you want to delete this Order? ');
        if (delConfirm === true) {
            delete _dataPOS[delIndex];
            $(this).closest('tr').remove();

        } else {
            return false;
        }

    });

    function getProcedurePOS(procedureName, level) {
        $.ajax({
            url: "search/ResultPOSSearchCode.jsp",
            type: "POST",
            timeout: 3000,
            data: {
                keyword: procedureName,
                level: level
            },
            success: function (response) {

                if (level === "2") {

                    searchPOS("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", procedureName, "2", $("#tCISOEPOS_1_ID").val());
                    $("#tCISOEPOS_2_ID").val(response.trim());


                } else if (level === "1") {

                    searchPOS("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", procedureName, "1", $("#tCISOEPOS_0_ID").val());
                    $("#tCISOEPOS_1_ID").val(response.trim());


                } else {

                    searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", procedureName, "0", "");
                    $("#tCISOEPOS_0_ID").val(response.trim());

                }
            }

        });
    }

    $(function () {
        $('#appointmentPOS').datepicker({dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true});
    });

    function clearFieldPOS() {

        $("#tCISOEPOS_2_ID").val('');
        $("#tCISOEPOS_1_ID").val('');
        $("#tCISOEPOS_0_ID").val('');
        $("#tCIS_POSCommentArea").val('');
        $("#patientConditionPOScd").val('PC01');
        $("#priorityPOScd").val('P01');

        searchingRetrieve("tCISOEPOSProblemName", "tCISOEPOSProblemNameLoading", "search/ResultCCNSearch.jsp", "problemCodePOS", "search/ResultCCNSearchCode.jsp", "");

        searchPOS("tCISOEPOSSearch", "tCISOEPOSSearchLoading", "", "0", "");
        searchPOS("tCISOEPOS1Search", "tCISOEPOS1SearchLoading", "", "1", "");
        searchPOS("tCISOEPOS2Search", "tCISOEPOSS2earchLoading", "", "2", "");

        $("#btnCIS_OE_POS_UPDATE").hide();
        $("#btnCIS_OE_POS_CANCEL").hide();

        $("#div_CIS_OE_POS_LVL1").hide();
        $("#div_CIS_OE_POS_LVL2").hide();

    }

    function appendOrderPOS(obj, index) {

        var displayProcedure = getProcedureDisplay(obj.procedure);
        var _tr = '<tr id="trPOS_row|' + index + '" ><td>' + obj.problemName + '</td><td>' + displayProcedure + '</td><td>' + obj.comment + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td></tr>';
        $("#tableOrderPOS").append(_tr);

    }
    function updateOrderPOSTable(obj, index) {
        var displayProcedure = getProcedureDisplay(obj.procedure);
        var _tr = '<td>' + obj.problemName + '</td><td>' + displayProcedure + '</td><td>' + obj.comment + '</td><td><a id="row|' + index + '" data-toggle="tooltip" data-placement="top" title="Update Order" class="btnUpdate" style="cursor: pointer" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>&nbsp;<a id="delRow|' + index + '" data-toggle="tooltip" data-placement="top" title="Delete Order" class="btnDelete" style="cursor: pointer" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>';
        $(rowPOSDataTR).html(_tr);
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


    //clear _dataLIO
    $('#nextBtn').on('click', function () {
        _dataPOS = [];
        $('#btnCIS_OE_POS_SEARCH_CLEAR').click();

    });

    $('#listQueue').on('click', '#consultBtn', function (e) {
        _dataPOS = [];
        $('#btnCIS_OE_POS_SEARCH_CLEAR').click();

    });

    //remind user to submit or cancel order before leaving the modal
    $('#CIS040006').on('hidden.bs.modal', function () {
        var gotItem = false;

        for (var i = 0; i < _dataPOS.length; i++) {
            if (typeof _dataPOS[i] != 'undefined') {
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
                        $('#btnCIS_OE_POS_SUBMIT').click();
                    } else {
                        bootbox.alert("<b class='text-danger'>WARNING!</b> <br>You did not submit the order. Do not forget to submit it later.");
                    }
                }
            });
        }

    });


});
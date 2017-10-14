/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//
//$('#billDetailOrderDetailContent').off('click', '#billDetailOrderListTable #generateBillDetailSingleRecordBtn').on('click', '#billDetailOrderListTable #generateBillDetailSingleRecordBtn', function (e) {
//
//    e.preventDefault();
//
//    var row = $(this).closest("tr");
//    var rowData = row.find("#dataBillDetailOrderListhidden").val();
//    var arrayData = rowData.split("|");
//
//    var orderNo = arrayData[7];
//    var pmiNo = arrayData[0];
//
//    var data = {
//        orderNo: orderNo,
//        pmiNo: pmiNo
//    };
//
//    console.log(data);
//
//    $.ajax({
//        url: "generateBillDetail.jsp",
//        type: "post",
//        data: data,
//        timeout: 10000,
//        success: function (data) {
//
//            $('#billDetailOrderDetailContent').html(data);
//
//        },
//        error: function (err) {
//        }
//    });
//
//
//});
//
//
//
//
//


//
//// Archive Order Function Start
//$('#generateBill').off('click', '#viewBillGenereteBillMasterButtonRightDiv #btnViewBillGenereteBillMasterGenerateSelected').on('click', '#viewBillGenereteBillMasterButtonRightDiv #btnViewBillGenereteBillMasterGenerateSelected', function (e) {
//    e.preventDefault();
//
//
//    var longString = "";
//
//    var table = $("#tableViewBill tbody");
//
//    var billChecked, episodeDate, orderNo, pmiNo;
//
//    var generateBillOrderList = [];
//    var pmiNoCheck = [];
//
//    table.find('tr').each(function (i) {
//
//        var $tds = $(this).find('td');
//
//        // Get The Data
//
//        billChecked = $(this).find("#generateBillChecked").is(':checked');
//        episodeDate = $tds.eq(1).text();
//        orderNo = $tds.eq(2).text();
//        pmiNo = $tds.eq(3).text();
//
//
//        if (billChecked === true) {
//
//            pmiNoCheck.push(pmiNo);
//
//            generateBillOrderList.push(episodeDate + "^" + orderNo + "^" + pmiNo);
//            longString = generateBillOrderList.join("|");
//
//        }
//
//
//    });
//
//    console.log(pmiNoCheck);
//
//
//    var booleanPmiNo = true;
//
//    var billPmiNoCheck = "";
//
//    for (var i = 0; i < pmiNoCheck.length; i++) {
//
//
//        if (i > 0) {
//
//            if (billPmiNoCheck !== pmiNoCheck[i]) {
//                booleanPmiNo = false;
//            } else if (billPmiNoCheck === pmiNoCheck[i]) {
//
//            }
//
//        } else if (i === 0) {
//
//            billPmiNoCheck = pmiNoCheck[i];
//
//        }
//
//    }
//    
//    
//
//    if (booleanPmiNo === false) {
//        alert("Please Choose The Same Patient To Generate Bill");
//    } else {
//        alert("Ok");
//    }
//
//
////    if (longString === "") {
////        bootbox.alert("Please Select At Least A Record To Generate The Billing Details !");
////    } else {
//
////        bootbox.confirm({
////            message: "Are you sure that you want to generate bill for the selected record ?",
////            title: "Archive Order ?",
////            buttons: {
////                confirm: {
////                    label: 'Yes',
////                    className: 'btn-success'
////                },
////                cancel: {
////                    label: 'No',
////                    className: 'btn-danger'
////                }
////            },
////            callback: function (result) {
////
////                if (result === true) {
////
////                    var data = {
////                        longString: longString
////                    };
////
////                    console.log(data);
////
////                    $.ajax({
////                        url: "generateBillDetailGroup.jsp",
////                        type: "post",
////                        data: data,
////                        timeout: 10000,
////                        success: function (data) {
////                            $('#generateBill').html(data);
////                        },
////                        error: function (err) {
////                            console.log("Error Ajax");
////                        }
////                    });
////
////
////                } else {
////                    console.log("Process Is Canceled");
////                }
////
////            }
////        });
//
//
////    }
//
//});
//// Archive Order Function End
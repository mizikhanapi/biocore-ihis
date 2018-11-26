<%-- 
    Document   : risManageOrderListDetails
    Created on : Feb 15, 2017, 1:13:37 PM
    Author     : Shammugam
--%>

<%@page import="POS_helper.OrderMaster"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdis = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String hfcori = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disori = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdisori = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String locationcode = hfc + "|" + dis + "|" + subdis;
    String user = session.getAttribute("USER_ID").toString();
%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn conn = new Conn();
    String orderNo = request.getParameter("orderNo");

//                                                   0                                              1                                   2                        3                  4               5        6              7               8             9            10
    String orderList = "select date_format(d.`startDateTime`, '%d/%m/%Y %H:%i'), date_format(d.`endDateTime`, '%d/%m/%Y %H:%i'), pro.procedure_cd, pro.`procedure_longName`, d.ot_room_no, rm.room_name, u.`USER_ID`, u.`USER_NAME`, d.order_status, d.comments, d.order_no "
            + "FROM opt_order_detail d "
            + "left join opt_room rm on rm.hfc_cd ='" + hfc_cd + "' and rm.room_no=d.ot_room_no "
            + "left join opt_procedure pro on pro.hfc_cd='" + hfc_cd + "' and pro.category_cd=d.category_cd and pro.procedure_cd = d.procedure_cd "
            + "left join adm_users u on u.`USER_ID` = d.consultant_id "
            + "where d.order_status in ('0', '1', '2', '3') AND d.order_no = '" + orderNo + "' "
            + "order by d.`startDateTime`, d.`endDateTime`;";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="risManageOrderDetailsListTable">
    <thead>
    <th style="display: none">Hidden</th>    
    <th>Start</th>
    <th>End</th>
    <th>Procedure</th>
    <th>OT-Room</th>
    <th>Consultant</th>
    <th>Comment</th>
    <th>Status</th>
    <th>Actions</th>

</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {
            String status = dataOrderList.get(i).get(8);
            String performDisabled = "";
            String prepareDisabled = "";
            String cancelDisabled = "";
            if (status.equalsIgnoreCase("0")) {
                status = "New";
                prepareDisabled = "disabled";
            } else if (status.equalsIgnoreCase("1")) {
                status = "In progress. Please write the report to complete this order.";
                performDisabled = "disabled";
                cancelDisabled = "disabled";
            } else if (status.equalsIgnoreCase("2")) {
                status = "Completed";
                performDisabled = "disabled";
                prepareDisabled = "disabled";
                cancelDisabled = "disabled";

            } else if (status.equalsIgnoreCase("3")) {
                status = "Result Rejected. Please redo.";
                // prepareDisabled = "disabled";
            }

//            String test = String.join("|", dataOrderList.get(i));
//            out.print(dataOrderList.get(i).toString());
//            out.print(test);

    %>
    <tr class="clickable_tr">

        <td style="display: none"><%= String.join("|", dataOrderList.get(i))%></td> <!-- hidden -->
        <td><%= dataOrderList.get(i).get(0)%></td> <!-- start -->
        <td><%= dataOrderList.get(i).get(1)%></td> <!-- End -->
        <td>(<%= dataOrderList.get(i).get(2)%>) <%= dataOrderList.get(i).get(3)%></td> <!-- Procedure -->
        <td>(<%= dataOrderList.get(i).get(4)%>) <%= dataOrderList.get(i).get(5)%></td> <!-- OT-Room -->
        <td>(<%= dataOrderList.get(i).get(6)%>) <%= dataOrderList.get(i).get(7)%></td><!-- Consultant -->
        <td><%= dataOrderList.get(i).get(9)%></td> <!-- comment -->
        <td><%= status%></td> <!-- status -->
        <td>
            <button id="MOD_btnPrepareItem" class="btn btn-default btn-danger" data-toggle="modal"   data-target="#POSorderNewStockOrder"><i class="fa fa-user-md fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i>&nbsp;&nbsp;&nbsp;Prepare Item</button>
            <button id="MOD_btnPerform" class="btn btn-default"  ><i class="fa fa-user-md fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i>&nbsp;&nbsp;&nbsp;Perform Procedure</button><!-- perform -->
            <button id="MOD_btnReport" class="btn btn-default" <%out.print(prepareDisabled);%> ><i class="fa fa-file-text fa-lg" aria-hidden="true" style="display: inline-block;color: #00dd1c;" ></i>&nbsp;&nbsp;&nbsp;Write Report</button><!-- report -->
            <button id ="MOD_btnDelete" class="btn btn-default" <%out.print(cancelDisabled);%>><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i>&nbsp;&nbsp;&nbsp;Cancel Order</button>        
        </td><!-- perform -->

    </tr>


    <%  }
    %>

</tbody>
</table>

<script>
    $('#risManageOrderDetailsListTable').DataTable({
        "paging": false,
        "searching": false,
        // "scrollX": true,
        "info": false,
        "language": {
            "emptyTable": "No Request Available To Display"
        }
    });

</script>
<script>


    $('#risManageOrderDetailsListTable').on('click', '#MOD_btnPrepareItem', function () {

        $('#orderNewStockOrderModalTitle').text("Add New Item");
        $('#orderNewStockOrderSearchItemInput').prop('disabled', false);
        $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="orderNewStockOrderItemAddNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Add Items</button>');
        $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').html('<button type="button" id="orderNewStockOrderItemReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>');

        $('#orderNewStockOrderModalFrom')[0].reset();

    });

    $(function () {

        $("#orderNewStockOrderSearchItemInput").on('keyup', function () { // everytime keyup event
            var itemType = $('#orderNewStockOrderItemType').val();
            var input = $(this).val(); // We take the input value
            var dataCS;


            dataCS = "nope";


            if (input.length >= 1) { // Minimum characters = 2 (you can change)

                $('#orderNewStockOrderSearchItemInputDisplayResult').html('<img src="libraries/LoaderIcon.gif"/>');

                var dataFields = {'input': input, 'itemtype': itemType, 'dataCS': dataCS}; // We pass input argument in Ajax

                console.log(dataFields);

                $.ajax({
                    type: "POST",
                    url: "../GNL/StockOrder/controllerProcess/orderStockSearchItem.jsp", // call the jsp file ajax/auto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success

                        $('#orderNewStockOrderSearchItemInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>

                        $('#orderNewStockOrderSearchItemInputDisplayResult li').on('click', function () { // When click on an element in the list

                            $('#orderNewStockOrderSearchItemInput').val($(this).text()); // Update the field with the new element
                            $('#orderNewStockOrderSearchItemInputDisplayResult').text(''); // Clear the <div id="match"></div>


                        });

                    },
                    error: function () { // if error

                        $('#orderNewStockOrderSearchItemInputDisplayResult').text('No Record Found !');

                    }
                });

            } else {

                $('#orderNewStockOrderSearchItemInputDisplayResult').text('Search For More Than One Characters !!'); // If less than 2 characters, clear the <div id="match"></div>

            }
        });
    });
    //JS Search in Add Item End


    //JS Get Add Item Start
    $('#orderNewStockOrderSearchItemInputDisplayResult').on('click', function () {

        $('<div class="loading">Loading</div>').appendTo('body');

        var id = $('#orderNewStockOrderSearchItemInput').val();

        var arrayData = $('#orderNewStockOrderSearchItemInput').val().split("|");
        var itemType = $('#orderNewStockOrderItemType').val();
        id = arrayData[0];
        var dataCS;


        dataCS = "nope";

        var data = {
            id: id, itemType: itemType, 'dataCS': dataCS
        };


        $.ajax({
            type: 'post',
            url: '../GNL/StockOrder/controllerProcess/orderStockSearchItemResult.jsp',
            data: data,
            success: function (reply_data) {
                console.log(reply_data);
                var array_data = String(reply_data.trim()).split("|");

                var itemCode = array_data[0];
                var itemCate = array_data[1];
                var itemName = array_data[2];
                var itemPrice = array_data[3];
                var itemStock = array_data[4];
                var hfc = array_data[5];
                var dis = array_data[6];
                var orderhfc = "<%=hfcori%>";
                var orderdis = "<%=disori%>";
                var temtype = array_data[7];


                $('#orderNewStockOrderItemDisplayItemCode').val(itemCode);
                $('#orderNewStockOrderItemDisplayItemName').val(itemName);
                $('#orderNewStockOrderItemDisplayItemStockQuantity').val(itemStock);
                $('#orderNewStockOrderItemDisplayItemPrice').val(itemPrice);

                $('#disciplineStock').val(dis);
                $('#subdisciplineStock').val(dis);
                $('#disciplineStockOrdering').val(orderdis);
                $('#subdisciplineStockOrdering').val("<%=subdisori%>");
                $('#stockitemtype').val(temtype);

                $('#orderNewStockOrderSearchItemInput').val('');

                $('.loading').hide();

            }
        });
    });

    $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').off('click', '#orderNewStockOrderItemReset').on('click', '#orderNewStockOrderItemReset', function (e) {
        $('#orderNewStockOrderModalFrom')[0].reset();
        $('#orderNewStockOrderSearchItemInputDisplayResult').html('');
    });

    // Add Item Function Start
    $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').off('click', '#orderNewStockOrderItemAddNewItemBtn').on('click', '#orderNewStockOrderItemAddNewItemBtn', function () {


        var table = $("#tablepositemprepare tbody");

        var arrayItemCode = [];
        var stockOrderListorder = [];
        var releaseOrderList = [];

        // Calculating Data For Overall Dispense
        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');
            var itemCode = $tds.eq(0).text();
            arrayItemCode.push(itemCode);

        });

        var itemCode = $('#orderNewStockOrderItemDisplayItemCode').val();
        var itemName = $('#orderNewStockOrderItemDisplayItemName').val();
        var itemPrice = $('#orderNewStockOrderItemDisplayItemPrice').val();
        var itemQuantity = $('#orderNewStockOrderItemInputQuantity').val();
        var itemComment = "-";
        var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();
        var disrec = $('#disciplineStock').val();
        var subdusrec = $('#subdisciplineStock').val();
        var disorder = $('#disciplineStockOrdering').val();
        var subdisorder = $('#subdisciplineStockOrdering').val();
        var temtype = $('#stockitemtype').val();



        if (itemCode === "" || itemCode === null) {

            bootbox.alert("Please Search An Item To Continue !!!");

        } else if (itemQuantity === "" || itemQuantity === null) {

            bootbox.alert("Please Insert Order Quantity !!!");

        } else if (parseInt(itemQuantity) > parseInt(itemStock)) {

            bootbox.alert("Please Insert Order Quantity Less Than Stock Quantity That Is Available !!!");

        } else {


            datatableTableDestroy();

            var arrayItemCodeCheck = arrayItemCode.indexOf(itemCode);


            if (arrayItemCodeCheck === -1) {

                var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);



                // datatableTable();

                $('#orderNewStockOrder').modal('hide');

                var customer_id = "<%=user%>";
                var order_no = $("#risOrderNo").val();
                var txt_date = $("#risOrderDate").val();

                var dt = new Date(txt_date);
                var newdt = dt.getDate() + "/" + dt.getMonth() + "/" + dt.getFullYear() + " " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();

                var item_amt = newTotal;
                var quantity = itemQuantity;
                var typebutton = "release";
                var stringMaster = customer_id + "|" + order_no + "|" + newdt + "|" + item_amt + "|" + quantity;
                var stringDetail = "";
                var grandTotalpriceorder = 0;
                var grandTotalqtyorder = 0, stringDetailorder;



                var updateQtyStock = parseInt(itemStock) - parseInt(itemQuantity);
                var status = "4";
                var location = "<%=hfcori%>";
                releaseOrderList.push(itemCode + "^" + itemName + "^" + updateQtyStock + "^" + itemQuantity + "^" + itemQuantity + "^" + itemQuantity + "^"
                        + item_amt + "^" + itemQuantity + "^" + itemComment + "^" + status + "^" + itemQuantity + "^" + temtype + "^" + location + "^" + customer_id + "^" + disorder + "^" + subdisorder);
                stringDetail = releaseOrderList.join("|");

                var data = {
                    stringMaster: stringMaster,
                    stringDetail: stringDetail,
                    button: typebutton
                };

                var product = parseFloat(newTotal);


                stockOrderListorder.push(itemCode + "^" + itemName + "^" + itemPrice + "^" + product + "^" + quantity + "^" + itemComment + "^" + disrec + "^" + subdusrec + "^" + disorder + "^" + subdisorder + "^" + temtype);
                stringDetailorder = stockOrderListorder.join("|");
                grandTotalpriceorder += parseFloat(product);
                grandTotalqtyorder += parseFloat(quantity);

                var dataorder = {
                    order_no: order_no,
                    total_amt: grandTotalpriceorder,
                    quantity: grandTotalqtyorder,
                    stringDetail: stringDetailorder
                };
                $.ajax({
                    url: "../GNL/StockOrder/controllerProcess/orderStockOverall.jsp",
                    type: "post",
                    data: dataorder,
                    timeout: 3000,
                    success: function (returnMessage) {

                        //$('.loading').hide();
                        //console.log(dataorder);
                        //console.log(returnMessage);

                        if (returnMessage.trim() === 'Success') {
                            console.log(data);
                            $.ajax({
                                url: "../SMS/controllerProcessDistributeStockOrder/distrubuteStockOrderReleaseItems.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {
                                    console.log(datas);
                                    //$('#myLoadingModal').modal('hide');

                                    if (datas.trim() === "Success") {

                                       var dataOrder = {
                                            orderNo: order_no
                                        };
                                        $.ajax({
                                            url: "../POM/procedure_controller/procedure_select.jsp",
                                            type: "post",
                                            data: dataOrder,
                                            success: function (databack) {
                                                datatableTableDestroy();
                                                $('#tablepositemprepare tbody').empty();
                                                if (databack.trim() !== "NO") {

                                                    $('#tablepositemprepare').append(databack.trim());
                                                    bootbox.alert({
                                                        message: "Item is Added Successful",
                                                        title: "Process Result",
                                                        backdrop: true
                                                    });
                                                    datatableTableCreate();
                                                }else{
                                                    bootbox.alert({
                                                        message: "Item is Added Successful",
                                                        title: "Process Result",
                                                        backdrop: true
                                                    });
                                                    datatableTableCreate();
                                                }
                                                $('#POSorderNewStockOrder').modal('hide');
                                                arrayItemCode.length = 0;
                                                stockOrderListorder.length = 0;
                                                releaseOrderList.length = 0;
                                            }
                                        });
                                    } else if (datas.trim() === "Failed") {

                                        bootbox.alert("Item failed to add!");

                                    }
                                    //resetPage();

                                },
                                error: function (err) {
                                    alert("Error! Deletion Ajax failed!!");
                                }
                            });
                        } else if (returnMessage.trim() === 'Failed') {
                            bootbox.alert("Item failed to add!");
                        }
                    }
                });


            } else {

                bootbox.alert("Item Code Duplicated!! Please Choose Different Code!!");

                datatableTableCreate();

            }

        }
    });

//-------------------------------------------------------------------------------  Update And Delete Part Start  --------------------------------------------------------------------------------//



    // global variable declaration
    var row;

    // Fetch Data For Update And Delete Function Start
    $('#posItemPreparation').off('click', '#tablepositemprepare #addNewStockOrderDetailsUpdateDeleteBtn').on('click', '#tablepositemprepare #addNewStockOrderDetailsUpdateDeleteBtn', function (e) {

        row = $(this).closest("tr");

        $('#POSorderNewStockOrder').modal('show');

        $('#orderNewStockOrderModalTitle').text("Update Or Delete Item");
        $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="orderNewStockOrderItemUpdateNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Update</button>');
        $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').html('<button type="submit" id="orderNewStockOrderItemDeleteNewItemBtn" class="btn btn-danger btn-block btn-lg" role="button">Delete</button>');

        $('#orderNewStockOrderSearchItemInput').prop('disabled', true);

        var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);
        var orivaluqty = parseInt(row.find('td').eq(4).text());
        var changedqty = parseInt(itemQuantity) - orivaluqty;

        var itemCode = row.find('td').eq(0).text();
        var itemName = row.find('td').eq(1).text();
        var itemPrice = row.find('td').eq(2).text();
        var itemStock = row.find('td').eq(3).text();
        var itemQuantity = row.find('td').eq(4).text();
        //var itemComment = row.find('td').eq(6).text();

        var disrec = $('#disciplineStockA').val();
        var subdusrec = $('#subdisciplineStockA').val();
        var disorder = $('#disciplineStockOrderingA').val();
        var subdisorder = $('#subdisciplineStockOrderingA').val();
        var temtype = row.find('td').eq(5).find('#stockitemtypeA').val();

        $('#orderNewStockOrderItemDisplayItemCode').val(itemCode);
        $('#orderNewStockOrderItemDisplayItemName').val(itemName);
        $('#orderNewStockOrderItemDisplayItemPrice').val(itemPrice);
        $('#orderNewStockOrderItemDisplayItemStockQuantity').val(itemStock);
        $('#orderNewStockOrderItemInputQuantity').val(itemQuantity);
        //$('#orderNewStockOrderItemInputComment').val(itemComment);

        $('#disciplineStock').val(disrec);
        $('#subdisciplineStock').val(subdusrec);
        $('#disciplineStockOrdering').val(disorder);
        $('#subdisciplineStockOrdering').val(subdisorder);
        $('#stockitemtype').val(temtype);



    });
    // Fetch Data For Update And Delete Function End


    // Delivery Update Function Start
    $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').off('click', '#orderNewStockOrderItemUpdateNewItemBtn').on('click', '#orderNewStockOrderItemUpdateNewItemBtn', function (e) {

        datatableTableDestroy();

        var itemCode = $('#orderNewStockOrderItemDisplayItemCode').val();
        var itemName = $('#orderNewStockOrderItemDisplayItemName').val();
        var itemPrice = $('#orderNewStockOrderItemDisplayItemPrice').val();
        var itemQuantity = $('#orderNewStockOrderItemInputQuantity').val();
        //var itemComment = $('#orderNewStockOrderItemInputComment').val();
        var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();
        var order_no = $("#risOrderNo").val();
        var disrec = $('#disciplineStock').val();
        var subdusrec = $('#subdisciplineStock').val();
        var disorder = $('#disciplineStockOrdering').val();
        var subdisorder = $('#subdisciplineStockOrdering').val();
        var temtype = $('#stockitemtype').val();

        var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);
        var orivaluqty = parseInt(row.find('td').eq(4).text());
        var changedqty = parseInt(itemQuantity) - orivaluqty;
//        row.find('td').eq(0).text(itemCode);
//        row.find('td').eq(1).text(itemName);
//        row.find('td').eq(2).text(itemPrice);
//        row.find('td').eq(3).text(itemStock);
//        row.find('td').eq(4).text(itemQuantity);
//        row.find('td').eq(5).text(newTotal);
//        //row.find('td').eq(6).text(itemComment);
//        row.find('#disciplineStockA').val(disrec);
//        row.find('#subdisciplineStockA').val(subdusrec);
//        row.find('#disciplineStockOrderingA').val(disorder);
//        row.find('#subdisciplineStockOrderingA').val(subdisorder);
//        row.find('#stockitemtypeA').val(temtype);

        $('#POSorderNewStockOrder').modal('hide');

        //datatableTableCreate();
        var dataOrder = {
            orderNo: order_no
        };
        var datasupdate = {orderno: order_no,
            changeqty: changedqty,
            amount: newTotal,
            totalqty: itemQuantity,
            itemcode: itemCode,
            itemtype: temtype
        };
        console.log(datasupdate);
        $.ajax({
            type: "post",
            url: "../POM/procedure_controller/item_update.jsp",
            data: datasupdate,
            success: function (databack) {
                console.log(databack);
                if (databack.trim() === "OK") {
                    $.ajax({
                        url: "../POM/procedure_controller/procedure_select.jsp",
                        type: "post",
                        data: dataOrder,
                        success: function (databack) {
                            datatableTableDestroy();
                            $('#tablepositemprepare tbody').empty();
                            if (databack.trim() !== "NO") {

                                $('#tablepositemprepare').append(databack.trim());
                                bootbox.alert({
                                    message: "Item is Updated Successfully",
                                    title: "Process Result",
                                    backdrop: true
                                });
                                datatableTableCreate();
                            }else{
                                bootbox.alert({
                                    message: "Item is Updated Successfully",
                                    title: "Process Result",
                                    backdrop: true
                                });
                                datatableTableCreate();
                            }
                            $('#POSorderNewStockOrder').modal('hide');
                        }
                    });
                    
                } else {
                    bootbox.alert({
                        message: "Item is Fail to update",
                        title: "Process Result",
                        backdrop: true
                    });
                }
            }
        });

    });
    // Delivery Update Function End        

    // Delete Order Data 
    $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').off('click', '#orderNewStockOrderItemDeleteNewItemBtn').on('click', '#orderNewStockOrderItemDeleteNewItemBtn', function (e) {

        var itemCode = $('#orderNewStockOrderItemDisplayItemCode').val();
        var itemName = $('#orderNewStockOrderItemDisplayItemName').val();
        var itemPrice = $('#orderNewStockOrderItemDisplayItemPrice').val();
        var itemQuantity = $('#orderNewStockOrderItemInputQuantity').val();
        //var itemComment = $('#orderNewStockOrderItemInputComment').val();
        var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();
        var order_no = $("#risOrderNo").val();
        var disrec = $('#disciplineStock').val();
        var subdusrec = $('#subdisciplineStock').val();
        var disorder = $('#disciplineStockOrdering').val();
        var subdisorder = $('#subdisciplineStockOrdering').val();
        var temtype = $('#stockitemtype').val();

        var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);
        var orivaluqty = parseInt(row.find('td').eq(4).text());
        var changedqty = parseInt(itemQuantity) - orivaluqty;

        var datasdelete = {orderno: order_no,
            changeqty: changedqty,
            amount: newTotal,
            totalqty: itemQuantity,
            itemcode: itemCode,
            itemtype: temtype
        };

        var dataOrder = {
            orderNo: order_no
        };

        console.log(datasdelete);

        $('#updateStockOrder').modal('hide');

        bootbox.confirm({
            message: "Are you sure want to delete this item ?",
            title: "Delete Item?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result === true) {

                    $.ajax({
                        url: "../POM/procedure_controller/item_delete.jsp",
                        type: "post",
                        data: datasdelete,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {
                            console.log(datas);
                            if (datas.trim() === 'OK') {

                                $.ajax({
                                    url: "../POM/procedure_controller/procedure_select.jsp",
                                    type: "post",
                                    data: dataOrder,
                                    success: function (databack) {
                                        datatableTableDestroy();
                                        $('#tablepositemprepare tbody').empty();
                                        if (databack.trim() !== "NO") {

                                            $('#tablepositemprepare').append(databack.trim());
                                            bootbox.alert({
                                                message: "Item is Deleted Successfully",
                                                title: "Process Result",
                                                backdrop: true
                                            });
                                            datatableTableCreate();

                                        }else{
                                            bootbox.alert({
                                                message: "Item is Deleted Successfully",
                                                title: "Process Result",
                                                backdrop: true
                                            });
                                            datatableTableCreate();
                                        }
                                        $('#POSorderNewStockOrder').modal('hide');
                                    }
                                });

                            } else {

                                bootbox.alert({
                                    message: "Item Delete Failed",
                                    title: "Process Result",
                                    backdrop: true
                                });


                            }

                        },
                        error: function (err) {
                            alert("Error! Deletion Ajax failed!!");
                        }

                    });



                } else {
                    console.log("Process Is Canceled");
                }

            }
        });

    });
    // Delete Order Data End

    function datatableTableDestroy() {

        $("#tablepositemprepare").DataTable().destroy();
    }

    function datatableTableCreate() {

        $('#tablepositemprepare').DataTable({
            "paging": true,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Data Available To Display"
            }
        });

    }
</script>


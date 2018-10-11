<%-- 
    Document   : contentStockAdjustment
    Created on : Oct 11, 2018, 1:25:09 PM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%
    Config.getFile_url(session);
    Config.getBase_url(request);
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdis = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String role = session.getAttribute("ROLE_CODE").toString();

    ArrayList<ArrayList<String>> dataDiscipline, datareason;
    String selectdiscipline = "SELECT discipline_cd,discipline_name from adm_discipline where discipline_hfc_cd = '" + hfc + "'";
    String wherecond = "and discipline_cd = '" + dis + "'";
    String fullsql = "";
    if (role.equalsIgnoreCase("001") && dis.equalsIgnoreCase("CS")) {
        fullsql = selectdiscipline;
        dataDiscipline = conn.getData(fullsql);
    } else {
        fullsql = selectdiscipline + " " + wherecond;
        dataDiscipline = conn.getData(fullsql);
    }

    String selectReason = "SELECT detail_reference_code,description from adm_lookup_detail where master_reference_code = '0129' and hfc_cd = '" + hfc + "'";
    datareason = conn.getData(selectReason);
    //out.print(fullsql);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid">
    <!-- main -->		

    <div class="row">
        <div class="col-md-12">
            <form class="form-horizontal" id="addStockOrderForm" autocomplete="off">

                <br>

                <div class="row">
                    <div class="col-md-12">
                        <h4>Order Details</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Store</label>
                            <div class="col-md-6">
                                <select id="selectStore" class="form-control input-md">
                                    <%
                                        if (dataDiscipline.size() > 0) {
                                            for (int i = 0; i < dataDiscipline.size(); i++) {
                                                out.print("<option value='" + dataDiscipline.get(i).get(0) + "'>" + dataDiscipline.get(i).get(1) + "</option>");
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                        </div> 

                    </div>
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Item Type</label>
                            <div class="col-md-4">
                                <select id="selectItemType" class="form-control input-md">
                                    <option value="drug">Drug</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="form-group" id="divCentralisedStore">
                        <label class="col-md-4 control-label" for="textinput">Mode of Adjustment</label>
                        <div class="col-md-4">
                            <select id="radioMode" class="form-control input-md">
                                    <option value="QA">Quantity Adjustment</option>
                                    <option value="VA">Value Adjustment</option>
                                </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Reference Number</label>
                        <div class="col-md-4">
                            <input id="referenceNumber" name="referenceNumber" type="text" placeholder="reference number"  class="form-control input-md">

                        </div>
                    </div>
                    <div class="col-md-12">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Date</label>
                            <div class="col-md-4">
                                <input id="stockadjustdate" name="stockadjustdate" type="text" placeholder="DD/MM/YYYY"  class="form-control input-md" readonly="">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Account</label>
                        <div class="col-md-4">
                            <input id="stockadjustaccount" name="stockadjustaccount" type="text" placeholder=""  class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Reason *</label>
                        <div class="col-md-4">
                            <select id="selectreason" class="form-control input-md">
                                <%
                                    if (datareason.size() > 0) {
                                        for (int i = 0; i < datareason.size(); i++) {
                                            out.print("<option value='" + datareason.get(i).get(0) + "'>" + datareason.get(i).get(1) + "</option>");
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Description *</label>
                        <div class="col-md-4">
                            <textarea id="textdesctiption" class="form-control input-md"></textarea>
                        </div>
                    </div>
                </div>
                <hr>
                <br>

                <div class="row">
                    <div class="col-md-12">
                        <h4>Item Details</h4>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Search Item</label>
                        <div class="col-md-4">
                            <input id="stockadjustsearch" name="stockadjustsearch" type="text" placeholder="please search item"  class="form-control input-md">
                            <div id="resultcarian" class="search-drop"></div>
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Item Code</label>
                            <div class="col-md-8">
                                <input id="stockadjustitemcode" name="orderStockItemDisplayItemCode" type="text" placeholder="Item Code"  class="form-control input-md" readonly>
                                <input type="hidden" id="othervalue">

                            </div>
                        </div>                           
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Item Name</label>
                            <div class="col-md-8">
                                <input id="stockadjustitemname" name="orderStockItemDisplayItemName" type="text" placeholder="Item Name" class="form-control input-md" readonly>
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Stock on hand/current value</label>
                            <div class="col-md-8">
                                <input id="stockadjustcurrent" name="orderStockItemDisplayItemStackQuantity" type="text" placeholder="Stock Quantity"  class="form-control input-md" readonly>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Quantity Adjusted/Adjusted value *</label>
                            <div class="col-md-8">
                                <input id="stockadjustadjusted" name="stockchangedval" type="text" placeholder="Please Insert Quantity adjusted/adjusted value" class="form-control input-md" >
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New quantity on hand/changed value *</label>
                            <div class="col-md-8">
                                <input id="stockadjustnewqty" name="stockadjustnewquantity" type="text" placeholder="Please Insert Quantity on hand/changed value" class="form-control input-md">
                            </div>
                        </div>

                    </div>
                </div>


            </form>
        </div>
    </div>
</div>
<!-- main -->		

<script>
    $(document).ready(function () {
        $('.loading').hide();
        $("#stockadjustdate").datepicker({
            dateFormat: 'dd/mm/yy',
            yearRange: '1999:c+1',
            changeMonth: true,
            changeYear: true,
            minDate: new Date(1999, 10 - 1, 25),
            maxDate: '+30Y'
        });
        
        $("#stockadjustadjusted").on('keyup keydown',function (e) {
            var current = parseFloat($('#stockadjustcurrent').val());
            var input = $(this).val(); 
            if (input.length >= 1) {
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190,110]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 $('#stockadjustnewqty').val(parseFloat($(this).val()) + current);
                 return;
        }
        // Ensure that it is a number and stop the keypress
//        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
//            e.preventDefault();
//        }
            }
        // Allow: backspace, delete, tab, escape, enter and .
        
    });
        
        
        $("#stockadjustsearch").on('keyup', function () { // everytime keyup event
        var itemType = $('#selectItemType').val();
        var input = $(this).val(); // We take the input value
        var selectstore = $('#selectStore').val();
        var isChecked = $("#radioMode").val();

        if (selectstore === "" || selectstore === null) {
            bootbox.alert("Please select store first");
        } else if (itemType === "" || itemType === null) {
            bootbox.alert("Please select item type");
        } else if (isChecked=="" || isChecked === null) {
            bootbox.alert("Please select mode of adjustment");
        } else {
            if (input.length >= 1) { // Minimum characters = 2 (you can change)

                $('#resultcarian').html('<img src="libraries/LoaderIcon.gif"/>');

                var dataFields = {'input': input, 'itemtype': itemType, 'dataCS': selectstore}; // We pass input argument in Ajax

                console.log(dataFields);

                $.ajax({
                    type: "POST",
                    url: "../GNL/StockOrder/controllerProcess/orderStockSearchItem.jsp", // call the jsp file ajax/auto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success

                        $('#resultcarian').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>

                        $('#resultcarian li').on('click', function () { // When click on an element in the list

                            $('#stockadjustsearch').val($(this).text()); // Update the field with the new element
                            $('#resultcarian').text(''); // Clear the <div id="match"></div>


                        });

                    },
                    error: function () { // if error

                        $('#resultcarian').text('No Record Found !');

                    }
                });

            } else {

                $('#resultcarian').text('Search For More Than One Characters !!'); // If less than 2 characters, clear the <div id="match"></div>

            }
        }


    });

    //JS Search in Add Item End


    //JS Get Add Item Start
    $('#resultcarian').on('click', function () {

        $('<div class="loading">Loading</div>').appendTo('body');

        var id;

        var arrayData = $('#stockadjustsearch').val().split("|");
        var itemType = $('#selectItemType').val();
        var store = $('#selectStore').val();
        id = arrayData[0];
        var radiomode = $("#radioMode").val();
        //var radiovalue = $('#radiovalue').val();


        var data = {
            id: id, itemType: itemType, store: store
        };
        console.log(data);
        console.log(radiomode);
        //console.log(radiovalue);

        $.ajax({
            type: 'post',
            url: '../GNL/StockOrder/controllerProcess/stockAdjustSearchItemResult.jsp',
            data: data,
            success: function (reply_data) {
                console.log(reply_data);
                var array_data = String(reply_data.trim()).split("|");

                var itemCode = array_data[0];
                var itemCate = array_data[1];
                var itemName = array_data[2];
                var itemPrice = array_data[3];
                var itemStock = array_data[4];

                if (radiomode === 'QA') {
                    $('#stockadjustcurrent').val(itemStock);
                } else if (radiomode === 'VA') {
                    $('#stockadjustcurrent').val(itemPrice);
                }

                $('#stockadjustitemcode').val(itemCode);
                $('#stockadjustitemname').val(itemName);

                $('#stockadjustsearch').val('');

                $('.loading').hide();

            }
        });
    });

    });
    
</script>
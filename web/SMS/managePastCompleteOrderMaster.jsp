<%-- 
    Document   : managePastCompleteOrderMaster
    Created on : Feb 1, 2018, 3:06:58 PM
    Author     : Shammugam
--%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="java.util.ArrayList"%>
<%
    String roleCode = session.getAttribute("ROLE_CODE").toString();
    String userID = session.getAttribute("USER_ID").toString();
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String adminCS = "CS01";
    String dis_names = "";
    String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query);
    for (int x = 0; x < mysqldis_name.size(); x++) {
        dis_names += mysqldis_name.get(x).get(0) + "|" + mysqldis_name.get(x).get(1);
        if (x < mysqldis_name.size() - 1) {
            dis_names += "^";
        }
    }
    MySession superUser = new MySession(userID, hfc);
%>
<h4>View Past Order</h4>
<div class=" form-horizontal" align="center">

    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">Order Status</label>
        <div class="col-md-4">
            <select id="OM_selectStatus" name="orderType" class="form-control" >
                <option selected disabled value="-"> Please select order Status</option>

                <option value="1">Completed</option>

                <option value="0">Ordered</option>
            </select>
        </div>
    </div>
    <%
        if (roleCode.equalsIgnoreCase(adminCS) || superUser.isSuperUser() == true) { %>
    <div class="form-group" >
        <label class="col-md-4 control-label" for="textinput">Discipline</label>
        <div class="col-md-4">
            <select id="patientType" class="form-control">
                <option value="all">All</option>
                <%
                    for (int x = 0; x < mysqldis_name.size(); x++) {
                        out.print("<option value='" + mysqldis_name.get(x).get(0) + "'>" + mysqldis_name.get(x).get(1) + "</option>");
                    }
                %>
            </select>
        </div>
    </div>
    <%
        }
    %>
    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">Search Type</label>
        <div class="col-md-4">
            <select id="OM_selectType" name="orderType" class="form-control" >
                <option selected disabled value="-"> Please select search type</option>

                <option value="User">User ID</option>

                <option value="Order">Order No.</option>

                <option value="Date">Date</option>

            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group select-type" id="OM_selectIC" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="OM_inputIC" name="idIC" placeholder="ID" >
        </div>


    </div>
    <div class="form-group select-type" id="OM_selectUser" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">User ID</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="OM_inputUser" placeholder="User Id" >
        </div>


    </div>
    <div class="form-group select-type" id="OM_selectOrder" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">Order No.</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="OM_inputOrder" name="order_no" placeholder="Order No.">
        </div>

    </div>
    <jsp:include page="../RIS/libraries/dateSelect.jsp" />
<!--    <div class="form-group select-type" id="OM_selectDate" style="display: none;">
        <label class="col-md-4 control-label" for="textinput">From</label>
        <div class="col-md-2">
            <input type="text" id="OM_DateFrom" class="form-control input-md Datepicker" placeholder="DD-MM-YYYY" readonly>
        </div>

        <label class="col-md-1 control-label" for="textinput">To</label>
        <div class="col-md-2">
            <input type="text" id="OM_DateTo" class="form-control input-md Datepicker" placeholder="DD-MM-YYYY" readonly>
        </div>

    </div>-->

    <div class="text-center">
        <button class="btn btn-primary" type="button" id="OM_btnSearch" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>
    </div>

    <hr class="pemisah"/>
    <div id="OM_viewDiv" class="table-guling">
    </div>

</div>


<script>

    $(function () {
        $("#divDate").hide();
        $("#refreshbuttondiv").hide();
        $('#spansearchbutton').hide();
//        //--- initialise datepicker for from ----
//        $('#OM_DateFrom').datepicker({
//            changeMonth: true,
//            changeYear: true,
//            dateFormat: 'dd/mm/yy',
//            yearRange: '1990:+0',
//            maxDate: '+0d'
//        });
//
//
//        //--- initialise datepicker for to after changes on from ------------
//        $('#OM_DateFrom').on('change', function () {
//
//            $("#OM_DateTo").datepicker("destroy");
//            $('#OM_DateTo').val('');
//
//            var fromDate = $("#OM_DateFrom").datepicker("getDate");
//
//            $('#OM_DateTo').datepicker({
//                changeMonth: true,
//                changeYear: true,
//                dateFormat: 'dd/mm/yy',
//                yearRange: '1990:+0',
//                minDate: fromDate,
//                maxDate: '+0d'
//            });
//
//        });


        // Type Choose
        $('#OM_selectType').on('change', function () {

            $('.select-type').hide();
            var div;
            var type = $(this).val();
            if(type==="Date"){
                div = "#divDate";
            }else{
                div = "#OM_select" + type;
            }
            

            $(div).show();

        });


        // On Search Click
        $('#OM_btnSearch').on('click', function () {
            var type = $('#OM_selectType').val();
            var status = $('#OM_selectStatus').val();
            var discipline = $('#patientType').val();
            dateType = $("#bydateSel").val();
            var inputID, dateFrom, dateTo,dateType;

            if (type === "Date") {
                dateType = $("#bydateSel").val();
                dateFrom = $('#OM_DateFrom').val();
                dateTo = $('#OM_DateTo').val();

            } else {

                var inputForm = "#OM_input" + type;
                inputID = $(inputForm).val();

            }

            if ((type === "Date") && (dateType ==="custom") && (dateFrom === "" || dateTo === "")) {
                
                bootbox.alert("Fill in all date inputs");

            } else if ((type !== "Date") && (inputID === "")) {

                bootbox.alert("Please fill in the empty field");

            } else if (type === null) {

                bootbox.alert("Please choose correct type");

            } else if (status === null || status === "-") {
                bootbox.alert("Please choose correct order status");
            } else {

                $('<div class="loading">Loading</div>').appendTo('body');

                var datas = {
                    type: type,
                    dateFrom: dateFrom,
                    dateTo: dateTo,
                    inputID: inputID,
                    status: status,
                    discipline : discipline,
                    dateType : dateType
                };

                console.log(datas);

                $.ajax({
                    type: 'POST',
                    timeout: 60000,
                    data: datas,
                    url: "controllerProcessPastOrder/managePastCompleteOrderMasterTable.jsp",
                    success: function (data, textStatus, jqXHR) {
                        //console.log(data);
                        $('#OM_viewDiv').html(data);

                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                        console.log("Error: " + errorThrown);

                    },
                    complete: function (jqXHR, textStatus) {

                        $('.loading').hide();

                    }
                });


            }

        });



        // Clicking The Table Row
        $('#OM_viewDiv').on('click', '#OM_tableOrder tbody tr', function () {

            var hidden = $(this).closest('tr').find('#OM_json').val();
            var obj = JSON.parse(hidden);

            $('<div class="loading">Loading</div>').appendTo('body');

            console.log(hidden);

            $('#OD_orderNo').val(obj.order_no);
            $('#OD_orderDate').val(obj.date);
            $('#requestorUserID').val(obj.customer_id);
            $('#requestorName').val(obj.customer_name);

            $('.nav-tabs a[href="#tab_default_2"]').tab('show');

            OD_getOrderDetail(obj.order_no);


        });


    });// end on document ready
</script>



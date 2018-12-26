<%-- 
    Document   : viewOrderMaster
    Created on : Jan 29, 2018, 10:03:00 AM
    Author     : user
--%>

<h4>View Past Order</h4>
<div class=" form-horizontal" align="center">


    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">Search Type</label>
        <div class="col-md-4">
            <select id="OM_selectType" name="orderType" class="form-control" >
                <option selected disabled value="-"> Please select search type</option>

                <option value="IC">IC No. (NEW)</option>

                <option value="PMI">PMI No.</option>

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
    <div class="form-group select-type" id="OM_selectPMI" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">PMI No.</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="OM_inputPMI" placeholder="PMI No" >
        </div>


    </div>
    <div class="form-group select-type" id="OM_selectOrder" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">Order No.</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="OM_inputOrder" name="order_no" placeholder="Order No.">
        </div>

    </div>
    <jsp:include page="../../RIS/libraries/dateSelect.jsp"/>
<!--    <div class="form-group select-type" id="OM_selectDate" style="display: none;">
        <label class="col-md-4 control-label" for="textinput">From</label>
        <div class="col-md-2">
            <input type="text" id="OM_DateFrom" class="form-control input-md Datepicker" placeholder="YYYY-MM-DD" readonly>
        </div>

        <label class="col-md-1 control-label" for="textinput">To</label>
        <div class="col-md-2">
            <input type="text" id="OM_DateTo" class="form-control input-md Datepicker" placeholder="YYYY-MM-DD" readonly>
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

        destroyScreenLoading();
        $("#refreshbuttondiv").hide();
        $("#divDate").hide();


        $('#OM_selectType').on('change', function () {
            $('.select-type').hide();
            var type = $(this).val();

            var div = "#OM_select" + type;
            if(type==="Date"){
                $("#divDate").show();
                $("#OM_selectDate").hide();
            }else{
                $(div).show();
                $("#OM_selectDate").hide();
                $("#divDate").hide();
            }
            
        });

        //on search click
        $('#OM_btnSearch').on('click', function () {
            var type = $('#OM_selectType').val();
            var dateType = $("#bydateSel").val();
            var inputID, dateFrom, dateTo;
            if (type === "Date") {
                dateFrom = $('#OM_DateFrom').val();
                dateTo = $('#OM_DateTo').val();
                
            } else {
                var inputForm = "#OM_input" + type;
                inputID = $(inputForm).val();
            }

            if ((type === "Date") && (dateType==="custom") && (dateFrom === "" || dateTo === "")) {
                bootbox.alert("Fill in all date inputs");
            } else if ((type !== "Date") && (inputID === "")) {
                bootbox.alert("Please fill in the empty field");
            } else {
                createScreenLoading();
                var datas = {
                    type: type,
                    dateFrom: dateFrom,
                    dateTo: dateTo,
                    inputID: inputID,
                    dateType : dateType
                };
                console.log(datas);
                $.ajax({
                    type: 'POST',
                    timeout: 60000,
                    data: datas,
                    url: "history/control/getOrderMaster.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#OM_viewDiv').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Error: " + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }
                });
            }
        });
        
        //clicking the table row
        
        $('#OM_viewDiv').on('click', '#OM_tableOrder tbody tr', function(){
            var hidden = $(this).closest('tr').find('#OM_json').val();
            var obj = JSON.parse(hidden);
            
            console.log(hidden);
            
            $('#OD_orderNo').val(obj.order_no);
            $('#OD_orderDate').val(obj.date);
            $('#OD_patPMI').val(obj.pmi_no);
            $('#OD_patName').val(obj.name);
            
            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
            OD_getPatientDetail(obj.pmi_no);
            OD_getOrderDetail(obj.order_no);
            
           
        });

    });// end on document ready
</script>


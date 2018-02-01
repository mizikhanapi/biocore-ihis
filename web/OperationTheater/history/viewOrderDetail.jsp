<%-- 
    Document   : viewOrderDetail
    Created on : Jan 29, 2018, 3:43:41 PM
    Author     : user
--%>

<h4>Basic Info</h4>
<!--    <hr/>-->
<form class="form-horizontal" id="OD_patientForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">PMI No.</label>
                <div class="col-md-7">
                    <input id="OD_patPMI" type="text" placeholder="" readonly class="form-control input-md">   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Name</label>
                <div class="col-md-7">
                    <input id="OD_patName" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">New IC No.</label>
                <div class="col-md-7">
                    <input id="OD_patIC" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Gender</label>
                <div class="col-md-7">
                    <input id="OD_patGender" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">D.O.B</label>
                <div class="col-md-7">
                    <input id="OD_patDOB" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Blood Type</label>
                <div class="col-md-7">
                    <input id="OD_patBlood" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>
</form>

<hr/>

<h4>
    Request Info

</h4>
<!--<hr/>-->
<form class="form-horizontal" id="OD_orderForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="OD_orderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="OD_orderDate" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>
</form>
<!--<hr/>-->
<h4>
    Order Detail
</h4>


<div id="risManageOrderDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-bordered table-striped" style="width: 100%" >
        <thead>
            <tr>
                <th>Category</th>
                <th>Procedure Code</th>
                <th>Procedure Name</th>
                <th>Comment</th>
                <th>Start</th>
                <th>End</th>
            </tr>
        </thead>
        <tbody id="OD_orderDetailTableBody">

        </tbody>
    </table>
</div>

<hr/>
<div class="text-left"> 
    <button class="btn btn-default " type="button" id="OD_btnClear" > <i class="fa fa-arrow-circle-left fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>

<script>
    function OD_getPatientDetail(pmiNo) {
        $.ajax({
            type: 'POST',
            url: "history/control/getPatient.jsp",
            timeout: 60000,
            data: {pmiNo: pmiNo},
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                if (data.valid) {
                    $('#OD_patBlood').val(data.blood +" "+data.rhesus);
                    $('#OD_patDOB').val(data.dob);
                    $('#OD_patGender').val(data.sex);
                    $('#OD_patIC').val(data.IC);

                } else {
                    console.log("Oops!Something went wrong. Try again later.");
                }
            },
            error: function (erx, das, err) {
                console.log("Error: " + err);
            }
        });
    }

    function OD_getOrderDetail(orderNo) {
        createScreenLoading();
        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "history/control/getOrderDetail.jsp",
            data: {orderNo: orderNo},
            success: function (data, textStatus, jqXHR) {
                
                $('#OD_orderDetailTableBody').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: "+errorThrown);
            },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
            }
        });
    }
    
    $(function(){
        $('#OD_btnClear').on('click', function(){
            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            $('#OD_patientForm')[0].reset();
            $('#OD_orderForm')[0].reset();
            $('#OD_orderDetailTableBody').html("");
        });
        
        //on click table row
        $('#OD_orderDetailTableBody').on('click', 'tr', function(){
            var hidden = $(this).closest('tr').find('#OD_json').val();
            console.log(hidden);
            var obj = JSON.parse(hidden);
            var orderNo = $('#OD_orderNo').val();
            
            $('#VR_orderNo').val(orderNo);
            $('#VR_category').val(obj.cat_name);
            $('#VR_proName').val(obj.pro_name);
            $('#VR_start').val(obj.start);
            $('#VR_end').val(obj.end);
            $('#VR_minutes').val(obj.minute);
            $('#VR_room').val(obj.room);
            $('#VR_consultant').val(obj.consultant);
            $('#VR_prepare').val(obj.prepare);
            $('#VR_comment').val(obj.comment);
            $('#VR_gamba').attr('src', 'img/LoaderIcon.gif');
            
            var dat={
                orderNo: orderNo,
                pm_cd:obj.pro_cd
            };
            
            $.ajax({
                type: 'POST',
                timeout: 60000,
                url: "history/control/getImage.jsp",
                data: dat,
                success: function (data, textStatus, jqXHR) {
                        $('#VR_gamba').attr('src', data.trim());
                        
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Cannot load image. "+errorThrown);
                    }
            });
            
            $('#OD_modalResult').modal('show');
        });
    });
</script>
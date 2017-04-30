<%-- 
    Document   : risManageOrderListBasicInfoNew
    Created on : Mar 28, 2017, 4:43:19 PM
    Author     : Shammugam
--%>

<div class="thumbnail">
    <h4><u>Basic Info</u></h4>
    <!--    <hr/>-->
    <form class="form-horizontal" name="risManageOrderDetailContentBasicInfoForm" id="risManageOrderDetailContentBasicInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                    <div class="col-md-8">
                        <input id="rispatientpmino" name="rispatientpmino" type="text" placeholder="" readonly class="form-control input-md">   
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>
                    <div class="col-md-8">
                        <input id="rispatientName" name="rispatientName" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                    <div class="col-md-8">
                        <input id="rispatientnic" name="rispatientnic" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Gender</label>
                    <div class="col-md-8">
                        <input id="rispatientGender" name="rispatientGender" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">D.O.B</label>
                    <div class="col-md-8">
                        <input id="rispatientBdate" name="rispatientBdate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Blood Type</label>
                    <div class="col-md-8">
                        <input id="rispatientBtype" name="rispatientBtype" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

        </div>
    </form>



    <hr/>
    <h5 style="padding-bottom: 1%;font-weight: bolder">
        <u>Allergy List</u>
    </h5>

    <div id="risManageAllergyListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageAllergyListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th>HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>ALLERGY CODE</th>
            <th>ALLERGY DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>




<div class="thumbnail">
    <h4><u>Diagnosis Info</u></h4>
    <!--<hr/>-->
    <div id="risManageDiagnosisListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageDiagnosisListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th >HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>DIAGNOSIS CODE</th>
            <th>DIAGNOSIS DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>




<div class="thumbnail">
    <h4><u>Request Info</u></h4>
    <!--<hr/>-->
    <form class="form-horizontal" name="risManageOrderDetailContentOrderInfoForm" id="risManageOrderDetailContentOrderInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order No.</label>
                    <div class="col-md-8">
                        <input id="risOrderNo" name="risOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order Date</label>
                    <div class="col-md-8">
                        <input id="risOrderDate" name="risOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Location</label>
                    <div class="col-md-8">
                        <input id="risOrderLocationCode" name="risOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


        </div>
    </form>
    <!--<hr/>-->
    <h4 style="padding-bottom: 2%">
        <u>Order Detail</u>
        <span class="pull-right">
            <button id="risOrderDetailRefreshBtn" class="btn btn-default" title="Refresh Order Detail">
                <i class="fa fa-refresh fa-lg"></i>
            </button>
            <button id="risOrderNewRequestButton" class="btn btn-primary" >
                <i class="fa fa-plus fa-lg"></i>&nbsp; New Request
            </button>
            
        </span>
        <br>
    </h4>


    <div id="risManageOrderDetailsListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageOrderDetailsListTable">
            <thead>
            <th style="width: 15%">Body System</th>
            <th style="width: 5%">Modality</th>
            <th style="width: 5%">Procedure Code</th>
            <th style="width: 15%">Procedure Name</th>
            <th style="width: 25%">Requestor Instruction</th>
            <th style="width: 5%">Exam Date</th>
            <th style="width: 5%">Status</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>


    <div class="text-center" id="patientOrderDispenseButtonDiv" > 
        <!--<button class="btn btn-success " type="button" id="btnRISOrderSave" name="btnRISOrderSave" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Save &nbsp;</button>-->
        <!--<button class="btn btn-primary " type="button" id="btnRISOrderSendResults" name="btnRISOrderSendResults" > <i class="fa fa-print fa-lg" ></i>&nbsp; Send Result &nbsp;</button>-->
        <button class="btn btn-default " type="button" id="btnRISClearOrderDetail" name="btnRISClearOrderDetail" > <i class="fa fa-arrow-circle-left fa-lg"></i>&nbsp; Back &nbsp;</button>
    </div>
</div>
<script src="order_detail_js/order_detail_main.js" type="text/javascript"></script>


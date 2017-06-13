<%-- 
    Document   : views-orderDetailContent.jsp
    Created on : Jun 13, 2017, 2:44:50 PM
    Author     : user
--%>

    <h4>Basic Info</h4>
    <!--    <hr/>-->
    <form class="form-horizontal" name="" id="">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">Name</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" readonly="" placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">PMI No.</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" placeholder="" readonly="" class="form-control input-md">   
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">New IC No.</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" readonly="" placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">Gender</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" readonly="" placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">D.O.B</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" readonly="" placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">Blood Type</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" readonly="" placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

        </div>
    </form>

    <h5>
        ALLERGY LIST
    </h5>

    <div id="" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="">
            <thead>
                <tr>
                    <th style="display: none;text-align: left;">PMI NO</th>
                    <th>HFC CODE</th>
                    <th>EPISODE DATE</th>
                    <th>ENCOUNTER DATE</th>
                    <th>DIAGNOSIS CODE</th>
                    <th>DIAGNOSIS DESCRIPTION</th>
                    <th>COMMENT</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="7" class="text-center">No Order Available To Display</td>
                </tr>
            </tbody>
        </table>
    </div>

    <hr>

    <h4>Diagnosis Info</h4>
    <!--<hr/>-->
    <div id="" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="">
            <thead>
                <tr>
                    <th style="display: none;text-align: left;">PMI NO</th>
                    <th style="text-align: left; width: 5%">HFC CODE</th>
                    <th style="text-align: left; width: 15%">EPISODE DATE</th>
                    <th style="text-align: left; width: 15%">ENCOUNTER DATE</th>
                    <th style="text-align: left; width: 15%">DIAGNOSIS CODE</th>
                    <th style="text-align: left; width: 25%">DIAGNOSIS DESCRIPTION</th>
                    <th style="text-align: left; width: 25%">COMMENT</th>
                </tr>
            </thead>
            <tbody>
                <tr >
                    <td colspan="7" class="text-center">No Order Available To Display</td>
                </tr>
            </tbody>
        </table>
    </div>

    <hr>

    <h4>
        Request Info
        <span class="pull-right">
            <button id="" class="btn btn-default" title="Refresh Order Detail">
                <i class="fa fa-refresh fa-lg"></i>
            </button>
            <button id="" class="btn btn-primary">
                <i class="fa fa-plus fa-lg"></i>&nbsp; New Request
            </button>
        </span>
    </h4>
    <!--<hr/>-->
    <form class="form-horizontal" name="" id="">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">Order No.</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" placeholder=" " readonly="" class="form-control input-md">   
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">Order Date</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" readonly="" placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="textinput">Location</label>
                    <div class="col-md-7">
                        <input id="" name="" type="text" readonly="" placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


        </div>
    </form>
    <!--<hr/>-->
    <h4>
        Order Detail
    </h4>


    <div id="" class="form-group table-guling">
        <table class="table table-filter table-striped table-bordered"  id="" >
            <thead>
                <tr>
                    <th style="display: none; width: 0px;" class="sorting_asc" tabindex="0"  aria-sort="ascending" aria-label="Hidden: activate to sort column descending">Hidden</th>
                    <th>Body System</th>
                    <th>Modality</th>
                    <th>Procedure Code</th>
                    <th>Procedure Name</th>
                    <th>Requestor Instruction</th>
                    <th>Exam Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr role="row" class="odd">

                    <td style="display: none" class="sorting_1"></td> <!-- hidden -->
                    <td>Heart</td> <!-- body -->
                    <td>Fluoroscopy</td> <!-- modality -->
                    <td>P0001</td> <!-- procedure code-->
                    <td>null</td> <!-- procedure name-->
                    <td>no comments</td> <!-- Instruction -->
                    <td>13/06/2017</td><!-- exam date -->
                    <td>New</td> <!-- status -->
                    <td> 
                        <button id="" class="btn btn-default"><i class="fa fa-calendar fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;"></i>&nbsp;&nbsp;&nbsp;Set Exam Date</button><!-- set date -->
                        <button id="" class="btn btn-default"><i class="fa fa-user-md fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;"></i>&nbsp;&nbsp;&nbsp;Perform Exam</button><!-- perform -->
                        <button id="" class="btn btn-default" disabled=""><i class="fa fa-file-text fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;"></i>&nbsp;&nbsp;&nbsp;Prepare Report</button><!-- prepare -->
                        <button id="" class="btn btn-default"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i>&nbsp;&nbsp;&nbsp;Cancel Order</button></td> <!-- cancel order -->

                </tr>
            </tbody>
        </table>
    </div>

    <hr>
    <div class="text-left" id="">
        <button class="btn btn-default" type="button" id="" name=""> <i class="fa fa-arrow-circle-left fa-lg"></i>&nbsp; Back &nbsp;</button>
    </div>

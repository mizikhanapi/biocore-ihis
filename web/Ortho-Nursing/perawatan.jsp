<%-- 
    Document   : perawatan
    Created on : Jun 7, 2017, 11:43:31 AM
    Author     : user
--%>
<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control">
                <option>View by</option>
                <option>Today</option>
                <option>Yesterday</option>
                <option>7 Days</option>
                <option>30 Days</option>
                <option>60 Days</option>
                <option>Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="exampleInputName2" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="exampleInputEmail2" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>Date</th>
            <th>Rawatan</th>
            <th>Time</th>
            <th>Aliran Vena</th>
            <th>Makanan</th>
            <th>STO</th>
            <th>Temujanji</th>
            <th>Action</th>
        </tr>
    </thead>
    <!--Loop-->
    <tbody>
        <tr>
            <td rowspan="2">07/06/2017</td>
            <td rowspan="2">
                Monitoring Temperature
                <div class="pull-right">
                    <a class="" style="cursor: pointer"><i class="fa fa-plus" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>
                    &nbsp;
                    <a data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                    &nbsp;
                    <a class="" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
                </div>
            </td>
            <td>12:00pm</td>
            <td>good</td>
            <td>bad</td>
            <td>average</td>
            <td>Esok</td>
            <td>
                <a data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
                <a class="" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
            </td>
        </tr>
        <tr>
            <td>12:00pm</td>
            <td>good</td>
            <td>bad</td>
            <td>average</td>
            <td>Esok</td>
            <td>
                <a data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
                <a class="" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
            </td>
        </tr>
    </tbody>
    <!--Loop-->

    <!--Loop-->
    <tbody>
        <tr>
            <td rowspan="3">08/06/2017</td>
            <td rowspan="3">
                Monitoring Skin
                <div class="pull-right">
                    <a class="" style="cursor: pointer"><i class="fa fa-plus" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>
                    &nbsp;
                    <a data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                    &nbsp;
                    <a class="" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
                </div>
            </td>
            <td>12:00pm</td>
            <td>good</td>
            <td>bad</td>
            <td>average</td>
            <td>Esok</td>
            <td>
                <a data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
                <a class="" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
            </td>
        </tr>

        <!--new items 'need to update rowspan'-->
        <tr> 
            <td>12:00pm</td>
            <td>good</td>
            <td>bad</td>
            <td>average</td>
            <td>Esok</td>
            <td>
                <a data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
                <a class="" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
            </td>
        </tr>
        <!--new items-->

        <!--new items 'need to update rowspan'-->
        <tr> 
            <td>12:00pm</td>
            <td>good</td>
            <td>bad</td>
            <td>average</td>
            <td>semalam</td>
            <td>
                <a data-toggle="modal" data-target="#SDT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                &nbsp;
                <a class="" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
            </td>
        </tr>
        <!--new items-->
    </tbody>
    <!--Loop-->
</table>

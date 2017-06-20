<%-- 
    Document   : chartObservation
    Created on : Jun 7, 2017, 5:34:35 PM
    Author     : Mizi K (UI)
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
    <tr>
        <th>Date</th>
        <th>Time</th>
        <th>B/P</th>
        <th>PR</th>
        <th>RR</th>
        <th>SpO2</th>
        <th>Pain Scale</th>
        <th style="width: 30%;">Notes</th>
        <th>Approval</th>
        <th>Action</th>
    </tr>
    <tr>
        <td>07/06/2017</td>
        <td>5:36 PM</td>
        <td>144</td>
        <td>43</td>
        <td>43</td>
        <td>35</td>
        <td>8</td>
        <td>Dia ni asik sakit je. mungkin perlu jagaan emosi.</td>
        <td>
            <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
        </td>
        <td>
            <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="MW_delete" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>
</table>

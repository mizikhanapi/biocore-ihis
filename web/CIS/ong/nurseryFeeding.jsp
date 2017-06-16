<%-- 
    Document   : anteNatal
    Created on : Jun 14, 2017, 4:32:59 PM
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

<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Date / Time</th>
            <th>Type Strength of Milk</th>
            <th>Method of Feeding</th>
            <th>Amount Offered</th>
            <th>Amount Taken</th>
            <th>Aspirate Vomit</th>
            <th>Temp</th>
            <th>Resp (/Min)</th>
            <th>HR (/Min)</th>
            <th>PU</th>
            <th>BO</th>
            <th>Remarks</th>
            <th>Approval</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>15/06/2017</td>
            <td>Very strong</td>
            <td>breast feed</td>
            <td>100</td>
            <td>100</td>
            <td>rarely</td>
            <td>37</td>
            <td>39</td>
            <td>39</td>
            <td>1</td>
            <td>1</td>
            <td>no marks</td>
            <td></td>
            <td>
                <a style="vertical-align: middle;" href="#"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                &nbsp;&nbsp;&nbsp;
                <a href="#"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #d9534f;"></i></a>
            </td>
        </tr>
    </tbody>
</table>

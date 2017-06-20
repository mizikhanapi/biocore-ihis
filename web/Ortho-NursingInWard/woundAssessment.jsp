<%-- 
    Document   : FitsChart
    Created on : Jun 9, 2017, 12:55:20 PM
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
    <tr>
        <th rowspan="2">Date</th>
        <th rowspan="2">Date of next dressing change</th>
        <th rowspan="2">Wound Dimensions in cm</th>
        <th rowspan="2">Exudate Level</th>
        <th rowspan="2">Exudate Colour</th>
        <th rowspan="2">Wound Bed in %</th>
        <th rowspan="2">Wound Edges</th>
        <th rowspan="2">Surrounding Skin</th>
        <th rowspan="2">Signs of Clinical Infaction</th>
        <th colspan="2">Patient Pain</th>
        <th rowspan="2">Wound Progress</th>
        <th rowspan="2">Dressing Plan</th>
        <th rowspan="2">Action</th>
    </tr>
    <tr>
        <td>During Removal</td>
        <td>While in place</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td>
            <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        </td>
    </tr>
</table>
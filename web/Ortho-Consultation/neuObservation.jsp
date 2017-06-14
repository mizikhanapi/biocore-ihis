<%-- 
    Document   : neurosurgical
    Created on : Apr 18, 2017, 12:20:37 PM
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
<table class="table table-striped">
    <thead style="text-transform: uppercase;" >
        <tr>
            <th rowspan="2">Date</th>
            <th rowspan="2">Time</th>
            <th colspan="3" style="text-align: center;">Coma Scale</th>
            <th rowspan="2">Blood Presure</th>
            <th colspan="2" style="text-align: center;">Pupil</th>
            <th colspan="2" style="text-align: center;">Limb</th>
            <th rowspan="2">Action</th>
        </tr>
        <tr>
            <th>Eye Opening</th>
            <th>Verbal Response</th>
            <th>Motor Response</th>
            <th>Left</th>
            <th>Right</th>
            <th>Arm</th>
            <th>Legs</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>2017/12/21</td>
            <td>12:00:00</td>
            <td>4</td>
            <td>3</td>
            <td>6</td>
            <td>321</td>
            <td>8</td>
            <td>7</td>
            <td>Normal Power</td>
            <td>Extension</td>
            <td>
                <a data-toggle="modal" href="" class="updateBtnCCN" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block; color: #337ab7;"></i></a> 
                &nbsp;&nbsp; 
                <a href="#" class="deleteBtn" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
            </td>
        </tr>
        <tr>
            <td>2017/12/21</td>
            <td>12:00:00</td>
            <td>4</td>
            <td>3</td>
            <td>6</td>
            <td>321</td>
            <td>8</td>
            <td>7</td>
            <td>Normal Power</td>
            <td>Extension</td>
            <td>
                <a data-toggle="modal" href="" class="updateBtnCCN" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block; color: #337ab7;"></i></a> 
                &nbsp;&nbsp; 
                <a href="#" class="deleteBtn" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
            </td>
        </tr>
        <tr>
            <td>2017/12/21</td>
            <td>12:00:00</td>
            <td>4</td>
            <td>3</td>
            <td>6</td>
            <td>321</td>
            <td>8</td>
            <td>7</td>
            <td>Normal Power</td>
            <td>Extension</td>
            <td>
                <a data-toggle="modal" href="" class="updateBtnCCN" id=""><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block; color: #337ab7;"></i></a> 
                &nbsp;&nbsp; 
                <a href="#" class="deleteBtn" id=""><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
            </td>
        </tr>
    </tbody>
</table>
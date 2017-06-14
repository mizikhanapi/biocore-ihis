<%-- 
    Document   : morsefallScale
    Created on : Jun 6, 2017, 3:53:50 PM
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
        <th>History of falling</th>
        <th>Secondary Diagnosis</th>
        <th>Ambulatory Aid</th>
        <th>IV Venofix / Syringe Pump</th>
        <th>Gait / Transferring</th>
        <th>Mental Status</th>
        <th>Total Score</th>
        <th>Approval</th>
    </tr>
    <tr>
        <td rowspan="3">06/06/2017</td>
        <td>AM</td>
        <td>25</td>
        <td>15</td>
        <td>30</td>
        <td>20</td>
        <td>10</td>
        <td>15</td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>PM</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td>Noon</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>

<%-- 
    Document   : 4hly
    Created on : Jun 8, 2017, 4:22:58 PM
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
        <th>Time 4hly obs.</th>
        <th>Site of IV Canulation</th>
        <th>Pain Score</th>
        <th>Yes / No</th>
        <th>Additive</th>
        <th>Thrombo Phlebitis</th>
        <th>V.I.P. Score</th>
        <th>Approval</th>
    </tr>
    <tr>
        <td>08/06/2017</td>
        <td>09:00 AM</td>
        <td>VEINS of the FOOT</td>
        <td>9</td>
        <td>Redness</td>
        <td>Medication</td>
        <td>Yes</td>
        <td>4</td>
        <td><button class="btn btn-success btn-block"><i class="fa fa-check-square-o"></i>&nbsp; Approved</button></td>
    </tr>
    <tr>
        <td>08/06/2017</td>
        <td>12:00 PM</td>
        <td>Caphalic</td>
        <td>5</td>
        <td>Redness</td>
        <td>Medication</td>
        <td>Yes</td>
        <td>4</td>
        <td><button class="btn btn-success btn-block"><i class="fa fa-check-square-o"></i>&nbsp; Approved</button></td>
    </tr>
</table>

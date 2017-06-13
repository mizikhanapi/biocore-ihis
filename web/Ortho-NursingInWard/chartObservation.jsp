<%-- 
    Document   : chartObservation
    Created on : Jun 7, 2017, 5:34:35 PM
    Author     : Mizi K (UI)
--%>

<div class="row">
    <div class="col-md-9">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-3">
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-12 control-label" for="textinput">Previous Assessment:</label>
            <div class="col-md-12" style="padding-right: 0px;">
                <select class="form-control input-md">
                    <option>Select episode date</option>
                    <option>-</option>
                </select>
            </div>
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
        <th>Progress</th>
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
            Progress...<span class="pull-right bold">3/7</span>
            <div class="progress progress-striped active" style="height: 8px">
                <div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                </div>
            </div>
        </td>
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

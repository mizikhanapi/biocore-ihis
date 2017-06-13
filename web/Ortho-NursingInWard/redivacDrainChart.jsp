<%-- 
    Document   : redivacDrainChart
    Created on : Jun 9, 2017, 3:21:44 PM
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
        <th>Shift</th>
        <th>Total in Bottle</th>
        <th>Amount<br>Increased / shift</th>
        <th>Total in Bottle<br>end of shift</th>
        <th>Remarks</th>
        <th>Action</th>
    </tr>
    <tr>
        <td rowspan="3">09/06/2017</td>
        <td>7am - 2pm</td>
        <td>56</td>
        <td>56</td>
        <td>85</td>
        <td>Botol apakah ini?</td>
        <td>
            <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>
    <tr>
        <td>2pm - 9pm</td>
        <td>56</td>
        <td>56</td>
        <td>85</td>
        <td>Botol apakah ini?</td>
        <td>
            <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>
    <tr>
        <td>9pm - 7am</td>
        <td>56</td>
        <td>56</td>
        <td>85</td>
        <td>Botol apakah ini?</td>
        <td>
            <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>
</table>

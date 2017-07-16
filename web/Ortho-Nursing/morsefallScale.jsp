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
            <select class="form-control" id="MS_viewBy">
                <option value="all">View by</option>
                <option value="0">Today</option>
                <option value="1">Yesterday</option>
                <option value="7">7 Days</option>
                <option value="30">30 Days</option>
                <option value="60">60 Days</option>
                <option value="x">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px"  style="display: none" id="MS_div_selectDate">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="MS_dateFrom" placeholder="dd/mm/yyyy" readonly style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="MS_dateTo" placeholder="dd/mm/yyyy" readonly style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="MS_btnSearchByDate"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>
<div id="div_morseAss_table" class="table-guling">
    
    <div style="text-align:center;border:1px solid #2196f3"><h3>No record found!</h3></div>
    
<!--    <table class="table table-bordered" id="morse_assessment_table">
    <tr>
        <th>Date</th>
        <th>Time</th>
        <th>History of falling</th>
        <th>Diagnosis</th>
        <th>Ambulatory Aid</th>
        <th>IV Venofix / Syringe Pump</th>
        <th>Body structure/Movement</th>
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
</table>-->
</div>

<!--<script type="text/javascript" src="../Ortho-Nursing/js/create_destroy_loading.js"></script>
<script type="text/javascript" src="../Ortho-Nursing/js/morsefallScale.js"></script>-->

<script type="text/javascript">

    //--- initialise datepicker for from ----
    $('#MS_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#MS_dateFrom').on('change', function(){
        
        $("#MS_dateTo" ).datepicker( "destroy" );
        $('#MS_dateTo').val('');
        var fromDate = $( "#MS_dateFrom" ).datepicker( "getDate" );
        
        $('#MS_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
        
    });
</script>
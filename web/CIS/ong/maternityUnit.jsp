<%-- 
    Document   : maternityUnit
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
            <select class="form-control soap-select" id="MU_viewBy">
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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" style=" display: none" id="MU_div_selectDate">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="MU_dateFrom" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="MU_dateTo" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Date / Time Ordered</th>
                    <th>Intravenous Therapy</th>
                    <th>Date / Time Off</th>
                    <th>Action</th>
                </tr>    
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Date / Time Ordered</th>
                    <th>Investigation</th>
                    <th>Date Done</th>
                    <th>Action</th>
                </tr>    
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
     //--- initialise datepicker for from ----
    $('#MU_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#MU_dateFrom').on('change', function(){
        
        $("#MU_dateTo" ).datepicker( "destroy" );
        $('#MU_dateTo').val('');
        var fromDate = $( "#MU_dateFrom" ).datepicker( "getDate" );
        
        $('#MU_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
        
    });
    
    $('#MU_viewBy').on('change', function(){
        var howTo = $(this).val();

        if (howTo === 'x') {
            $('#MU_div_selectDate').show();
        } else {
            $('#MU_div_selectDate').hide();
            //loadMorsefallAssessment();// view previous assessment
        }
    });
    
    
</script>
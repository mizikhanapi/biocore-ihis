<%-- 
    Document   : continuation
    Created on : Jun 7, 2017, 12:11:16 PM
    Author     : user
--%>
<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="proNote_viewBy">
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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="proNote_div_select_date" style="display: none;">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="proNote_dateFrom" placeholder="Pick start date" style="margin-bottom: 0px !important;" readonly>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="proNote_dateTo" placeholder="Pick end date" style="margin-bottom: 0px !important;" readonly>
            </div>
            <button type="submit" class="btn btn-default" id="proNote_btnSearchByDate"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<!--area to load and view previous progress note-->
<div id="div_view_progressNotes">
    
     <div style="text-align:center;border:1px solid #2196f3"><h3>No record found!</h3></div>
<!--    <div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-xs-12">
                <div class="media">
                    <div class="media-left media-middle">
                        <div class="ckbox"><input type="checkbox" id="checkbox0" name="CIS_consult_notes"><label for="checkbox0"></label></div>
                    </div>
                    <div class="media-body">
                        <dl><dt class="media-heading">07/06/2017</dt></dl>
                        <p class="summary">Harini dia rasa sakit bahagian hati. patah hati mungkin. As a leading student accommodation booking platform, we strive to provide top class service to you in finding a place you can call home. In order to help you quick and efficiently, we've helped create an account for you. You can change your password anytime in your account settings.</p>
                    </div>
                    <div style="position: absolute; bottom: 0px; right: 15px;">
                        <a style="vertical-align: middle;" href="#"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="#"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #d9534f;"></i></a>
                    </div>
                </div>
            </div>
        </div>   
    </div>
</div>-->
    
</div>

<script type="text/javascript">

    //--- initialise datepicker for from ----
    $('#proNote_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#proNote_dateFrom').on('change', function(){
        
        $("#proNote_dateTo" ).datepicker( "destroy" );
        $('#proNote_dateTo').val('');
        var fromDate = $( "#proNote_dateFrom" ).datepicker( "getDate" );
        
        $('#proNote_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
        
    });
</script>

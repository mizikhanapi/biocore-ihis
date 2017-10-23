<%-- 
    Document   : analyse
    Created on : Oct 23, 2017, 11:05:08 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<div class="row">
    <div class="col-md-12">

        <div class="thumbnail">

            <!-- Tab Menu -->
            <div class="tabbable-panel cis-tab">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a data-toggle="tab" aria-expanded="false">
                                <i class="fa fa-info-circle fa-lg"></i> Analyse Patient </a>
                        </li>
                        <li class="pull-right">
                            <a href="#generic-soap" class="panelito general-exam">
                                <i class="fa fa-chevron-left"></i> Back to General Examination </a>
                        </li>

                    </ul>

                    <div class="tab-content">
                        <!-- content -->
                        <div class="tab-pane active fade in" id="Analyse_tab1">
                            <p class="pull-right">
                                <button class="btn btn-info" type="button" name="searchPatient" title="Show/Hide search area" onclick="$('#ANL_searchPatient').toggle();"><i class="fa fa-eye fa-lg"></i>&nbsp;Search</button>
                            </p>
                            <div class="row ANL-toggle" id="ANL_searchPatient">
                                <form class="form-horizontal" name="myFormApp" id="myFormApp">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                                        <div class="col-md-4">

                                            <select id="ANL_idType" name="idType" class="form-control">
                                                                                                                                                
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control input-md" id="ANL_idInputApp" name="idInputApp" placeholder="ID"/>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button class="btn btn-primary" type="button" id="ANL_btnSearch" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                                    </div>
                                </form>
                            </div>
                            <div class="row ANL-toggle" id="ANL_div_info" style="display: none;">
                                <div id="ANL_div_patientBiodata"></div>
                            </div>
                            <hr class="pemisah" />
                           
                            <div class="row">
                                <div class="col-md-8">
                                    <h4>Past Records</h4>
                                </div>
                                <div class="col-md-4" style="padding-top: 20px">
                                    <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
                                    <div class="col-sm-6 " style="padding-right: 0px;">
                                        <select class="form-control" id="ANL_viewBy">
                                            <option value="0" selected disabled> --View by-- </option>
                                            <option value="all">All</option>
                                            <option value="0">Today</option>
                                            <option value="1">Yesterday</option>
                                            <option value="7">7 Days</option>
                                            <option value="30">30 Days</option>
                                            <option value="60">60 Days</option>
                                            <option value="x">Select date</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
                                    <div class="col-sm-12 form-inline" style="padding-right: 0px; display: none;" id="ANL_div_selectDate">
                                        <div class="form-group">
                                            <label for="exampleInputName2">Start</label>
                                            <input type="text" class="form-control" id="ANL_dateFrom" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">to</label>
                                            <input type="text" class="form-control" id="ANL_dateTo" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
                                        </div>
                                        <button type="submit" class="btn btn-default" id="ANL_btnSearchRecord"><i class="fa fa-search fa-lg"></i></button>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row" id="ANL_viewDiv">
                                
                            </div>
                            
                        </div>
                        <!-- content -->

                    </div>

                </div>
            </div>

            <!-- Tab Menu -->
        </div>
    </div>
</div>
                        
<script type="text/javascript">
    
     //--- initialise datepicker for from ----
    $('#ANL_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#ANL_dateFrom').on('change', function(){
        
        $("#ANL_dateTo" ).datepicker( "destroy" );
        $('#ANL_dateTo').val('');
        var fromDate = $( "#ANL_dateFrom" ).datepicker( "getDate" );
        
        $('#ANL_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
        
    });
    
    $('#ANL_viewBy').on('change', function(){
        var howTo = $(this).val();
        $('#ANL_dateFrom').val("");
        $("#ANL_dateTo").val("");

        if (howTo === 'x') {
            $('#ANL_div_selectDate').show();
        } else {
            $('#ANL_div_selectDate').hide();
            ANL_loadData();
        }
    });
    
    $('#ANL_btnSearchRecord').on('click', function(){
        var dateFrom = $('#ANL_dateFrom').val();
        var dateTo = $('#ANL_dateTo').val();
        
        if(dateFrom==="" || dateTo===""){
            bootbox.alert("Please choose the dates");
        }
        else{
            ANL_loadData();
        }
    });
    
    $(function(){
        $('#ANL_searchPatient #myFormApp #ANL_idType').load('search/SearchModal.jsp #myFormApp #idType option');
    });
    
    function ANL_searchPatient(idType, id){
        
        createScreenLoading();
        var data={
            idType : idType,
            id : id
        };
        
        $.ajax({
            type: 'POST',
            timeout: 60000,
            data: data,
            url: "analyse/controller/getPatientBiodata.jsp",
            success: function (data, textStatus, jqXHR) {
                        
                        if(data.trim()==="0"){
                            bootbox.alert("Cannot find the patient.");
                        }
                        else{
                            $('#ANL_div_patientBiodata').html(data);
                            $('.ANL-toggle').hide();
                            $('#ANL_div_info').show();
                        }
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+ errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
        
    }
    
    $('#ANL_btnSearch').on('click', function(){
        var idType = $('#ANL_idType').val();
        var id = $('#ANL_idInputApp').val();
        
        if(idType==null || idType==="" || id===""){
            bootbox.alert("Please complete all inputs.");
        }
        else{
            ANL_searchPatient(idType, id);
        }
    });
    
    
    //------------------ retrieve data
    function ANL_loadData(){
        var data = {
            day: $('#ANL_viewBy').val(),
            from: $('#ANL_dateFrom').val(),
            to: $('#ANL_dateTo').val()
        };
        
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "analyse/controller/getPastRecord.jsp",
            success: function (data, textStatus, jqXHR) {
                $('#ANL_viewDiv').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#ANL_viewDiv').html(errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }
    
</script>
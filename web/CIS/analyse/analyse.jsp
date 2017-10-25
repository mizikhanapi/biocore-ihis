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
                                            <option value="0">Today</option>
                                            <option value="1">Yesterday</option>
                                            <option value="7">7 Days</option>
                                            <option value="30">30 Days</option>
                                            <option value="60">60 Days</option>
                                            <option value="x">Select date</option>
                                            <option value="all">All</option>
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
                            
                            <div class="row table-guling" id="ANL_viewDiv" style="max-height: 500px; height: 100%; width: 100%; overflow-y: auto; overflow-style: panner;">
                                
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
<!-- Add Modal Start -->
<div class="modal fade" id="ANL_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="REP_modalTitle"></h3>
            </div>
            <div class="modal-body" id="REP_modalBody">

                <div class="chart-container" style="height: 100%;">
                   <canvas id="ANL_canvas" style="height: 500px;"></canvas>
                </div>
                
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
               
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
                        
<script type="text/javascript">
         
    $(function(){
        $('#ANL_searchPatient #myFormApp #ANL_idType').load('search/SearchModal.jsp #myFormApp #idType option');
    });
    
    
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
    
//    $('#ANL_viewBy').on('focus', function(){
//        var hiddenPat = $('#ANL_hidden_patientBio');
//        
//        if(hiddenPat.length < 1){
//            bootbox.alert("Search a patient first!");
//            return false;
//        }
//    });

    function ANL_gotPatient(){
        var hiddenPat = $('#ANL_hidden_patientBio');
       
        if(hiddenPat.length < 1){
            bootbox.alert("Search a patient first!");
            return false;
        }
        else{
            return true;
        }
    }
    
    $('#ANL_viewBy').on('change', function(){
        
        var howTo = $(this).val();
        $('#ANL_dateFrom').val("");
        $("#ANL_dateTo").val("");

        if (howTo === 'x') {
            $('#ANL_div_selectDate').show();
        } else {
            $('#ANL_div_selectDate').hide();
            if(ANL_gotPatient()){
                ANL_loadData();
            }           
        }
    });
    
    $('#ANL_btnSearchRecord').on('click', function(){
        
        if(ANL_gotPatient()){
            var dateFrom = $('#ANL_dateFrom').val();
            var dateTo = $('#ANL_dateTo').val();

            if(dateFrom==="" || dateTo===""){
                bootbox.alert("Please choose the dates");
            }
            else{
                ANL_loadData();
            }
        }
        
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
                            bootbox.alert("Cannot find the patient. Try different ID.");
                        }
                        else{
                            $('#ANL_div_patientBiodata').html(data);
                            $('.ANL-toggle').hide();
                            $('#ANL_div_info').show();
                            
                            $('#ANL_viewDiv').html("");
                            $('#ANL_viewBy').val("0");
                            ANL_loadData();
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
        var patArr = $('#ANL_div_patientBiodata').find('#ANL_hidden_patientBio').val().split("|");
        var data = {
            day: $('#ANL_viewBy').val(),
            from: $('#ANL_dateFrom').val(),
            to: $('#ANL_dateTo').val(),
            pmiNo: patArr[0]
        };
        //console.log(data);
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "analyse/controller/getPastRecord.jsp",
            success: function (data, textStatus, jqXHR) {
                if(data.trim()==="0"){
                    bootbox.alert("This patient has no records on the selected time.");
                    $('#ANL_viewDiv').html("");
                }
                else{
                    $('#ANL_viewDiv').html(data);
                }
                
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#ANL_viewDiv').html(errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });     
              
    }
    
    
     //-------------------graph processing-------------------------------------
        function ANL_getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++ ) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }
        
        function ANL_getUniqueColors(t)
        {
            t = parseInt(t);
            if (t < 2){
//                throw new Error("'t' must be greater than 1.");
                  var err=[];
                  err.push(ANL_hsvToRgb(360, 200, 100));
                  return err;
            }
              

            // distribute the colors evenly on
            // the hue range (the 'H' in HSV)
            var i = 360 / (t - 1);

            // hold the generated colors
            var r = [];
            var sv = 70;
            for (var x = 0; x < t; x++) {
              // alternate the s, v for more
              // contrast between the colors.
              sv = sv > 90 ? 70 : sv+10;
              r.push(ANL_hsvToRgb(i * x, sv, sv));
            }
            return r;
        }
        
        function ANL_hsvToRgb(h, s, v) {
            var r, g, b;
            var i;
            var f, p, q, t;

            // Make sure our arguments stay in-range
            h = Math.max(0, Math.min(360, h));
            s = Math.max(0, Math.min(100, s));
            v = Math.max(0, Math.min(100, v));

            // We accept saturation and value arguments from 0 to 100 because that's
            // how Photoshop represents those values. Internally, however, the
            // saturation and value are calculated from a range of 0 to 1. We make
            // That conversion here.
            s /= 100;
            v /= 100;

            if (s == 0) {
              // Achromatic (grey)
              r = g = b = v;
              return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
            }

            h /= 60; // sector 0 to 5
            i = Math.floor(h);
            f = h - i; // factorial part of h
            p = v * (1 - s);
            q = v * (1 - s * f);
            t = v * (1 - s * (1 - f));

            switch (i) {
              case 0:
                r = v;
                g = t;
                b = p;
                break;

              case 1:
                r = q;
                g = v;
                b = p;
                break;

              case 2:
                r = p;
                g = v;
                b = t;
                break;

              case 3:
                r = p;
                g = q;
                b = v;
                break;

              case 4:
                r = t;
                g = p;
                b = v;
                break;

              default: // case 5:
                r = v;
                g = p;
                b = q;
            }

            return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
         }
        
        $('#ANL_viewDiv').on('click', '#ANL_btnGraph', function(){
            
            Chart.helpers.each(Chart.instances, function(instance){
                instance.destroy();
             });
            
            createScreenLoading();
            var dataArr = $(this).closest('td').find('.hidden');
            var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
            $('#ANL_canvas').html("");
            var canvas = $('#ANL_canvas');
                       
            var lhrData = [];
            var lhrLabel = [];
            var lhrColour = [];
            
            var intT = 0;
            
            dataArr.each(function(){
                var tempArr = $(this).text().split("|");
                lhrLabel.push(tempArr[1]);
                lhrData.push(tempArr[2]);
                intT++;
                //lhrColour.push(ANL_getRandomColor());
            });
            console.log(intT);
            var lhrColourTemp = ANL_getUniqueColors(intT);
            console.log(lhrColourTemp.length);
            
            for(var tempI=0; tempI<lhrColourTemp.length; tempI++){
                 var strRGBA = "rgba("+lhrColourTemp[tempI][0]+", "+lhrColourTemp[tempI][1]+", "+lhrColourTemp[tempI][2]+", 0.5)";
                lhrColour.push(strRGBA);
            }
            
            
            new Chart(canvas,
            {
                type:"bar",
                data:{
                    labels:lhrLabel,
                    datasets:[{
                            label:"Frequency",
                            data:lhrData,
                            fill:false,
                            backgroundColor:lhrColour,
                            borderColor:lhrColour,
                            borderWidth:1
                        }]
                },
                options: { 
                    legend: {
                        display: false,
                        position: 'top',
                        labels: {
                          boxWidth: 40,
                          fontColor: 'black'
                        }
                    },
                    scales:{
                        yAxes:[{
                                ticks:{beginAtZero:true}
                            }],
                        xAxes: [{
                            maxBarThickness: 30,
                            categoryPercentage: 0.5,
                            barPercentage: 1,
                            stacked: false,
                            beginAtZero: true,
                            scaleLabel: {
                                labelString: 'Description'
                            },
                            ticks: {
                                stepSize: 1,
                                min: 0,
                                autoSkip: false
                            }
                        }]
                    },
                    title: {
                        display: true,
                        fontSize: 20,
                        fontFamily: 'Arial',
                        text: chartTitle
                    }
                }
            });
            
            $('#ANL_modal').modal('show');
            destroyScreenLoading();
                        
        });
        
        $('#ANL_viewDiv').on('click', '#ANL_btnGraphLine', function(){
            Chart.helpers.each(Chart.instances, function(instance){
                instance.destroy();
             });
            
            createScreenLoading();
            var dataArr = $(this).closest('td').find('.hidden');
            var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
            $('#ANL_canvas').html("");
            var canvas = $('#ANL_canvas');
            
            var lhrData = [];
            var lhrLabel = [];
            
            
            dataArr.each(function(){
                var tempArr = $(this).text().split("|");
                lhrLabel.push(tempArr[4]);
                lhrData.push(tempArr[3]);
                
                
            });
            
            
            var dataReading = {
                label: chartTitle,
                data: lhrData,
                lineTension: 0.3,
                fill: false,
                borderColor: 'purple',
                backgroundColor: 'transparent',
                pointBorderColor: 'purple',
                pointBackgroundColor: 'purple',
                pointRadius: 5,
                pointHoverRadius: 10,
                pointHitRadius: 30,
                pointBorderWidth: 2,
                yAxisID: "y-axis-1"
              };

              var chartOptions = {
                  legend: {
                    display: false,
                    position: 'top',
                    labels: {
                      boxWidth: 40,
                      fontColor: 'black'
                    }
                  },
                  title: {
                        display: true,
                        fontSize: 20,
                        fontFamily: 'Arial',
                        text: chartTitle
                   },
                  tooltips: {
                      mode: 'index',
                      intersect: true
                  },
                  responsive: true,
                  scales: {
                        yAxes: [{
                            type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: "left",
                            id: "y-axis-1"
                        }]
                    }
                };

            var speedData = {
              labels: lhrLabel,
              datasets: [dataReading]
            };


            var lineChart = new Chart(canvas, {
              type: 'line',
              data: speedData,
              options: chartOptions
            });
            
            $('#ANL_modal').modal('show');
            destroyScreenLoading();
            
        });
    
</script>
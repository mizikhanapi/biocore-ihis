<%-- 
    Document   : sessionMain
    Created on : Apr 16, 2017, 1:01:47 AM
    Author     : user
--%>

<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    SESSION MANAGEMENT

</h4>

<!--<div class="col-md-12">  start of user id information -->


    <div class="col-md-6 margin1" >
        <form class="form-horizontal" autocomplete="off" style="width: 60%; margin: 0 auto" id="SS_form">
            <!-- Text input-->
            <div class="form-group" >
                <label class="col-md-4 control-label" for="textinput">Health Facility</label>
                <div class="col-md-8">
                    <input id="SS_hfc" type="text" placeholder="Search health facility" class="form-control input-md" >
                    <div id="SS_hfc_match" class="search-drop"></div>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Discipline</label>
                <div class="col-md-8">
                    <input id="SS_discipline"  type="text"  placeholder="Search discipline"   class="form-control input-md" >
                    <div id="SS_discipline_match" class="search-drop"></div>
                </div>
            </div>



            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Subdiscipline</label>
                <div class="col-md-8">
                    <input id="SS_subdiscipline"  type="text" placeholder="Search subdiscipline" class="form-control input-md" >
                    <div id="SS_subdiscipline_match" class="search-drop"></div>

                </div>
            </div>
        </form>
        <div class="col-md-12">
            <br/>
            <div class="text-center">
                <button id="SS_btnChange" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Change</button>
                <button id="SS_btnClear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
            </div>
        </div>
    </div>
<!--</div>  end of user id information -->

<script type="text/javascript">
    $(function(){
        
        //------------------ global variable ---------------------------------
        
        var isHFCSelected = false;
        var selectedHFC = '';
        
        var isDiscSelected = false;
        var selectedDisc = '';
        
        var isSubdiscSelected = false;
        var selectedSubdisc = '';
        
        //===================================================================
        
        
//------------------------ search hfc ----------------------------------        
        $('#SS_hfc').on('keyup', function(){
            var input = $(this).val();
            if(input.length > 0){
                
                var data= {
                    process: 'hfc',
                    input: input
                };
                $('#SS_hfc_match').html('<img src="img/ajax-loader.gif">');
                
                $.ajax({
                    type: 'POST',
                    url: 'controller/session_search.jsp',
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        $('#SS_hfc_match').html(data);
                        $('#SS_hfc_matchlist li').on('click', function () { // When click on an element in the list
                            // Update the field with the new element
                            $('#SS_hfc').val($(this).text());
                            $('#SS_hfc_match').html(''); // Clear the <div id="PM_match_system"></div>

                            isHFCSelected = true;
                            selectedHFC = $('#SS_hfc').val();
                            
                            $('#SS_discipline').val('');
                            $('#SS_subdiscipline').val('');

                        });
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#SS_hfc_match').html('Opps! ' +errorThrown);
                    }
                });
                
            }else{
                $('#SS_hfc_match').html('');
            }
        });
        //==============================================================================
        
        
        //------------------------------ search discipline -----------------------------
        $('#SS_discipline').on('keyup', function(){
            var input = $(this).val();
            
            if(isHFCSelected === false || selectedHFC !== $('#SS_hfc').val()){
                bootbox.alert('Fill in health facility first');
                $(this).val('');
            }
            else if(input.length > 0){
                
                var arrayData = selectedHFC.split('|');
                var hfc_cd = arrayData[0].trim();
                //console.log(hfc_cd);
                
                var data= {
                    process: 'discipline',
                    input: input,
                    hfc_cd: hfc_cd
                    
                };
                $('#SS_discipline_match').html('<img src="img/ajax-loader.gif">');
                
                $.ajax({
                    type: 'POST',
                    url: 'controller/session_search.jsp',
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        $('#SS_discipline_match').html(data);
                        $('#SS_discipline_matchlist li').on('click', function () { // When click on an element in the list
                            // Update the field with the new element
                            $('#SS_discipline').val($(this).text());
                            $('#SS_discipline_match').html(''); // Clear the <div id="PM_match_system"></div>

                            isDiscSelected = true;
                            selectedDisc = $('#SS_discipline').val();
                            
                            $('#SS_subdiscipline').val('');

                        });
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#SS_discipline_match').html('Opps! ' +errorThrown);
                    }
                });
                
            }else{
                $('#SS_discipline_match').html('');
            }
        });
        //===============================================================================================
        
         //------------------------------ search subdiscipline -----------------------------
        $('#SS_subdiscipline').on('keyup', function(){
            var input = $(this).val();
            
            if(isDiscSelected === false || selectedDisc !== $('#SS_discipline').val()){
                bootbox.alert('Fill in discipline first!');
                $(this).val('');
            }
            else if(input.length > 0){
                
                var arrayData = selectedHFC.split('|');
                var hfc_cd = arrayData[0].trim();
                
                arrayData = selectedDisc.split('|');
                var discipline_cd = arrayData[0].trim();
                //console.log(hfc_cd);
                
                var data= {
                    process: 'subdiscipline',
                    input: input,
                    hfc_cd: hfc_cd,
                    discipline_cd: discipline_cd
                    
                };
                $('#SS_subdiscipline_match').html('<img src="img/ajax-loader.gif">');
                
                $.ajax({
                    type: 'POST',
                    url: 'controller/session_search.jsp',
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        $('#SS_subdiscipline_match').html(data);
                        $('#SS_subdiscipline_matchlist li').on('click', function () { // When click on an element in the list
                            // Update the field with the new element
                            $('#SS_subdiscipline').val($(this).text());
                            $('#SS_subdiscipline_match').html(''); // Clear the <div id="PM_match_system"></div>

                            isSubdiscSelected = true;
                            selectedSubdisc = $('#SS_subdiscipline').val();
                            
                            
                        });
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#SS_subdiscipline_match').html('Opps! ' +errorThrown);
                    }
                });
                
            }else{
                $('#SS_subdiscipline_match').html('');
            }
        });
        //===============================================================================================
        
        $('#SS_btnClear').on('click', function(){
            $('#SS_form')[0].reset();
        });
        
        //-------------------------- change session value ---------------------------------
        $('#SS_btnChange').on('click', function(){
            if(isHFCSelected === false || selectedHFC !== $('#SS_hfc').val()){
                bootbox.alert('Choose existing health facility');
                $('#SS_hfc').val('');
                $('#SS_discipline').val('');
                $('#SS_subdiscipline').val('');
                
            }else if(isDiscSelected === false || selectedDisc !== $('#SS_discipline').val()){
                bootbox.alert('Choose existing discipline');
                $('#SS_discipline').val('');
                $('#SS_subdiscipline').val('');
                
            }else if(isSubdiscSelected === false || selectedSubdisc !== $('#SS_subdiscipline').val()){
                bootbox.alert('Choose existing subdiscipline');
                $('#SS_subdiscipline').val('');
                
            }else{
                
                var arrayData = selectedHFC.split('|');
                var hfc_cd = arrayData[0].trim();
                var hfc_name = arrayData[1].trim();
                
                arrayData = selectedDisc.split('|');
                var discipline_cd = arrayData[0].trim();
                var discipline_name = arrayData[1].trim();
                
                arrayData = selectedSubdisc.split('|');
                var subdiscipline_cd = arrayData[0].trim();
                var subdiscipline_name = arrayData[1].trim();
                
                var data = {
                    hfc_cd: hfc_cd,
                    hfc_name: hfc_name,
                    discipline_cd: discipline_cd,
                    discipline_name: discipline_name,
                    subdiscipline_cd: subdiscipline_cd,
                    subdiscipline_name: subdiscipline_name
                };
                $('<div class="laoding">Loading</div>').appendTo('body');
                
                 $.ajax({
                     type: 'POST',
                     url: 'controller/session_process.jsp',
                     data: data,
                     success: function (data, textStatus, jqXHR) {
                         if(data.trim()==='success'){
                            bootbox.alert('Session variable is changed', function(){
                                location.reload(true);
                            });
                            
                         }   
                        $("#SS_form")[0].reset();
                         
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert('Opps! '+errorThrown);
                    },
                    complete: function (jqXHR, textStatus ) {
                        $('.loading').hide();
                }
                     
                 });
            }
        });
        //==============================================================
        
    });
</script>
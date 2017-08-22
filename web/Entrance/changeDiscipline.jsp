<%-- 
    Document   : changeDiscipline
    Created on : Aug 22, 2017, 4:54:20 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com
--%>

<h4 class="text-center">Discipline &AMP; Subdiscipline:</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="C_form">

    <!-- Text input-->
    <div class="form-group" >
        <label class="col-md-8 control-label" for="textinput">Current discipline: <%= (String) session.getAttribute("DISCIPLINE_NAME")%></label>
        
    </div>

    <!-- Text input-->
    <div class="form-group" >
        <label class="col-md-8 control-label" for="textinput">Current subdiscipline: <%= (String) session.getAttribute("SUB_DISCIPLINE_NAME")%></label>
        
    </div>

    <br>
    
    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">New discipline:</label>
        <div class="col-md-4">
            <select id="CD_selectDis" class="form-control">
                <option selected disabled value="">-- Select discipline --</option>
            </select>

        </div>
    </div>
    
    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">New subdiscipline:</label>
        <div class="col-md-4">
            <select id="CD_selectSub" class="form-control">
                <option selected disabled>-- Select subdiscipline --</option>
            </select>

        </div>
    </div>


</form>
<div class="col-md-12">
    <br/>
    <div class="text-center">
        <button id="CD_btnChange" name="button1id" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Change</button>
        <!--<button id="btnClear" name="button2id" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>-->
    </div>
</div>

<script type="text/javascript">
    $(function(){
        CD_createDisList();
    });
    
    // ----------------- retrieve list of discipline from database ---------------------
    function CD_createDisList(){
        var data={type:"dis"};
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "control/discipline_subdis_list.jsp",
            data: data,
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#CD_selectDis').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oopps! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
    //----------------- retrieve subdiscipline from database
    function CD_createSubList(){
        var dis= $('#CD_selectDis').val();
        var data={
            type:"sub",
            dis:dis
        };
        
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "control/discipline_subdis_list.jsp",
            data: data,
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#CD_selectSub').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oopps! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
    $('#CD_selectDis').on('change', function(){
        var dis = $(this).val();
        
        if(dis==="" || dis == null){
            return false;
        }
        else{
            CD_createSubList();
        }
    });
    
    //change subdiscipline on click
    $('#CD_btnChange').on('click', function(){
       var dis = $('#CD_selectDis').val();
       var sub = $('#CD_selectSub').val();
       
       if(dis==="" || dis==null){
           bootbox.alert("Please select existing discipline!");
       }
       else if(sub==="" || sub==null){
           bootbox.alert("Please select existing subdiscipline!");
       }
       else{
          var disName = $("#CD_selectDis option:selected").text();
          var subName = $("#CD_selectSub option:selected").text();
          
          var data={
              disCD:dis,
              disName: disName,
              subCD: sub,
              subName: subName
          };
          
          createScreenLoading();
          
          $.ajax({
              type: 'POST',
              url: "control/process_change_dis.jsp",
              timeout: 60000,
              data: data,
              success: function (data, textStatus, jqXHR) {
                        if(data.trim()==="success"){
                             bootbox.alert("Discipline and subdiscipline is changed!", function(){
                                location.reload(true);
                                $('.nav-tabs a[href="##PR_tab4"]').tab('show');
                            });
                        }
                        else{
                            bootbox.alert("Failed to change discipline and subdiscipline.");
                        }
                    },
              error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oopps! "+errorThrown);
                    },
              complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                        
                }
          });
          
       }
    });

</script>
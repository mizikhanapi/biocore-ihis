<%-- 
    Document   : setting_PMS
    Created on : Jun 15, 2017, 6:57:00 PM
    Author     : user
--%>

<%
    String param = (String) session.getAttribute("CS_PARAM");
    String  disS="" , subdisS="";
    
    if(param.equalsIgnoreCase("1")){
        disS = "checked";
    }
    else{
        subdisS = "checked";
    }
%>

<h4 class="text-left">Calling System Filter type :</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="CS_form">

    <!-- Text input-->
    <div class="form-group">
        <p>
            <input type="radio" name="CS_type" value="1" <%=disS%>>
            <label>Discipline Only</label>
        </p>
       
        <p>
            <input type="radio" name="CS_type" value="0" <%=subdisS%>>
            <label>Discipline + Sub Discipline</label>
        </p>
       
    </div>

   


</form>
<div class="col-md-8">
    <br/>
    <div class="text-center">
        <button id="CS_btnSave" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
        
    </div>
</div>

<script type="text/javascript">
    
    //---------------- saving pms setting --------------
    $('#CS_btnSave').on('click', function(){
        var CSType = $('input[name=CS_type]:checked').val();
        
        if(CSType == null){
            bootbox.alert("Please choose an option.");
        }
        else{
            var data = {type: CSType};
            $.ajax({
                url: 'controller/cs_setting_process.jsp',
                type: 'POST',
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim() === 'success'){
                            bootbox.alert("Calling System setting is saved.");
                        }
                        else if(data.trim() === 'fail'){
                            bootbox.alert("Failed to save Calling System setting.");
                        }
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+ errorThrown);
                    }
            });
        }
    });
    //===================================================
    
</script>

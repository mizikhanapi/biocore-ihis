<%-- 
    Document   : setting_PMS
    Created on : Jun 15, 2017, 6:57:00 PM
    Author     : user
--%>

<%
    String param = (String) session.getAttribute("SYSTEM_PARAMETER");
    String UM ="", PP="";
    
    if(param.equalsIgnoreCase("1")){
        UM = "checked";
    }
    else{
        PP = "checked";
    }
%>

<h4 class="text-left">Hospital type:</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="PMS_form">

    <!-- Text input-->
    <div class="form-group">
        <p>
            <input type="radio" name="PMS_type" value="1" <%=UM%>>
            <label>University/Military Hospital</label>
        </p>
       
        <p>
            <input type="radio" name="PMS_type" value="0" <%=PP%>>
            <label>Public/Private University Hospital</label>
        </p>
       
    </div>

   


</form>
<div class="col-md-8">
    <br/>
    <div class="text-center">
        <button id="PMS_btnSave" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
        
    </div>
</div>

<script type="text/javascript">
    
    //---------------- saving pms setting --------------
    $('#PMS_btnSave').on('click', function(){
        var pmsType = $('input[name=PMS_type]:checked').val();
        
        if(pmsType == null){
            bootbox.alert("Please choose an option.");
        }
        else{
            var data = {type: pmsType};
            $.ajax({
                url: 'controller/pms_setting_process.jsp',
                type: 'POST',
                data: data,
                success: function (data, textStatus, jqXHR) {
                        if(data.trim() === 'success'){
                            bootbox.alert("PMS setting is saved.");
                        }
                        else if(data.trim() === 'fail'){
                            bootbox.alert("Failed to save PMS setting.");
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

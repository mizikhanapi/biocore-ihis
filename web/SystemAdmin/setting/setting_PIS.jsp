<%-- 
    Document   : setting_PIS
    Created on : Nov 2, 2018, 2:07:59 AM
    Author     : user
--%>

<%
    String param = (String) session.getAttribute("PIS_PARAM");
    String NeedScreening = "", NoNeedScreening = "";

    if (param.equalsIgnoreCase("1")) {
        NoNeedScreening = "checked";
    } else {
        NeedScreening = "checked";
    }
%>

<h4 class="text-left">Pharmacy Dispense Process :</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="PMS_form">

    <!-- Text input-->
    <div class="form-group">
        <p>
            <input type="radio" name="PIS_type" value="2" <%=NeedScreening%>>
            <label>Screening Enabled</label>
        </p>

        <p>
            <input type="radio" name="PIS_type" value="1" <%=NoNeedScreening%>>
            <label>Screening Disabled</label>
        </p>

    </div>




</form>
<div class="col-md-8">
    <br/>
    <div class="text-center">
        <button id="PIS_btnSave" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>

    </div>
</div>

            
<script type="text/javascript">

    //---------------- saving pis setting --------------
    
    $('#PIS_btnSave').on('click', function () {
        
        var pisType = $('input[name=PIS_type]:checked').val();

        if (pisType == null) {
            
            bootbox.alert("Please choose an option for PIS Setting !!!");
            
        } else {
            
            createScreenLoading();
            
            var data = {
                type: pisType
            };
            
            $.ajax({
                url: 'setting/control/pis_setting_process.jsp',
                type: 'POST',
                data: data,
                success: function (data, textStatus, jqXHR) {
                    
                    if (data.trim() === 'success') {
                        bootbox.alert("PIS setting is saved.");
                    } else if (data.trim() === 'fail') {
                        bootbox.alert("Failed to save PIS setting.");
                    }
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Oops! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
            
        }
        
    });
    
    //===================================================

</script>

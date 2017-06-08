<%-- 
    Document   : setting_CIS
    Created on : Jun 7, 2017, 2:34:02 PM
    Author     : user
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%
    String CISLongString = (String) session.getAttribute("CIS_PARAM");
    
    ArrayList<String> params = new ArrayList<String>(Arrays.asList(CISLongString.split("\\|"))) ;
    
    String DCG = "", DGS ="", CCN ="";
    
    if(params.contains("DCG"))
        DCG = "checked";
    
    if(params.contains("DGS"))
        DGS = "checked";
    
    if(params.contains("CCN"))
        CCN = "checked";
%>

<h4 class="text-left">Before discharge:</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="CIS_form">

    <!-- Text input-->
    <div class="form-group">
        <p>
            <input type="checkbox" id="CCN" <%= CCN%>>
            <label  for="CCN">Required to complete the Chief Complain before discharge</label>
        </p>
       
        <p>
            <input type="checkbox" id="DGS" <%= DGS%>>
            <label  for="DGS">Required to complete the Diagnosis before discharge</label>
        </p>
        
        <p>
            <input type="checkbox" id="DCG" <%= DCG%>>
            <label  for="DCG">Required to complete the Discharge Summary before discharge</label>
        </p>
    </div>

   


</form>
<div class="col-md-8">
    <br/>
    <div class="text-center">
        <button id="CIS_btnSave" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
        <!--<button id="btnClear" name="button2id" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>-->
    </div>
</div>

<script type="text/javascript">
    $('#CIS_btnSave').on('click', function(){
        
        var dgs = '0', dcg = '0', ccn = '0';
        
        if($('#DGS').is(":checked")){
            dgs = '1';
        }
        
        if($('#DCG').is(":checked")){
            dcg = '1';
        }
        
        if($('#CCN').is(":checked")){
            ccn = '1';
        }
        
        //console.log(dgs + dcg + ccn);
        
        var data = {
            DGS: dgs,
            DCG: dcg,
            CCN: ccn
        };
        
        $.ajax({
            type: 'POST',
            url: 'controller/setting_CIS_process.jsp',
            data: data,
            success: function (data, textStatus, jqXHR) {
                        if(data.trim() === 'success'){
                            bootbox.alert('CIS settings are saved.');
                        }
                        else{
                            bootbox.alert('Failed to save CIS settings');
                        }
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert('Oops! '+ errorThrown);
                    }
        });
    });
</script>
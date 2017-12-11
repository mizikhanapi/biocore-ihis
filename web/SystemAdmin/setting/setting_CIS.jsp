<%-- 
    Document   : setting_CIS
    Created on : Jun 7, 2017, 2:34:02 PM
    Author     : user
--%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%
    String CISLongString = (String) session.getAttribute("CIS_PARAM");
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);

    ArrayList<String> params = new ArrayList<String>(Arrays.asList(CISLongString.split("\\|")));

    String DCG = "", DGS = "", CCN = "";

    if (params.contains("DCG")) {
        DCG = "checked";
    }

    if (params.contains("DGS")) {
        DGS = "checked";
    }

    if (params.contains("CCN")) {
        CCN = "checked";
    }
    
    //DRUG ORDER setting
    //get the setting from adm_system_param accroding to hfc, module and param code
    // system_code for CIS is 02
    //param code for drug order is DRG_ORD
    //if the setting not found, set default which is 2 -> allow drug order above reorder level
    Conn con = new Conn();
    String query= "Select status from adm_system_parameter where hfc_cd='"+hfc_cd+"' and system_code='02' and parameter_code='DRG_ORD';";
    ArrayList<ArrayList<String>> dataDRG = con.getData(query);
    
    String statDRG = "2";
    if(dataDRG.size()>0){
        statDRG = dataDRG.get(0).get(0);
    }
    
    String drg_0="", drg_1="", drg_2="";
    if(statDRG.equals("2")){
        drg_2="checked";
    }
    else if(statDRG.equals("1")){
        drg_1="checked";
    }
    else{
        drg_0="checked";
    }
%>
<div class="row">
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
</div>
<hr/>
<div class="row">
    <h4 class="text-left">Drug Order:</h4>
    <form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="CIS_DRG_form">

        <!-- Text input-->
        <div class="form-group">
            <p>
                <input type="radio" name="DRG_ord" value="2" <%=drg_2%>>
                <label>Allow drug order if quantity is above or equal to reorder level</label>
            </p>

            <p>
                <input type="radio" name="DRG_ord" value="1" <%=drg_1%>>
                <label>Allow drug order if quantity is above or equal to minimum level</label>
            </p>
            
            <p>
                <input type="radio" name="DRG_ord" value="0" <%=drg_0%>>
                <label>Allow drug order if quantity is more than 0</label>
            </p>

        </div>



    </form>
    <div class="col-md-8">
        <br/>
        <div class="text-center">
            <button id="CIS_DRG_btnSave" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
            <!--<button id="btnClear" name="button2id" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>-->
        </div>
    </div>
</div>


<script type="text/javascript">
    $('#CIS_btnSave').on('click', function () {

        var dgs = '0', dcg = '0', ccn = '0';

        if ($('#DGS').is(":checked")) {
            dgs = '1';
        }

        if ($('#DCG').is(":checked")) {
            dcg = '1';
        }

        if ($('#CCN').is(":checked")) {
            ccn = '1';
        }

        //console.log(dgs + dcg + ccn);

        var data = {
            DGS: dgs,
            DCG: dcg,
            CCN: ccn
        };
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: 'setting/control/setting_CIS_process.jsp',
            data: data,
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    bootbox.alert('CIS settings are saved.');
                } else {
                    bootbox.alert('Failed to save CIS settings');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert('Oops! ' + errorThrown);
            },
            complete: function (jqXHR, textStatus ) {
                    destroyScreenLoading();
                }
        });
    });
    
    
    $('#CIS_DRG_btnSave').on('click', function(){
        var DRG_type = $('input[name=DRG_ord]:checked').val();
        
        if(DRG_type == null){
            bootbox.alert("Please choose an option for drug order.");
        }
        else{
            
            var data ={
                status : DRG_type
            };
            createScreenLoading();
            $.ajax({
                type: 'POST',
                data: data,
                dataType: 'json',
                url: "setting/control/cis_drg_setting.jsp",
                timeout: 60000,
                success: function (data, textStatus, jqXHR) {
                        if(data.valid){
                            bootbox.alert(data.msg);
                        }
                        else{
                            bootbox.alert(data.msg);
                        }
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
            });
        }
    });
</script>
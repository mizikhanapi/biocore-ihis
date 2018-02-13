<%-- 
    Document   : CIS0200013
    Created on : Nov 3, 2017, 6:17:16 PM
    Author     : -D-
--%>

<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                                          0                 1
    String sql_reactivity = "SELECT `Detail_Reference_code`,`Description` FROM adm_lookup_detail WHERE `Master_Reference_code` = '0111' AND hfc_cd = '"+hfc_cd+"'";
    ArrayList<ArrayList<String>> data_reactivity = Conn.getData(sql_reactivity);
%>
<div class="modal fade" id="CIS020013" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Pupil Size Reaction</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-12">
        
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput"></label>
                                <div class="col-md-12">

                                    <p style="text-align: center; font-weight: 500; margin-bottom: 0px;">Pupil Scale<br/>(mm)</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <input class="hidden" id="pupil-ID">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Left</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="quant[1]" class="form-control input-number" value="1" min="1" max="10" id="cis-vts-left_pupil" placeholder="mm">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[1]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Right</label>
                                <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" disabled="disabled" data-type="minus" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-minus"></span>
                                            </button>
                                        </span>
                                        <input type="text" name="quant[2]" class="form-control input-number" value="1" min="1" max="10" id="cis-vts-right_pupil" placeholder="mm">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default btn-number" data-type="plus" data-field="quant[2]">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">

                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput"></label>
                                <div class="col-md-12">

                                    <p style="text-align: center; font-weight: 500; margin-bottom: 0px;"><b>Reactivity to Light</b> <br/></p>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-lg-6 col-md-6">
                            <label>Left Eye </label>
                            <div class="form-group">
                                <select name="cis-vts-left-reactivity" id="cis-vts-left-reactivity" class="form-control input-lg">
                                    <option value="">-Select Reactivity-</option>
                                    <%
                                        for(int i = 0; i<data_reactivity.size();i++){
                                            %>
                                            <option value="<%out.print(data_reactivity.get(i).get(1));%>"><%out.print(data_reactivity.get(i).get(1));%></option>
                                    <%
                                        }
                                        
                                        %>

                                </select>
                            </div>
                        </div>
                                        <div class="col-lg-6 col-md-6">
                                            <label>Right Eye</label>
                                            <div class="form-group">
                                                <select name="cis-vts-right-reactivity" id="cis-vts-right-reactivity" class="form-control input-lg">
                                                    <option value="">-Select Reactivity-</option>
                                                    <%                                        for (int i = 0; i < data_reactivity.size(); i++) {
                                                    %>
                                                    <option value="<%out.print(data_reactivity.get(i).get(1));%>"><%out.print(data_reactivity.get(i).get(1));%></option>
                                                    <%
                                                        }

                                                    %>

                                                </select>
                                            </div>
                                        </div>

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput"></label>
                                <div class="col-md-12">
                                    <img src="img/Pupil-Scale-(mm).jpg" alt="Pupil Scale" style="width: 100%;" />
                                    <p style="text-align: center; font-weight: 500; margin-bottom: 0px;">Pupil Scale<br/>(mm)</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer vts-pupil-add">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btn_CIS_VTS_Pupil_ADD" role="button">Add</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer vts-pupil-update">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btn_CIS_VTS_Pupil_UPDATE" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$('.btn-number').click(function(e){
    e.preventDefault();
    
    fieldName = $(this).attr('data-field');
    type      = $(this).attr('data-type');
    var input = $("input[name='"+fieldName+"']");
    var currentVal = parseInt(input.val());
    if (!isNaN(currentVal)) {
        if(type == 'minus') {
            
            if(currentVal > input.attr('min')) {
                input.val(currentVal - 1).change();
            } 
            if(parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('max')) {
                input.val(currentVal + 1).change();
            }
            if(parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
});
$('.input-number').focusin(function(){
   $(this).data('oldValue', $(this).val());
});
$('.input-number').change(function() {
    
    minValue =  parseInt($(this).attr('min'));
    maxValue =  parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());
    
    name = $(this).attr('name');
    if(valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    
    
});
$(".input-number").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) || 
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
</script>
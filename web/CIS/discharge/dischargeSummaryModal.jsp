<%-- 
    Document   : CIS020001
    Created on : Jan 31, 2017, 9:55:20 AM
    Author     : -D-
--%>

<%
    String sqlDischargeDisposition = "select Detail_Reference_code,Description from adm_lookup_detail where Master_Reference_code = '0098' AND hfc_cd = '" + hfc_cd + "' order by priority_indicator ASC";
    ArrayList<ArrayList<String>> dataDischargeDisposition = Conn.getData(sqlDischargeDisposition);

%>
<!-- Modal -->
<div class="modal fade" id="mCIS_Discharge_Summary" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg"  id="mainModal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Order To Discharge</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <h4 class="modal-title modalTextLabel">Discharge Summary Details</h4>
                </div>
                <input class="form-control input-lg" type="hidden" name="tCIS_DCGHFCOrderDetail" id="tCIS_DCGHFCOrderDetail" placeholder="" >
                <input class="form-control input-lg" type="hidden" name="tCIS_DCGHFCProviderDetail" id="tCIS_DCGHFCProviderDetail" placeholder="" >
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Date</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="tCIS_DCGDate" id="tCIS_DCGDate" placeholder="DD-MM-YYYY" >
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Time</label>
                            <div class="col-md-12">
                                <input class="form-control input-lg" type="text" name="tCIS_DCGTime" id="tCIS_DCGTime" placeholder="">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-6 control-label" for="textinput">Disposition</label>
                            <div class="col-md-12">
                                <select id="tCIS_DCGDisposition" class="form-control input-lg">
                                    <option disabled="" >Please select Priority...</option>
                                    <%                                            if (dataDischargeDisposition.size() > 0) {
                                            for (int i = 0; i < dataDischargeDisposition.size(); i++) {
                                    %>
                                    <option value="<%out.print(dataDischargeDisposition.get(i).get(0));%>"><%out.print(dataDischargeDisposition.get(i).get(1));%></option>
                                    <%
                                            }
                                        }%>

                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <label class="col-md-6 control-label" for="textinput">Please Choose Clinical Finding as Below</label>
                    <div class="col-md-12">
                        <div id="divCIS_Discharge_Summary" style="overflow:auto; height:400px; border: 1px solid #ddd; padding: 15px 0px;">
                        </div>
                    </div>
                </div>                        

                <br/>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="tCIS_DCGComment" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
                        </div>
                    </div>
                </div>

            </div>
            <div class="modal-footer" id="actionGSC">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-block btn-lg gcsAccept " id="btnCIS_OE_DCG_SUBMIT" >Submit</a>
                    </div>

                    <div class="btn-group" role="group">
                        <button type="button" id="btnCIS_Discharge_Cancel" class="btn btn-default btn-block btn-lg"  role="button">Close</button>
                    </div>
                </div>
                </form>
            </div>


        </div>

    </div>
</div>

<!--      Update Modal-->
<div class="modal fade" id="update_mCIS_Discharge_Summary" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg"  id="mainModal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Discharge Summary</h3>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <h4 class="modal-title modalTextLabel">Discharge Summary Details</h4>
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Date</h4>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Time</h4>

                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Disposition</h4>
                        </div>
                    </div>
                    <input class="form-control input-lg" type="hidden" name="update_tCIS_DCGHFCOrderDetail" id="update_tCIS_DCGHFCOrderDetail" placeholder="" >
                    <input class="form-control input-lg" type="hidden" name="update_tCIS_DCGHFCProviderDetail" id="update_tCIS_DCGHFCProviderDetail" placeholder="" >
                </div>
                <div class="row">
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="update_tCIS_DCGDate" id="update_tCIS_DCGDate" placeholder="" >
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <div class="form-group">
                            <input class="form-control input-lg" type="text" name="update_tCIS_DCGTime" id="update_tCIS_DCGTime" placeholder="">

                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8">
                        <div class="form-group">
                            <select id="update_tCIS_DCGDisposition" class="form-control input-lg">
                                <option disabled="" >Please select Priority...</option>
                                <%
                                    if (dataDischargeDisposition.size() > 0) {
                                        for (int i = 0; i < dataDischargeDisposition.size(); i++) {
                                %>
                                <option value="<%out.print(dataDischargeDisposition.get(i).get(0));%>"><%out.print(dataDischargeDisposition.get(i).get(1));%></option>
                                <%
                                        }
                                    }%>

                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div id="update_divCIS_Discharge_Summary" style="overflow:scroll; height:400px;">
                    </div>

                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">

                        <div class="form-group">
                            <h4 class="modal-title modalTextLabel">Comments</h4>
                            <textarea type="text" name="display_name" id="update_tCIS_DCGComment" class="form-control input-lg" placeholder="" tabindex="3"></textarea>
                        </div>
                    </div>
                </div>

                <div class="modal-footer" id="actionGSC">
                    <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                        <div class="btn-group" role="group">
                            <a class="btn btn-success btn-block btn-lg gcsAccept " id="btnCIS_Update_Summary" >Update</a>
                        </div>

                        <div class="btn-group" role="group">
                            <button type="button" id="btnCIS_Update_Cancel" class="btn btn-default btn-block btn-lg"  role="button">Close</button>
                        </div>
                    </div>
                    </form>
                </div>

            </div>
        </div>

    </div>
</div>



<script type='text/javascript'>

    $(document).ready(function () {

        $("#tCIS_DCGDate").datepicker({
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            dateFormat: "dd-mm-yy"
        });
        $("#tCIS_DCGDate").datepicker("setDate", new Date());

        $('#tCIS_DCGTime').timepicker({
            timeFormat: 'H:mm ',
            interval: 60,
            minTime: '00:00',
            maxTime: '23:59',
            defaultTime: '13:00',
            startTime: '10:00',
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });

        $('#btnCIS_Discharge_Cancel').click(function () {
            $('#tblCIS_Consultation_Table').html($('#divCIS_Discharge_Summary').html());
            $('#mCIS_Discharge_Summary').modal("hide");
            $('.fa-pencil-square-o').css("display", "inline-block");
            $('.fa-times').css("display", "inline-block");

        });
        $('#btnCIS_Update_Cancel').click(function () {
          $("#update_mCIS_Discharge_Summary").modal('hide');
        });



    });


</script>
<script src="jsFunction/DischargeSummary.js" type="text/javascript"></script>
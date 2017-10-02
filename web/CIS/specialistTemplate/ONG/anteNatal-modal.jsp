<%-- 
    Document   : anteNatal-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<!-- Start Modal -->
<%
    Config.getFile_url(session);
    Config.getBase_url(request);
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String rhesus4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0017' AND hfc_cd = '" + hfc + "' and status ='0'";
    String bloodty4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0074' AND hfc_cd = '" + hfc + "' and status ='0'";
    ArrayList<ArrayList<String>> dataBloodty4, dataRhesus4;
    dataBloodty4 = conn.getData(bloodty4);
    dataRhesus4 = conn.getData(rhesus4);

%>
<div class="modal fade" id="ong-anteNatal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Blood Profile</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Blood Group</label>
                                <div class="col-md-12">
                                    <select id="BPbGroup" class="form-control">
                                        <option value="null" selected="" disabled="">Select Blood Type</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < dataBloodty4.size();i++) {%>
                                        <option value="<%=dataBloodty4.get(i).get(1)%>"><%=dataBloodty4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">ATT Injection</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BPatt">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <br/>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Rhesus Factor</label>
                                <div class="col-md-12">
                                    <select id="BPbRhesus" class="form-control">
                                <option value="null" selected="" disabled="">Select Blood Rhesus</option>
                                <option value="-">-</option>
                                <%
                                    for (int i = 0;i < dataRhesus4.size();i++) {%>
                                <option value="<%=dataRhesus4.get(i).get(1)%>"><%=dataRhesus4.get(i).get(2)%></option>
                                <%  }
                                %>
                            </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Rubella Status</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BPrubella">
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <br/>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">VDRL</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BPvdrl">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Hepatitis B Antibody</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BPhBantibody">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Hepatitis B Antigen</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BPhBantigen">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <h4>Date</h4>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">1st dose</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BP1dose">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">2nd dose</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BP2dose">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Booster</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BPbooster">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnBPAddItem" role="button">Add Items</button>
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
<!-- End Modal -->
<!-- Start Modal -->
<div class="modal fade" id="ong-anteNatal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Care Plan</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gestation Weeks</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteGestation">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Prest/Lie</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="antePrest">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <hr/>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Ultrasound</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteUltra">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">BP</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteBp">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Hb</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteHb">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">WT</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteWt">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <h4>Urine</h4>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">A</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteA">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">S</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteS">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Follow up</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteFollowUp">
                                </div>
                            </div>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnAnteAddItem" role="button">Add Items</button>
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
<!-- End Modal -->
<script>
    // function for datepicker
    $(function () {
        $('#BP1dose').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        $('#BP2dose').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        $('#BPbooster').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
    });
    
    $('#btnBPAddItem').on('click',function(){
        var bloodGroup = $('#BPbGroup').val();
        var attInjection = $('#BPatt').val();
        var rhesus = $('#BPbRhesus').val();
        var rubella = $('#BPrubella').val();
        var vdrl = $('#BPvdrl').val();
        var hepatitisAntibody = $('#BPhBantibody').val();
        var hepatitisAntigen = $('#BPhBantigen').val();
        var Fdose = $('#BP1dose').val();
        var Sdose = $('#BP2dose').val();
        var booster = $('#BPbooster').val();
        
        if (bloodGroup === "" || rhesus === "" || rubella === "") {
            bootbox.alert("please insert the compulsory item to proceed");
        }else{
            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;
            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();
            var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;
            
            var CFdose = convertDate(Fdose);
            var CSdose = convertDate(Sdose);
            var CBooster = convertDate(booster);
            
            var datas2 = pmi_no + "|" + hfc_cd1;
            var datas = datas2 + "|" + epDate + "|" + encounterDate + "|" + bloodGroup + "|" + attInjection + "|" + rhesus + "|" + rubella + "|" + vdrl + "|" + hepatitisAntibody + "|" + hepatitisAntigen + "|" + CFdose + "|" + CSdose + "|" + CBooster;

            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
                data: {datas: datas, methodName: "add"},
                success: function (databack) {
//                    getPI(datas2);
//                    getPIpreg(datas2);
                    if (databack) {
                        bootbox.alert("succes inserting");
                        $('#ong-anteNatal1').modal('hide');
                    } else {
                        bootbox.alert("fail inserting");
                    }
                }
            });
        }
    });
    
    
    $('#btnAnteAddItem').on('click',function(){
        var gestation_week = $('#anteGestation').val();
        var prest_lie = $('#antePrest').val();
        var ultrasound = $('#anteUltra').val();
        var bp = $('#anteBp').val();
        var hb = $('#anteHb').val();
        var wt = $('#anteWt').val();
        var urineA = $('#anteA').val();
        var urineS = $('#anteS').val();
        var followUp = $('#anteFollowUp').val();
        
        if (gestation_week === "" || prest_lie === "" || ultrasound === "") {
            bootbox.alert("please insert the compulsory item to proceed");
        }else{
            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;
            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();
            var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;
            
            var datas2 = pmi_no + "|" + hfc_cd1;
            var datas = datas2 + "|" + epDate + "|" + encounterDate + "|" + gestation_week + "|" + prest_lie + "|" + ultrasound + "|" + bp + "|" + hb + "|" + wt + "|" + urineA + "|" + urineS + "|" + followUp;

            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
                data: {datas: datas, methodName: "addAnte"},
                success: function (databack) {
//                    getPI(datas2);
//                    getPIpreg(datas2);
                    console.log(databack);
                    if (databack) {
                        bootbox.alert("succes inserting");
                        $('#ong-anteNatal2').modal('hide');
                    } else {
                        bootbox.alert("fail inserting");
                    }
                }
            });
            
        }
    });
</script>



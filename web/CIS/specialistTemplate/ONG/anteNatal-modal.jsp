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
    
    String rubella4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0116' AND hfc_cd = '" + hfc + "' and status ='0'";
    String cdrl4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0117' AND hfc_cd = '" + hfc + "' and status ='0'";
    String antibody4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0118' AND hfc_cd = '" + hfc + "' and status ='0'";
    String antigen4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0119' AND hfc_cd = '" + hfc + "' and status ='0'";
    
    String prestlie4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0120' AND hfc_cd = '" + hfc + "' and status ='0'";
    String a4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0121' AND hfc_cd = '" + hfc + "' and status ='0'";
    String s4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0122' AND hfc_cd = '" + hfc + "' and status ='0'";
    
    ArrayList<ArrayList<String>> dataBloodty4, dataRhesus4,datarubela4,datacdrl4,dataantibody4,dataantigen4,dataprestlie4,dataa4,datas4;
    dataBloodty4 = conn.getData(bloodty4);
    dataRhesus4 = conn.getData(rhesus4);
    datarubela4 = conn.getData(rubella4);
    datacdrl4 = conn.getData(cdrl4);
    dataantibody4 = conn.getData(antibody4);
    dataantigen4 = conn.getData(antigen4);
    
    dataprestlie4 = conn.getData(prestlie4);
    dataa4 = conn.getData(a4);
    datas4 = conn.getData(s4);

%>
<div class="modal fade" id="ong-anteNatal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog-gra" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Blood Profile</h4>
            </div>
            <div class="modal-body modal-body-pp">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <input type="hidden" id="BPkeyupdate">
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Blood Group *</label>
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
                        <div class="col-md-6 hidden">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">ATT Injection</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="BPatt" value="-">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <br/>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Rhesus Factor *</label>
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
                                <label class="col-md-12 control-label" for="textinput">Rubella Status *</label>
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="BPrubella">-->
                                    <select id="BPrubella" class="form-control">
                                        <option value="null" selected="" disabled="">Select Rubella Status</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < datarubela4.size();i++) {%>
                                        <option value="<%=datarubela4.get(i).get(2)%>"><%=datarubela4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
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
<!--                                    <input type="text" class="form-control input-md" id="BPvdrl">-->
                                    <select id="BPvdrl" class="form-control">
                                        <option value="null" selected="" disabled="">Select VDRL</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < datacdrl4.size();i++) {%>
                                        <option value="<%=datacdrl4.get(i).get(2)%>"><%=datacdrl4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Hepatitis B Antibody</label>
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="BPhBantibody">-->
                                    <select id="BPhBantibody" class="form-control">
                                        <option value="null" selected="" disabled="">Select Antibody</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < dataantibody4.size();i++) {%>
                                        <option value="<%=dataantibody4.get(i).get(2)%>"><%=dataantibody4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Hepatitis B Antigen</label>
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="BPhBantigen">-->
                                    <select id="BPhBantigen" class="form-control">
                                        <option value="null" selected="" disabled="">Select Antigen</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < dataantigen4.size();i++) {%>
                                        <option value="<%=dataantigen4.get(i).get(2)%>"><%=dataantigen4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <h4>ATT Injection</h4>
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
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnBPUpdateItem" role="button">Update Items</button>
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
    <div class="modal-dialog modal-dialog-gra" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Care Plan</h4>
            </div>
            <div class="modal-body modal-body-pp">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <input type="hidden" id="ANTEkeyupdate">
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gestation Weeks *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="anteGestation" readonly="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Prest/Lie *</label>
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="antePrest">-->
                                    <select id="antePrest" class="form-control">
                                        <option value="null" selected="" disabled="">Select Prest/Lie</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < dataprestlie4.size();i++) {%>
                                        <option value="<%=dataprestlie4.get(i).get(2)%>"><%=dataprestlie4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <hr/>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Ultrasound *</label>
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
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="anteBpSystolic" maxlength="3" placeholder="systolic">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="anteBpDiastolic" maxlength="3" placeholder="diastolic">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Hb</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md singleNumbersOnly" id="anteHb" maxlength="3">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">WT</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md decimalNumbersOnly" id="anteWt" placeholder="Weight(Kg)" maxlength="5">
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
<!--                                    <input type="text" class="form-control input-md" id="anteA">-->
                                    <select id="anteA" class="form-control">
                                        <option value="null" selected="" disabled="">Select Urine A</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < dataa4.size();i++) {%>
                                        <option value="<%=dataa4.get(i).get(2)%>"><%=dataa4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">S</label>
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="anteS">-->
                                    <select id="anteS" class="form-control">
                                        <option value="null" selected="" disabled="">Select Urine S</option>
                                        <option value="-">-</option>
                                        <% for (int i = 0;i < datas4.size();i++) {%>
                                        <option value="<%=datas4.get(i).get(2)%>"><%=datas4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
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
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnAnteUpdateItem" role="button">Update Items</button>
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
    $('#ong-anteNatal2').on('hidden.bs.modal', function (e) {
        $(this)
                .find("input,textarea,select")
                .val('')
                .end()
                .find("input[type=checkbox], input[type=radio]")
                .prop("checked", "")
                .end();
    });
    
    $('#ong-anteNatal1').on('hidden.bs.modal', function (e) {
        $(this)
                .find("input,textarea,select")
                .val('')
                .end()
                .find("input[type=checkbox], input[type=radio]")
                .prop("checked", "")
                .end();
    });
    // function for datepicker
    $(function () {
        $('#BP1dose').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        $('#BP2dose').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        $('#BPbooster').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
    });
    
        function getBP(data) {
        //console.log(data);
        $.ajax({
            type: "post",
            url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
            data: {datas: data, methodName: "getBP"},
            success: function (databack) {
                $('#divAntenatal').html(databack);
            }
        });
    }
    
    function getWeek(data){
        $.ajax({
            type: "post",
            url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
            data: {datas: data, methodName: "getWeek"},
            success: function (databack) {
                console.log(databack);
                var arraydata = databack.split("|");
                var week = arraydata[0];
                var createddate = arraydata[1];
                var araay = createddate.split("-");
                var newdate = new Date(araay[0],araay[1]-1,araay[2]);
                var today = new Date();
                var $weekDiff = Math.floor((today - newdate + 1) / (1000 * 60 * 60 * 24) / 7);
                var nweek = parseInt(week) + parseInt($weekDiff);
                $('#anteGestation').val(nweek);
                
            }
        });
    }
    
    function getAnteNatal(data) {
        //console.log(data);
        $.ajax({
            type: "post",
            url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
            data: {datas: data, methodName: "getAnte"},
            success: function (databack) {
                console.log(databack);
                $('#divAnteB #tblante tbody').html(databack);
            }
        });
    }
    
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
            
            
            var startdate = $('#startdateantenatal').val();
            var enddate = $('#enddateantenatal').val();
            if(startdate === "" || enddate === ""){
                var data3 = datas2+"|"+yy + "-" + mm + "-" + dd+"|"+yy + "-" + mm + "-" + dd;
            }else{
                var sDate = startdate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = enddate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                var data3 = datas2+"|"+SnewDate+"|"+EnewDate;
            }
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
                        getBP(data3);
                        getAnteNatal(data3);
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
        var bpSystolic = $('#anteBpSystolic').val();
        var bpDiastolic = $('#anteBpDiastolic').val();
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
            var datas = datas2 + "|" + epDate + "|" + encounterDate + "|" + gestation_week + "|" + prest_lie + "|" + ultrasound + "|" + bpSystolic + "|" + hb + "|" + wt + "|" + urineA + "|" + urineS + "|" + followUp + "|" + bpDiastolic;
            
            var startdate = $('#startdateantenatal').val();
            var enddate = $('#enddateantenatal').val();

             var startdate = $('#startdateantenatal').val();
            var enddate = $('#enddateantenatal').val();
            if(startdate === "" || enddate === ""){
                var data3 = datas2+"|"+yy + "-" + mm + "-" + dd+"|"+yy + "-" + mm + "-" + dd;
            }else{
                var sDate = startdate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = enddate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                var data3 = datas2+"|"+SnewDate+"|"+EnewDate;
            }
            
            
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
                        getBP(data3);
                        getAnteNatal(data3);
                        $('#ong-anteNatal2').modal('hide');
                    } else {
                        bootbox.alert("fail inserting");
                    }
                }
            });
            
        }
    });
    
    $('#btnBPUpdateItem').on('click',function(){
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
        var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();
        if (bloodGroup === "" || rhesus === "" || rubella === "") {
            bootbox.alert("please insert the compulsory item to proceed");
        }else{
            var key = $('#BPkeyupdate').val();
            var keySPlit = key.split("|");
            var hfc_cd1 = keySPlit[1];
            var pmi = keySPlit[0];
            
            
            var CFdose = convertDate(Fdose);
            var CSdose = convertDate(Sdose);
            var CBooster = convertDate(booster);
            
            var datas2 = pmi + "|" + hfc_cd1;
            var datas = key + "|" + bloodGroup + "|" + attInjection + "|" + rhesus + "|" + rubella + "|" + vdrl + "|" + hepatitisAntibody + "|" + hepatitisAntigen + "|" + CFdose + "|" + CSdose + "|" + CBooster;
            
            
            var startdate = $('#startdateantenatal').val();
            var enddate = $('#enddateantenatal').val();

            if(startdate === "" || enddate === ""){
                var data3 = datas2+"|"+yy + "-" + mm + "-" + dd+"|"+yy + "-" + mm + "-" + dd;
            }else{
                var sDate = startdate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = enddate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                var data3 = datas2+"|"+SnewDate+"|"+EnewDate;
            }
            //console.log(datas);
            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
                data: {datas: datas, methodName: "updateBP"},
                success: function (databack) {
                    if (databack) {
                        bootbox.alert("succes updating");
                        $('#ong-anteNatal1').modal('hide');
                        getBP(data3);
                        getAnteNatal(data3);
                    } else {
                        bootbox.alert("fail updating");
                    }
                }
            });
        }
    });
    
    $('#btnAnteUpdateItem').on('click',function(){
        var gestation_week = $('#anteGestation').val();
        var prest_lie = $('#antePrest').val();
        var ultrasound = $('#anteUltra').val();
        var bpSystolic = $('#anteBpSystolic').val();
        var bpDiastolic = $('#anteBpDiastolic').val();
        var hb = $('#anteHb').val();
        var wt = $('#anteWt').val();
        var urineA = $('#anteA').val();
        var urineS = $('#anteS').val();
        var followUp = $('#anteFollowUp').val();
        var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();
        if (gestation_week === "" || prest_lie === "" || ultrasound === "") {
            bootbox.alert("please insert the compulsory item to proceed");
        }else{
            var key = $('#ANTEkeyupdate').val();
            var keySplit = key.split("|");
            var pmi_no = keySplit[0];
            var hfc_cd1 = keySplit[1];
            
            
            var datas2 = pmi_no + "|" + hfc_cd1;
            var datas = key + "|" + gestation_week + "|" + prest_lie + "|" + ultrasound + "|" + bpSystolic + "|" + hb + "|" + wt + "|" + urineA + "|" + urineS + "|" + followUp + "|" + bpDiastolic;
            
            var startdate = $('#startdateantenatal').val();
            var enddate = $('#enddateantenatal').val();

            if(startdate === "" || enddate === ""){
                var data3 = datas2+"|"+yy + "-" + mm + "-" + dd+"|"+yy + "-" + mm + "-" + dd;
            }else{
                var sDate = startdate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = enddate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                var data3 = datas2+"|"+SnewDate+"|"+EnewDate;
            }
            
            
            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/AN_control/antenatalFunction.jsp",
                data: {datas: datas, methodName: "updateAntenatal"},
                success: function (databack) {
//                    getPI(datas2);
//                    getPIpreg(datas2);
                    console.log(databack);
                    if (databack) {
                        bootbox.alert("succes updating");
                        getBP(data3);
                        getAnteNatal(data3);
                        $('#ong-anteNatal2').modal('hide');
                    } else {
                        bootbox.alert("fail updating");
                    }
                }
            });
            
        }
    });
</script>



<%-- 
    Document   : personalDetail-modal (UI)
    Created on : May 15, 2017, 10:49:00 AM
    Author     : Mizi K
--%>
<%@page import="dBConn.Conn"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String gender4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0041' AND hfc_cd = '" + hfc + "' and status ='0'";
    String periodCycle = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0113' AND hfc_cd = '" + hfc + "' and status ='0'";
    String gestation4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0114' AND hfc_cd = '" + hfc + "' and status ='0'";
    String labourdellivery4 = "select master_reference_code,detail_reference_code,description,priority_indicator,start_date,end_date,status,created_by,created_date from adm_lookup_detail where master_reference_code = '0115' AND hfc_cd = '" + hfc + "' and status ='0'";


    ArrayList<ArrayList<String>> dataGender4,dataperiodCycle4,datagestation4,datalabourdelivery4;
    Conn Cconn = new Conn();
    dataGender4 = Cconn.getData(gender4);
    dataperiodCycle4 = Cconn.getData(periodCycle);
    datagestation4 = Cconn.getData(gestation4);
    datalabourdelivery4 = Cconn.getData(labourdellivery4);
%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Start Modal -->
<div class="modal fade" id="ong-pDetails1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog-gra" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Gravida & etc</h4>
            </div>
            <div class="modal-body modal-body-gra">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gravida *</label>
                                <div class="col-md-12">
                                    <input  class="form-control input-md numbersOnly" type="text"  maxlength="2" id="PIgravida">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Parity *</label>
                                <div class="col-md-12">
                                    <input  class="form-control input-md numbersOnly" type="text"  maxlength="2" id="PIparity">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <hr>
                        <h4>Present Pregnancy</h4>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">LMP </label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIlmp">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Current Pregnancy Week *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md numbersOnly" id="PIcpw"> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">EDD *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIedd" readonly="">
                                </div>
                            </div>
                        </div>

                        
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Scan EDD </label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIscanedd"> 
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <hr>
                        <h4>Period Cycle *</h4>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="PIperiodCycle">-->
                                    <select id="PIperiodCycle" name="selectbasic" class="form-control">
                                        <option value="null" selected disabled>Select Period Cycle</option>
                                        <option value="-">-</option>
                                        <%
                                            for (int i = 0;
                                                    i < dataperiodCycle4.size();
                                                    i++) {%>
                                        <option value="<%=dataperiodCycle4.get(i).get(2)%>"><%=dataperiodCycle4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <hr>
                        <h4>Past History</h4>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Past gynaecological History</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIgynaecologicalHistory">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Past Medical History</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIpastMedHis">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Past Surgical History</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIsurHis">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnPIadd" role="button">Add Items</button>
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

<div class="modal fade" id="ong-pDetails3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog-gra" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Previous Pregnancy</h4>
            </div>
            <div class="modal-body modal-body-pp">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Year *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md numbersOnly" id="PIyear" size="4" maxlength="4" placeholder="YYYY">
                                    <input type="hidden" class="form-control input-md" id="PIupdateKey">                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gestation *</label>
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="PIgestation" placeholder="gestation">-->
                                    <select id="PIgestation" name="selectbasic" class="form-control">
                                        <option value="null">Select Gestation</option>
                                        <option value="-">-</option>
                                        <%
                                            for (int i = 0;
                                                    i < datagestation4.size();
                                                    i++) {%>
                                        <option value="<%=datagestation4.get(i).get(2)%>"><%=datagestation4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <hr>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Place of Delivery *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md" id="PIpod" placeholder="place of delivery">
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Labour/Delivery *</label>
                                <div class="col-md-12">
<!--                                    <input type="text" class="form-control input-md" id="PIlabour" placeholder="labour/delivery">-->
                                    <select id="PIlabour" name="selectbasic" class="form-control">
                                        <option value="null">Select Labour Delivery</option>
                                        <option value="-">-</option>
                                        <%
                                            for (int i = 0;
                                                    i < datalabourdelivery4.size();
                                                    i++) {%>
                                        <option value="<%=datalabourdelivery4.get(i).get(2)%>"><%=datalabourdelivery4.get(i).get(2)%></option>
                                        <%  }
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <hr>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">WT *</label>
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-md decimalNumbersOnly" id="PIwt" placeholder="weight (Kg)" maxlength="5">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-12 control-label" for="textinput">Gender *</label>
                                <div class="col-md-12">
                                    <select id="PIgender" name="selectbasic" class="form-control">
                                        <option value="null">Select Gender</option>
                                        <option value="-">-</option>
                                        <%
                                            for (int i = 0;
                                                    i < dataGender4.size();
                                                    i++) {%>
                                        <option value="<%=dataGender4.get(i).get(1)%>"><%=dataGender4.get(i).get(2)%></option>
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
                                <div class="col-md-12">
                                    <textarea  class="form-control input-lg" placeholder="Comment..." tabindex="3" id="PIcoment"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnPIpreg" role="button">Add Items</button>
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btnPIpregUpdate" role="button" hidden="">Update Items</button>
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
//    $('#PIlmp').on('blur paste',function(){
//        var datePicked = $(this).val();
//        if(!datePicked===""){
//            var araay = datePicked.split("/");
//            var date = new Date(araay[2],araay[1]-1,araay[0]);
//            console.log("date "+date);
//            var newdate = new Date();
//            newdate.setDate(date+283.75);
//            console.log(newdate.getFullYear() + "-" + (newdate.getMonth() + 1) + "-" + newdate.getDate());
//            
//        }
//    });
    // when modal close,reset all input
    
    $('#PIcpw').on('keyup',function(){
        var A = ($(this).val() * 7);
        var B = (283.75 - A);
        var x = new Date();
        x.setDate(x.getDate()+B);
//        console.log("A "+ A);
//        console.log("B "+ B);
//        console.log("x "+ x);
        $('#PIedd').val(("0" + x.getDate()).slice(-2)+"/"+("0" + (x.getMonth() + 1)).slice(-2)+"/"+x.getFullYear());
        
    });
    
    $('#ong-pDetails1').on('hidden.bs.modal', function (e) {
        $(this)
                .find("input,textarea,select")
                .val('')
                .end()
                .find("input[type=checkbox], input[type=radio]")
                .prop("checked", "")
                .end();
    });
    $('#ong-pDetails3').on('hidden.bs.modal', function (e) {
        $(this)
                .find("input,textarea,select")
                .val('')
                .end()
                .find("input[type=checkbox], input[type=radio]")
                .prop("checked", "")
                .end();
        
        
    });
    //function for get personal detail
    function getPI(data) {
        //console.log(data);
        $.ajax({
            type: "post",
            url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
            data: {datas: data, methodName: "getPI"},
            success: function (databack) {
                $('#PIdiv').html(databack);
            }
        });
    }

    //function for get pregnancy
    function getPIpreg(data) {
        //console.log(data);
        $.ajax({
            type: "post",
            url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
            data: {datas: data, methodName: "getPIpreg"},
            success: function (databack) {
                $('#divPIpreg #tblPreg tbody').html(databack);
            }
        });
    }
    // function for datepicker
    $(function () {
        $('#PIlmp').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true,onSelect: function(date2) {
            var araay = date2.split("/");
            var newdate = new Date(araay[2],araay[1]-1,araay[0]);
            var x = new Date();
            x.setDate(newdate.getDate()+283.75);
//            console.log(newdate.getFullYear() + "-" + (newdate.getMonth() + 1) + "-" + newdate.getDate());
            $('#PIedd').val(("0" + x.getDate()).slice(-2)+"/"+("0" + (x.getMonth() + 1)).slice(-2)+"/"+x.getFullYear());
            var tday = new Date();
            var $weekDiff = Math.floor((tday - newdate + 1) / (1000 * 60 * 60 * 24) / 7);
            $('#PIcpw').val($weekDiff);
            console.log("lmp: "+ newdate);
            console.log("today: "+tday);
        }});
    
//        $('#PIedd').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        $('#PIscanedd').datepicker({dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
    });

    //function for validate numbersonly
    $('.numbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        }
    });



    // button add item for personal detail
    $('#btnPIadd').on('click', function () {
        var gravida, parity, lmp, edd, scanEdd, periodCycle, pgh, pmh, psh,cpw;
        gravida = $('#PIgravida').val();
        parity = $('#PIparity').val();
        lmp = $('#PIlmp').val();
        edd = $('#PIedd').val();
        scanEdd = $('#PIscanedd').val();
        periodCycle = $('#PIperiodCycle').val();
        pgh = $('#PIgynaecologicalHistory').val();
        pmh = $('#PIpastMedHis').val();
        psh = $('#PIsurHis').val();
        cpw = $('#PIcpw').val();
        var harini = new Date();
        var hariniyangtelahconvert = harini.getFullYear()+"-"+("0" + (harini.getMonth() + 1)).slice(-2)+"-"+("0"+ harini.getDate()).slice(-2);
        console.log(hariniyangtelahconvert);

        if (gravida === "" || parity === "" || edd === "" || periodCycle === "" || cpw ==="") {
            bootbox.alert("please insert the compulsory item to proceed");
        } else {
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
            var Clmp;
            if(lmp===""){
                Clmp = "";
            }else{
                Clmp = convertDate(lmp);
            }
            
            var Csedd;
            if(scanEdd===""){
                Csedd="";
            }else{
                Csedd = convertDate(scanEdd);
            }
            
            var Cedd = convertDate(edd);
            

            var datas2 = pmi_no + "|" + hfc_cd1;
            var datas = datas2 + "|" + epDate + "|" + encounterDate + "|" + gravida + "|" + parity + "|" + Clmp + "|" + Cedd + "|" + Csedd + "|" + periodCycle + "|" + pgh + "|" + pmh + "|" + psh + "|" + cpw + "|" + hariniyangtelahconvert;
            console.log(datas);
            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
                data: {datas: datas, methodName: "add"},
                success: function (databack) {
                    getPI(datas2);
                    getPIpreg(datas2);
                    console.log(databack);
                    if (databack) {
                        console.log(databack);
                        bootbox.alert("succes inserting");
                        $('#ong-pDetails1').modal('hide');
                    } else {
                        bootbox.alert("fail inserting");
                    }
                }
            });
        }

    });

    // button add item for personal detail pregnancy
    $('#btnPIpreg').on('click', function () {
        var pregnancyYear, gestation, place, labour, wt, gender, comment;
        pregnancyYear = $('#PIyear').val();
        gestation = $('#PIgestation').val();
        place = $('#PIpod').val();
        labour = $('#PIlabour').val();
        wt = $('#PIwt').val();
        gender = $('#PIgender').val();
        comment = $('textarea#PIcoment').val();
        console.log("pregnancyYear" + pregnancyYear);
        console.log("gestation" + gestation);
        console.log("place" + place);
        console.log("labour" + labour);
        console.log("wt" + wt);
        console.log("gender" + gender);
        console.log("comment" + comment);
        
        
        

        if (pregnancyYear === "" || gestation === "" || place === "" || labour === "" || wt === "" || gender === "null") {
            bootbox.alert("please insert the compulsory item to proceed");
        } else {
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
            var datas = datas2 + "|" + epDate + "|" + encounterDate + "|" + pregnancyYear + "|" + gestation + "|" + place + "|" + labour + "|" + wt + "|" + gender + "|" + comment;
            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
                data: {datas: datas, methodName: "addPREG"},
                success: function (databack) {
                    getPI(datas2);
                    getPIpreg(datas2);
                    if (databack) {
                        bootbox.alert("succes inserting");
                        $('#ong-pDetails3').modal('hide');
                    } else {
                        bootbox.alert("fail inserting");
                    }
                }
            });
        }

    });
    
     // button update item for personal detail pregnancy
    $('#btnPIpregUpdate').on('click', function () {
        var pregnancyYear, gestation, place, labour, wt, gender, comment;
        pregnancyYear = $('#PIyear').val();
        gestation = $('#PIgestation').val();
        place = $('#PIpod').val();
        labour = $('#PIlabour').val();
        wt = $('#PIwt').val();
        gender = $('#PIgender').val();
        comment = $('textarea#PIcoment').val();
//        console.log("pregnancyYear" + pregnancyYear);
//        console.log("gestation" + gestation);
//        console.log("place" + place);
//        console.log("labour" + labour);
//        console.log("wt" + wt);
//        console.log("gender" + gender);
//        console.log("comment" + comment);
        
        
        

        if (pregnancyYear === "" || gestation === "" || place === "" || labour === "" || wt === "" || gender === "null") {
            bootbox.alert("please insert the compulsory item to proceed");
        } else {
            var key = $('#PIupdateKey').val();
            var splitkey = key.split("|");
            var pmi_no = splitkey[0];
            var hfc_cd1 = splitkey[1];
            var epDate = splitkey[2];
            var encounterDate = splitkey[3];

            var datas2 = pmi_no + "|" + hfc_cd1;
            var datas = datas2 + "|" + epDate + "|" + encounterDate + "|" + pregnancyYear + "|" + gestation + "|" + place + "|" + labour + "|" + wt + "|" + gender + "|" + comment;
            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/PI_control/personalDetailFunction.jsp",
                data: {datas: datas, methodName: "updatePREG"},
                success: function (databack) {
                    getPI(datas2);
                    getPIpreg(datas2);
                    if (databack) {
                        bootbox.alert("succes updating");
                        $('#ong-pDetails3').modal('hide');
                    } else {
                        bootbox.alert("fail updatings");
                    }
                }
            });
        }

    });

</script>



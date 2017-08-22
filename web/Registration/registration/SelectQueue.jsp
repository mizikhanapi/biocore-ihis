<%--
Document   : SelectQueue_2
Created on : Apr 10, 2017, 4:25:40 PM
Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../Entrance/validateSession.jsp" %>

<%    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String subDis = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String Commonqueue = "select distinct queue_type,queue_name,user_id,hfc_cd,discipline_cd,start_date,end_date,sub_discipline_cd,status,created_by,created_date from pms_queue_list where queue_type='CM' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' AND sub_discipline_cd='" + subDis + "' group by queue_name; ";
    String Consultationqueue = "select distinct queue_type,queue_name,user_id,hfc_cd,discipline_cd,start_date,end_date,sub_discipline_cd,status,created_by,created_date  from pms_queue_list where queue_type='FY' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' AND sub_discipline_cd='" + subDis + "' group by queue_name;";
    String Doctorqueue = "select distinct queue_type,queue_name,user_id,hfc_cd,discipline_cd,start_date,end_date,sub_discipline_cd,status,created_by,created_date from pms_queue_list where queue_type='PN' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' AND sub_discipline_cd='" + subDis + "' group by queue_name;";

//    String Consultationqueue = "select * from pms_queue_name where queue_type='FY' and hfc_cd = '" + session.getAttribute("HEALTH_FACILITY_CODE") + "' ";
//    String Doctorqueue = "select * from pms_queue_name where queue_type='PN' and hfc_cd = '" + session.getAttribute("HEALTH_FACILITY_CODE") + "' ";
    ArrayList<ArrayList<String>> dataQueueCommon, dataQueue2Cons, dataQueue2Doc;

    dataQueueCommon = conn.getData(Commonqueue);
    dataQueue2Cons = conn.getData(Consultationqueue);
    dataQueue2Doc = conn.getData(Doctorqueue);

    String add = null, text = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Registration</title>
        <!--header-->
        <%@include file="../assets/header.html"%>
        <link  rel="stylesheet" href="../assets/css/radiobtn.css">

        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <!--        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->


        <script src="../../assets/js/jquery-ui.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>

        <link href="../assets/css/keyboard.css" rel="stylesheet">
        <link href="../assets/css/jquery-ui.min.css" rel="stylesheet">
        <script src="../assets/js/jquery.keyboard.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
        <script>

            var lang = sessionStorage.getItem('lang');
            $(function () {
                if (lang === "en") {
                    $("div[lang=ml]").css("display", 'none');
                } else if (lang === "ml") {
                    $("div[lang=en]").css("display", 'none');
                }

                $("div[lang=" + lang + "] #inputUserIC").keyboard();
            });
        </script>
        <!--header-->
    </head>
    <body>
        <div class="container-fluid m-scene" lang="ml">
            <div class="kiosk thumbnail" style="max-height: 690px; max-width: 485px;">
                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                <div class="profile-img-card" style="text-align: center;" >
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px; text-align: center;">
                    Sila masukkan Nombor IC anda
                </div>
                <br/>

                <div id="fields" style="display: block">
                    <form class="form-signin" action="dashboard.jsp">
                        <span id="reauth-email" class="reauth-email"></span>
                        <input type="text" id="inputUserIC" class="form-control" placeholder="Masukkan Nombor IC anda" name="useric">
                        <input type="text" id="inputUserName" class="form-control" placeholder="Nama awak" name="username" disabled="">


                        <div class="form-group">
                            <label class="control-label" for="selectbasic">Sila Pilih Giliran</label>
                            <!--<div class="col-md-8">-->
                            <br>      
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn active marglft" for="commonQueue">
                                    <input type="radio" id ="commonQueue" name='queuetype' value="CM"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i> <span>Perundingan</span>
                                </label>
                                <label class="btn marglft" for="consultantQueue">
                                    <input type="radio" id ="consultantQueue" name='queuetype' value="FY"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i><span>Perkhidmatan</span>
                                </label>
                                <label class="btn marglft" for="doctorQueue">
                                    <input type="radio" id ="doctorQueue" name='queuetype' value="PN"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i><span>Doktor</span>
                                </label>
                            </div>
                            <!--</div>-->
                        </div>
                        <select  id="selectedServiceQueue"  class="form-control select-full" hidden>
                            <option value="null" selected="" disabled="">Sila Pilih Giliran</option>

                            <%
                                add = null;
                                text = null;
                                for (int i = 0; i < dataQueue2Cons.size(); i++) {
                                    if (dataQueue2Cons.get(i).get(1) != "" || dataQueue2Cons.get(i).get(1) != null) {

                                        if (!dataQueue2Cons.get(i).get(1).contains("Room")) {

                            %>

                            <option value="<%=dataQueue2Cons.get(i).get(1) + "|" + dataQueue2Cons.get(i).get(2)%>"><%="(" + dataQueue2Cons.get(i).get(0) + ") " + dataQueue2Cons.get(i).get(1)%></option>
                            <%                  }
                                    }
                                }
                            %>

                        </select>

                        <select  id="selectedDoctorQueue"  class="form-control select-full">
                            <option value="null" selected="" disabled="">Sila Pilih Giliran</option>

                            <%
                                for (int i = 0; i < dataQueue2Doc.size(); i++) {
                                    if (dataQueue2Doc.get(i).get(1) != "" || dataQueue2Doc.get(i).get(1) != null) {
                            %>

                            <option value="<%=dataQueue2Doc.get(i).get(1) + "|" + dataQueue2Doc.get(i).get(2)%>"><%="(" + dataQueue2Doc.get(i).get(0) + ") " + dataQueue2Doc.get(i).get(1)%></option>
                            <%                  }
                                }
                            %>

                        </select>

                        <select  id="selectedCommonQueue"  class="form-control select-full">
                            <option value="null" selected="" disabled="">Sila Pilih Giliran</option>

                            <%
                                for (int i = 0; i < dataQueueCommon.size(); i++) {
                                    if (dataQueueCommon.get(i).get(1) != "" || dataQueueCommon.get(i).get(1) != null) {
                            %>

                            <option value="<%=dataQueueCommon.get(i).get(1) + "|" + dataQueueCommon.get(i).get(2)%>"><%="(" + dataQueueCommon.get(i).get(0) + ") " + dataQueueCommon.get(i).get(1)%></option>
                            <%                  }
                                }
                            %>

                        </select>

                    </form>
                    <div class="text-center" style=" bottom: 30px; margin: auto; position: absolute; left: 30%;">
                        <button id="registerSignup" class="btn btn-lg btn-primary">Daftar</button>
                        <button id="cancelSignup" class="btn btn-lg btn-default">Batalkan</button>
                    </div>
                </div>
                <div id="reportQueResultContent"  style="display: none; margin-top: auto">
                    <div id="reportQueResult" style="margin: auto 0;"></div>
                    <div class="text-center" style=" bottom: 30px; margin: auto; position: absolute; left: 30%;">
                        <button id="SaveQueue" class="btn btn-lg btn-success">Save</button>
                        <button id="cancelSignup" class="btn btn-lg btn-default">Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid m-scene" lang="en">
            <div class="kiosk thumbnail" style="max-height: 690px; max-width: 485px;">
                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                <div class="profile-img-card" style="text-align: center;" >
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px; text-align: center;">
                    Please Enter your IC Number
                </div>
                <br/>
                <div id="fields" style="display: block">
                    <form class="form-signin" action="dashboard.jsp">
                        <span id="reauth-email" class="reauth-email"></span>

                        <input type="text" id="inputUserIC" class="form-control" placeholder="Enter Your IC" name="useric">
                        <input type="text" id="inputUserName" class="form-control" placeholder="Your Name" name="username" disabled="">


                        <div class="form-group">
                            <label class="control-label" for="selectbasic">Please Select Queue</label>
                            <!--<div class="col-md-8">-->
                            <br>      
                            <div class="btn-group" data-toggle="buttons">
                                <label class="btn active marglft" for="commonQueue">
                                    <input type="radio" id ="commonQueue" name='queuetype' value="CM"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i> <span>Consultation</span>
                                </label>
                                <label class="btn marglft" for="consultantQueue">
                                    <input type="radio" id ="consultantQueue" name='queuetype' value="FY"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i><span>Services</span>
                                </label>
                                <label class="btn marglft" for="doctorQueue">
                                    <input type="radio" id ="doctorQueue" name='queuetype' value="PN"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x "></i><span>Doctors</span>
                                </label>
                            </div>
                            <!--</div>-->
                        </div>
                        <select  id="selectedServiceQueue"  class="form-control select-full" hidden>
                            <option value="null" selected="" disabled="">Please Select Queue</option>

                            <%
                                add = null;
                                text = null;
                                for (int i = 0; i < dataQueue2Cons.size(); i++) {
                                    if (dataQueue2Cons.get(i).get(1) != "" || dataQueue2Cons.get(i).get(1) != null) {

                                        if (!dataQueue2Cons.get(i).get(1).contains("Room")) {

                            %>

                            <option value="<%=dataQueue2Cons.get(i).get(1) + "|" + dataQueue2Cons.get(i).get(2)%>"><%="(" + dataQueue2Cons.get(i).get(0) + ") " + dataQueue2Cons.get(i).get(1)%></option>
                            <%                  }
                                    }
                                }
                            %>

                        </select>

                        <select  id="selectedDoctorQueue"  class="form-control select-full">
                            <option value="null" selected="" disabled="">Please Select Queue</option>

                            <%
                                for (int i = 0; i < dataQueue2Doc.size(); i++) {
                                    if (dataQueue2Doc.get(i).get(1) != "" || dataQueue2Doc.get(i).get(1) != null) {
                            %>

                            <option value="<%=dataQueue2Doc.get(i).get(1) + "|" + dataQueue2Doc.get(i).get(2)%>"><%="(" + dataQueue2Doc.get(i).get(0) + ") " + dataQueue2Doc.get(i).get(1)%></option>
                            <%                  }
                                }
                            %>

                        </select>

                        <select  id="selectedCommonQueue"  class="form-control select-full">
                            <option value="null" selected="" disabled="">Please Select Queue</option>

                            <%
                                for (int i = 0; i < dataQueueCommon.size(); i++) {
                                    if (dataQueueCommon.get(i).get(1) != "" || dataQueueCommon.get(i).get(1) != null) {
                            %>

                            <option value="<%=dataQueueCommon.get(i).get(1) + "|" + dataQueueCommon.get(i).get(2)%>"><%="(" + dataQueueCommon.get(i).get(0) + ") " + dataQueueCommon.get(i).get(1)%></option>
                            <%                  }
                                }
                            %>

                        </select>

                    </form>
                    <div class="text-center" style=" bottom: 30px; margin: auto; position: absolute; left: 30%;">
                        <button id="registerSignup" class="btn btn-lg btn-primary">Register</button>
                        <button id="cancelSignup" class="btn btn-lg btn-default">Cancel</button>
                    </div>
                </div>
                <div id="reportQueResultContent" style="display: none; margin-top: auto">
                    <div id="reportQueResult" style="margin: auto 0;"></div>
                    <div class="text-center" style=" bottom: 30px; margin: auto; position: absolute; left: 30%;">
                        <button id="SaveQueue" class="btn btn-lg btn-primary" >Save</button>
                        <button id="cancelSignup" class="btn btn-lg btn-default">Cancel</button>
                    </div>
                </div>

            </div>
        </div>


        <!--Script-->

        <div w3-include-html="../libraries/script.html"></div>

        <script src="../assets/js/bootbox.min.js"></script>
        <%//@include file="../assets/script.html"%>
        <script src="../assets/jquery.PrintArea.js"></script>

        <script>

            $("div[lang=" + lang + "] #selectedDoctorQueue").hide();
            $("div[lang=" + lang + "] #selectedServiceQueue").hide();
            $("div[lang=" + lang + "] #selectedCommonQueue").hide();
            var $body = $('body');
            var yyyyMMddHHmmss;
            var HHmmss;
            var yyyyMMdd;
            var ddMMyyyy;
            var timeStamp;
            var pmi_no;
            var ic_no;
            var patient_name;
            var user_id;
            var user_name;
            //function to get date 
            function getDateNow() {
                //yyyy-MM-dd HH:mm:ss
                var nowDate = new Date();
                timeStamp = nowDate;
                var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;
                //months
                var month = (nowDate.getMonth() + 1);
                if (month < 10) {
                    ZeroMonth = "0" + month;
                } else {
                    ZeroMonth = month;
                }
                //days
                var day = (nowDate.getDate());
                if (day < 10) {
                    ZeroDay = "0" + day;
                } else {
                    ZeroDay = day;
                }
                //years
                var year = (nowDate.getFullYear());
                //hours
                var hours = nowDate.getHours();
                //minutes
                var minutes = nowDate.getMinutes();
                if (minutes < 10) {
                    ZeroMinutes = "0" + minutes;
                } else {
                    ZeroMinutes = minutes;
                }
                //seconds
                var seconds = nowDate.getSeconds();
                if (seconds < 10) {
                    ZeroSeconds = "0" + seconds;
                } else {
                    ZeroSeconds = seconds;
                }
                //complete day
                yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
                HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
                yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
                ddMMyyyy = ZeroDay + "-" + ZeroMonth + "-" + year;
//                ddMMyyyyHHmmss = ZeroDay + "/" + ZeroMonth + "/" + year + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
//                HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
//                ddMMyyyy = ZeroDay + "/" + ZeroMonth + "/" + year;
            }

            //event when radio consolate is change
            $("div[lang=" + lang + "] #commonQueue").change(function () {
                changesComonClicked();
            });
            function changesComonClicked() {
//                console.log("click 2");
                $("div[lang=" + lang + "] #selectedCommonQueue").show();
                $("div[lang=" + lang + "] #selectedServiceQueue").hide();
                $("div[lang=" + lang + "] #selectedDoctorQueue").hide();
                $("div[lang=" + lang + "] #selectedDoctorQueue").val("null");
                $("div[lang=" + lang + "] #selectedCommonQueue").val("null");
                $("div[lang=" + lang + "] #selectedServiceQueue").val("null");
            }
            ;
            //event when radio doctor is change
            $("div[lang=" + lang + "] #doctorQueue").change(function () {
                changesDocClicked();
            });
            function changesDocClicked() {
//                console.log("click 1");

                $("div[lang=" + lang + "] #selectedCommonQueue").hide();
                $("div[lang=" + lang + "] #selectedServiceQueue").hide();
                $("div[lang=" + lang + "] #selectedDoctorQueue").show();
                $("div[lang=" + lang + "] #selectedDoctorQueue").val("null");
                $("div[lang=" + lang + "] #selectedCommonQueue").val("null");
                $("div[lang=" + lang + "] #selectedServiceQueue").val("null");
            }
            ;
            //event when radio service is change
            $("div[lang=" + lang + "] #consultantQueue").change(function () {
                changesSerClicked();
            });
            function changesSerClicked() {
//                console.log("click 1");

                $("div[lang=" + lang + "] #selectedCommonQueue").hide();
                $("div[lang=" + lang + "] #selectedServiceQueue").show();
                $("div[lang=" + lang + "] #selectedDoctorQueue").hide();
                $("div[lang=" + lang + "] #selectedDoctorQueue").val("null");
                $("div[lang=" + lang + "] #selectedCommonQueue").val("null");
                $("div[lang=" + lang + "] #selectedServiceQueue").val("null");
            }
            ;
            //event when radio button1 is change
            $("div[lang=" + lang + "] #inputUserIC").change(function () {
                TextFiledchanges();
            });
            function TextFiledchanges() {
                var userIC;
                userIC = $("div[lang=" + lang + "] #inputUserIC").val();
                var data = {
                    userIC: userIC
                };
                console.log(data);
                if (userIC === "")
                {
                    bootbox.alert("please Fill in the user IC");
                } else {
//                       console.log("before ajax");
                    $.ajax({
                        type: "POST",
                        url: "../Controller/searchUser.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (data) {
//                               console.log("in sucess");
                            if (data.trim() === "NOT FOUND")
                            {
                                bootbox.alert("User NOT Found");
                            } else
                            {
//                                   console.log(data.trim());
                                var splitData = String(data.trim()).split("|");
                                console.log(splitData);
                                pmi_no = splitData[0];
                                ic_no= splitData[4]
                                patient_name= splitData[2]
                                user_name = splitData[2];
                                user_id = splitData[7];
                                $("div[lang=" + lang + "] #inputUserName").val(user_name);
//                                   console.log(pmi_no +" " +user_name+" "+user_id);
                            }
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                }
            }
            ;

            function viewQueueReport(quename) {

                var viewData = {
                    today: yyyyMMdd,
                    time: HHmmss,
                    queuename: quename,
                    icno:ic_no,
                    patientname:patient_name
                };

                if (quename === "")
                {
                    bootbox.alert("Oops!, There is an error, Missing information");
                } else {
//                       console.log("before ajax");
                    $.ajax({
                        type: "POST",
                        url: "queuenoView.jsp",
                        data: viewData,
                        timeout: 10000,
                        success: function (data) {
//                               console.log("print sent " + data.trim());
                            console.log(data.trim());
//                               respond = data;
//                               if (data.trim() === "No Records")
//                                 bootbox.alert("You got no report");

                            $("div[lang=" + lang + "] #reportQueResult").html(data.trim());

                            if ($("div[lang=" + lang + "] #checkReport").text() === "No Records")
                            {
                                bootbox.alert("Your Registration filed");
                            } else {
                                $("div[lang=" + lang + "] #fields").css("display", 'none');
                                $("div[lang=" + lang + "] #reportQueResultContent").css("display", "block");
                                $("div[lang=" + lang + "] #reportQueResult").css("display", "block");
                            }

                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                }
            }
            ;

            $("div[lang=" + lang + "] #SaveQueue").click(function () {
                $("div[lang=" + lang + "] #checkReport").text("");
                var pdf = new jsPDF('p', 'mm', [74,52])
                        , source = $("div[lang=" + lang + "] #reportQueResult")[0]
                        , specialElementHandlers = {
                            '#bypassme': function (element, renderer)
                            {
                                return true
                            }
                        }
                margins = {
                    top: 2,
                    bottom: 3,
                    left: 2,
                    width:47
                };
                pdf.setFontSize(2);
                pdf.fromHTML(
                        source
                        , margins.left
                        , margins.top
                        , {
                            'width': margins.width
                            , 'elementHandlers': specialElementHandlers
                        },
                        function (dispose) {
                            pdf.save('queue-no_' + yyyyMMdd + '.pdf');
                        },
                        margins
                        )
            });




//            
//            
//            
//            
//             //event when radio button is change
//        $('input:radio[name="queuetype"]').on("change",
//            function () {
//                if ($('#commonQueue').is(':checked')) {
//                    $('#selectedQueue').hide();
//                }else if ($('#consultantQueue').is(':checked')) {
//                    $('#selectedQueue').show();
//                } 
//            });
//               
            $("div[lang=" + lang + "] #cancelSignup").on("click", function () {
                window.history.back();
            }); //on clcik submitSignup
            $("div[lang=" + lang + "] #registerSignup").click(function () {
                getDateNow();
                var useric, username, queuetype, selectedqueue, queueuserid, selectedqueuename;
                useric = $("div[lang=" + lang + "] #inputUserIC").val();
                username = $("div[lang=" + lang + "] #inputUserName").val();
                queuetype = $("div[lang=" + lang + "] input[name='queuetype']:checked").val();
                console.log(useric + username + queuetype);
                queueuserid = "";
                selectedqueuename = "";
                if (queuetype === "CM")
                {
                    selectedqueue = $("div[lang=" + lang + "] #selectedCommonQueue").val();
                } else if (queuetype === "PN")
                {
                    selectedqueue = $("div[lang=" + lang + "] #selectedDoctorQueue").val();
                } else if (queuetype === "FY")
                {
                    selectedqueue = $("div[lang=" + lang + "] #selectedServiceQueue").val();
                }



                console.log(useric + "-" + username + "-" + queuetype + "-" + selectedqueue + "-" + selectedqueuename + "-" + queueuserid);
                if (useric === "")
                {
                    bootbox.alert("Fill in the user IC");
                } else if (selectedqueue == "" || selectedqueue == null) {
                    bootbox.alert("Please Select Queue");
                    $("div[lang=" + lang + "] #selectedQueue").focus();
                } else {

                    var tempsplit = selectedqueue.split("|");
                    selectedqueuename = tempsplit[0];
                    queueuserid = tempsplit[1];
                    console.log(selectedqueue + "+" + queueuserid);
                    //hfc amik kat session
                    var hfc = "<%=hfc%>";
                    var datas = {
                        'pmi': pmi_no,
                        'epiDate': yyyyMMdd + " " + HHmmss,
                        'name': username,
                        'newic': useric,
                        'oldic': '-',
                        'typeId': '-',
                        'idNo': user_id,
                        'rnNo': '-',
                        'patCatCode': '-',
                        'visTyCode': '001',
                        'emTy': '-',
                        'eliCatCode': '-',
                        'eliTyCode': '-',
                        'disCode': '<%=dis%>',
                        'subDisCD': '<%=subDis%>',
                        'consultRoom': '-',
                        'comQueue': '-',
                        'doctor': '-',
                        'prioGruCode': '-',
                        'commDis': '-',
                        'polCase': '-',
                        'natuDisasCode': '-',
                        'docTy': '-',
                        'guardInd': '-',
                        'referNo': '-',
                        'gruGuard': '-',
                        'glExpDate': '-',
                        'epiTime': HHmmss,
                        'stat': '0',
                        'hfc': hfc,
                        'now': yyyyMMdd,
                        'comTy': queuetype,
                        'createdBy': user_id,
                        'queue': selectedqueuename,
                        'docID': ''};
//                    console.log(datas);
                    $.ajax({
                        type: "POST",
                        url: "../../PMS/controller/registerqueue.jsp",
                        data: datas, // Send input
                        timeout: 10000,
                        success: function (list) {
                            console.log(list);
                            if ($.trim(list) === "Success") {
                                bootbox.alert("Patient has been register successfully");
                                viewQueueReport(selectedqueuename);

                            } else if ($.trim(list) === "already") {
                                bootbox.alert("Patient is already registered");
                            }

                        }, error: function (err) {
                            console.log(err);
                            bootbox.alert("There is an error!");
                        }
                    });
//                    var data = {
//                        'userIC': useric,
//                        'userName': username,
//                        'queueType': queuetype,
//                        'selectedQueue': selectedqueue,
//                        'today': yyyyMMdd,
//                        'now' : HHmmss,
//                        'pmiNo': pmi_no,
//                        'userID':user_id
//                    };
//                    
//                    
////                console.log(data);
//                
//                $.ajax({
//                            type: "POST",
//                            url: "../Controller/insertNewQueue.jsp",
//                            data: data,
//                            timeout: 10000,
//                            success: function (data){
////                                console.log(data.trim());
//                                $("#inputUserIC").val("");
//                                $("#inputUserName").val("");
//                                $("#selectedQueue").val("null");
//                            },
//                            error: function (err) {
//                                    console.log(err);
//                            }
//                        });
                }
//                var mode = 'iframe'; //popup
//                var close = mode == "popup";
//                var options = { mode : mode, popClose : close};
//                $("div.printableArea").printArea( options );
//                var prtContent = document.getElementById("printableArea");
//                var WinPrint = window.open('', 'Queue', 'left=0,top=0,width=4.8cm,height=4.8cm,toolbar=0,scrollbars=0,status=0');
//                WinPrint.document.write(prtContent.innerHTML);
//                WinPrint.document.close();
//                WinPrint.focus();
//                WinPrint.print();
                //WinPrint.close();
//                
//            var printContents = document.getElementById(divName).innerHTML;
//            var originalContents = document.body.innerHTML;
//
//            document.body.innerHTML = printContents;
//
//            window.print(); 
//
//            document.body.innerHTML = originalContents;
            });
//            function PrintLable(queueName)
//            {
//
//                var data = {
//                    'queuename': queueName,
//                    'today': yyyyMMdd,
//                    'time': HHmmss
//
//                };
//
//
////                console.log(data);
//
//                $.ajax({
//                    type: "POST",
//                    url: "../Controller/PrintQueueNo.jsp",
//                    data: data,
//                    timeout: 10000,
//                    success: function (data) {
//                        console.log(data.trim());
//                    },
//                    error: function (err) {
//                        console.log(err);
//                    }
//                });
//            }


            function containsNumber(any) {
                var alpha = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space
                //var re = /^[A-Za-z]+$/; for one word only don't allow space
                if (alpha.test(any))//contain no number
                    return false;
                else               //comtain number
                    return true;
            }
            ;
//    });
        </script>

    </body>
</html>
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
<%
    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();

    String Consultationqueue = "select * from pms_queue_name where queue_type='FY' ";

    ArrayList<ArrayList<String>> dataQueue2;

    dataQueue2 = conn.getData(Consultationqueue);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Signup Page</title>
        <!--header-->
        <%@include file="../assets/header.html"%>
        <link  rel="stylesheet" href="../assets/css/radiobtn.css">

        <!--header-->
    </head>
    <body>
        <input type="text" id="Rhfc" name="hiddeninput_HFC" hidden="" value='<%=session.getAttribute("HEALTH_FACILITY_CODE").toString()%>'>
        <div class="container-fluid m-scene">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;">
                            <div class="thumbnail">
                                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                                <a href="../../Entrance/destroySession.jsp" title="Log Out"><i class="fa fa-power-off fa-lg pull-right" style="color: #ccc;"></i></a>
                                <div class="profile-img-card" style="text-align: center;" >
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px; text-align: center;">
                                    Please Enter your IC Number
                                </div>
                                <br/>
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
                                        </div>
                                        <!--</div>-->
                                    </div>
                                    <select  id="selectedQueue"  class="form-control select-full" >
                                        <option value="null" selected="" disabled="">Please Select Queue</option>

                                        <%
                                            String add = null, text = null;
                                            for (int i = 0; i < dataQueue2.size(); i++) {
                                                if (dataQueue2.get(i).get(1) != "" || dataQueue2.get(i).get(1) != null) {
                                                    text = dataQueue2.get(i).get(1).substring(0, 4);
                                                    //                                            add = add + "-"+text;
                                                    //                                            out.print(add);
                                                    if (!text.equalsIgnoreCase("Room")) {

                                        %>

                                        <option value="<%=dataQueue2.get(i).get(1)%>"><%="(" + dataQueue2.get(i).get(0) + ") " + dataQueue2.get(i).get(1)%></option>
                                        <%                  }
                                                }
                                            }
                                        %>

                                    </select>

                                </form>
                                <div class="text-center">
                                    <button id="registerSignup" class="btn btn-lg btn-primary">Register</button>
                                    <button id="cancelSignup" class="btn btn-lg btn-default">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Script-->

        <div w3-include-html="../libraries/script.html"></div>

        <script src="http://www.w3schools.com/lib/w3data.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../assets/js/bootbox.min.js"></script>
        <%@include file="../assets/script.html"%>
        <script src="../assets/jquery.PrintArea.js"></script>

        <script>
            w3IncludeHTML();


            $('#selectedQueue').hide();

            var $body = $('body');
            var yyyyMMddHHmmss;
            var HHmmss;
            var yyyyMMdd;
            var ddMMyyyy;
            var timeStamp;
            var pmi_no;
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
            }




            //event when radio button1 is change
            document.getElementById("commonQueue").onchange = function () {
                changes();
            };

            function changes() {
//                console.log("click 2");
                $('#selectedQueue').hide();
                $("#selectedQueue").val("null");
            }
            ;

            //event when radio button2 is change
            document.getElementById("consultantQueue").onchange = function () {
                changes1();
            };

            function changes1() {
//                console.log("click 1");
                $('#selectedQueue').show();

            }
            ;

            //event when radio button1 is change
            document.getElementById("inputUserIC").onchange = function () {
                TextFiledchanges();
            };

            function TextFiledchanges() {

                var userIC;
                userIC = $("#inputUserIC").val();

                var data = {
                    userIC: userIC
                };
                if (userIC === "")
                {
                    bootbox.alert("please Fill in the user IC");
                } else
                {
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
//                                    console.log(splitData);

                                pmi_no = splitData[0];
                                user_name = splitData[2];
                                user_id = splitData[7];
                                $("#inputUserName").val(user_name);
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


            $("#cancelSignup").on("click", function () {

                window.history.back();

            });//on clcik submitSignup

            $("#registerSignup").click(function () {
                getDateNow();
                var useric, username, queuetype, selectedqueue;

                useric = $("#inputUserIC").val();
                username = $("#inputUserName").val();
                queuetype = $("input[name='queuetype']:checked").val();
                selectedqueue = $("#selectedQueue").val();
                if (queuetype === "CM")
                {
                    selectedqueue = "Normal Queue";
                }
                ;
//                console.log(useric+" "+username+" "+queuetype+" "+selectedqueue);

                if (useric === "")
                {
                    bootbox.alert("Fill in the user IC");
                    $("#inputUserIC").focus();
                } else if (username === "") {
                    bootbox.alert("Fill in the user Name");
                    $("#inputUserName").focus();
                } else if (containsNumber(username)) {
                    bootbox.alert("UnValic Name, Contain Numbers");
                    $("#inputUserName").focus();
                } else if (selectedqueue === "" || selectedqueue === null) {
                    bootbox.alert("Please Select Queue");
                    $("#selectedQueue").focus();
                } else {




                    //hfc amik kat session
                    hfc = $("#Rhfc").val();
                    var datas = {'pmi': pmi_no,
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
                        'disCode': '-',
                        'subDiscode': '-',
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
                        'queue': selectedqueue,
                        'docID': '-'};
                    console.log(datas);

                    $.ajax({
                        type: "POST",
                        url: "../../PMSs/controller/registerqueue.jsp",
                        data: datas, // Send input
                        timeout: 10000,
                        success: function (list) {
                            console.log(list);
                            if ($.trim(list) === "Success") {

                                bootbox.alert("Patient has been register successfully");
                                window.history.back();

                            } else if ($.trim(list) === "already") {
                                bootbox.alert("Patient is already registered");
                            }

                        }, error: function (err) {
                            console.log(err);
                            bootbox.alert("There is an error!");
                        }
                    });




//                    
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

            function containsNumber(any) {
                var alpha = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space
                //var re = /^[A-Za-z]+$/; for one word only don't allow space
                if (alpha.test(any))//contain no number
                    return false;
                else               //comtain number
                    return true;
            };




//    });
        </script>

    </body>
</html>

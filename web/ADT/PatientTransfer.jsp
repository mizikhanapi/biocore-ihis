<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    //Conn conn = new Conn();
    String pageNow ="PT";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>


        <div class="row" id="transfer">
            <div class="col-md-12">
                <div class="thumbnail">
                    <h4>Patient Transfer</h4>
                    <hr/>
                    <form class="form-horizontal" id="TransferForm">



                        <div class="row">
                            <div class="col-md-6">


                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">PMI No. *</label>
                                    <div class="col-md-4">
                                        
                                        <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md" readonly="">                        </div>
                                </div>



                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">IC NO</label>
                                    <div class="col-md-4">
                                        <input id="pinof" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Gender</label>
                                    <div class="col-md-4">
                                        <input id="gender" name="gender" type="text" placeholder=""  readonly class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Age</label>
                                    <div class="col-md-4">
                                        <input id="age" name="age" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Ward Class *</label>
                                    <div class="col-md-4">
                                        <input id="WardClassf" name="age" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Bed no *</label>
                                    <div class="col-md-4">
                                        <input id="Bedf" name="Bed" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>
                            </div>



                            <div class="col-md-6">

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Name</label>
                                    <div class="col-md-4">
                                        <input id="pnamef" name="pnamef" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">MRN Number</label>
                                    <div class="col-md-4">
                                        <input id="MRN" name="MRN" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>



                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Admission Date *</label>
                                    <div class="col-md-4">
                                        <input id="AdmissionDatef" name="AdmissionDate" type="text" readonly placeholder="AdmissionDate" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Treating Consultant</label>
                                    <div class="col-md-4">
                                        <input id="Consultant" name="Consultant" type="text" readonly placeholder="Consultant" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Ward Name *</label>
                                    <div class="col-md-4">
                                        <input id="WardNamef" name="WardName" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Rate *</label>
                                    <div class="col-md-4">
                                        <input id="Ratef" name="Rate" type="text" readonly placeholder="" class="form-control input-md">
                                    </div>
                                </div>

                            </div>
                        </div>


                        <h4>Transfer Ward</h4>
                        <hr/>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Transfer Reason *</label>
                            <div class="col-md-4">
                                <input id="TransferReason" name="TransferReason" type="text"  placeholder="" class="form-control input-md">
                            </div>
                        </div>
                        <div>                                       
                            <%@include file = "PMS/search/searchBed.jsp" %>
                        </div>
                        <div id="listbedPT"></div>
                        
                        
                    </form>
                </div>


                <div class="text-center">
                    <button class="btn btn-primary " type="button" id="transfer"> Transfer</button>

                    <button class="btn btn-default " type="button" id="btncancel" name="btncancel" > Cancel</button>
                </div>
                </form>
            </div>
        </div>

    </div>



    <script>

        $("#GL").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        var $body = $('body');
        var yyyyMMddHHmmss;
        var HHmmss;
        var yyyyMMdd;
        var ddMMyyyy;
        var tahun, bulan, hari, ICbday;
        //function get birth date

        function getBday(x) {
            if (x.length === 12) {
                tahun = x.substr(0, 2);
                bulan = x.substr(2, 2);
                hari = x.substr(4, 2);
                if (tahun >= 00 && tahun < 50)
                {

                    //                    ICbday = "20" + tahun + "-" + bulan + "-" + hari;
                    ICbday = hari + "-" + bulan + "-" + "20" + tahun;
                } else
                {
                    //                    ICbday = "19" + tahun + "-" + bulan + "-" + hari;
                    ICbday = hari + "-" + bulan + "-" + "19" + tahun;
                }
            }

        }

        //function to get date 
        function getDateNow() {
            //yyyy-MM-dd HH:mm:ss
            var nowDate = new Date();
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

        //register patient
        $("#transfer").off('click').on('click', function (e) {




            e.preventDefault();
            var pmino = $('#pmino').val();
            var pino = $('#pino').val();
            var gender = $('#gender').val();
            var age = $('#age').val();
            var Bed = $('#Bed').val();
            var pname = $('#pname').val();
            var MRN = $('#MRN').val();
            var AdmissionType = $('#AdmissionType').val();
            var Consultant = $('#Consultant').val();
            var WardClass = $('#WardClass').val();
            var WardName = $('#WardName').val();
            var Rate = $('#Rate').val();
            var BedN = $('#BedN').val();
            var WardNameN = $('#WardNameN').val();
            var WardClassN = $('#WardClassN').val();
            var Dis = $('#Dis').val();
            var TransferReason = $('#TransferReason').val();
            var Deposit = $('#Deposit').val();
            var hfc = $("#Rhfc").val();
            var createdBy = $("#Rid").val();
            var sub = $("#Rsub").val();


            //var hfc = $('#hfc').val();
            //var discipline = $('#discipline').val();
            //var subDicipline = $('#subDicipline').val();

            if (Dis === "" || Dis === null) {
                //bootbox.alert("Complete The Fields of Discipline ");
            } else if (WardClassN === "" || WardClassN === null) {
                //bootbox.alert("Complete The Fields of Ward ID");
            } else if (TransferReason === "" || TransferReason === null) {
                // bootbox.alert("Complete The Fields of TransferReason");
            } else if (WardNameN === "" || WardNameN === null) {
                //bootbox.alert("Complete The Fields of Ward Name");
            } else if (Deposit === "" || Deposit === null) {
                //bootbox.alert("Complete The Fields of Citizen Rates");
            } else if (BedN === "" || BedN === null) {
                // bootbox.alert("Complete The Fields of Citizen Deposit");

            } else {

                var data = {
                    pmino: pmino,
                    WardName: WardName,
                    pino: pino,
                    gender: gender,
                    age: age,
                    Bed: Bed,
                    pname: pname,
                    MRN: MRN,
                    AdmissionType: AdmissionType,
                    Consultant: Consultant,
                    WardClass: WardClass,
                    Rate: Rate,
                    BedN: BedN,
                    WardNameN: WardNameN,
                    WardClassN: WardClassN,
                    Dis: Dis,
                    TransferReason: TransferReason,
                    Deposit: Deposit,
                    hfc: hfc,
                    createdBy: createdBy,
                    sub: sub
                };
                $.ajax({
                    url: "patientTransferSQL.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {


                            bootbox.alert({
                                message: "Successfully update new patient information",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                        }

                    },
                    error: function (err) {
                        bootbox.alert("Error update!");
                    }
                });

                $.ajax({
                    url: "patientTransferSQLHistory.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {


                            bootbox.alert({
                                message: "Successfully transfer patient",
                                title: "Process Result",
                                backdrop: true
                            });
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert({
                                message: "Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                        }

                    },
                    error: function (err) {
                        bootbox.alert("Error update!");
                    }
                });
            }
        });
        //event on click clear buton
        $('#btnclear').click(function () {
            $('#myForm2')[0].reset();
        });


    </script>                       
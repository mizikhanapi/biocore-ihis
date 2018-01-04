<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    //Conn conn = new Conn();
    String pageNow = "PT";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>


        <div class="row" id="transfer">
            <div class="col-md-12">
                <h4>Patient Transfer</h4>
                <form class="form-horizontal" id="TransferForm">



                    <div class="row">
                        <div class="col-md-6">

                            <input value="1" type="hidden" id="transStat">
                            <input type="hidden" id="oldDis">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">PMI No. </label>
                                <div class="col-md-4">

                                    <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md" readonly>                        </div>
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
                                <label class="col-md-4 control-label" for="textinput">Ward Class </label>
                                <div class="col-md-4">
                                    <input id="WardClassf" name="age" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Bed no </label>
                                <div class="col-md-4">
                                    <input id="Bedf" name="Bed" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>
                        </div>



                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Name</label>
                                <div class="col-md-6">
                                    <input id="pnamef" name="pnamef" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>



                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Admission Date </label>
                                <div class="col-md-6">
                                    <input id="AdmissionDatef" name="AdmissionDate" type="text" readonly placeholder="AdmissionDate" class="form-control input-md">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Treating Consultant</label>
                                <div class="col-md-6">
                                    <input id="Consultant" name="Consultant" type="text" readonly placeholder="Consultant" class="form-control input-md">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Ward Name </label>
                                <div class="col-md-6">
                                    <input id="WardNamef" name="WardName" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Deposit</label>
                                <div class="col-md-6">
                                    <input id="Ratef" name="Rate" type="text" readonly placeholder="" class="form-control input-md">
                                </div>
                            </div>

                        </div>
                    </div>
                </form>    
                <hr/>
                <h4>Transfer Ward</h4>
                <div class="row" style="width: 60%; margin: auto;">
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="textinput">Transfer Reason *</label>
                        <div class="col-md-6">
                            <textarea id="TransferReason" name="TransferReason" placeholder="" class="form-control input-md" maxlength="230"></textarea>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">                                       
                    <%@include file = "PMS/search/searchBed.jsp" %>
                    <input type="hidden" id="bednew">
                    <input type="hidden" id="wardnew">
                    <input type="hidden" id="classnew">
                    <input type="hidden" id="ratenew">
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <h4 style="text-align: center;">List of Bed</h4>
                    </div>
                    <!-- List of Bed -->
                    <div class="col-md-10 col-md-offset-1">
                        <div class="panel panel-default form-horizontal">
                            <div class="panel-body">
                                <div>
                                    <div id="listbedPT"> </div>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- List of Bed -->
                </div>



                <div class="text-center">
                    <button class="btn btn-primary " type="button" id="transferBtn"> Transfer</button>
                    <button class="btn btn-default " type="button" id="btncancel" name="btncancel" > Cancel</button>
                </div>

            </div>
        </div>


        <input  type="hidden" id="wardName_CD">
        <input  type="hidden" id="wardClass_CD">
        <input  type="hidden" id="EliSource">
        <input  type="hidden" id="EliTy">
        <input  type="hidden" id="preStartDate">
        

        <script>

            $(document).ready(function () {
                //register patient
                $("#transferBtn").off('click').on('click', function () {
                    var pmino = $('#pmino').val();
                    
                    var Bed = $('#BedIDReg').val();          //$('#bednew').val();
                    var WardClass = $('#WardType').val();    //$('#classnew').val();
                    var WardName = $('#wname').val().split("|")[0];      //$('#wardnew').val();
                    var queueName = $('#wname').val().split("|")[1];
                    //var Rate = $('#Rate').val();
                    
                    var BedO = $('#Bedf').val();
                    var WardNameO = $('#wardName_CD').val();
                    var WardClassO = $('#wardClass_CD').val();
                    var Dis = $('#dis_cd').val();
                    var TransferReason = $('#TransferReason').val();
                    var Deposit = $('#Deposit').val();
                    var hfc = $("#Rhfc").val();
                    var createdBy = $("#Rid").val();
                    //var sub = $("#Rsub").val();
                    var status = $('#transStat').val();
                    var oldDis = $("#oldDis").val();
                    var episode_date = $("#AdmissionDatef").val();
                    var subO = $("#sub_cd").val();
                    
                    var preStartDate = $('#preStartDate').val();



                    //var hfc = $('#hfc').val();
                    //var discipline = $('#discipline').val();
                    //var subDicipline = $('#subDicipline').val();

                    if (Dis === "" || Dis === null) {
                        bootbox.alert("Complete The Fields of Discipline ");
                    } else if (WardClass === "" || WardClass === null) {
                        bootbox.alert("Complete The Fields of Ward ID");
                    } else if (TransferReason === "" || TransferReason === null) {
                        bootbox.alert("Complete The Fields of Transfer Reason");
                    } else if (WardName === "" || WardName === null) {
                        bootbox.alert("Complete The Fields of Ward Name");
                    } else if (Deposit === "" || Deposit === null) {
                        bootbox.alert("Complete The Fields of Citizen Rates");
                    } else if (Bed === "" || Bed === null) {
                        bootbox.alert("Select Bed first");

                    } else {
                        
                        TransferReason = TransferReason.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                        var data = {
                            pmino: pmino,
                            WardNameO: WardNameO,
                            BedO: BedO,
                            WardClassO: WardClassO,
                            BedN: Bed,
                            WardNameN: WardName.trim(),
                            WardClassN: WardClass,
                            Dis: Dis,
                            TransferReason: TransferReason,
                            Deposit: Deposit,
                            hfc: hfc,
                            status: status,
                            oldDis: oldDis,
                            episode_date: episode_date,
                            subO: subO,
                            qName: queueName.trim(),
                            preStartDate: preStartDate
                        };
                        console.log(data);
                        
                        createScreenLoading();

                        $.ajax({
                            type: "post",
                            url: "transfer.jsp",
                            timeout: 10000,
                            data: data,
                            success: function (databack) {
                                console.log(databack);
                                if (databack.trim() === "success") {
                                    bootbox.alert("Patient successfully transferred");
                                    $('#btnClear').click();
                                    $('#SB_Form')[0].reset();
                                    $('#WardOccuTable').html('');
                                    $('#TransferReason').val('');
                                    $('#TransferForm')[0].reset();

                                } else if (databack.trim() === "fail") {
                                    bootbox.alert("Fail to transfer the patient");
                                }
                                else if(databack.trim()=== "taken"){
                                    bootbox.alert("Sorry, the bed is already taken by other. Please choose different bed.");
                                }
                                else{
                                    console.log(databack);
                                }
                                
                            }, error: function () {
                                bootbox.alert("");
                            },
                            complete: function (jqXHR, textStatus ) {
                                destroyScreenLoading();
                            }
                        });
                        
                    }
                });

                //event on click clear buton
                $('#btnclear').off('click').on('click',function () {
                    $('#TransferForm')[0].reset();
                });

            });




        </script>                       
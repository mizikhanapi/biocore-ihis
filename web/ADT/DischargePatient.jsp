<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String idTY = session.getAttribute("USER_ID").toString();
    //  String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String disb = request.getParameter("Dis");
    String wnameb = request.getParameter("wname");
    String WardTypeb = request.getParameter("WardType");
    String EliTy = request.getParameter("EliTy");
    String EliSrc = request.getParameter("EliSrc");
    String totalelisource = "";
    String tw = "";

    String pnc = "select non_citizen_deposit from wis_ward_name where discipline_cd ='" + disb + "' and ward_class_code = '" + WardTypeb + "' AND ward_id =  '" + wnameb + "'";
    ArrayList<ArrayList<String>> datapnc;
    datapnc = conn.getData(pnc);
    for (int i2 = 0; i2 < datapnc.size(); i2++) {
        String w = datapnc.get(i2).get(0);
        tw = w;
    }

    String eliCat = "select  from adm_lookup_detail where master_reference_code = '0063' and Detail_Reference_code ='" + EliSrc + "'  ";
    ArrayList<ArrayList<String>> dataEliCat;

    dataEliCat = conn.getData(eliCat);
    for (int i = 0; i < dataEliCat.size(); i++) {
        String elisource = dataEliCat.get(i).get(0);
        totalelisource = elisource;
    }

%>
<input id="dataMSHPDIORC" disabled="" name="textinput" type="hidden"  readonly class="form-control input-md">
<input id="datatest" disabled="" name="textinput" type="hidden"  readonly class="form-control input-md">
<input id="datatest1" disabled="" name="textinput" type="hidden"  readonly class="form-control input-md">

<input  type="hidden" id="totalelisrc"  class="form-control input-md">

<input type="hidden" id="Btype" class="form-control input-md">

<input type="hidden" id="Bdate" class="form-control input-md">
<input type="hidden"  id="order_no" class="form-control input-md">
<input type="hidden" id="gender" class="form-control input-md">
<input type="hidden" id="order_date" class="form-control input-md">


<input   type="hidden" id="disb" class="form-control input-md">
<input   type="hidden" id="wnameb" class="form-control input-md">
<input type="hidden" id="WardTypeb" class="form-control input-md">



<input  type="hidden"  value="<%=idTY%>" id="LChfc" class="form-control input-md">

<!--type="hidden" -->

<input type="hidden" id="hfc_cd"   class="form-control input-md">



<!--
<div style="color: #999; top: 30px; right: 30px; font-weight: 500; text-transform: uppercase">Total Room: </div>
<input name="EliSrc" id="EliSrc">

<div id="resultPatientDischarge">
    <div class="col-md-6" id="depositResult">



        <input id="dDeposit"   class="form-control input-md">
        <input id="dCost"   class="form-control input-md">
        <input id="dDiscount"  class="form-control input-md">

    </div>

</div>-->



<div class="row" id="bedDiv1">
    <div class="col-md-12">
        <h4>In-Patient Information</h4>






        <form class="form-horizontal" name="myForm2" id="myForm2">
            <div class="row">
                <div class="col-md-6">
                    <!--                     Text input
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="textinput">admit date</label>
                                            <div class="col-md-6">
                                                <input id="TotalDate" name="TotalDate" type="text" placeholder=" " readonly class="form-control input-md">                        
                                            </div>
                                        </div>-->

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                        <div class="col-md-6">
                            <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Old IC NO</label>
                        <div class="col-md-6">
                            <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>



                </div>

                <div class="col-md-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Name</label>
                        <div class="col-md-6">
                            <input id="pname" name="pnamef" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                        <div class="col-md-6">
                            <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                        <div class="col-md-6">
                            <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                        </div>
                    </div>
                </div>
            </div>

            <hr/>
            <h4>More In-Patient Information</h4>

            <div class="row">

                <div class="col-md-4">  
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Source*</label>
                        <div class="col-md-6">

                            <input  disabled="" id="EliSrc" name="EliSrc" type="text" readonly class="form-control input-md">



                        </div> 
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Type*</label>
                        <div class="col-md-6" id="EligibilityTypeDropdown">
                            <input disabled="" id="EliTy" name="EliTy" type="text" readonly class="form-control input-md">

                        </div>

                    </div>




                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Admission type *</label>
                        <div class="col-md-6">
                            <input disabled="" id="AdmTy" name="AdmTy" type="text" readonly  class="form-control input-md">

                        </div> 
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Admission reason* </label>
                        <div class="col-md-6">
                            <input disabled="" id="AdmRe" name="AdmRe" type="text" readonly  class="form-control input-md">

                        </div>
                    </div>


                </div>




                <div class="col-md-4">

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Document type *</label>
                        <div class="col-md-6">
                            <input disabled="" id="DocTy" name="AdmRe" type="text" readonly  class="form-control input-md">

                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Document no*</label>
                        <div class="col-md-6">
                            <input id="DocNo" name="textinput" type="text" readonly  placeholder="" class="form-control input-md">
                        </div>
                    </div>



                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Referring from *</label>
                        <div class="col-md-6">
                            <input disabled="" id="RefFrom" name="textinput" type="text" placeholder="" class="form-control input-md">

                        </div>
                    </div>   
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Referred By *</label>
                        <div class="col-md-6">
                            <input disabled="" id="RefBy" name="textinput" type="text" placeholder="" class="form-control input-md">

                        </div>
                    </div> 







                </div>



                <div class="col-md-4">  

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput"> GL expiry date *</label>
                        <div class="col-md-6">
                            <input id="GL" name="GL" type="text" placeholder="Pop-up Calendar" readonly class="form-control input-md">
                        </div>
                    </div>



                    <!-- Select Basic -->


                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Payer Group*</label>
                        <div class="col-md-6">

                            <input disabled="" id="PayerGrp" name="PayerGrp" type="text"  readonly class="form-control input-md">


                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Police case *</label>
                        <div class="col-md-6">
                            <input disabled="" id="Police" name="Police" type="text"  readonly class="form-control input-md">

                        </div>
                    </div>

                </div>
            </div>

            <hr/>
            <h4>Discharge Ward Information</h4>

            <div class="row">


                <div class="col-md-4">
                    <!-- Select Basic -->
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                        <div class="col-md-6">
                            <input disabled="" id="Dis" name="Dis" type="text"  class="form-control input-md">

                        </div>

                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                        <div class="col-md-6" >
                            <input id="WardType" name="WardType" type="text" disabled="" class="form-control input-md">


                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                        <div class="col-md-6" >
                            <input id="wname" name="wname" type="text" disabled="" class="form-control input-md">
                        </div>

                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
                        <div class="col-md-6">
                            <input id="Deposit" name="textinput" type="text" disabled="" class="form-control input-md">
                        </div>
                    </div>


                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
                        <div class="col-md-6">
                            <input id="BedIDReg" disabled="" name="textinput" type="text"  readonly class="form-control input-md">
                            </br>
                        </div>
                    </div>
                </div>



                <div class="col-md-4">  

                    <!--         Text input
                    -->        <div class="form-group">
                        <label class="col-md-4 control-label" >Chronic Indicator </label>
                        <div class="col-md-6">
                            <input id="chronic"    disabled="" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Active Drug Taken</label>
                        <div class="col-md-6">
                            <input id="drug" disabled="" name="textinput" type="text"  readonly class="form-control input-md">

                        </div>
                    </div>
                    <!--         Text input
                    -->        <div class="form-group">
                        <label class="col-md-4 control-label" >Procedure Taken </label>
                        <div class="col-md-6">
                            <input id="procedure"    disabled="" class="form-control input-md">
                        </div>
                    </div>






                </div>

                <div class="col-md-4"> 

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total Days Admit</label>
                        <div class="col-md-6">
                            <input id="day" name="day" type="text" placeholder=" " readonly class="form-control input-md">                        
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total Discharge (RM) </label>
                        <div class="col-md-6">
                            <input id="TotalDischarge" name="TotalDischarge" type="text" placeholder=" " readonly class="form-control input-md">                        
                        </div>
                    </div>

                   



                </div>
            </div>




            <div class="text-center">
                <button class="btn btn-primary " type="button" id="DischargeBtn"> Discharge</button>
                <button class="btn btn-default " type="button" id="btncancel" name="btncancel" > Cancel</button>
            </div>


        </form>
    </div>
</div>
<script>




    $("#DischargeBtn").click(function () {

        var patientpmino = $('#pmino').val();
        var patientName = $('#pname').val();
        var patientnic = $('#pnic').val();
        var patientGender = $("#gender").val();
        var patientBdate = $("#Bdate").val();
        var patientBtype = $("#Btype").val();
        var patientOrderNo = $("#order_no").val();
        var patientOrderDate = $("#order_date").val();
        var patientOrderLocationCode = $("#hfc_cd").val();
        var id = $("LChfc").val();
        var patientDischarge = $("#TotalDischarge").val();
        var BedID = $("#BedIDReg").val();
        var disb = $("#disb").val();
        var wnameb = $("#wnameb").val();
        var WardTypeb = $("#WardTypeb").val();
        var hfc_cd = $("#hfc_cd").val();
        var DisReason = $("#DisReason").val();



        var pmiNo = patientpmino;
        var orderNo = patientOrderNo;
        var orderDate = patientOrderDate;
        var Discharge = patientDischarge;
        var userID = id;
        var BedID = BedID;

        var data = {
            BedID: BedID,
            pmiNo: pmiNo,
            orderNo: orderNo,
            orderDate: orderDate,
            Discharge: Discharge,
            userID: userID,
            disb: disb,
            wnameb: wnameb,
            WardTypeb: WardTypeb,
            hfc_cd: hfc_cd,
            DisReason: DisReason
        };
        $.ajax({
            url: "patientDischargeDispenseEHRCentralGetMSH.jsp",
            type: "post",
            timeout: 3000,
            data: data,
            success: function (returnDataMSHFull) {

                $.ajax({
                    url: "patientDischargeDispenseEHRCentralGetPDIFinal.jsp",
                    type: "post",
                    timeout: 3000,
                    data: data,
                    success: function (returnDataPDIFull) {


                        $.ajax({
                            url: "patientDischargeDispenseEHRCentralGetORC.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnDataORCFull) {

                                //Set value to the Second Tab 
                                $("#patientpmino").val(patientpmino);
                                $("#patientName").val(patientName);
                                $("#patientnic").val(patientnic);
                                $("#patientGender").val(patientGender);
                                $("#patientBdate").val(patientBdate);
                                $("#patientBtype").val(patientBtype);
                                $("#patientOrderNo").val(patientOrderNo);
                                $("#patientOrderDate").val(patientOrderDate);
                                $("#patientOrderLocationCode").val(patientOrderLocationCode);
                                $("#dataMSHPDIORC").val(returnDataMSHFull.trim() + returnDataPDIFull.trim() + returnDataORCFull.trim());

                                console.log(returnDataMSHFull.trim());
                                console.log(returnDataPDIFull.trim());
                                console.log(returnDataORCFull.trim());
                                console.log($("#dataMSHPDIORC").val());

                                //loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);

                                $.ajax({
                                    url: "patientDischargeDetailItem.jsp",
                                    type: "post",
                                    data: data,
                                    timeout: 3000,
                                    success: function (returnDataItem) {
                                        $("#datatest").val(returnDataItem.trim());
                                        $("#datatest1").val(returnDataMSHFull.trim() + returnDataPDIFull.trim() + returnDataORCFull.trim() + returnDataItem.trim());
                                        //$('#dataItem').html(returnDataItem);
                                        //$('#dataItem').trigger('contentchanged');
                                        console.log(returnDataItem.trim());
                                        console.log($("#datatest").val());
                                        console.log($("#datatest1").val());
                                        var ehr_central = $("#datatest1").val();
                                        //alert(ehr_central);

                                        var data1 = {
                                            pmiNo: patientpmino,
                                            ehr_central: ehr_central,
                                            order_no: orderNo
                                        };
                                        $.ajax({
                                            url: "sentToEHRcentral.jsp",
                                            type: "post",
                                            data: data1,
                                            timeout: 3000,
                                            success: function (returnEHR) {

                                                alert("Success transfer to Billing");

                                                $.ajax({
                                                    url: "DischargeUpdate.jsp",
                                                    type: "post",
                                                    data: data,
                                                    timeout: 3000,
                                                    success: function (update) {

                                                        console.log(update);

//                                                        $.ajax({
//                                                            url: "updatebeddischarge.jsp",
//                                                            type: "post",
//                                                            data: data,
//                                                            timeout: 3000,
//                                                            success: function (dd) {
//
//                                                                console.log(dd);
//
//
//                                                            }
//                                                        });


                                                    }
                                                });


                                            }
                                        });

                                    }
                                });

                            }
                        });

                    }
                });

            }
        });

    });


</script>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<div class="row" id="bedDiv1">
    <div class="col-md-12">
        <h4>In-Patient Information</h4>

        <form class="form-horizontal" name="myForm2" id="myForm2">
            <div class="row">
                <div class="col-md-6">
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
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                        <div class="col-md-6">
                            <input type="hidden" id="pitID">
                            <input id="pit" name="pit" type="text" placeholder=""  readonly class="form-control input-md">
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Name</label>
                        <div class="col-md-6">
                            <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
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
                                                              <input disabled="" id="EliSrc" name="EliSrc" type="text" readonly class="form-control input-md">

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

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Discharge Reason</label>
                        <div class="col-md-6">
                            <input id="DisReason" disabled="" name="textinput" type="text"  readonly class="form-control input-md">

                        </div>
                    </div>




                </div>
                        
                <div class="col-md-4">  
                    
                    <!--         Text input
                    -->        <div class="form-group">
                        <label class="col-md-4 control-label" >HFC To:</label>
                        <div class="col-md-6">
                            <input id="hfcTo"  value="<%=hfc%>"  disabled="" class="form-control input-md">
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Attain by DR :</label>
                        <div class="col-md-6">
                            <input id="DrAttain" disabled="" name="textinput" type="text"  readonly class="form-control input-md">

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
    $("#EliSource").on('change', function () {
        var EliSrc = $(this).val();
        $.ajax({
            type: "post",
            url: "PMS/listEliTy.jsp",
            data: {'EliSrc': EliSrc},
            timeout: 10000,
            success: function (list) {
                //remove the loading 
                //$body.removeClass("loading");
                console.log(list);
                $('#EligibilityTypeDropdown').html(list);

            },
            error: function (xhr, status, error) {
                var err = eval("(" + xhr.responseText + ")");
                //bootbox.alert(err.Message);
            }
        });
    });



    $("#GL").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd',
        minDate: '0'
    });
</script>
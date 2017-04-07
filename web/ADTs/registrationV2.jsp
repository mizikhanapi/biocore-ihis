<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/css/loading.css">
<!--hfc code in register queue need to get from session -->

<%
    //String hfc = session.getAttribute("HFC").toString();
    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063'   ";
    String admit = "select * from lookup_detail where master_ref_code ='0023'";
    String bed = "select bed_id from wis_bed_id";
    String eliType = "select * from adm_lookup_detail where master_reference_code = '0034'   ";
    String discip = "select * from adm_lookup_detail where master_reference_code = '0072'   ";
    String wname = "select ward_name from wis_ward_name";
    String wtype = "select ward_class_code from wis_ward_name";
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012'   ";

    ArrayList<ArrayList<String>> dataEliCat, dataAdmit, dataBed, dataEliType, dataIdType, dataDiscip, dataWardName, dataWardType;

    Conn conn = new Conn();

    dataEliCat = conn.getData(eliCat);
    dataAdmit = conn.getData(admit);
    dataBed = conn.getData(bed);
    dataEliType = conn.getData(eliType);
    dataDiscip = conn.getData(discip);
    dataWardName = conn.getData(wname);
    dataWardType = conn.getData(wtype);
    dataIdType = conn.getData(idTYpe);

    String dataSystemStatus = session.getAttribute("SYSTEMSTAT").toString();

%>
<div class="row" id="register">
    <div class="col-md-12">
        <div id="searchPatientModule"></div>
        <!--        <div class="thumbnail">
                    <h4>Search Patient
                        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
                    </h4>
                    <form class="form-horizontal" name="myForm" id="myForm">
                         Select Basic 
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <select id="idType" name="idType" class="form-control" required="">
                                    <option selected="" disabled="" value="-"> Please select ID type</option>
                                    <option value="pmino">PMI No</option>
                                    <option value="icnew">IC No (NEW)</option>
                                    <option value="icold">IC No (OLD)</option>
                                    <option value="matricno">Matric No</option>
                                    <option value="staffno">Staff No</option>
        <%                                if (dataSystemStatus.equals("0")) {

            } else if (dataSystemStatus.equals("1")) {
                for (int i = 0; i < dataIdType.size(); i++) {%>
        <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
        <%  }
            }

        %>
    </select>
</div>
</div>

Text input
<div class="form-group">
<label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
<div class="col-md-4">
    <input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
</div>
</div>
<div class="text-center">
<button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

<button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
</div>
</form>
</div>-->

        <div class="thumbnail">
            <h4>In-Patient Information</h4>
            <hr/>
            <form class="form-horizontal" name="myForm2" id="myForm2">
              
  <div class="row">



                    <div class="col-md-6">


                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-4">
                                <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        </div>
                        </div>



                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">IC NO</label>
                            <div class="col-md-4">
                                <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <input id="pid" name="pid" type="text" placeholder=""  readonly class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">MRN Number</label>
                            <div class="col-md-4">
                                <input id="MRN" name="MRN" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>



                    <div class="col-md-6">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Name</label>
                            <div class="col-md-4">
                                <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                            <div class="col-md-4">
                                <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>



                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">ID No</label>
                            <div class="col-md-4">
                                <input id="pidno" name="pidno" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>

                </div>
                <h4>Registration Info</h4>
                <hr/>
                
     <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Source</label>
                            <div class="col-md-4">
                                <select id="EliSource" name="EliSource" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Eligibility Source</option>


                                    <%                                        for (int i = 0; i < dataEliCat.size(); i++) {%>
                                    <option value="<%=dataEliCat.get(i).get(2)%>"><%=dataEliCat.get(i).get(2)%></option>
                                    <%  }
                                    %>


                                </select>
                            </div> 
                        </div>


                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Admission type</label>
                            <div class="col-md-4">
                                <select id="AdmissionType" name="selectbasic" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Admission Type</option>


                                    <%                                        for (int i = 0; i < dataAdmit.size(); i++) {%>
                                    <option value="<%=dataAdmit.get(i).get(2)%>"><%=dataAdmit.get(i).get(2)%></option>
                                    <%  }
                                    %>


                                </select>
                            </div> 
                        </div>



                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Referring from</label>
                            <div class="col-md-4">
                                <select id="Refer" name="Refer" class="form-control">
                                    <option value="" selected="" disabled="">Select </option>
                                    <option value="1">1. KLINIK PESAKIT LUAR PAKAR</option>
                                    <option value="2">2. LAIN HOSP. KERAJAAN</option>
                                    <option value="3">3. KLINIK KESIHATAN/JPL</option>
                                    <option value="4">4. PENGAMAL PERUBATAN</option>
                                    <option value="5">5. BERSALIN</option>
                                    <option value="6">6. JABATAN KECEMASAN</option>
                                    <option value="7">9. LAIN-LAIN</option>

                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Document type</label>
                            <div class="col-md-4">
                                <select id="DocType" name="DocType" class="form-control">
                                    <option value="" selected="" disabled="">Select </option>
                                    <%--
                                    <option value="1">1. KLINIK PESAKIT LUAR PAKAR</option>
                                    <option value="2">2. LAIN HOSP. KERAJAAN</option>
                                  
                                    
                                    <%
                                        for (int i = 0; i < dataDiscip.size(); i++) {%>
                                    <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                    --%>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">GL expiry date</label>
                            <div class="col-md-4">
                                <input id="GL" name="textinput" type="text" placeholder="Pop-up Calendar" class="form-control input-md">
                            </div>
                        </div>


                    </div>



                    <div class="col-md-6">  
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                            <div class="col-md-4">
                                <select id="EliTy" name="EliTy" class="form-control">
                                    <option value="1" selected="" disabled="">Select Eligibility Type</option>



                                    <%
                                        for (int i = 0; i < dataEliType.size(); i++) {%>
                                    <option value="<%=dataEliType.get(i).get(2)%>"><%=dataEliType.get(i).get(2)%></option>
                                    <%  }
                                    %>


                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Admission reason</label>
                            <div class="col-md-4">
                                <input id="AdmissionReason" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Police case</label>
                            <div class="col-md-8">
                                <label class="radio-inline">
                                    <input type="radio" name="PoliceCase" id="PoliceCase1" value="Yes">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="PoliceCase" id="PoliceCase2" value="No">
                                    No
                                </label>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Document no</label>
                            <div class="col-md-4">
                                <input id="DocNo" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>


                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Payer Group</label>
                            <div class="col-md-4">
                                <input id="payer" name="payer" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>
                    </div>
                </div>

                <h4>Assign Ward</h4>
                <hr/>
                

                <div class="text-center">
                    <button class="btn btn-primary " type="button" id="registerQueue"><i class="fa fa-floppy-o fa-lg"></i> Register</button>
                    <button class="btn btn-default " type="button" id="btnclear" name="btnclear" > <i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                    <!--                    <div id="dialog" title="Basic dialog">
                                            <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
                                        </div>-->
                </div>
                <br/>

            </form>
        </div>
    </div>
</div>



<script>w3IncludeHTML();</script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script> -->
<script src="assets/js/bootbox.min.js"></script> 


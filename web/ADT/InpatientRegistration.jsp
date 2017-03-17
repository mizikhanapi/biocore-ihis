<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="old/assets/css/loading.css">



<%

 String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();


    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063'   ";
    String admit = "select * from lookup_detail where master_ref_code ='0023'";
    String eliType = "select * from adm_lookup_detail where master_reference_code = '0034'   ";

    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012'   ";

    ArrayList<ArrayList<String>> dataEliCat, dataAdmit, dataEliType, dataIdType;

    dataEliCat = conn.getData(eliCat);
    dataAdmit = conn.getData(admit);
    dataEliType = conn.getData(eliType);
    dataIdType = conn.getData(idTYpe);

    String dataSystemStatus2 = session.getAttribute("SYSTEMSTAT").toString();

%>

<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<input type="hidden" value="<%=dis%>" id="dis">
<input type="hidden" value="<%=sub%>" id="sub">
<div class="row" id="register">
    <div class="col-md-12">
        <div> <%@include file = "searchPatient.jsp" %></div>
    </div>
</div>



<div class="row" id="bedDiv1">
    <div class="col-md-12">
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
                            <label class="col-md-4 control-label" for="textinput">Old IC NO</label>
                            <div class="col-md-4">
                                <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <input id="pit" name="pit" type="text" placeholder=""  readonly class="form-control input-md">
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
                            <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                            <div class="col-md-4">
                                <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>

                </div>


                <h4>Registration Information</h4>
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
                                    <option value="-">-</option>

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
                            <label class="col-md-4 control-label" for="textinput"> GL expiry date</label>
                            <div class="col-md-4">
                                <input id="GL" name="GL" type="text" placeholder="Pop-up Calendar" readonly class="form-control input-md">
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
                <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                            <div class="col-md-6">
                                <input id="Dis" name="Dis" type="text"  class="form-control input-md">
                                <div id="disList"></div>
                            </div>

                        </div>


                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                            <div class="col-md-4">
                                <select id="wname" name="selectbasic" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Ward Name</option>

                                    <%
                                        String wname = "select ward_name from wis_ward_name";
                                        ArrayList<ArrayList<String>> dataWardName = conn.getData(wname);

                                        int size1 = dataWardName.size();

                                        for (int i = 0; i < size1; i++) {
                                    %>
                                    <option value="<%= dataWardName.get(i).get(0)%>"><%= dataWardName.get(i).get(0)%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div> 
                        </div>





                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
                            <div class="col-md-4">
                                <input id="Deposit" name="textinput" type="text" placeholder="RM :" class="form-control input-md">
                            </div>
                        </div>


                    </div>



                    <div class="col-md-6">  
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                            <div class="col-md-4">
                                <select id="WardType" name="WardType" class="form-control">
                                    <option value="1" selected="" disabled="">Select Ward Type</option>

                                    <%
                                        String wtype = "select ward_class_code from wis_ward_name";
                                        ArrayList<ArrayList<String>> dataWardType = conn.getData(wtype);

                                        int size2 = dataWardType.size();

                                        for (int i = 0; i < size2; i++) {
                                    %>
                                    <option value="<%= dataWardType.get(i).get(0)%>"><%= dataWardType.get(i).get(0)%> </option>
                                    <%
                                        }
                                    %>


                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
                            <div class="col-md-4">
                                <input id="BedIDReg" name="textinput" type="text" placeholder="Bed ID" readonly class="form-control input-md">
                                </br>


                                <!--                                <button type="button" class="btn btn-default"  id="listbed">List Bed</button>-->

                            </div>
                        </div>

                    </div>
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
                                    <%@include file = "bed.jsp" %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- List of Bed -->
                </div>

                <div class="text-center">
                    <button class="btn btn-primary " type="button" id="registerQueue"><i class="fa fa-floppy-o "></i> Register</button>
                    <button class="btn btn-default " type="button" id="btnclear" name="btnclear" > <i class="fa fa-ban "></i>&nbsp; Clear</button>
                </div>


            </form>
        </div>
    </div>
</div>

<!-- main -->		





<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://www.w3schools.com/lib/w3data.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>-->
<!--
<script src="old/assets/js/bootbox.min.js"></script>
<script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>-->
 
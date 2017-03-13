
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Conn conn = new Conn();

    //for select box items
    String eliCat4 = "select * from adm_lookup_detail where master_reference_code = '0063'";
    String eliType4 = "select * from adm_lookup_detail where master_reference_code = '0034'";
    String gender4 = "select * from adm_lookup_detail where master_reference_code = '0041'";
    String marital4 = "select * from adm_lookup_detail where master_reference_code = '0006'";
    String race4 = "select * from adm_lookup_detail where master_reference_code = '0004'";
    //String nationality4 = "select * from adm_lookup_detail where master_reference_code = '0011'";
    String religion4 = "select * from adm_lookup_detail where master_reference_code = '0005'";
    String idType4 = "select * from adm_lookup_detail where master_reference_code = '0012'";
    //String title4 = "select * from adm_lookup_detail where master_reference_code = '0026' ";
    String bloodty4 = "select * from adm_lookup_detail where master_reference_code = '0074'   ";
    String rhesus4 = "select * from adm_lookup_detail where master_reference_code = '0017'   ";
    String allergy4 = "select * from adm_lookup_detail where master_reference_code = '0075'   ";
    String chronicDesease4 = "select * from adm_lookup_detail where master_reference_code = '0076'  ";
    String organDonor4 = "select * from adm_lookup_detail where master_reference_code = '0077'";
//    String district4 = "select * from adm_lookup_detail where master_reference_code = '0078'   ";
//    String postcode4 = "select * from adm_lookup_detail where master_reference_code = '0079'   ";
//    String country4 = "select * from adm_lookup_detail where master_reference_code = '0001'   ";
//    String town4 = "select * from adm_lookup_detail where master_reference_code = '0003'   ";
//    String state4 = "select * from adm_lookup_detail where master_reference_code = '0002'   ";

    ArrayList<ArrayList<String>> dataEliCat4, dataEliType4, dataIdType4, dataGender4, dataMarital4, dataRace4, dataNationality4, dataReligion4, dataTitle4,
            dataBloodty4, dataRhesus4, dataAllergy4, dataChronicDesease4, dataOrganDonor4, dataDistrict4, dataPostcode4, dataCountry4, dataTown4, dataState4;

    dataEliCat4 = conn.getData(eliCat4);
    dataEliType4 = conn.getData(eliType4);
    dataGender4 = conn.getData(gender4);
    dataMarital4 = conn.getData(marital4);
    dataRace4 = conn.getData(race4);
    //dataNationality4 = conn.getData(nationality4);
    dataReligion4 = conn.getData(religion4);
    dataIdType4 = conn.getData(idType4);
    //dataTitle4 = conn.getData(title4);
    dataBloodty4 = conn.getData(bloodty4);
    dataRhesus4 = conn.getData(rhesus4);
    dataAllergy4 = conn.getData(allergy4);
    dataChronicDesease4 = conn.getData(chronicDesease4);
    dataOrganDonor4 = conn.getData(organDonor4);
//    dataDistrict4 = conn.getData(district4);
//    dataPostcode4 = conn.getData(postcode4);
//    dataCountry4 = conn.getData(country4);
//    dataTown4 = conn.getData(town4);
//    dataState4 = conn.getData(state4);

    //  ArrayList<String> dataDistrictSingular= new ArrayList<String>(),dataPostcodeSingular = new ArrayList<String>(),dataCountrySingular = new ArrayList<String>(),dataTownSingular = new ArrayList<String>(),dataStateSingular = new ArrayList<String>();
//   for(int i = 0;i<dataDistrict.size();i++){
//       dataDistrictSingular.add(dataDistrict.get(i).get(2));
//   }
//   String newVal = StringUtils.join(dataDistrictSingular,"|");
//   
//   for(int i = 0;i<dataPostcode.size();i++){
//       dataPostcodeSingular.add(dataPostcode.get(i).get(2));
//   }
//   String newVal2 = String.join("|",dataPostcodeSingular);
//   
//   for(int i = 0;i<dataCountry.size();i++){
//       dataCountrySingular.add(dataCountry.get(i).get(2));
//   }
//   String newVal3 = String.join("|",dataCountrySingular);
//   
//for(int i = 0;i<dataTown.size();i++){
//       dataTownSingular.add(dataTown.get(i).get(2));
//   }
//   String newVal4 = String.join("|",dataTownSingular);
//   
//for(int i = 0;i<dataState.size();i++){
//       dataStateSingular.add(dataState.get(i).get(2));
//   }
//   String newVal5 = String.join("|",dataStateSingular);

%>

<div class="row">
    <div class="col-md-12">
        <div class="thumbnail">
            <h4>Patient Information</h4>
            <hr/>
            <form style=" margin: 0 auto;" class="form-horizontal" id="formPMI">
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-8">
                                <input id="PMIpmino" name="PMIpmino" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Temporary PMI No.</label>
                            <div class="col-md-8">
                                <input id="PMIpminotemp" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Name</label>
                            <div class="col-md-8">
                                <input id="PMIpname" name="PMIpname" type="text" placeholder="" class="form-control input-md" required="require" maxlength="80">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Title</label>
                            <div class="col-md-8">
                                
                                <input id="PMItitle" name="textinput" type="text" placeholder="select title.." class="form-control input-md">
                                <input id="PMItitleCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchtitle"></div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                            <div class="col-md-8">
                                <input id="PMInic" name="PMInic" type="text" placeholder="" class="form-control input-md" maxlength="12">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                            <div class="col-md-8">
                                <input id="PMIoic" name="PMIoic" type="text" placeholder="" class="form-control input-md" maxlength="8">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-8">
                                <select id="PMIidty" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select ID Type</option>
                                    <%
                                        for (int i = 0; i < dataIdType4.size(); i++) {%>
                                    <option value="<%=dataIdType4.get(i).get(1)%>"><%=dataIdType4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                            <div class="col-md-8">
                                <input id="PMIino" name="textinput" type="text" placeholder="" class="form-control input-md" maxlength="10">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Category</label>
                            <div class="col-md-8">
                                <select id="PMIelicat" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Eligibility Category</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataEliCat4.size(); i++) {%>
                                    <option value="<%=dataEliCat4.get(i).get(1)%>"><%=dataEliCat4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                            <div class="col-md-8">
                                <select id="PMIelity" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Eligibility Type</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataEliType4.size();
                                                i++) {%>
                                    <option value="<%=dataEliType4.get(i).get(1)%>"><%=dataEliType4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Date of Birth</label>
                            <div class="col-md-8">
                                <input id="PMIbday" name="textinput" type="text" class="form-control input-md" required="">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Gender</label>
                            <div class="col-md-8">
                                <select id="PMIsex" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Gender</option>
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

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Martial Status</label>
                            <div class="col-md-8">
                                <select id="PMImarital" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Martial Status</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataMarital4.size();
                                                i++) {%>
                                    <option value="<%=dataMarital4.get(i).get(1)%>"><%=dataMarital4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Race</label>
                            <div class="col-md-8">
                                <select id="PMIrace" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Race</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataRace4.size();
                                                i++) {%>
                                    <option value="<%=dataRace4.get(i).get(1)%>"><%=dataRace4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Nationality</label>
                            <div class="col-md-8">
                               
                                <input id="PMInational" name="textinput" type="text" placeholder="select nationality.." class="form-control input-md">
                                <input id="PMInationalCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchnational"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Religion</label>
                            <div class="col-md-8">
                                <select id="PMIreligion" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Religion</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataReligion4.size();
                                                i++) {%>
                                    <option value="<%=dataReligion4.get(i).get(1)%>"><%=dataReligion4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <h4>Medical Information</h4>
                <hr/>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Blood Type</label>
                            <div class="col-md-6">
                                <select id="PMIblood" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Blood Type</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataBloodty4.size();
                                                i++) {%>
                                    <option value="<%=dataBloodty4.get(i).get(1)%>"><%=dataBloodty4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Blood Rhesus</label>
                            <div class="col-md-6">
                                <select id="PMIrhesus" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Blood Rhesus</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataRhesus4.size();
                                                i++) {%>
                                    <option value="<%=dataRhesus4.get(i).get(1)%>"><%=dataRhesus4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Allergy</label>
                            <div class="col-md-6">
                                <select id="PMIallergy" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Allergy</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataAllergy4.size();
                                                i++) {%>
                                    <option value="<%=dataAllergy4.get(i).get(1)%>"><%=dataAllergy4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Chronic Disease</label>
                            <div class="col-md-6">
                                <select id="PMIchronic" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Chronic Disease</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataChronicDesease4.size();
                                                i++) {%>
                                    <option value="<%=dataChronicDesease4.get(i).get(1)%>"><%=dataChronicDesease4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Organ Donor</label>
                            <div class="col-md-6">
                                <select id="PMIorgan" name="selectbasic" class="form-control">
                                    <option value="null" selected="" disabled="">Select Organ Donor Status</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataOrganDonor4.size();
                                                i++) {%>
                                    <option value="<%=dataOrganDonor4.get(i).get(1)%>"><%=dataOrganDonor4.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <h4>Patient Contact</h4>
                <hr/>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Home Address</label>
                            <div class="col-md-8">
                                <input id="PMIhadd" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home District</label>
                            <div class="col-md-7">

                                <input id="PMIhdis" name="textinput" type="text" placeholder="select district.." class="form-control input-md">
                                <input id="PMIhdisCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchHdis"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home Town</label>
                            <div class="col-md-7">
                                
                                <input id="PMIhtown" name="textinput" type="text" placeholder="select town.." class="form-control input-md">
                                <input id="PMIhtownCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchHtown"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home Postcode</label>
                            <div class="col-md-7">
                                
                                <input id="PMIhpostcode" name="textinput" type="text" placeholder="select postcode.." class="form-control input-md">
                                <input id="PMIhpostcodeCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchHpostcode"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home State</label>
                            <div class="col-md-7">
                              
                                <input id="PMIhstate" name="textinput" type="text" placeholder="select state.." class="form-control input-md">
                                <input id="PMIhstateCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchHstate"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Home Country</label>
                            <div class="col-md-7">
                                <!--                                <input id="PMIhcountry" class="form-control input-md">-->
                                <input id="PMIhcountry" name="textinput" type="text" placeholder="select country.." class="form-control input-md">
                                <input id="PMIhcountryCODE" name="PMIhcountryCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchHcountry"></div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Phone No.(Home)</label>
                            <div class="col-md-7">
                                <input id="PMIhphone" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Email Address</label>
                            <div class="col-md-7">
                                <input id="PMIemail" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Postal Address</label>
                            <div class="col-md-8">
                                <input id="PMIpadd" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal District</label>
                            <div class="col-md-7">
                               
                                <input id="PMIpdis" name="textinput" type="text" placeholder="select district.." class="form-control input-md">
                                <input id="PMIpdisCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchPdis"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal Town</label>
                            <div class="col-md-7">
                              
                                <input id="PMIptown" name="textinput" type="text" placeholder="select town.." class="form-control input-md">
                                <input id="PMIptownCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchPtown"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal Postcode</label>
                            <div class="col-md-7">
                                
                                <input id="PMIppostcode" name="textinput" type="text" placeholder="select postcode.." class="form-control input-md">
                                <input id="PMIppostcodeCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchPpostcode"></div>
                                
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal State</label>
                            <div class="col-md-7">
                                
                                <input id="PMIpstate" name="textinput" type="text" placeholder="select state.." class="form-control input-md">
                                <input id="PMIpstateCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchPstate"></div>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Postal Country</label>
                            <div class="col-md-7">
                                
                                <input id="PMIpcountry" name="textinput" type="text" placeholder="select country.." class="form-control input-md">
                                <input id="PMIpcountryCODE" name="PMIhcountryCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                <div id="matchPcountry"></div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Handphone No.</label>
                            <div class="col-md-7">
                                <input id="PMIhandphone" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>
                </div>

                <div class="text-center">
                    <!--                    <button class="btn btn-primary " type="button" disabled="">Save</button>-->
                    <button class="btn btn-primary " type="button" id="updatePatient"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                    <!--                    <button class="btn btn-default " type="button"> Appointment List</button>-->
                    <button class="btn btn-default " type="button" id="clearPMI"> <i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>



</script>
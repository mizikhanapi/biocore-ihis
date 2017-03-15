<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idType61 = "select * from adm_lookup_detail where master_reference_code = '0012'   ";
    
    String relation61 = "select * from adm_lookup_detail where master_reference_code = '0007'  ";

    ArrayList<ArrayList<String>> dataIdType61, dataRelation61;
    dataIdType61 = conn.getData(idType61);

    dataRelation61 = conn.getData(relation61);
%>
<!-- Modal -->
<div class="modal fade" id="KINModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Next Of Kin Information</h3>
            </div>
            <div class="modal-body" >

                <div class="thumbnail" id="maintainKIN">
                    <!--                    <h4>Next of Kin Information</h4>-->
                    <hr/>
                    <form class="form-horizontal" id="kinform">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>  
                                    <div class="col-md-7">
                                        <input id="KINpmino" name="KINpmino" type="text"  class="form-control input-md">
                                        <input id="KINseq" name="KINseq" type="hidden"  class="form-control input-md">

                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Relationship</label>  
                                    <div class="col-md-7">
                                        <select id="KINrelationship" name="KINrelationship" class="form-control">
                                            <option value="null" selected="" disabled="">Select Relationship</option>
                                            <option value="-">-</option>

                                            <%                                        for (int i = 0; i < dataRelation61.size(); i++) {%>
                                            <option value="<%=dataRelation61.get(i).get(1)%>"><%=dataRelation61.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">New IC</label>  
                                    <div class="col-md-7">
                                        <input id="KINnewic" name="KINnewic" type="text"  class="form-control input-md" maxlength="12">

                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                                    <div class="col-md-7">
                                        <select id="KINidtype" name="KINidtype" class="form-control">
                                            <option value="null" selected="" disabled="">Select ID Type</option>
                                            <option value="-">-</option>

                                            <%
                                                for (int i = 0; i < dataIdType61.size(); i++) {%>
                                            <option value="<%=dataIdType61.get(i).get(2)%>"><%=dataIdType61.get(i).get(2)%></option>
                                            <%  }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Date Of Birth</label>  
                                    <div class="col-md-7">
                                        <input id="KINdob" name="KINdob" type="text" class="form-control input-md">

                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Handphone Number</label>
                                    <div class="col-md-7">
                                        <input id="KINphone" name="KINphone" type="text" class="form-control input-md"maxlength="12" >
                                    </div>
                                </div>
                                

                            </div>

                            <div class="col-md-6">

                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Name</label>  
                                    <div class="col-md-7">
                                        <input id="KINname" name="KINname" type="text"  class="form-control input-md" maxlength="80">

                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Email</label>
                                    <div class="col-md-7">
                                        <input id="KINemail" name="KINemail" type="text" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Old IC</label>  
                                    <div class="col-md-7">
                                        <input id="KINoldic" name="KINoldic" type="text" class="form-control input-md" maxlength="8">

                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">ID number</label>
                                    <div class="col-md-7">
                                        <input id="KINidnumber" name="KINidnumber" type="text" class="form-control input-md">
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Occupation</label>
                                    <div class="col-md-7">

                                        <input id="KINoccu" name="textinput" type="text" placeholder="select occupation.." class="form-control input-md">
                                        <input id="KINoccuCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                        <div id="matcKINoccu"></div>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Homephone Number</label>
                                    <div class="col-md-7">
                                        <input id="KINhomephone" name="KINhomephone" type="text" class="form-control input-md" maxlength="12">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h4>Address</h4>
                        <hr/>
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Address</label>
                                    <div class="col-md-7">
                                        <input id="KINaddress" name="KINaddress" type="text" class="form-control input-md">
                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">District</label>
                                    <div class="col-md-7">

                                        <input id="KINdistrict" name="textinput" type="text" placeholder="select District.." class="form-control input-md">
                                        <input id="KINdistrictCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                        <div id="matcKINdistrict"></div>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Postcode</label>
                                    <div class="col-md-7">

                                        <input id="KINpostcode" name="textinput" type="text" placeholder="select Postcode.." class="form-control input-md">
                                        <input id="KINpostcodeCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                        <div id="matcKINpostcode"></div>
                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Country</label>
                                    <div class="col-md-7">

                                        <input id="KINcountry" name="textinput" type="text" placeholder="select Country.." class="form-control input-md">
                                        <input id="KINcountryCODE" type="hidden" class="form-control input-md">
                                        <div id="matcKINcountry"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">Town</label>
                                    <div class="col-md-7">

                                        <input id="KINtown" name="textinput" type="text" placeholder="select Town.." class="form-control input-md">
                                        <input id="KINtownCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                        <div id="matcKINtown"></div>
                                    </div>
                                </div>

                                <!-- Select Basic -->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="selectbasic">State</label>
                                    <div class="col-md-7">

                                        <input id="KINstate" name="textinput" type="text" placeholder="select State.." class="form-control input-md">
                                        <input id="KINstateCODE" name="PMIhstateCODE" type="hidden" placeholder="select country.." class="form-control input-md">
                                        <div id="matcKINstate"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <button id="KINsave" name="KINsave" class="btn btn-primary" data-dismiss="modal" role="button"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
                            <button id="KINclear" name="KINclear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                        </div>
                    </form>
                </div>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                </div>
                </form>
            </div>
        </div>
    </div>
</div>


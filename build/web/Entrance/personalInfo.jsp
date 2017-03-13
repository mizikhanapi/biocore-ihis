<%-- 
    Document   : personalInfo
    Created on : Mar 2, 2017, 10:15:38 AM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%Conn conn = new Conn();%>
 
<form class="form-horizontal" autocomplete="off">

    <div class="col-md-12"> <!-- start of user id information -->

       
        <div class="row">
            <br/><h4>User ID Information</h4><br/>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">User ID</label>
                    <div class="col-md-8">
                        <input id="PI_userID"  type="text" placeholder="User ID" class="form-control input-md" maxlength="30" readonly="true">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Health Facility</label>
                    <div class="col-md-8">
                        <input id="PI_hfc"  type="text" placeholder="Health Facility" class="form-control input-md">
                        <div id="PI_hfc_match">
                            <!--search result-->
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </div> <!-- end of user id information -->

    <div class="col-md-12">

        <div class="row">
            <hr/><h4>Basic Personal Information</h4><br/>


            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>
                    <div class="col-md-8">
                        <input id="PI_name" type="text" placeholder="Staff Name" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Title</label>
                    <div class="col-md-8">
                        <select id="PI_title" class="form-control input-md">
                            <option value="">-- Select title --</option>
                            <%
                                String sqlTitle = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0026'";
                                ArrayList<ArrayList<String>> dataTitle = conn.getData(sqlTitle);

                                for (int i = 0; i < dataTitle.size(); i++) {

                            %><option value="<%=dataTitle.get(i).get(0)%>"><%=dataTitle.get(i).get(1)%></option><%
                                }
                            %>

                        </select>
                    </div>
                </div>
            </div>

        </div> <!--end of first row--> 

        <div class="row"> <!--start second row-->

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">IC/ID No</label>
                    <div class="col-md-8">
                        <input id="PI_icno"  type="text" placeholder=" Staff IC or ID Number" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Email</label>
                    <div class="col-md-8">
                        <input id="PI_email"  type="text" placeholder="satff.email@example.com" class="form-control input-md" maxlength="100">
                    </div>
                </div>
            </div>

        </div> <!--end second row-->

    </div> <!--end basic info-->



    <div class="col-md-12"> <!-- start of detail information -->

        <div class="row">
            <hr/><h4>Detail Information</h4><br/>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Date of Birth</label>
                    <div class="col-md-8">
                        <input id="PI_dob"  type="text" placeholder="DD/MM/YYYY" class="form-control input-md" readonly="true">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Gender</label>
                    <div class="col-md-8">
                        <select id="PI_gender" class="form-control input-md">
                            <option value="">-- Select gender --</option>
                            <%
                                String sqlGender = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0041'";
                                ArrayList<ArrayList<String>> dataGender = conn.getData(sqlGender);

                                for (int i = 0; i < dataGender.size(); i++) {

                            %><option value="<%=dataGender.get(i).get(0)%>"><%=dataGender.get(i).get(1)%></option><%
                                }
                            %>  
                        </select>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Occupation</label>
                    <div class="col-md-8">
                        <select id="PI_occupation" class="form-control input-md">
                            <option value="">-- Select occupation --</option>  
                            <%
                                String sqlOccupation = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0050'";
                                ArrayList<ArrayList<String>> dataOccupation = conn.getData(sqlOccupation);

                                for (int i = 0; i < dataOccupation.size(); i++) {

                            %><option value="<%=dataOccupation.get(i).get(0)%>"><%=dataOccupation.get(i).get(1)%></option><%
                                }
                            %>  
                        </select>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Nationality</label>
                    <div class="col-md-8">
                        <select id="PI_nationality" class="form-control input-md">
                            <option value="">-- Select nationality --</option>  
                            <%
                                String sqlNationality = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0011'";
                                ArrayList<ArrayList<String>> dataNationality = conn.getData(sqlNationality);

                                for (int i = 0; i < dataNationality.size(); i++) {

                            %><option value="<%=dataNationality.get(i).get(0)%>"><%=dataNationality.get(i).get(1)%></option><%
                                }
                            %>  
                        </select>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Office Tel No</label>
                    <div class="col-md-8">
                        <input id="PI_officeTel"  type="text" placeholder="Office telephone (Optional)" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Home Tel No</label>
                    <div class="col-md-8">
                        <input id="PI_homeTel"  type="text" placeholder="Home telephone number (Optional)" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Mobile Phone</label>
                    <div class="col-md-8">
                        <input id="PI_mobile"  type="text" placeholder="Mobile phone number" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Fax No</label>
                    <div class="col-md-8">
                        <input id="PI_fax"  type="text" placeholder="Fax number (Optional)" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

        </div>


    </div> <!-- end of detail information -->



</form>

<script type="text/javascript">
    
   

</script>
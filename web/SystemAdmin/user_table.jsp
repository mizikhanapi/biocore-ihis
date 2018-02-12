<%-- 
    Document   : user_table
    Created on : Feb 17, 2017, 11:11:12 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String user_hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");
    String super_user = (String)session.getAttribute("USER_ID");
    
    MySession mys = new MySession(super_user, user_hfc);
    
%>
<table  id="THE_userTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>User ID</th>
    <th>Name</th>
    <th>Health Facility</th>
    <th>Mobile Phone</th>
    <th style="width: 5% ">Status</th>
    <th style="width: 5% ">Change Password</th>
    <th style="width: 5% ">Update</th>
    <th style="width: 5% ">Delete</th>
</thead>
<tbody>

    <%
        String whereClause = "";
        String disabled="";
        
        if(!mys.isSuperUser()){
    
          whereClause = "WHERE a.health_facility_code = '" + user_hfc + "'";
          disabled="disabled";
        }
        
        //                      0       1                       2           3                       4               5                                6        7       8               9           10          11          12      13                  14                                              15                                        16          17              18          19          20                          21                  22          23         24           25                      26                  27                  28                      29
        String sql = " SELECT user_id, a.health_facility_code, user_name, 'password' as dummy, occupation_code, DATE_FORMAT(birth_date,'%d/%m/%Y'), sex_code, new_icno, home_phone, office_phone, mobile_phone, a.fax_no, a.email, id_category_code, ifnull(DATE_FORMAT(start_date,'%d/%m/%Y'), '') ,ifnull(DATE_FORMAT(end_date,'%d/%m/%Y'), '') , title, nationality_code, user_type, user_group, user_classification_code, ifnull(a.status, '0'), hfc_name, mother_name, room_no, ifnull(login_status, '0'), c.discipline_code, d.discipline_name, c.subdiscipline_code, e.subdiscipline_name "
                + "FROM adm_users a join adm_health_facility b on a.health_facility_code = hfc_cd "
                + "join adm_user_access_role c using (user_id) "
                + "join adm_discipline d on c.discipline_code = d.discipline_cd and d.discipline_hfc_cd = a.health_facility_code "
                + "join adm_subdiscipline e on c.discipline_code = e.discipline_cd AND c.subdiscipline_code = e.subdiscipline_cd and e.subdiscipline_hfc_cd = a.health_facility_code "
                + whereClause;
        ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

        int size = dataUser.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="UT_hidden" type="hidden" value="<%=String.join("|", dataUser.get(i))%>">
<td><%= dataUser.get(i).get(0)%></td>
<td><%= dataUser.get(i).get(2)%></td>
<td><%= dataUser.get(i).get(22)%></td>
<td><%= dataUser.get(i).get(10)%></td>
<td><%if (dataUser.get(i).get(21).equals("1")) {
        out.print("Terminated");
    } else if(dataUser.get(i).get(21).equals("0")){
        out.print("Active");
    }else{
        out.print("Suspended");
    } %></td>

<td>
    <a id="UT_btnChangePassword" data-toggle="modal" data-target="#UT_detail2" style="cursor: pointer"><i class="fa fa-key" aria-hidden="true" style="display: inline-block;color: #337ab7;" ></i></a>
</td>

<td>

    <!-- Update Part Start -->
    <a id="UT_btnUpdate" data-toggle="modal" data-target="#UT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

    <!-- Modal Update -->

    <!-- Update Part End -->
</td>
<!-- Delete Part Start -->
<td>
    <!-- Delete Button Start -->
    <a id="UT_btnDelete" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
<!-- Delete Button End -->
</tr>
<%
    }
%>
</tbody>
</table>    


<div class="modal fade" id="UT_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update User</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">

                    <div class="col-md-12">

                        <div class="row">
                            <br/><h4>Basic Personal Information</h4><br/>


                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Name *</label>
                                    <div class="col-md-8">
                                        <input id="UT_name" type="text" placeholder="Insert Staff Name" class="form-control input-md" maxlength="100">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Title *</label>
                                    <div class="col-md-8">
                                        <select id="UT_title" class="form-control input-md">
                                            <option value="">-- Select title --</option>
                                            <%
                                                String sqlTitle = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0026' AND hfc_cd = '"+user_hfc+"' AND status = '0'";
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
                                    <label class="col-md-4 control-label" for="textinput">IC/ID No *</label>
                                    <div class="col-md-8">
                                        <input id="UT_icno"  type="text" placeholder="Insert Staff IC or ID Number" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Email *</label>
                                    <div class="col-md-8">
                                        <input id="UT_email"  type="text" placeholder="Insert staff.email@example.com" class="form-control input-md" maxlength="100">
                                    </div>
                                </div>
                            </div>

                        </div> <!--end second row-->

                    </div> <!--end basic info-->

                    <div class="col-md-12"> <!-- start of user id information -->


                        <div class="row">
                            <hr/><h4>User ID Information</h4><br/>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User ID *</label>
                                    <div class="col-md-8">
                                        <input id="UT_userID"  type="text" placeholder="User ID" class="form-control input-md" maxlength="30" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Health Facility *</label>
                                    <div class="col-md-8">
                                        <input id="UT_hfc" <%=disabled%>  type="text" placeholder="Search Health Facility" class="form-control input-md">
                                        <div id="UT_hfc_match"  class="search-drop">
                                            <!--search result-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                            
                            <div class="row">
                                
                                <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Discipline *</label>
                                    <div class="col-md-8">
                                        <input id="UT_discipline"  type="text" placeholder="Search Discipline" class="form-control input-md">
                                        <div id="UT_discipline_match" class="search-drop">
                                            <!--search result-->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Subdiscipline *</label>
                                    <div class="col-md-8">
                                        <input id="UT_subdiscipline"  type="text" placeholder="Search Subdiscipline" class="form-control input-md">
                                        <div id="UT_subdiscipline_match" class="search-drop">
                                            <!--search result-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                            </div>

                            

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Room No *</label>
                                    <div class="col-md-8">
                                        <input id="UT_roomNO"  type="text" placeholder="Insert room number" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Mother's Name *</label>
                                    <div class="col-md-8">
                                        <input id="UT_mother"  type="text" placeholder="Insert the staff mother's name" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Login Status *</label>
                                    <div class="col-md-8">
                                        <select id="UT_loginStatus"  class="form-control input-md">
                                            <option value="0">Logged Out</option>
                                            <option value="1">Logged In</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        


                    </div> <!-- end of user id information -->

                    <div class="col-md-12"> <!-- start of detail information -->

                        <div class="row">
                            <hr/><h4>Detail Information</h4><br/>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Date of Birth *</label>
                                    <div class="col-md-8">
                                        <input id="UT_dob"  type="text" placeholder="DD/MM/YYYY" class="form-control input-md" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Gender *</label>
                                    <div class="col-md-8">
                                        <select id="UT_gender" class="form-control input-md">
                                            <option value="">-- Select gender --</option>
                                            <%
                                                String sqlGender = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0041' AND hfc_cd = '"+user_hfc+"' AND status = '0'";
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
                                    <label class="col-md-4 control-label" for="textinput">Occupation *</label>
                                    <div class="col-md-8">
                                        <select id="UT_occupation" class="form-control input-md">
                                            <option value="">-- Select occupation --</option>  
                                            <%
                                                String sqlOccupation = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0050' AND hfc_cd = '"+user_hfc+"' AND status = '0'";
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
                                    <label class="col-md-4 control-label" for="textinput">Nationality *</label>
                                    <div class="col-md-8">
                                        <select id="UT_nationality" class="form-control input-md">
                                            <option value="">-- Select nationality --</option>  
                                            <%
                                                String sqlNationality = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0011' AND hfc_cd = '"+user_hfc+"' AND status = '0'";
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
                                        <input id="UT_officeTel"  type="text" placeholder="Office telephone (Optional)" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Home Tel No</label>
                                    <div class="col-md-8">
                                        <input id="UT_homeTel"  type="text" placeholder="Home telephone number (Optional)" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Mobile Phone *</label>
                                    <div class="col-md-8">
                                        <input id="UT_mobile"  type="text" placeholder="Insert Mobile phone number" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Fax No</label>
                                    <div class="col-md-8">
                                        <input id="UT_fax"  type="text" placeholder="Insert Fax number (Optional)" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div> <!-- end of detail information -->

                    <div class="col-md-12"> <!-- start of additional information -->

                        <div class="row">
                            <hr/><h4>Additional Information</h4><br/>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User ID Category</label>
                                    <div class="col-md-8">
                                        <input id="UT_userIDCategory" type="text" placeholder="Insert user ID category(Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User Type</label>
                                    <div class="col-md-8">
                                        <input id="UT_userType"  type="text" placeholder="Insert user type(Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User Group</label>
                                    <div class="col-md-8">
                                        <input id="UT_userGroup" type="text" placeholder="Insert user group(Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User Classification</label>
                                    <div class="col-md-8">
                                        <input id="UT_userClass"  type="text" placeholder="Insert user classification(Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Start Date *</label>
                                    <div class="col-md-8">
                                        <input id="UT_startDate" type="text" placeholder="DD/MM/YYYY"  class="form-control input-md" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">End Date *</label>
                                    <div class="col-md-8">
                                        <input id="UT_endDate"  type="text" placeholder="DD/MM/YYYY" class="form-control input-md" readonly>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User ID Status *</label>
                                    <div class="col-md-8">
                                        <select id="UT_userIDStatus" class="form-control input-md">
                                            <option value="0">Active</option>
                                            <option value="1">Terminated</option>
                                            <option value="2">Suspended</option>
                                        </select>
                                    </div>
                                </div>
                            </div>


                        </div><hr/>

                    </div> <!-- end of additional information -->


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="UT_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="UT_updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->

<!--modal change password-->
<div class="modal fade" id="UT_detail2" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Change User's Password</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm" autocomplete="off">

                    <div class="row">

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">User ID</label>
                                <div class="col-md-8">
                                    <input id="UT_userID2"  type="text"  class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">User Name</label>
                                <div class="col-md-8">
                                    <input id="UT_userName2"  type="text"  class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Password *</label>
                                <div class="col-md-8">
                                    <input id="UT_password"  type="password" placeholder="Type Password" class="form-control input-md" maxlength="30">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Retype Password *</label>
                                <div class="col-md-8">
                                    <input id="UT_password2"  type="password" placeholder="Type Password" class="form-control input-md" maxlength="30">
                                </div>
                            </div>
                        </div>

                    </div>



                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="UT_btnConfirmChangePassword">Change <span class="fa fa-check" aria-hidden="true" style="display: inline-block;" ></span></button>
                    </div>
                    <!--                    <div class="btn-group" role="group">
                                            <button type="reset"  class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                        </div>-->
                </div>
            </div>
        </div>
    </div>
</div>
<!--modal change password-->

<script src="libraries/validator.js" type="text/javascript"></script>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $('#THE_userTable').DataTable({
            deferRender: true
        });

        $('#UT_dob').datepicker({
            changeMonth: true,
            changeYear: true,
            maxDate: 0,
            dateFormat: 'dd/mm/yy',
            yearRange: '-100:nn'
        });

        $('#UT_startDate').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        $('#UT_endDate').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

//--------------------- global variable for hfc, discipline, subdiscipline ----------------------------------
        var isHFCselected = false;
        var selectedHFC = "";

        var isDisciplineSelected = false;
        var selectedDiscipline = "";

        var isSubdisciplineSelected = false;
        var selectedSubdiscipline = "";

//--------------------- global variable for hfc, discipline, subdiscipline end----------------------------------

        $('#userTable').off('click', '#THE_userTable #UT_btnUpdate').on('click', '#THE_userTable #UT_btnUpdate', function (e) {
            e.preventDefault();

            $('#UT_endDate').datepicker('option', 'minDate', null);

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#UT_hidden").val();
            var arrayData = rowData.split("|");

            //                      0       1                       2           3           4               5          6        7       8               9           10          
//        String sql = " SELECT user_id, health_facility_code, user_name, password, occupation_code, birth_date, sex_code, new_icno, home_phone, office_phone, mobile_phone, 
//        11          12      13                  14          15      16          17              18          19          20                      21      22
//        a.fax_no, a.email, id_category_code, start_date, end_date, title, nationality_code, user_type, user_group, user_classification_code, status, hfc_name "

//        
            //assign into seprated val
            var name = arrayData[2];
            var title = arrayData[16];
            var icNo = arrayData[7];
            var email = arrayData[12];
            var userID = arrayData[0];
            var hfc = arrayData[1];
            var hfcName = arrayData[22];
            //var password = arrayData[3];
            var dob = arrayData[5];
            var gender = arrayData[6];
            var occupation = arrayData[4];
            var nationality = arrayData[17];
            var officeTel = arrayData[9];
            var homeTel = arrayData[8];
            var mobilePhone = arrayData[10];
            var faxNo = arrayData[11];
            var userIDCategory = arrayData[13];
            var userType = arrayData[18];
            var userGroup = arrayData[19];
            var userClass = arrayData[20];
            var startDate = arrayData[14];
            var endDate = arrayData[15];
            var userIDStatus = arrayData[21];
            var mother = arrayData[23];
            var roomNo = arrayData[24];
            var loginStatus = arrayData[25];
            var dis_cd = arrayData[26];
            var dis_name = arrayData[27];
            var sub_cd = arrayData[28];
            var sub_name = arrayData[29];

            $('#UT_name').val(name);
            $('#UT_title').val(title);
            $('#UT_icno').val(icNo);
            $('#UT_email').val(email);
            $('#UT_userID').val(userID);
            $('#UT_hfc').val(hfc + " | " + hfcName);
            $('#UT_discipline').val(dis_cd + " | " + dis_name);
            $('#UT_subdiscipline').val(sub_cd + " | " + sub_name);
            //$('#UT_password').val(password);
            //$('#UT_password2').val(password);
            $('#UT_dob').val(dob);
            $('#UT_gender').val(gender);
            $('#UT_occupation').val(occupation);
            $('#UT_nationality').val(nationality);
            $('#UT_officeTel').val(officeTel);
            $('#UT_homeTel').val(homeTel);
            $('#UT_mobile').val(mobilePhone);
            $('#UT_fax').val(faxNo);
            $('#UT_userIDCategory').val(userIDCategory);
            $('#UT_userType').val(userType);
            $('#UT_userGroup').val(userGroup);
            $('#UT_userClass').val(userClass);
            $('#UT_startDate').val(startDate);
            $('#UT_endDate').val(endDate);
            $('#UT_userIDStatus').val(userIDStatus);
            $('#UT_mother').val(mother);
            $('#UT_roomNO').val(roomNo);
            $('#UT_loginStatus').val(loginStatus);

            isHFCselected = true;
            selectedHFC = $('#UT_hfc').val();

            isDisciplineSelected = true;
            selectedDiscipline = $('#UT_discipline').val();

            isSubdisciplineSelected = true;
            selectedSubdiscipline = $('#UT_subdiscipline').val();
        });

        $("#UT_btn_update_").off('click').on('click', function (e) {

            e.preventDefault();
            var startDateX = $('#UT_startDate').datepicker('getDate');
            var endDateX = $('#UT_endDate').datepicker('getDate');

            var name = $('#UT_name').val();
            var title = $('#UT_title').val();
            var icNo = $('#UT_icno').val();
            var email = $('#UT_email').val();
            var userID = $('#UT_userID').val();
            var hfc = $('#UT_hfc').val();
            var discipline = $('#UT_discipline').val();
            var subdiscipline = $('#UT_subdiscipline').val();
            //var password = $('#UT_password').val();
            //var password2 = $('#UT_password2').val();
            var dob = $('#UT_dob').val();
            var gender = $('#UT_gender').val();
            var occupation = $('#UT_occupation').val();
            var nationality = $('#UT_nationality').val();
            var officeTel = $('#UT_officeTel').val();
            var homeTel = $('#UT_homeTel').val();
            var mobilePhone = $('#UT_mobile').val();
            var faxNo = $('#UT_fax').val();
            var userIDCategory = $('#UT_userIDCategory').val();
            var userType = $('#UT_userType').val();
            var userGroup = $('#UT_userGroup').val();
            var userClass = $('#UT_userClass').val();
            var startDate = $('#UT_startDate').val();
            var endDate = $('#UT_endDate').val();
            var userIDStatus = $('#UT_userIDStatus').val();
            var mother = $('#UT_mother').val();
            var roomNo = $('#UT_roomNO').val();
            var loginStatus = $('#UT_loginStatus').val();

            $('#UT_detail').css('overflow', 'auto');

            if (name === "") {
                //$('#UT_detail').modal('hide');

                bootbox.alert("Fill in the staff name");

            } else if (title === "" || title === null) {
                bootbox.alert("Select the title");

            } else if (icNo === "") {
                bootbox.alert("Fill in the staff IC/ID Number");

            } else if (email === "") {
                bootbox.alert("Fill in the staff email");

            } else if (userID === "") {
                bootbox.alert("Fill in the staff user ID");

            } else if (hfc === "") {
                bootbox.alert("Fill in the staff health facility");

            } else if (discipline === "") {
                bootbox.alert("Fill in the staff discipline");

            } else if (subdiscipline === "") {
                bootbox.alert("Fill in the staff subdiscipline");

            } else if (dob === "") {
                bootbox.alert("Select the staff date of birth");

            } else if (gender === "" || gender === null) {
                bootbox.alert("Select the staff gender");

            } else if (occupation === "" || occupation === null) {
                bootbox.alert("Select the staff occupation");

            } else if (nationality === "" || nationality === null) {
                bootbox.alert("Select the staff nationality");

            } else if (mobilePhone === "") {
                bootbox.alert("Fill in the staff mobile phone number");

            } else if (startDate === "" || endDate === "") {
                bootbox.alert("Select the start date and end date of the staff");

            } else if (mother === "") {
                bootbox.alert("Fill in the staff mother's name");

            } else if (roomNo === "") {
                bootbox.alert("Fill in the room number");

            } else if (ValidateEmail(email) === false) {
                bootbox.alert("Invalid email address");
                $('#UT_email').val("");

            } else if (isHFCselected === false || selectedHFC !== hfc) {
                bootbox.alert("Choose existing health facility");
                $('#UT_hfc').val("");

            } else if (isDisciplineSelected === false || selectedDiscipline !== discipline) {
                bootbox.alert("Choose existing discipline");
                $('#UT_discipline').val("");

            } else if (isSubdisciplineSelected === false || selectedSubdiscipline !== subdiscipline) {
                bootbox.alert("Choose existing subdiscipline");
                $('#UT_subdiscipline').val("");

            } else if (officeTel !== "" && validatePhonenumber(officeTel) === false) {
                bootbox.alert("Invalid office telephone number. Only numbers and +, - signs are allowed.");
                $('#UT_officeTel').val("");

            } else if (faxNo !== "" && validatePhonenumber(faxNo) === false) {
                bootbox.alert("Invalid fax number. Only numbers and +, - signs are allowed.");
                $('#UT_fax').val("");

            } else if (homeTel !== "" && validatePhonenumber(homeTel) === false) {
                bootbox.alert("Invalid home telephone number. Only numbers and +, - signs are allowed.");
                $('#UT_homeTel').val("");

            } else if (validatePhonenumber(mobilePhone) === false) {
                bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.");
                $('#UT_mobile').val("");

            } else if (startDateX > endDateX) {
                bootbox.alert("End date must be later than start date");
                $('#UT_endDate').datepicker('option', 'minDate', startDateX);
                $('#UT_endDate').val("");

            } else {
                
                name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                mother = mother.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

                var array = hfc.split("|");
                hfc = array[0].trim();

                var array2 = discipline.split("|");
                discipline = array2[0].trim();

                var array3 = subdiscipline.split("|");
                subdiscipline = array3[0].trim();

                var data = {
                    process: "normal",
                    name: name,
                    title: title,
                    icNo: icNo,
                    email: email,
                    userID: userID,
                    hfc: hfc,
                    discipline: discipline,
                    subdiscipline: subdiscipline,
                    dob: dob,
                    gender: gender,
                    occupation: occupation,
                    nationality: nationality,
                    officeTel: officeTel,
                    homeTel: homeTel,
                    mobilePhone: mobilePhone,
                    faxNo: faxNo,
                    userIDCategory: userIDCategory,
                    userType: userType,
                    userGroup: userGroup,
                    userClass: userClass,
                    startDate: startDate,
                    endDate: endDate,
                    userIDStatus: userIDStatus,
                    mother: mother,
                    roomNo: roomNo,
                    loginStatus: loginStatus
                };

                $.ajax({
                    url: "user_update.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#userTable').load('user_table.jsp');
                            $(".modal-backdrop").hide();
                            bootbox.alert("User is updated");


                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Update failed!");
                            //$('#UM_detail').modal('hide');


                        } else {
                            bootbox.alert(datas.trim());

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    }

                });
            }

        });


        $('#userTable').off('click', '#THE_userTable #UT_btnDelete').on('click', '#THE_userTable #UT_btnDelete', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#UT_hidden").val();
            var arrayData = rowData.split("|");
            //assign into seprated val
            var userID = arrayData[0], name = arrayData[2];
            //console.log(arrayData);

            bootbox.confirm({
                message: "Are you sure want to delete this user? " + userID + "-" + name,
                title: "Delete User?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {

                    if (result === true) {

                        var data = {
                            userID: userID
                        };

                        $.ajax({
                            url: "user_delete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {
                                    $('#userTable').load('user_table.jsp');
                                    //alert("Delete Success");

                                    bootbox.alert({
                                        message: "A user is deleted",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {
                                    bootbox.alert("Delete failed!");

                                } else {

                                    bootbox.alert(datas.trim());
                                }

                            },
                            error: function (err) {
                                alert("Error! Deletion failed!!");
                            }

                        });

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });


        });

<%
    if(mys.isSuperUser()){
%>
//----------------------------- search hfc --------------------------------
// only super user can have this function
        $('#UT_hfc').on('keyup', function () {

            var input = $('#UT_hfc').val();

            if (input.length > 0) {

                var data = {input: input};

                $.ajax({
                    url: "UM_result.jsp",
                    type: 'POST',
                    data: data,
                    timeout: 10000,
                    success: function (data) {
                        $('#UT_hfc_match').html(data);
                        $('#UM_hfc_matchlist li').on('click', function () {

                            $('#UT_hfc').val($(this).text());
                            $('#UT_hfc_match').text('');
                            isHFCselected = true;
                            selectedHFC = $('#UT_hfc').val();

                        });
                    },
                    error: function () {
                        $('#UT_hfc_match').text('Problem!');
                    }

                });

            } else {
                $('#UT_hfc_match').text('');
            }

        });
//----------------------------- search hfc end --------------------------------

<%    
    }// end if super user
%>


//----------------------------- search discipline --------------------------------
        $('#UT_discipline').on('keyup', function () {
            var hfc = $('#UT_hfc').val();
            var input = $(this).val();

            if (input.length > 0) {

                //make sure hfc is selected fisrt before we can search discipline
                if (isHFCselected === false || selectedHFC !== hfc) {
                    bootbox.alert("Select health facility first!");

                } else {

                    $('#UT_discipline_match').html('<img src = "img/ajax-loader.gif">');
                    var array = hfc.split("|");
                    hfc = array[0];
                    var data = {
                        process: 'discipline',
                        hfc: hfc,
                        searchKey: input
                    };

                    $.ajax({
                        type: 'POST',
                        url: 'controller/UM_search_discipline_subdiscipline.jsp',
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            $('#UT_discipline_match').html(data);
                            $('#UM_discipline_matchlist li').on('click', function () {

                                $('#UT_discipline').val($(this).text());
                                $('#UT_discipline_match').text('');
                                isDisciplineSelected = true;
                                selectedDiscipline = $('#UT_discipline').val();

                            });

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#UT_discipline_match').text("Opps! " + errorThrown);

                        }
                    });

                }

            } else {
                $('#UT_discipline_match').text('');

            }


        });
//----------------------------- search discipline end --------------------------------

//------------------------------------ search subdiscipline ------------------------------------------
        $('#UT_subdiscipline').on('keyup', function () {
            var hfc = $('#UT_hfc').val();
            var discipline = $('#UT_discipline').val();
            var input = $(this).val();
            
            if (input.length > 0) {

                //make sure discipline is selected fisrt before we can search discipline
                if (isDisciplineSelected === false || selectedDiscipline !== discipline) {
                    bootbox.alert("Select discipline first!");

                } else {
                    
                    $('#UT_subdiscipline_match').html('<img src = "img/ajax-loader.gif">');
                    var array = hfc.split("|");
                    hfc = array[0].trim();
                    
                    var array2 = discipline.split("|");
                    discipline = array2[0].trim();
                    
                    var data = {
                        process: 'subdiscipline',
                        discipline: discipline,
                        hfc: hfc,
                        searchKey: input
                    };

                    $.ajax({
                        type: 'POST',
                        url: 'controller/UM_search_discipline_subdiscipline.jsp',
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            $('#UT_subdiscipline_match').html(data);
                            $('#UM_subdiscipline_matchlist li').on('click', function () {

                                $('#UT_subdiscipline').val($(this).text());
                                $('#UT_subdiscipline_match').text('');
                                isSubdisciplineSelected = true;
                                selectedSubdiscipline = $('#UT_subdiscipline').val();

                            });

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#UT_subdiscipline_match').text("Opps! " + errorThrown);
                            console.log(discipline);

                        }
                    });

                }

            } else {
                $('#UT_subdiscipline_match').text('');

            }


        });

//------------------------------------ search subdiscipline end------------------------------------------     

//----------------------- check changes of hfc, discipline after selection is made ------------------------------ 
        $('#UT_hfc').on('blur', function(){
            
            // if change then clear discipline and subdiscipline
            if(isHFCselected === false || selectedHFC !== $(this).val()){
                 $('#UT_discipline').val('');
                 $('#UT_subdiscipline').val('');
            
            }else{
                return false;
            }
        });
        
        $('#UT_discipline').on('blur', function(){
            
            // if change then clear subdiscipline
            if(isDisciplineSelected === false || selectedDiscipline !== $(this).val()){
                $('#UT_subdiscipline').val('');
                 
            
            }else{
                return false;
            }
        });

//----------------------- check changes of hfc, discipline after selection is made end ------------------------------

        $('#userTable').off('click', '#THE_userTable #UT_btnChangePassword').on('click', '#THE_userTable #UT_btnChangePassword', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#UT_hidden").val();
            var arrayData = rowData.split("|");
            //assign into seprated val
            var userID = arrayData[0], name = arrayData[2];

            $('#UT_userID2').val(userID);
            $('#UT_userName2').val(name);


        });

        $('#UT_btnConfirmChangePassword').on('click', function () {

            var userID = $('#UT_userID2').val();
            var userName = $('#UT_userName2').val();

            var password = $('#UT_password').val();
            var password2 = $('#UT_password2').val();

            if (userID === "" || userName === "") {
                bootbox.alert("Something wrong!!!");

            } else if (password === "" || password2 === "") {
                bootbox.alert("Fill in all fields");

            } else if (password.length < 6) {
                bootbox.alert("Password must at least has 6 characters");
                $('#UT_password').val("");
                $('#UT_password2').val("");

            } else if (password !== password2) {
                bootbox.alert("Password do not match");
                $('#UT_password').val("");
                $('#UT_password2').val("");


            } else {

                var data = {
                    process: "password",
                    userID: userID,
                    password: password
                };

                $.ajax({
                    type: 'POST',
                    url: "user_update.jsp",
                    data: data,
                    success: function (datas) {
                        if (datas.trim() === 'Success') {

                            $('#userTable').load('user_table.jsp');
                            $(".modal-backdrop").hide();
                            bootbox.alert("User is updated");


                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Update failed!");
                            //$('#UM_detail').modal('hide');


                        } else {
                            bootbox.alert(datas.trim());

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    }

                });
            }

        });



    });
</script>


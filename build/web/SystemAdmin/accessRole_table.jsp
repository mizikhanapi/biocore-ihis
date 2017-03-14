<%-- 
    Document   : accessRole_table
    Created on : Feb 24, 2017, 5:12:55 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>

<table  id="THE_accessRoleTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>User ID</th>
    <th>Name</th>
    <th>Role</th>
    <th>Discipline</th>
    <th>Subdiscipline</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        //                      0           1           2           3           4                   5               6                   7               8                       9
        String sql = "Select ua.user_id, user_name, ua.role_code, role_name, ua.discipline_code, discipline_name, ua.subdiscipline_code, subdiscipline_name, ifnull(ua.status, ''), u.health_facility_code "
                + "FROM adm_users u join adm_user_access_role ua using(user_id) "
                + "join adm_role r on ua.role_code = r.role_code or ua.role_code = role_name "
                + "left join adm_discipline d on discipline_code = d.discipline_cd "
                + "left join adm_subdiscipline s on subdiscipline_code = subdiscipline_cd and discipline_code = s.discipline_cd "
                + "Where u.health_facility_code = '"+hfc+"'";
        ArrayList<ArrayList<String>> dataAccess = conn.getData(sql);

        int size = dataAccess.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="ART_hidden" type="hidden" value="<%=String.join("|", dataAccess.get(i))%>">
<td><%= dataAccess.get(i).get(0)%></td> <!--id  -->   
<td><%= dataAccess.get(i).get(1)%></td> <!--name  --> 
<td><%= dataAccess.get(i).get(3)%></td> <!--role --> 
<td><%= dataAccess.get(i).get(5)%></td> <!--discipline   --> 
<td><%= dataAccess.get(i).get(7)%></td> <!--sub  -->
<td><%if(dataAccess.get(i).get(8).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td> <!--status --> 

<td style="width: 5% ">

    <!-- Update Part Start -->
    <a id="ART_btnUpdate" data-toggle="modal" data-target="#ART_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td style="width: 5% ">
    <!-- Delete Button Start -->
    <a id="ART_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>



<%
    }
%>

</tbody>
</table>

<!-- Modal Update -->
<div class="modal fade" id="ART_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update User Access</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form autocomplete="off" class="form-horizontal">

                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">User</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ART_user" placeholder="User" readonly="true">
                            
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role</label>
                        <div class="col-md-8">
                            <select id="ART_role" class="form-control input-md">
                                            <option value="">-- Select role --</option>
                                            <%
                                                String sqlRole = "Select role_code, role_name FROM adm_role";
                                                ArrayList<ArrayList<String>> dataRole = conn.getData(sqlRole);

                                                for (int i = 0; i < dataRole.size(); i++) {

                                            %><option value="<%=dataRole.get(i).get(0)%>"><%=dataRole.get(i).get(1)%></option><%
                                                }
                                            %>

                            </select>
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline</label>
                        <div class="col-md-8">
                            <select id="ART_discipline" class="form-control input-md">
                                <option value="">-- Select discipline--</option>
                            </select>
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline</label>
                        <div class="col-md-8">
                            <select id="ART_subdiscipline" class="form-control input-md">
                                <option value="">-- Select subdiscipline--</option>
                            </select>
                        </div>
                    </div> 
                     
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="ART_status">
                                <option  value="0" >Active</option>
                                <option  value="1" >Inactive</option>
                            </select>
                        </div>
                    </div>

                    
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="ART_btnUpdateConfirm">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset"  class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->
<!-- Update Part End -->

<!-- Delete Part Start -->


<script type="text/javascript" charset="utf-8">
    
    var ART_G_hfcCode;

    $('#accessRoleTable').off('click', '#THE_accessRoleTable #ART_btnUpdate').on('click', '#THE_accessRoleTable #ART_btnUpdate', function (e) {
        e.preventDefault();
        
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#ART_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var userID = arrayData[0], userName = arrayData[1], roleCode = arrayData[2], disciplineCode = arrayData[4], status = arrayData[8], subdisciplineCode = arrayData[6], hfcCode = arrayData[9];
        //set value in input on the top
        ART_G_hfcCode = hfcCode;
        ART_createDisciplineList(disciplineCode);
        ART_createSubList(disciplineCode, subdisciplineCode);
        
        $('#ART_user').val(userID +" | "+ userName);
        $('#ART_role').val(roleCode);
        
        $('#ART_subdiscipline').val(subdisciplineCode);
       
        if (status === '1')
            $('#ART_status').val(1);
        else
            $('#ART_status').val(0);

        
    });


    $('#ART_btnUpdateConfirm').on('click', function () {

        var userID = $('#ART_user').val();
        var roleCode = $('#ART_role').val();
        var disciplineCode = $('#ART_discipline').val();
        var subdisciplineCode = $('#ART_subdiscipline').val();
        var status = $('#ART_status').val();

        if (roleCode === "" || roleCode === null) { 
            bootbox.alert("Please choose the role");
            
        }else if (disciplineCode === "" || disciplineCode === null) {
            bootbox.alert("Select the discipline");
            
        } else if (subdisciplineCode === "" || subdisciplineCode === null) {
            bootbox.alert("Select the subdiscipline");
            
        } else if (status !== '1' && status !== '0') {
            bootbox.alert("Please choose the status");
            

        } else {
            
            var array = userID.split("|");
            userID = array[0].trim();

            var data = {
                userID : userID,
                roleCode : roleCode,
                disciplineCode : disciplineCode,
                subdisciplineCode : subdisciplineCode,
                status : status
            };

            $.ajax({
                url: "accessRole_update.jsp",
                type : "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    console.log(datas.trim());
                    if (datas.trim() === 'Success') {
                        $('#accessRoleTable').load('accessRole_table.jsp');
                        $(".modal-backdrop").hide();
                        //alert("Update Success");
                        
                        bootbox.alert({
                                    message: "Access role is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                        
                    } else if (datas.trim() === 'Failed') {
                        alert("Update failed!");

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });
        }



    });

    $('#accessRoleTable').off('click', '#THE_accessRoleTable #ART_btnDelete').on('click', '#THE_accessRoleTable #ART_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#ART_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var userID = arrayData[0], roleCode = arrayData[2];
        
        
        bootbox.confirm({
            message: "Are you sure want to delete this role assignment? " + userID + "-" + roleCode,
            title: "Delete Item?",
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
                        roleCode: roleCode,
                        userID: userID
                    };

                    $.ajax({
                        url: "subdiscipline_delete.jsp",
                        subdisciplineCode: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#accessRoleTable').load('accessRole_table.jsp');
                                //alert("Delete Success");
                                 bootbox.alert({
                                    message: "A subdiscipline is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                                
                            } else if (datas.trim() === 'Failed') {
                                alert("Delete failed!");
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
    
    
    $('#ART_discipline').on('change', function(){
            
           ART_createSubList($(this).val(), "");
        });
    
    
    function ART_createDisciplineList(disciplineCode){
            var data = {process : "discipline", hfc : ART_G_hfcCode};
            $.ajax({
                url: "ARM_result.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                   $('#ART_discipline').html(datas);
                   $('#ART_discipline').val(disciplineCode);

                },
                error: function (err) {
                    console.log("Ajax Is Not Success");
                }

            });
            
    }
    
    
    function ART_createSubList(disciplineCode, subdisciplineCode){
        
        var data = {process : "subdiscipline",
                        discipline : disciplineCode,
                        hfc : ART_G_hfcCode
                        };
            
            $.ajax({
                url: "ARM_result.jsp",
                type: 'POST',
                data: data,
                timeout: 10000,
                success: function (data) {
                    
                    $('#ART_subdiscipline').html(data);
                    $('#ART_subdiscipline').val(subdisciplineCode);
                        
                },
                error: function (jqXHR, textStatus, errorThrown) {
                        
                    }
            });
    }



</script>  


<!-- Delete Part Start -->




<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_accessRoleTable').DataTable({
            deferRender : true
        });
        
                
    });
</script>


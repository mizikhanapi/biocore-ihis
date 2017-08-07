<%-- 
    Document   : assignDiscipline_table
    Created on : Feb 15, 2017, 10:18:58 AM
    Author     : user
--%>
<%@page import="ADM_helper.MySession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String user_id = session.getAttribute("USER_ID").toString();
    
    MySession mys = new MySession(user_id, hfc_cd);
%>

<table  id="THE_assignDisciplineTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
     <th>Health Facility Code</th>
    <th>Health Facility</th>
     <th>Discipline Code</th>
    <th>Discipline</th>
    <th>Subdiscipline Code</th>
    <th>Subdiscipline</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String whereClause = " ";
        if(!mys.isSuperUser()){
            whereClause = " where hd.hfc_cd = '"+hfc_cd+"'";
        }
        
        //                      0           1           2                   3                   4                   5                       6
        String sql ="SELECT hd.hfc_cd, hf.hfc_name, hd.discipline_cd, d.discipline_name, hd.subdiscipline_cd, sd.subdiscipline_name, hd.hfc_discipline_status "
                + "from adm_hfc_discipline hd "
                + "join adm_health_facility hf on hf.hfc_cd = hd.hfc_cd "
                + "join adm_discipline d on d.discipline_cd = hd.discipline_cd and d.discipline_hfc_cd = hd.hfc_cd "
                + "join adm_subdiscipline sd on sd.subdiscipline_cd = hd.subdiscipline_cd and sd.discipline_cd = hd.discipline_cd and sd.subdiscipline_hfc_cd = hd.hfc_cd "
                +whereClause;
        
        ArrayList<ArrayList<String>> dataHD = conn.getData(sql);

        int size = dataHD.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
<input id="ADT_hidden" type="hidden" value="<%=String.join("|", dataHD.get(i))%>">
<td style="width: 10%"><%= dataHD.get(i).get(0)%></td>
<td><%= dataHD.get(i).get(1)%></td> <!-- hfc --> 
<td style="width: 10%"><%= dataHD.get(i).get(2)%></td>
<td><%= dataHD.get(i).get(3)%></td> <!-- discipline  --> 
<td style="width: 10%"><%= dataHD.get(i).get(4)%></td>
<td><%= dataHD.get(i).get(5)%></td> <!-- subdiscipline  --> 
<td style="width: 5%"><%if(dataHD.get(i).get(6).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td> <!--status --> 

<td style="width: 5% ">

    <!-- Update Part Start -->
    <a id="ADT_btnUpdate" data-toggle="modal" data-target="#ADT_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td style="width: 5% ">
    <!-- Delete Button Start -->
    <a id="ADT_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>



<%
    }
%>

</tbody>
</table>

<!-- Modal Update -->
<div class="modal fade" id="ADT_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Discipline Assignment</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form autocomplete="off" class="form-horizontal">

                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Health Facility Code*</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ADT_hfc" placeholder="Health Facility" readonly>
                            
                        </div>
                    </div>
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Health Facility Name</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ADT_hfc_name" placeholder="Health Facility" readonly>
                            
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Code*</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ADT_discipline" placeholder="Discipline" readonly>
                            
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discipline Name</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ADT_discipline_name" placeholder="Discipline" readonly>
                            
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline Code*</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ADT_subdiscipline" placeholder="Subdiscipline" readonly>
                          
                        </div>
                    </div>
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Subdiscipline Name</label>
                        <div class="col-md-8">
                            <input type="text"  class="form-control" id="ADT_subdiscipline_name" placeholder="Subdiscipline" readonly>
                          
                        </div>
                    </div>
                     
                    
                     <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="ADT_status">
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
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="ADT_btnUpdateConfirm">Update</button>
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

    $('#assignDisciplineTable').off('click', '#THE_assignDisciplineTable #ADT_btnUpdate').on('click', '#THE_assignDisciplineTable #ADT_btnUpdate', function (e) {
        e.preventDefault();
        
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#ADT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var hfcCode = arrayData[0], hfcName = arrayData[1], disciplineCode = arrayData[2], disName = arrayData[3], subdisciplineCode = arrayData[4], subName = arrayData[5], status = arrayData[6];
        //set value in input on the top
        $('#ADT_hfc').val(hfcCode);
        $('#ADT_hfc_name').val(hfcName);
        
        $('#ADT_discipline').val(disciplineCode);
        $('#ADT_discipline_name').val(disName);
        $('#ADT_subdiscipline').val(subdisciplineCode);
        $('#ADT_subdiscipline_name').val(subName);
       
        
        if (status === '1')
            $('#ADT_status').val(1);
        else
            $('#ADT_status').val(0);

            console.log(status);
    });


    $('#ADT_btnUpdateConfirm').on('click', function () {

        var hfcCode = $('#ADT_hfc').val();
        var disciplineCode = $('#ADT_discipline').val();
        var subdisciplineCode = $('#ADT_subdiscipline').val();
        var status = $('#ADT_status').val();

      if (status !== '1' && status !== '0') {
            alert("Please choose the status");
            $('#ADT_status').focus();

        } else {

            var data = {
                hfcCode : hfcCode,
                disciplineCode : disciplineCode,
                subdisciplineCode : subdisciplineCode,
                status : status
            };

            $.ajax({
                url: "assignDiscipline_update.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    console.log(datas.trim());
                    if (datas.trim() === 'Success') {
                        $('#assignDisciplineTable').load('assignDiscipline_table.jsp');
                        $(".modal-backdrop").hide();
                        //alert("Update Success");
                        
                        bootbox.alert({
                                    message: "Health facility discipline assignment is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                        
                    } else if (datas.trim() === 'Failed') {
                        bootbox.alert("Update failed!");

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });
        }



    });

    $('#assignDisciplineTable').off('click', '#THE_assignDisciplineTable #ADT_btnDelete').on('click', '#THE_assignDisciplineTable #ADT_btnDelete', function (e) {
        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#ADT_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var hfcCode = arrayData[0], disciplineCode = arrayData[2], subdisciplineCode = arrayData[4];
               
        bootbox.confirm({
            message: "Are you sure want to delete this item? " + hfcCode + "-" + disciplineCode + "-" + subdisciplineCode,
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
                        hfcCode : hfcCode,
                        disciplineCode : disciplineCode,
                        subdisciplineCode : subdisciplineCode
                    };

                    $.ajax({
                        url: "assignDiscipline_delete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#assignDisciplineTable').load('assignDiscipline_table.jsp');
                                //alert("Delete Success");
                                 bootbox.alert({
                                    message: "A health facility discipline assignment is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                                
                            }
                            else if (datas.trim() === 'Failed') {
                                bootbox.alert("Delete failed!");
                            
                            }
                            else{
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



</script>  


<!-- Delete Part Start -->




<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_assignDisciplineTable').DataTable();

        
    });
</script>





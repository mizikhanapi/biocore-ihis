<%-- 
    Document   : responsibility_table
    Created on : Mar 2, 2017, 4:29:36 AM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>
<table  id="THE_responsibilityTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="width: 15% ">Role Name</th>
    <th>Page Code</th>
    <th>Page Name</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        //                          0           1           2           3               4               5               6
        String sql = " select res.page_code, page_name, res.role_code, role_name, res.system_code, res.module_code, res.status "
                + "from adm_responsibility res join adm_role r using (role_code) "
                + "join adm_page p using (page_code)";
        ArrayList<ArrayList<String>> dataRes = conn.getData(sql);

        int size = dataRes.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="REST_hidden" type="hidden" value="<%=String.join("|", dataRes.get(i))%>">
        <td><%= dataRes.get(i).get(3)%></td>
        <td><%= dataRes.get(i).get(0)%></td>
        <td><%= dataRes.get(i).get(1)%></td>
        <td style="width: 5% "><%if(dataRes.get(i).get(6).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td>


        <td style="width: 5% ">

            <!-- Update Part Start -->
            <a id="REST_btnUpdate" data-toggle="modal" data-target="#REST_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td style="width: 5% ">
            <!-- Delete Button Start -->
            <a id="REST_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
</table>    


<div class="modal fade" id="REST_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Responsibility</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Code</label>
                        <div class="col-md-8">
                            <input id="REST_roleCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Role Name</label>
                        <div class="col-md-8">
                            <input id="REST_roleName"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">System Code</label>
                        <div class="col-md-8">
                            <input id="REST_systemCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Module Code</label>
                        <div class="col-md-8">
                            <input type="text" id="REST_moduleCode" class="form-control" readonly="true" >
                        </div>
                    </div>
                    
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Page Code</label>
                        <div class="col-md-8">
                            <input id="REST_pageCode"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>
                     
                     <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Page Name</label>
                        <div class="col-md-8">
                            <input id="REST_pageName"  type="text"  class="form-control input-md"  readonly>
                        </div>
                    </div>
                    
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <select class="form-control" name="tstatus" id="REST_status">
                                <option value="0" >Active</option>
                                <option value="1" >Inactive</option>
                                
                            </select>
                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="REST_btn_update_">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="REST_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update -->


<script type="text/javascript" charset="utf-8">
    
    $('#responsibilityTable').off('click', '#THE_responsibilityTable #REST_btnUpdate').on('click', '#THE_responsibilityTable #REST_btnUpdate', function (e) {
        e.preventDefault();
  
        //get the row value
        var row = $(this).closest("tr");
        var rowData = row.find("#REST_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var roleName = arrayData[3], roleCode = arrayData[2], systemCode = arrayData[4], moduleCode = arrayData[5], pageCode = arrayData[0], pageName = arrayData[1], status = arrayData[6];
        //set value in input on the top
        $('#REST_systemCode').val(systemCode);
        $('#REST_moduleCode').val(moduleCode);
        $('#REST_roleCode').val(roleCode);
        $('#REST_roleName').val(roleName);
        $('#REST_pageCode').val(pageCode);
        $('#REST_pageName').val(pageName);
        
        if(status === '1')
            $('#REST_status').val(1);
        else
            $('#REST_status').val(0);
          
        
        
    });
    
    $("#REST_btn_update_").off('click').on('click', function (e) {
        
        e.preventDefault();
        //console.log("entering Update");
       var roleCode = $('#REST_roleCode').val();
       var pageCode = $('#REST_pageCode').val();
       var status = $('#REST_status').val();

       if(status !=='1' && status !=='0'){
            alert("Select the status");
        }
        else{
            var data = {
                roleCode : roleCode,
                pageCode : pageCode,
                status : status
            };
            
            //console.log("entering Ajax");
            $.ajax({
                url: "responsibility_update.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#responsibilityTable').load('responsibility_table.jsp');
                            $(".modal-backdrop").hide();
                            //alert("Update Success");
                            
                            bootbox.alert({
                                    message: "Responsibility is updated",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Update failed!");
                        }

                },
                error: function (err) {
                    bootbox.alert("Error! Ajax failed!!");
                }

            });
        }   


    });
        
    
     $('#responsibilityTable').off('click', '#THE_responsibilityTable #REST_btnDelete').on('click', '#THE_responsibilityTable #REST_btnDelete', function (e) {
         
         e.preventDefault();
         
        var row = $(this).closest("tr");
        var rowData = row.find("#REST_hidden").val();
        var arrayData = rowData.split("|");
        //assign into seprated val
        var roleName = arrayData[3], roleCode = arrayData[2], pageCode = arrayData[0];
        console.log(arrayData);
        
        bootbox.confirm({
            message: "Are you sure want to delete page "+pageCode+" responsibility from role " + roleName,
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
                    roleCode : roleCode,
                    pageCode : pageCode
                };

                $.ajax({
                    url: "responsibility_delete.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000, // 10 seconds
                    success: function (datas) {

                        if (datas.trim() === 'Success') {
                            $('#responsibilityTable').load('responsibility_table.jsp');
                            //alert("Delete Success");
                            
                            bootbox.alert({
                                    message: "A responsibility is deleted",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            
                        } else if (datas.trim() === 'Failed') {
                            bootbox.alert("Delete failed!");
                            
                        } else{
                            bootbox.alert(datas.trim());
                            
                        }

                    },
                    error: function (err) {
                        bootbox.alert("Error! Deletion failed!!");
                    }

                });
                    
                } else {
                    console.log("Process Is Canceled");
                }

            }
        });
         
          
     });
    

</script>  





<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#THE_responsibilityTable').DataTable();
    });
</script>


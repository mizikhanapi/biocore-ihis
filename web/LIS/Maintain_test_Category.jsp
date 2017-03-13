<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<span class="pull-right">
<button id="MLM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#TestCategory" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Test Category</button>
</span>
<br><br>
<div class="modal fade" id="TestCategory" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add Test Category</h3>
                
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category code</label>
                        <div class="col-md-8">
                            <input type="text" name="testCat" id="testCat" class="form-control"  required="required"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Category name</label>
                        <div class="col-md-8">
                            <input type="text" name="testCatName" id="testCatName" class="form-control"  required="required"/>
                        </div>
                    </div>
                                        
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Status</label>
                        <div class="col-md-8">
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status1" value="0">
                                Active 
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" id="status2" value="1">
                                Inactive
                            </label>
                        </div>
                    </div>


                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_add">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                                            

                                        <div class="table-responsive" id='viewMTCpage'>           

                                        </div>
                                   
        <script>
                                $(document).ready(function () {
                                   $("#viewMTCpage").load("viewMTC.jsp");
                                   
                                   $("#btn_add").click(function () {
                                       var testCat = $("#testCat").val();
                                       var testCatName = $("#testCatName").val();
                                       var status = $("#status").val();
                                       
                                       if(testCat === ""){ 
                                        alert("Complete The Fields");  
                                        return false; 
                                        
                                    }
                                    else if(testCatName === ""){ 
                                        alert("Complete The Fields");  
                                        return false; 
                                    }
                                    else if(status === ""){ 
                                        alert("Complete The Fields");  
                                        return false; 
                                    }
                                    else{
                                        $.ajax({
                                           url: "tCategoryInsert.jsp",
                                           type: "post",
                                           data: {
                                               testCat: testCat,
                                               testCatName: testCatName,
                                               status: status
                                           },
                                           timeout: 10000,
                                           success: function(data) {
                                                var d = data.split("|");
                                                if (d[1] === '1') {
                                                    $("#viewMTCpage").load("viewMTC.jsp");
                                                    $("#testCat").val("");
                                                    $("#testCatName").val("");
                                                    $("#status").val("Active");
                                                    alert("Test is submited succesfully!");
                                                } else {
                                                    alert("Insertion failed!");
                                                }
                                           },
                                           error: function(err) {
                                               
                                           }
                                       
                                       });
                                    }   
                                          
                                       
                                  });
                                });

                            </script>
        <script>
            
        w3IncludeHTML();

        $(document).ready(function () {
            //$("#WardOccupancy").load("WardOccupancy.jsp");
            //$("#RecieveOderTable").load("RecieveOder-Table.jsp");
            
            
            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#sidemenus").load("libraries/sideMenus.jsp");
//                $("#WardOccupancyTable").load("WardOccupancy-Table.jsp");

        });

    </script>
  
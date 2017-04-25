<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>
<form enctype="multipart/form-data" method="get">
<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <%
                        String item_cd = (String)session.getAttribute("item_cd");
                        String item_name = (String)session.getAttribute("item_name");
                        
                        //out.println("item_cd:"+item_cd);
                        Conn conn = new Conn();
                                
                         String query4 = "SELECT * FROM lis_assign_result WHERE item_cd='"+item_cd+"' AND test_name = '"+item_name+"'";
                         ArrayList<ArrayList<String>> q4 = conn.getData(query4);    
                     %>
                     <thead>
        <tr>
                
                <th class="col-sm-1">Result</th>
                <th class="col-sm-1">Remark</th>
                <th class="col-sm-1">Test Date</th>
                <th class="col-sm-1">Test Time</th>
                <th class="col-sm-1">Verification</th>
                <th class="col-sm-1">Test Performed By</th>
                <th class="col-sm-1">Edit</th>
                <th class="col-sm-1">Delete</th>
                
        </tr>
    </thead>
    <tbody>
         <%if (q4.size() > 0) 
           {
                for (int i = 0; i < q4.size(); i++) 
           {%> 
        <tr>    
                <td><%=q4.get(i).get(0)%></td>
                <td><%=q4.get(i).get(1)%></td>
                <td><%=q4.get(i).get(2)%></td>
                <td><%=q4.get(i).get(3)%></td>
                <td><%=q4.get(i).get(9)%></td>
                <td><%=q4.get(i).get(8)%></td>
                <td>
                <a data-toggle="modal" data-target="#TestCategory<%=i %>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

                <div class="modal fade" id="TestCategory<%=i %>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 950px !important; ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add  Test Result</h3>
                
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Test Name</label>
                        <div class="col-md-8">
                            <input type="text" name="testCat" id="testName<%=i%>" class="form-control" value="<%=item_name%>" disabled="disabled"/>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Result</label>
                        <div class="col-md-8">
                            <input type="text" name="testCatName" id="testCatName" class="form-control" style="display: none;"/>
                            <textarea name="career[message]" class="form-control" id="Result<%=i%>" placeholder="Write your result" required="required" ><%=q4.get(i).get(0)%></textarea>
                        </div>
                    </div>
                        
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Remark</label>
                        <div class="col-md-8">
                            <input type="text" name="testCatName" id="testCatName" class="form-control" style="display: none;"/>
                            <textarea name="career[message]" class="form-control" id="Remark<%=i%>" placeholder="Write your Remark" required="required" ><%=q4.get(i).get(1)%></textarea>
                        </div>
                    </div>
                    
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Test Date</label>
                                <div class="col-md-8">
                                <input id="testDate<%=i%>" name="textinput" type="text" class="form-control input-md" required="required" value="<%=q4.get(i).get(2)%>">
                                <script>
            
                                    $(function() {
                                    $( "#testDate<%=i%>" ).datepicker({ 
                                        yearRange: '1999:c+1' ,
                                        changeMonth: true,
                                        changeYear: true,
                                        minDate: new Date(1999, 10 - 1, 25),
                                        maxDate: '+30Y',
                                    });
                                });
                                </script>
                                </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Test Time</label>
                                <div class="col-md-8">
                                    <input id="testTime<%=i%>" name="textinput" type="time" class="form-control input-md" required="required" value="<%=q4.get(i).get(3)%>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Test Perform By</label>
                                <div class="col-md-8">
                                <input type="text" name="performBy" id="performBy<%=i%>" class="form-control" value="<%=q4.get(i).get(8)%>"/>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content goes here -->
            </div>
                                <input type="text" name="idresult<%=i%>" id="idresult<%=i%>" value="<%=q4.get(i).get(11)%>" style="display:none;"/>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_saveChange<%=i%>">Save Change</button>
                        <script>
                            
                        </script>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
                </td>
                <td>
                <a id="btnDelete<%=i%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
                <script type="text/javascript" charset="utf-8">
                    $(document).ready(function () {
                        $("#btnDelete<%=i%>").click(function () {
                            var Result = $("#Result<%=i%>").val();
                            var Remark = $("#Remark<%=i%>").val();
                            var testDate = $("#testDate<%=i%>").val();
                            var testTime = $("#testTime<%=i%>").val();
                            var idResult = $("#idresult<%=i%>").val();
                            
                            var conf = confirm('Are you sure want to delete?');
                            if (conf) {
                                $.ajax({
                                    url: "tAssignDelete.jsp",
                                    type: "post",
                                    data: {
                                        idResult: idResult,
                                        result: Result,
                                        remark: Remark,
                                        date: testDate,
                                        time: testTime
                                    },
                                    timeout: 10000, // 10 seconds
                                    success: function (data) {
                                        var d = data.split("|");
                                        if (d[1] == '1') {
                                            $("#viewTA").load("viewTA.jsp");
                                            alert("Success");
                                        } else {
                                            alert("Deletion failed!");
                                        }
                                    },
                                    error: function (err) {
                                        alert("Error! Deletion failed!!");
                                    }
                                });
                            }
                        });
                        
                        $("#btn_saveChange<%=i%>").click(function () {
                            var Result = $("#Result<%=i%>").val();
                            var Remark = $("#Remark<%=i%>").val();
                            var testDate = $("#testDate<%=i%>").val();
                            var testTime = $("#testTime<%=i%>").val();
                            var performBy = $("#performBy<%=i%>").val();
                            var idResult = $("#idresult<%=i%>").val();
                            
                            $.ajax({
                                url: "tAssignUpdate.jsp",
                                type: "post",
                                data: {
                                    idResult: idResult,
                                    Result: Result,
                                    Remark: Remark,
                                    testDate: testDate,
                                    testTime: testTime,
                                    performBy: performBy
                                    
                                },
                                timeout: 10000,
                                success: function(data) {
                                    $("#viewTA").load("viewTA.jsp");
                                        $(".modal-backdrop").hide();
                                        alert("Success");
                                     
                                },
                                error: function(err) {
                                    alert("Error update!");
                                }
                            });
                        });
                        
                    });
                </script>  

                </td>
               
        <%
                }
            }
        %>
        </tr>
       
    </tbody>
</table>
        
</form>

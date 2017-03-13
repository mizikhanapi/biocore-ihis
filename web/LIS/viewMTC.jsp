<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>



<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        Conn conn = new Conn();
        String sqlPatientApp = "SELECT category_code,category_name,status from lis_item_category ";
        ArrayList<ArrayList<String>> q1 = conn.getData(sqlPatientApp);
    %>
    <thead>
        <tr>
            <th class="col-sm-1">Test cat code</th>
            <th class="col-sm-1">Test category name</th>
            <th class="col-sm-1">Status</th>
            <th class="col-sm-1">Edit</th>				 
            <th class="col-sm-1">Delete</th>
        </tr>
    </thead>
    <tbody>

        <%
            if (q1.size() > 0) {
                for (int i = 0; i < q1.size(); i++) {

        %>
        <tr>
            <td><%=q1.get(i).get(0)%></td>
            <td><%=q1.get(i).get(1)%></td>
            <td><%=q1.get(i).get(2)%></td>
            <td>
                
                <a data-toggle="modal" data-target="#basicModal<%=i %>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

                <div class="modal fade" id="basicModal<%=i %>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></button>
                                <h4 class="modal-title" id="myModalLabel">Edit</h4>
                            </div>
                            <div class="modal-body">  
                                <!--<form name="myForm" action="j.jsp" method="post">-->
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Test category code</label>
                                        <input type="text" class="form-control" name="tcode" id="tcode<%=i%>"  value='<%=q1.get(i).get(0)%>' readonly="">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Test category name</label>
                                        <input type="text" class="form-control" name="tname" id="tname<%=i%>"  value='<%=q1.get(i).get(1)%>'>
                                    </div>
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select class="form-control" name="tstatus" id="tstatus<%=i%>">
                                            <option value="Active" <% if (q1.get(i).get(2).equals("Active")) { out.print("selected"); } %>>Active</option>
                                            <option value="Inactive" <% if (q1.get(i).get(2).equals("Inactive")) { out.print("selected"); } %>>Inactive</option>
                                        </select>
                                    </div>
                                <!--</form>-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="btn_update<%=i%>">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                
            </td>
            <td>
                <a id="btn<%=i%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
                <script type="text/javascript" charset="utf-8">
                    $(document).ready(function () {
                        $("#btn<%=i%>").click(function () {
                            var conf = confirm('Are you sure want to delete?');
                            if (conf) {
                                $.ajax({
                                    url: "tCategoryDelete.jsp",
                                    type: "post",
                                    data: {
                                        iditem: "<%=q1.get(i).get(0)%>"
                                    },
                                    timeout: 10000, // 10 seconds
                                    success: function (data) {
                                        var d = data.split("|");
                                        if (d[1] == '1') {
                                            $("#viewMTCpage").load("viewMTC.jsp");
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
                        
                        $("#btn_update<%=i%>").click(function () {
                            var testCat = $("#tcode<%=i%>").val();
                            var testCatName = $("#tname<%=i%>").val();
                            var status = $("#tstatus<%=i%>").val();

                            $.ajax({
                                url: "tCategoryUpdate.jsp",
                                type: "post",
                                data: {
                                    testCat: testCat,
                                    testCatName: testCatName,
                                    status: status
                                },
                                timeout: 10000,
                                success: function(data) {
                                     var d = data.split("|");
                                     if (d[1] == '1') {
                                         $("#viewMTCpage").load("viewMTC.jsp");
//                                         $("#basicModal_<%=i %>").removeClass("in").css("display", "none");
                                        $(".modal-backdrop").hide();
                                        alert("Success");
                                     } else {
                                         alert("Update failed!");
                                     }
                                },
                                error: function(err) {
                                    alert("Error update!");
                                }
                            });
                        });
                    });
                </script>  

            </td>
        </tr>
        <%
                }
            }
        %>
    </tbody>
</table>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#MTC').DataTable();
    });
</script>

<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

    <table id="MTD"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        Conn conn = new Conn();
        String query1 = "select item_cd,test_cat,item_name,spe_source,spe_container,volume,special_inst,status,buy_price,ser_price from lis_item_detail";
        ArrayList<ArrayList<String>> q1 = conn.getData(query1);
    %>
    <thead>
        <tr>
            <th class="col-sm-1">Item code</th>
            <th class="col-sm-1">Category code</th>
            <th class="col-sm-1">Item name</th>
            <th class="col-sm-1">S.source</th>
            <th class="col-sm-1">S.container</th>
            <th class="col-sm-1">Volume</th>
            <th class="col-sm-1">Special instruction</th>
            <th class="col-sm-1">Status</th>
            <th class="col-sm-1">Buying price</th>
            <th class="col-sm-1">Service price</th>
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
            <td><%=q1.get(i).get(3)%></td>
            <td><%=q1.get(i).get(4)%></td>
            <td><%=q1.get(i).get(5)%></td>
            <td><%=q1.get(i).get(6)%></td>
            <td><%=q1.get(i).get(7)%></td>
            <td><%=q1.get(i).get(8)%></td>
            <td><%=q1.get(i).get(9)%></td>
            <td>
     <a id="updateTButton" data-toggle="modal" data-target="#testDetail_<%=i%>"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <div class="modal fade" id="testDetail_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Update Test Detail</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Category code</label>
                                    <div class="col-md-8">
                                        <input class="form-control" type="text" id="ccode_<%=i%>" value="<%=q1.get(i).get(1)%>" readonly="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">ICD10-PCS</label>
                                    <div class="col-md-8">
                                        <input type="text" name="testCatName"  class="form-control" id="icd10_<%=i%>" value="<%=q1.get(i).get(0)%>" required="required"/ readonly="">
                                     </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Analyte name</label>
                                    <div class="col-md-8"><input type="text" name="testCat"  class="form-control" id="analytename_<%=i%>" value="<%=q1.get(i).get(2)%>" required="required"/></div>
                                    
                                </div>
                                <div class="form-group">
                                     <label class="col-md-4 control-label" for="textinput">Specimen source</label>
                                    <div class="col-md-8"><input type="text" name="testCatName"  class="form-control" id="ssource_<%=i%>" value="<%=q1.get(i).get(3)%>" required="required"/>
                                </div>
                                   
                                    </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Specimen container</label>
                                    <div class="col-md-8"><input type="text" name="testCatName"  class="form-control" id="scontainer_<%=i%>" value="<%=q1.get(i).get(4)%>" required="required"/></div>
                                 </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Volume required</label>
                                    <div class="col-md-8">
                                        <input type="text" name="testCatName"  class="form-control" id="vreq_<%=i%>" value="<%=q1.get(i).get(5)%>" required="required"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Special instruction</label>
                                    <div class="col-md-8"><input type="text" name="testCatName"  class="form-control" id="sinst_<%=i%>" value="<%=q1.get(i).get(6)%>" required="required"/></div>
                                    
                                </div>
                                    <div class="form-group" >
                                    <label class="form-check-inline">
                                        <label class="col-md-4 control-label" for="textinput">Buying price </label>
                                        <input type="text" name="testCatName"  class="form-control" style="width: 120px"  id="bprice_<%=i%>" value="<%=q1.get(i).get(8)%>" required="required"/>
                                    </label>
                                    <label class="form-check-inline">
                                        <label class="col-md-4 control-label" for="textinput">Service price(RM)</label>
                                        <input type="text" name="testCatName"  class="form-control" style="width: 120px" id="sprice_<%=i%>" value="<%=q1.get(i).get(9)%>"  required="required"/> 
                                    </label>
                                </div>
                                <div class="form-group" id="dstatus">
                                    <label class="col-md-4 control-label" for="textinput">Status</label>
                                    <div  class="col-md-8">
                                        <select class="form-control" id="status_<%=i%>">
                                        <option value="Active" <% if (q1.get(i).get(2).equals("Active")) {
                                                    out.print("selected");
                                                } %>>Active</option>
                                        <option value="Inactive" <% if (q1.get(i).get(2).equals("Inactive")) {
                                                    out.print("selected");
                                                }%>>Inactive</option>
                                        </select>
                                    </div>
                                    
                                    
                                </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btn_update1<%=i%>">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="updateReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
            </td>
            <td>
                
                <a id="btn_delete<%=i%>" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
                <script type="text/javascript" charset="utf-8">
                    $(document).ready(function () {
                        $("#btn_delete<%=i%>").click(function () {
                            var conf = confirm('Are you sure want to delete?');
                            if (conf) {
                                $.ajax({
                                    url: "tDetailDelete.jsp",
                                    type: "post",
                                    data: {
                                        cditem: "<%=q1.get(i).get(0)%>",
                                        idcat: "<%=q1.get(i).get(1)%>"
                                    },
                                    timeout: 10000, // 10 seconds
                                    success: function (data) {
                                        var d = data.split("|");
                                        if (d[1] == '1') {
                                            $("#viewMTDpage").load("viewMTD.jsp");
                                            alert("Delete successfully");
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

                        $("#btn_update1<%=i%>").click(function () {
                           // var ccode = $("#ccode_<%=i%>").val();
                            var icd10 = $("#icd10_<%=i%>").val();
                            var analytename = $("#analytename_<%=i%>").val();
                            var s_source = $("#ssource_<%=i%>").val();
                            var s_container = $("#scontainer_<%=i%>").val();
                            var v_req = $("#vreq_<%=i%>").val();
                            var s_inst = $("#sinst_<%=i%>").val();
                            var b_price = $("#bprice_<%=i%>").val();
                            var s_price = $("#sprice_<%=i%>").val();
                            var status = $("#status_<%=i%>").val();

                            $.ajax({
                                url: "tDetailUpdate.jsp",
                                type: "post",
                                data: {
                                    //ccode: ccode,
                                    icd10: icd10,
                                    analytename: analytename,
                                    s_source: s_source,
                                    s_container: s_container,
                                    v_req: v_req,
                                    s_inst: s_inst,
                                    b_price: b_price,
                                    s_price: s_price,
                                    status: status
                                }
                            });
                            $("#viewMTDpage").load("viewMTD.jsp");
                            $(".modal-backdrop").hide();
                        });
                    });
                </script>  
            </td>
        </tr>
        <% }
            }
        %>
    </tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#MTD').DataTable();
    });
</script>
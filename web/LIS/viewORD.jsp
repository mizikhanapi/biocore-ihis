<%-- 
    Document   : viewORD
    Created on : Dec 14, 2016, 12:17:30 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <%
                        Conn conn = new Conn();
                        String pmi2 = request.getParameter("pmi");
                        String orderno1 = request.getParameter("order_no");
                         String query4 = "select ord.item_cd,lim.item_name,lim.spe_source,lim.volume,ord.requestor_comments,ord.filler_comments "
                                + " from lis_item_detail lim, lis_order_detail ord "
                                + " where lim.item_cd = ord.item_cd and pmi_no = '"+pmi2+"' and order_no ='"+orderno1+"'";
                         ArrayList<ArrayList<String>> q4 = conn.getData(query4);    
                     %>
    <thead>
        <tr>
                <th class="col-sm-1">Item Code</th>
                <th class="col-sm-1">Item Name</th>			 
                <th class="col-sm-1">Spe_Source</th>
                <th class="col-sm-1">Volume</th>
                <th class="col-sm-1">Requestor Comments</th>
                <th class="col-sm-1">Filler Comments</th>
                <th class="col-sm-1">Edit</th>
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
                <td><%=q4.get(i).get(4)%></td>
                <td><%=q4.get(i).get(5)%></td>
            <td>
                <button  class='btn btn-warning btn-xs' data-toggle="modal" data-target="#basicModal_<%=i %>">Update</button>
                
                <div class="modal fade" id="basicModal_<%=i %>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                                <h4 class="modal-title" id="myModalLabel">Edit</h4>
                            </div>
                            <div class="modal-body">  
                                <!--<form name="myForm" action="j.jsp" method="post">-->
                                     <div class="form-group">
                                        <label for="text">Item Code</label>
                                        <input type="text" class="form-control" id="tcode_<%=i%>" name="tcode" value="<%=q4.get(i).get(0)%>" readonly="">
                                     </div>
                                   <div class="form-group">
                                        <label for="text">Item Name</label>
                                        <input type="text" class="form-control" id="tname_<%=i%>" name="tcode" value="<%=q4.get(i).get(1)%>" readonly="">
                                   </div>
                                    <div class="form-group">
                                    <label for ="inputMessage">Filler Comments</label>
                                    <textarea name="career[message]" class="form-control" id="fcomment_<%=i%>"   placeholder="Write your details" ></textarea>
                                     </div> 
                                <!--</form>-->
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary" id="btn_update_<%=i%>">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                           
                <script>
                     $(document).ready(function () { 
                     $("#btn_update_<%=i%>").click(function () {
                            var tcode = $("#tcode_<%=i%>").val();
                            var fcomment = $("#fcomment_<%=i%>").val();

                            $.ajax({
                                url: "odUpdate.jsp",
                                type: "post",
                                data: {
                                    tcode: tcode,
                                    fcomment: fcomment
                                },
                                timeout: 10000,
                                success: function(data) {
                                     var d = data.split("|");
                                     if (d[1] == '1') {
                                         $("#basicModal_<%=i %>").hide();
                                         $(".modal-backdrop").hide();
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
            
        <%
                }
            }
        %>
             
          
        </tr>
    </tbody>
</table>
       <script type="text/javascript" charset="utf-8">
           
   $(document).ready(function() {
    $('#orderRecieve').DataTable();
} );
    </script>
 
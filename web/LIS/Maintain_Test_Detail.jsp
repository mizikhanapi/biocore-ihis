<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@ page session="true" %>
         
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        

                                        <span class="pull-right">
                                        <button id="MLM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#TestDetail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Test Detail</button>
                                        </span>
                                        <div class="modal fade" id="TestDetail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                                           <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                                                    <h3 class="modal-title" id="lineModalLabel">ADD Test Detail</h3>
                                                     <%
                                                    Conn conn = new Conn();
                                                    String query = "SELECT category_code, category_name from lis_item_category";
                                                    ArrayList<ArrayList<String>> q2 = conn.getData(query);
                                                     %>
                                            
                                         <div class="form-group row">
                                            <label for="example-text-input" class="col-xs-2 col-form-label">Category code</label>
                                            <div class="col-xs-10">
                                            <select class="form-control" id="ccode" required="required" >
<%                                                    
                                                if (q2.size() > 0) {
                                                    for (int i = 0; i < q2.size(); i++) {

                                            %>
                                            <option value="<%=q2.get(i).get(0)%>"><%=q2.get(i).get(0)%></option>
                                            <%}
                                                     }%>
                                            </select>
                                            
                                            
                                            
                                            </select>
                                            </div>
                                            </div>   
                                        <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Item code</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="icd10" id="icd10" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Item name</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="item_name" id="item_name" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Specimen source</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="s_source" id="s_source" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                            <div class="form-group row">
                                         <label for="example-text-input" class="col-xs-2 col-form-label">Specimen container</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="s_container" id="s_container" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                            <div class="form-group row">
                                       <label for="example-text-input" class="col-xs-2 col-form-label">Volume required</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="v_req" id="v_req" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                       <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Special instruction</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="s_inst" id="s_inst" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Buying price(RM)</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="b_price" id="b_price" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                       <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Service price(RM)</label>
                                        <div class="col-xs-10">
                                            <input type="text" name="s_price" id="s_price" class="form-control"  required="required"/>
                                        </div>
                                        </div>
                                        <div class="form-group row">
                                        <label for="example-text-input" class="col-xs-2 col-form-label">Status</label>
                                        <div class="col-xs-10">
                                    <select class="form-control" name="status" id="status">
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                    </select>
                                         </div>
                                        </div>
                                            <br>
                                            <div class="modal-footer">
                                                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                                                    <div class="btn-group" role="group">
                                                    <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="btn_add1">Add</button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                            
                                                </div>
                                            </div>
                                           </div>
                                        </div>
                                            <br><br>
                                            
                                            
                                        
                                            
                                            
                                       <div id="viewMTDpage">
                                                
                                            </div>     
                                      
                                            <!--<form method="post" name="myform" role="form" action="tCategoryInsert.jsp">-->
                                            <!--<div class="form-inline" >-->

                       
           
      
       <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
                            <script>
                                $(document).ready(function () {
                                   $("#viewMTDpage").load("viewMTD.jsp");
                                   
                                   $("#btn_add1").click(function () {
                                       var icd10 = $("#icd10").val();
                                       var item_name = $("#item_name").val();
                                       var ccode = $("#ccode").val();
                                       var status = $("#status").val();
                                       var s_source = $("#s_source").val();
                                       var s_container = $("#s_container").val();
                                       var v_req = $("#v_req").val();
                                       var s_inst = $("#s_inst").val();
                                       var b_price = $("#b_price").val();
                                       var s_price = $("#s_price").val();
                                       
                                    if(icd10 === ""){ 
                                        alert("Complete The Fields"); 
                                        return false; 
                                    }
                                    else if(item_name === ""){ 
                                        alert("Complete The Fields");  
                                        return false; 
                                    }
                                    else if(ccode === ""){ 
                                        alert("Complete The Fields"); 
                                        return false; 
                                    }
                                    else if(s_source === ""){ 
                                        alert("Complete The Fields");  
                                        return false; 
                                    }
                                    else if(s_container === ""){ 
                                        alert("Complete The Fields"); 
                                        return false; 
                                    }
                                    else if(v_req === ""){ 
                                       alert("Complete The Fields");  
                                        return false; 
                                    }
                                    else if(b_price === ""){ 
                                        alert("Complete The Fields");
                                        return false; 
                                    }
                                    else if(s_price === ""){ 
                                        alert("Complete The Fields"); 
                                        return false; 
                                    }
                                    
                                    else{
                                       
                                       $.ajax({
                                           url: "tDetailInsert.jsp",
                                           type: "post",
                                           data: {
                                               icd10: icd10,
                                               item_name: item_name,
                                               ccode: ccode,
                                               status: status,
                                               s_source: s_source,
                                               s_container: s_container,
                                               v_req: v_req,
                                               s_inst: s_inst,
                                               b_price: b_price,
                                               s_price: s_price
                                           },
                                           timeout: 10000,
                                           success: function(data) {
                                                var d = data.split("|");
                                                if (d[1] === '1') {
                                                    $("#viewMTDpage").load("viewMTD.jsp");
                                                    alert("Test is add succesfully!");
                                                    //$(".modal-backdrop").hide();
                                                } else {
                                                    alert("Insertion failed!");
                                                }
                                           },
                                           error: function(err) {
                                               
                                           }
                                       });
                                   }});
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
   
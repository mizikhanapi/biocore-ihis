<%-- 
    Document   : order_requestNewOrder_modal
    Created on : Apr 25, 2017, 1:20:18 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String RNO_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn RNO_conn = new Conn();

    String RNO_sql = "SELECT body_system_cd, body_system_name from ris_body_system where status = '0' AND hfc_cd = '" + RNO_hfc_cd + "'";
    ArrayList<ArrayList<String>> RNO_dataBS = RNO_conn.getData(RNO_sql);

    RNO_sql = "SELECT modality_cd, modality_name from ris_modality where status = '0' AND hfc_cd = '" + RNO_hfc_cd + "' ";
    ArrayList<ArrayList<String>> RNO_dataMod = RNO_conn.getData(RNO_sql);


%>
<!-- Modal Detail -->
<!-- Add Modal Start -->
<div class="modal fade" id="modal_requestNewOrder" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="RNO_modalTitle"></h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="RNO_addForm" autocomplete="off">
                                        
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Procedure*</label>
                        <div class="col-md-8">
                            <input type="text" placeholder="Search radiology procedure name" class="form-control" maxlength="330" id="RNO_proName">
                            <div id="RNO_pro_match" class="search-drop">
                                <!--search result-->
                            </div>
                        </div>
                    </div>
                   
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Body System*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="RNO_bodySystem" disabled>
                                <option  value="" >-- Selected Body System --</option>
                                <%                                    for (int i = 0; i < RNO_dataBS.size(); i++) {

                                %>
                                <option value="<%= RNO_dataBS.get(i).get(0)%>"><%= RNO_dataBS.get(i).get(1)%></option>
                                <%

                                    }//end for loop
                                %>
                            </select>

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Modality*</label>
                        <div class="col-md-8">
                            <select class="form-control"  id="RNO_modality" disabled>
                                <option  value="" >-- Selected Modality --</option>
                                <%
                                    for (int i = 0; i < RNO_dataMod.size(); i++) {

                                %>
                                <option value="<%= RNO_dataMod.get(i).get(0)%>"><%= RNO_dataMod.get(i).get(1)%></option>
                                <%

                                    }//end for loop
%>
                            </select>

                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Instruction</label>
                       <div class="col-md-8">
                           <textarea id="RNO_instruction" placeholder="Write your instruction here (Optional)" class="form-control input-md" maxlength="500" rows="4"></textarea>
                        </div>
                    </div>

                   
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="RNO_div_btnAdd_or_update">
                        <!--<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="RNO_btnAdd">Add</button>-->
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="RNO_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<!-- Modal -->

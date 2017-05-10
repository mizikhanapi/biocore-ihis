<%-- 
    Document   : deleveryOrderModal
    Created on : May 10, 2017, 1:50:30 AM
    Author     : Shammugam
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
%>


<!-- Add Button End -->
<!-- Modal Add Update Delivery Order Start -->
<div class="modal fade" id="deleveryOrderModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="deleveryOrderDetailTitle" align="center"></h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off" id="deleveryOrderDetailForm">
                    <div class="row">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Drug Name &nbsp; *</label>
                            <div class="col-md-8">
                                <input id="drug_Name" type="text" class="form-control" placeholder="Please Search Drug Name" maxlength="100" >
                                <div id="drug_Name_Search" class="search-drop">
                                    <!--for search area-->
                                </div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Drug Code &nbsp; *</label>
                            <div class="col-md-8">
                                <input id="drug_Code" type="text" class="form-control" readonly>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Drug Price &nbsp; *</label>
                            <div class="col-md-8">
                                <input id="drug_Price" type="text" class="form-control" readonly>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Drug Stock Quantity &nbsp; *</label>
                            <div class="col-md-8">
                                <input id="drug_Stock" type="text" class="form-control" readonly>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Drug Quantity &nbsp; *</label>
                            <div class="col-md-8">
                                <input id="drug_Quantity" type="number" class="form-control" placeholder="Please Insert Drug Quantity" maxlength="7">
                            </div>
                        </div>

                    </div>
                </form>
                <!-- content goes here -->

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="deleveryOrderDetail_btnAdd_or_btnUpdate_div">
                    </div>
                    <div class="btn-group" role="group" id="deleveryOrderDetail_btnClear_or_btnDelete_div">
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Add Update Delivery Order End -->
<!-- Add Part End --> 
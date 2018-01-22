<%-- 
    Document   : ReferralModal
    Created on : Jan 22, 2018, 12:06:58 PM
    Author     : Ardhi Surya; rdsurya147@gmial.com; @rdcfc
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<!-- Modal -->
<div class="modal fade" id="referralModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Referral List</h3>
            </div>
            <div class="modal-body" >
                <div class="row" id="searchRefointment" style="    margin-top: 30px;">
                    <form class="form-horizontal" name="myFormRef" id="myFormRef">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <select id="idTypeRef" name="idTypeRef" class="form-control" required="">
                                    <option selected="" disabled="" value="-"> Please select ID type</option>
                                    <%
                                        for (int i = 0; i < data3.size(); i++) {%>
                                    <option value="<%=data3.get(i).get(1)%>"><%=data3.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                            <div class="col-md-4">
                                <input type="text" class="form-control input-md" id="idInputRef" name="idInputRef" placeholder="ID" maxlength="0"/>
                            </div>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary" type="button" id="searchRef" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

                            <button id="clearRef" name="clearRef" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                        </div>
                    </form>
                </div>
            </div>
            <hr/>
            <div class="modal-table"><div class="row" id="modalBodyReferral" >
                    <!-- content goes here -->
                    <form role="form" id="formRefointmentSaya" method="post">
                        <table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="listReferralTbl">
                            <thead>
                                <tr>
                                    <th>PMI No.</th>
                                    <th>Name</th>
                                    <th>New IC No</th>
                                    <th>Referred From</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="listReferralTblBody">

                            </tbody>

                        </table>
                    </form>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
            </div>

        </div>
    </div>
</div>
<script src="libraries/lib/js/main/referral.js" type="text/javascript"></script>

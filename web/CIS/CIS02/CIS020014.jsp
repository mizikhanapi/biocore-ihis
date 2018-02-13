<%-- 
    Document   : CIS0200013
    Created on : Nov 3, 2017, 6:17:16 PM
    Author     : -D-
--%>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                                          0                 1
    String sql_eye_score = "SELECT `Detail_Reference_code`,`Description` FROM adm_lookup_detail WHERE `Master_Reference_code` = '0112' AND hfc_cd = '" + hfc_cd + "'";
    ArrayList<ArrayList<String>> data_eye_score = Conn.getData(sql_eye_score);
%>
<div class="modal fade" id="CIS020014" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h4 class="modal-title" id="myModalLabel">Eye Vision Test</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <label>Left Vision Score</label>
                            <div class="form-group">
                                <input id="vision-ID" class="hidden">
                                <select name="cis-vts-lvs" id="cis-vts-lvs" class="form-control input-lg">
                                    <option value="">-Select Vision Score-</option>
                                   
                                    <%
                                        for (int i = 0; i < data_eye_score.size(); i++) {
                                    %>
                                    <option value="<%out.print(data_eye_score.get(i).get(1));%>"><%out.print(data_eye_score.get(i).get(1));%></option>
                                    <%
                                        }

                                    %>

                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <label>Right Vision Score</label>
                            <div class="form-group">
                                <select name="cis-vts-rvs" id="cis-vts-rvs" class="form-control input-lg">
                                    <option value="">-Select Vision Score-</option>
                                     
                                    <%
                                        for(int i = 0; i<data_eye_score.size();i++){
                                            %>
                                            <option value="<%out.print(data_eye_score.get(i).get(1));%>"><%out.print(data_eye_score.get(i).get(1));%></option>
                                    <%
                                        }
                                        
                                        %>

                                </select>
                            </div>
                        </div>
                    </div>
                                        <div class="row">
                                            <div class="form-group">
                                                <label>Comment</label>
                                                <textarea type="text" name="cis-vts-vision-comment" id="cis-vts-vision-comment" class="form-control input-lg clsHPI_COMMENT" placeholder="Put your comment here" tabindex="3" onkeypress="return blockSpecialChar(event)"></textarea>
                                            </div>
                                        </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3"></div>
                        <div class="col-lg-6 col-md-6">
                            <img src="img/snellen-chart.png" alt="Snellen Chart" style="width: 100%; align-items: center "/>
                        </div>
                        <div class="col-lg-3 col-md-3"></div>
                    </div>
                </form>
            </div>
           <div class="modal-footer vts-vision-update">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btn_CIS_VTS_Vision_Update" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
            <div class="modal-footer vts-vision-add">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btn_CIS_VTS_Vision_ADD" role="button">Add</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- 
    Document   : medicalModal
    Created on : Aug 18, 2017, 12:36:20 PM
    Author     : shay
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String my_1_hfc_cd = "";
    String my_1_hfcName = "";
    my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    my_1_hfcName = session.getAttribute("HFC_NAME").toString();
    String sql = "SELECT address1 FROM adm_health_facility WHERE hfc_cd = '" + my_1_hfc_cd + "'";
    ArrayList<ArrayList<String>> add = conn.getData(sql);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="modal fade" id="basicModalMedical" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title">Patient Medical History</h3>
            </div>
            <div class="modal-body" id="allDiv">
                <div style="text-align: center; margin-bottom: 30px;">
                    <h1><%=my_1_hfcName%></h1>
                    <h4 style="padding: 0px;"><%=add.get(0).get(0)%></h4>
                </div>
                <br/>
                <div id="test">

                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <input name="b_print2" id="b_print2" type="button" class="btn btn-success btn-lg" value=" Approve ">        
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">Close</button>     
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
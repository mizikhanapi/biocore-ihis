<%-- 
    Document   : dischargeBaby-modal
    Created on : Oct 9, 2017, 9:56:46 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String DB_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn DB_con = new Conn();

%>

<!--Start Modal -->
<div class="modal fade" id="DB_dischargeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
                <h3 class="modal-title">Discharge Letter</h3>
            </div>
            <div class="modal-body">
                <div class="pull-right">
                    <button class="btn btn-warning" id="DB_btnOverride" title="Override"><span aria-hidden="true"><i class="fa fa-warning fa-lg"></i></span></button>
                </div>
                <br>
                <form id="DB_dischargeForm">
                    <input type="hidden" id="DB_dischargeModalID">
                    <div class="col-md-12">

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IC /Passport number:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md db-override flexdatalist" type="text" placeholder="Insert guardian IC no / passport no" id="DB_guardianID" 
                                           data-search-by-word="true"
                                           data-selection-required="true">
                                    <div class="search-drop" id="DB_guardianID_match"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label ls-add-update" for="textinput">Name:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md " type="text" placeholder="Insert guardian name" id="DB_guardianName" maxlength="190" disabled>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label ls-add-update" for="textinput">Address:</label>
                                <div class="col-md-8">
                                    <textarea class="form-control input-md" cols="4" maxlength="980" id="DB_address"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Relationship :</label>
                                <div class="col-md-8">
                                    <select class="form-control input-md" id="DB_relationship">
                                        <option value="" selected disabled>-- Select guardian's relationship with infant</option>
                                        <%                                            String queryRelation = "select `Description` "
                                                    + "from adm_lookup_detail "
                                                    + "where `Master_Reference_code`='0007' and hfc_cd='" + DB_hfc_cd + "' order by description;";
                                            ArrayList<ArrayList<String>> dataRelation = DB_con.getData(queryRelation);
                                            for (int i = 0; i < dataRelation.size(); i++) {
                                                out.print("<option value='" + dataRelation.get(i).get(0) + "'>" + dataRelation.get(i).get(0) + "</option>");
                                            }
                                        %>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Infant tag number:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md flexdatalist" id="DB_tagNo" type="text" maxlength="200" 
                                           data-search-by-word="true"
                                           data-selection-required="true">
                                    <div class="search-drop" id="DB_tagNo_match"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Date:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" id="DB_dischargeDate" type="text" readonly placeholder="dd/mm/yyyy">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Time:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md" id="DB_dischargeTime" type="text" placeholder="dd/mm/yyyy">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Staff on duty:</label>
                                <div class="col-md-8">
                                    <input class="form-control input-md db-override flexdatalist" id="DB_staff" type="text" 
                                           data-search-by-word="true"
                                           data-selection-required="true">
                                    <div class="search-drop" id="DB_staff_match"></div>
                                    <input type="hidden" id="DB_staffID">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Picture Of Baby:</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="DB_pic_baby" type="file" accept=".jpg, .png, .gif">    
                                </div>
                            </div >
                            <div class="form-group">
                                <div class="col-md-12">
                                    <img id="DBpicBabyViewer" height="300" width="500" />
                                </div>
                                        
                            </div>
                        </div>
                        <div class="row">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Picture Of Baby With Mother:</label>
                                <div class="col-md-8">
                                    <input class="form-control" id="DB_pic_with_mother" type="file" accept=".jpg, .png, .gif">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <img id="DBpicWithMotherViewer" height="300" width="500" />
                                </div>
                                        
                            </div>
                        </div>
                    </div> 
                </form>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group" id="DB_discharge_div_add">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="DB_dischargeBtnAdd" role="button">Add Discharge Letter</button>
                    </div>
                    <div class="btn-group" role="group" id="DB_discharge_div_update" style="display: none">
                        <button type="button" class="btn btn-success btn-block btn-lg" role="button" id="DB_dischargeBtnUpdate">Update Discharge Letter</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

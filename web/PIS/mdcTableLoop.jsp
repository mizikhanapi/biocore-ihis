<%-- 
    Document   : atcTable
    Created on : Jan 26, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>

<table  id="mdcTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Drug CODE</th>
    <th style="text-align: center;">ATC CODE</th>
    <th style="text-align: center;">TRADE NAME</th>
    <th style="text-align: center;">GNR NAME</th>
    <th style="display: none">ROUTE CODE</th>
    <th style="display: none">FORM CODE</th>
    <th style="text-align: center;">STRENGTH</th>
    <th style="display: none">ADVISORY CODE</th>
    <th style="text-align: center;">STOCK QTY</th>
    <th style="display: none">MINIMUM QTY</th>
    <th style="display: none">MAXIMUM QTY</th>
    <th style="display: none">REORDER QTY</th>
    <th style="display: none">DOSE QTY</th>
    <th style="display: none">DOSE TYPE</th>
    <th style="display: none">DURATION</th>
    <th style="display: none">DURATION TYPE</th>
    <th style="display: none">FREQUENCY</th>
    <th style="display: none">CAUTION</th>
    <th style="text-align: center;">EXP DATE</th>
    <th style="display: none">CLASSIFICATION</th>
    <th style="display: none">STATUS</th>
    <th style="display: none">LOCATION CODE</th>
    <th style="text-align: center;">SELL PRICE</th>
    <th style="display: none">COST PRICE</th>
    <th style="display: none">PACKAGING</th>
    <th style="display: none">PACKAGING TYPE</th>
    <th style="display: none">PRICE/PACK</th>
    <th style="display: none">HFC</th>
    <th style="display: none">DISCIPLINE</th>
    <th style="display: none">SUB-DISCIPLINE</th>

    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
</thead>
<tbody>

    <%
        //                              0         1           2           3           4           5           6           7                 8            9
        String sqlMain = " SELECT ud_mdc_code,ud_atc_code,d_trade_name,d_gnr_name,d_route_code,d_form_code,d_strength,d_advisory_code,d_stock_qty,d_minimum_stock_level,"
                //
                //          10                      11          12     13        14         15          16            17                    18                   
                + "d_maximum_stock_level,d_reorder_stock_level,d_qty,d_qtyt,d_duration,d_durationt,d_frequency,d_caution_code,DATE_FORMAT(DATE(d_exp_date),'%d/%m/%Y'),"
                //
                //          19        20         21             22          23            24          25            26        27          28            29
                + "d_classification,status,d_location_code,d_sell_price,d_cost_price,d_packaging,d_packagingt,d_price_ppack,hfc_cd,discipline_cd,subdiscipline_cd "
                //
                // Where Condition
                + "FROM pis_mdc2 WHERE hfc_cd  = '" + hfc + "' AND discipline_cd  = '" + dis + "'; ";

        ArrayList<ArrayList<String>> dataMTC = conn.getData(sqlMain);

        int sizeMain = dataMTC.size();
        for (int s = 0; s < sizeMain; s++) {

    %>

    <tr style="text-align: center;">

<input id="dataMDChidden" type="hidden" value="<%=String.join("|", dataMTC.get(s))%>">

<td><%= dataMTC.get(s).get(0)%></td>                                            <!-- Drug Code -->
<td><%= dataMTC.get(s).get(1)%></td>                                            <!-- ATC Code -->
<td><%= dataMTC.get(s).get(2)%></td>                                            <!-- Trade Name -->
<td><%= dataMTC.get(s).get(3)%></td>                                            <!-- Generic Name -->
<td style="display: none"><%= dataMTC.get(s).get(4)%></td>                      <!-- Route Code -->
<td style="display: none"><%= dataMTC.get(s).get(5)%></td>                      <!-- Form Code -->
<td><%= dataMTC.get(s).get(6)%></td>                                            <!-- Strength -->
<td style="display: none"><%= dataMTC.get(s).get(7)%></td>                      <!-- Advisory Code -->
<td><%= dataMTC.get(s).get(8)%></td>                                            <!-- Stock Qty -->
<td style="display: none"><%= dataMTC.get(s).get(9)%></td>                      <!-- Minimum Qty -->
<td style="display: none"><%= dataMTC.get(s).get(10)%></td>                     <!-- Maximum Qty -->
<td style="display: none"><%= dataMTC.get(s).get(11)%></td>                     <!-- Reorder Qty -->
<td style="display: none"><%= dataMTC.get(s).get(12)%></td>                     <!-- Dose Qty -->
<td style="display: none"><%= dataMTC.get(s).get(13)%></td>                     <!-- Dose T -->
<td style="display: none"><%= dataMTC.get(s).get(14)%></td>                     <!-- Duration Qty -->
<td style="display: none"><%= dataMTC.get(s).get(15)%></td>                     <!-- Duration T -->
<td style="display: none"><%= dataMTC.get(s).get(16)%></td>                     <!-- Frequency -->
<td style="display: none"><%= dataMTC.get(s).get(17)%></td>                     <!-- Caution -->
<td ><%= dataMTC.get(s).get(18)%></td>                                          <!-- EXP Date -->
<td style="display: none"><%= dataMTC.get(s).get(19)%></td>                     <!-- Classiffication -->
<td style="display: none"><%= dataMTC.get(s).get(20)%></td>                     <!-- Status -->
<td style="display: none"><%= dataMTC.get(s).get(21)%></td>                     <!-- Location -->
<td ><%= dataMTC.get(s).get(22)%></td>                     <!-- Sell Price -->
<td style="display: none"><%= dataMTC.get(s).get(23)%></td>                     <!-- Cost Price -->
<td style="display: none"><%= dataMTC.get(s).get(24)%></td>                     <!-- Packaging -->
<td style="display: none"><%= dataMTC.get(s).get(25)%></td>                     <!-- Packaging T -->
<td style="display: none"><%= dataMTC.get(s).get(26)%></td>                     <!-- Package Per Price -->
<td style="display: none"><%= dataMTC.get(s).get(27)%></td>                     <!-- HFC -->
<td style="display: none"><%= dataMTC.get(s).get(28)%></td>                     <!-- Discipline -->
<td style="display: none"><%= dataMTC.get(s).get(29)%></td>                     <!-- Sub Discipline -->


<!-- Button Part Start -->
<td>
    <!-- Update Button Start -->
    <a id="mdcUpdateTButton" data-toggle="modal" data-target="#mdcUpdateModal">
        <i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i>
    </a>
    <!-- Update Button End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="mdcDeleteTButton" class="testing">
        <i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i>
    </a>
    <!-- Delete Button End -->
</td>
<!-- Button Part End -->

</tr>

<%
    }
%>

</tbody>
</table>


<!-- Modal Update MTC End -->
<div class="modal fade" id="mdcUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:95%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h2 class="modal-title" id="lineModalLabel" align="center">Update Drug Code</h2>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" autocomplete="off">
                    <div class="row">


                        <div class="col-md-4">

                            <h4>HFC Information</h4>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">HEALTH FACILITY CODE *</label>
                                <div class="col-md-8">
                                    <input id="updateMDCHFC" name="textinput" type="text" class="form-control input-md" value="<%= hfc%>" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">DISCIPLINE CODE *</label>
                                <div class="col-md-8">
                                    <input id="updateMDCDISCIPLINE" name="textinput" type="text" class="form-control input-md"  value="<%= dis%>" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">SUB-DISCIPLINE CODE *</label>
                                <div class="col-md-8">
                                    <input id="updateMDCSUBDISCIPLINE" name="textinput" type="text" class="form-control input-md" value="<%= sub%>" readonly>
                                </div>
                            </div>

                            <hr/>




                            <h4>Drug Information</h4>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">ATC Drug Code *</label>
                                <div class="col-md-8">
                                    <input id="updateUD_ATC_CODE" name="textinput" type="text" placeholder="ATC Drug Code" class="form-control input-md" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Drug Code *</label>
                                <div class="col-md-8">
                                    <input id="updateUD_MDC_CODE" name="textinput" type="text" placeholder="Drug Code" class="form-control input-md" readonly>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Product Name *</label>
                                <div class="col-md-8">
                                    <input id="updateD_TRADE_NAME" name="textinput" type="text" placeholder="Product Name" class="form-control input-md" maxlength="200">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Generic Name *</label>
                                <div class="col-md-8">
                                    <textarea id="updateD_GNR_NAME" class="form-control" rows="3" maxlength="300"></textarea>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Drug Route *</label>
                                <div class="col-md-8">
                                    <select id="updateD_ROUTE_CODE" name="selectbasic" class="form-control">
                                        <option value="-">Select Drug Route</option>
                                        <%
                                            String sql2 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0066' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDRoute = conn.getData(sql2);

                                            int size2 = listOfDRoute.size();

                                            for (int i = 0;
                                                    i < size2;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfDRoute.get(i).get(2)%>"><%= listOfDRoute.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dosage Form *</label>
                                <div class="col-md-8">
                                    <select id="updateD_FORM_CODE" name="selectbasic" class="form-control">
                                        <option value="-">Select Dosage Form</option>
                                        <%
                                            String sql3 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0067' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDForm = conn.getData(sql3);

                                            int size3 = listOfDForm.size();

                                            for (int i = 0;
                                                    i < size3;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfDForm.get(i).get(2)%>"><%= listOfDForm.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                        </div>





                        <div class="col-md-4">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Strength *</label>
                                <div class="col-md-8">
                                    <input id="updateD_STRENGTH" name="textinput" type="text" placeholder="Strength" class="form-control input-md" maxlength="20">
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Stock Quantity *</label>
                                <div class="col-md-8">
                                    <input id="updateD_STOCK_QTY" name="textinput" type="text" placeholder="Stock Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Minimum Quantity *</label>
                                <div class="col-md-8">
                                    <input id="updateD_MINIMUM_QTY" name="textinput" type="text" placeholder="Minimum Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Maximum Quantity *</label>
                                <div class="col-md-8">
                                    <input id="updateD_MAXIMUM_QTY" name="textinput" type="text" placeholder="Maximum Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Reorder Quantity *</label>
                                <div class="col-md-8">
                                    <input id="updateD_REORDER_QTY" name="textinput" type="text" placeholder="Reorder Qty" class="form-control input-md singleNumbersOnly" maxlength="10">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Location Code *</label>
                                <div class="col-md-8">
                                    <input id="updateD_LOCATION_CODE" name="textinput" type="text" placeholder="Location Code" class="form-control input-md" maxlength="10">
                                </div>
                            </div>

                            <hr/>




                            <h4>Purchase</h4>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Packaging *</label>
                                <div class="col-md-4">
                                    <input id="updateD_PACKAGING" name="updateD_PACKAGING" type="text" placeholder="Please Insert Packaging" class="form-control input-md singleNumbersOnly" maxlength="2">
                                </div>
                                <div class="col-md-4">
                                    <select id="updateD_PACKAGINGT" name="updateD_PACKAGINGT" class="form-control">
                                        <option value="-">No Packaging</option>
                                        <%
                                            String sql9 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0107' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfPack = conn.getData(sql9);

                                            int size9 = listOfPack.size();

                                            for (int i = 0; i < size9; i++) {
                                        %>
                                        <option value="<%= listOfPack.get(i).get(2)%>"><%= listOfPack.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Price per Pack *</label>
                                <div class="col-md-8">
                                    <input id="updateD_PRICE_PPACK" name="textinput" type="text" placeholder="Price per Pack" class="form-control input-md decimalNumbersOnly" maxlength="9">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Purchase Price *</label>
                                <div class="col-md-8">
                                    <input id="updateD_COST_PRICE" name="textinput" type="text" placeholder="Purchase Price" class="form-control input-md decimalNumbersOnly" maxlength="9">
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Sell Price *</label>
                                <div class="col-md-8">
                                    <input id="updateD_SELL_PRICE" name="textinput" type="text" placeholder="Sell Price" class="form-control input-md decimalNumbersOnly" maxlength="9">
                                </div>
                            </div>

                        </div>








                        <div class="col-md-4">

                            <h4>Label Information</h4>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Dose *</label>
                                <div class="col-md-4">
                                    <input id="updateD_QTY" name="textinput" type="text" class="form-control input-md singleNumbersOnly" maxlength="2">
                                </div>
                                <div class="col-md-4">
                                    <select id="updateD_QTYT" name="addD_QTYT" class="form-control">
                                        <option value="-">No Dose</option>
                                        <%
                                            String sql4 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0025' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDUOM = conn.getData(sql4);

                                            int size4 = listOfDUOM.size();

                                            for (int i = 0;
                                                    i < size4;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfDUOM.get(i).get(2)%>"><%= listOfDUOM.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Frequency *</label>
                                <div class="col-md-8">
                                    <select id="updateD_FREQUENCY" name="addD_FREQUENCY" class="form-control">
                                        <option value="-">No Frequency</option>
                                        <%
                                            String sql5 = "SELECT frequency_code,frequency_desc,frequency_value FROM pis_drug_frequency where hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";
                                            ArrayList<ArrayList<String>> listOfDFreq = conn.getData(sql5);

                                            int size5 = listOfDFreq.size();

                                            for (int i = 0; i < size5; i++) {
                                        %>
                                        <option value="<%= listOfDFreq.get(i).get(1)%>"><%= listOfDFreq.get(i).get(1)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Duration *</label>
                                <div class="col-md-4">
                                    <input id="updateD_DURATION" name="textinput" type="text" class="form-control input-md singleNumbersOnly" maxlength="2">
                                </div>
                                <div class="col-md-4">
                                    <select id="updateD_DURATIONT" name="addD_DURATIONT" class="form-control">
                                        <option value="-">No Duration</option>
                                        <%
                                            String sql6 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0089' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDDura = conn.getData(sql6);

                                            int size6 = listOfDDura.size();

                                            for (int i = 0;
                                                    i < size6;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfDDura.get(i).get(2)%>"><%= listOfDDura.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Instruction *</label>
                                <div class="col-md-8">
                                    <select id="updateD_ADVISORY_CODE" name="addD_ADVISORY_CODE" class="form-control">
                                        <option value="-">No Instruction</option>
                                        <%
                                            String sql7 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0087' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDInst = conn.getData(sql7);

                                            int size7 = listOfDInst.size();

                                            for (int i = 0;
                                                    i < size7;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfDInst.get(i).get(2)%>"><%= listOfDInst.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Cautionary *</label>
                                <div class="col-md-8">
                                    <textarea id="updateD_CAUTIONARY_CODE" class="form-control" rows="3" placeholder="Drug Cautionary" maxlength="200"></textarea>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Expire Date *</label>
                                <div class="col-md-8">
                                    <input id="updateD_EXP_DATE" name="updateD_EXP_DATE" type="text" class="form-control input-md" readonly>
                                </div>
                            </div>

                            <!-- Select Basic -->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Classification *</label>
                                <div class="col-md-8">
                                    <select id="updateD_CLASSIFICATION" name="updateD_CLASSIFICATION" class="form-control">
                                        <option value="-">No Classification</option>
                                        <%
                                            String sql8 = "SELECT Master_Reference_code,Detail_Reference_code, Description FROM adm_lookup_detail where Master_Reference_code = '0091' AND hfc_cd = '" + hfc + "' ";
                                            ArrayList<ArrayList<String>> listOfDClass = conn.getData(sql8);

                                            int size8 = listOfDClass.size();

                                            for (int i = 0;
                                                    i < size8;
                                                    i++) {
                                        %>
                                        <option value="<%= listOfDClass.get(i).get(2)%>"><%= listOfDClass.get(i).get(2)%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="selectbasic">Status *</label>
                                <div class="col-md-8">
                                    <select id="updateSTATUS" name="addSTATUS" class="form-control">
                                        <option value="-" disabled>No Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>   
                                    </select>
                                </div>
                            </div>

                            <hr/>


                        </div>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" id="updateMDCButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="updateMDCReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal Update MTC End -->


<script type="text/javascript">


    // Date Picker For Update
    $("#updateD_EXP_DATE").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        minDate: '0'
    });

    $('.decimalNumbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        }
    });


    $('.singleNumbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9]/g, '')) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
    });


    // Delete Function Start
    $('#contentMDCTable').off('click', '#mdcTable #mdcDeleteTButton').on('click', '#mdcTable #mdcDeleteTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataMDChidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //assign into seprated val
        var iditem = arrayData[0];
        console.log(iditem);


        bootbox.confirm({
            message: "Are you sure want to delete this item?",
            title: "Delete Item?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result === true) {
                    var data = {
                        iditem: iditem
                    };

                    $.ajax({
                        url: "controllerProcess/mdcDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {
                                $('#contentMDCTable').load('mdcTableLoop.jsp');
                                bootbox.alert({
                                    message: "Drug Code is Deleted Successful",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            } else if (datas.trim() === 'Failed') {
                                bootbox.alert({
                                    message: "Drug Code Delete Failed",
                                    title: "Process Result",
                                    backdrop: true
                                });
                            }

                        },
                        error: function (err) {
                            alert("Error! Deletion Ajax Failed!!");
                        }

                    });
                } else {
                    console.log("Process Is Canceled");
                }

            }
        });

    });
    // Delete Function End


    // Getting Data For Update Start
    $('#contentMDCTable').off('click', '#mdcTable #mdcUpdateTButton').on('click', '#mdcTable #mdcUpdateTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataMDChidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //assign into seprated val
        var UD_MDC_CODE = arrayData[0];
        var UD_ATC_CODE = arrayData[1];
        var D_TRADE_NAME = arrayData[2];
        var D_GNR_NAME = arrayData[3];
        var D_ROUTE_CODE = arrayData[4];
        var D_FORM_CODE = arrayData[5];
        var D_STRENGTH = arrayData[6];
        var D_STOCK_QTY = arrayData[8];
        var D_MINIMUM_QTY = arrayData[9];
        var D_MAXIMUM_QTY = arrayData[10];
        var D_REORDER_QTY = arrayData[11];
        var D_LOCATION_CODE = arrayData[21];
        var STATUS = arrayData[20];

        var D_PACKAGING = arrayData[24];
        var D_PACKAGINGT = arrayData[25];
        var D_PRICE_PPACK = arrayData[26];
        var D_COST_PRICE = arrayData[23];
        var D_SELL_PRICE = arrayData[22];
        var D_QTY = arrayData[12];
        var D_QTYT = arrayData[13];
        var D_FREQUENCY = arrayData[16];
        var D_DURATION = arrayData[14];
        var D_DURATIONT = arrayData[15];
        var D_ADVISORY_CODE = arrayData[7];
        var D_CAUTIONARY_CODE = arrayData[17];
        var D_EXP_DATE = arrayData[18];
        var D_CLASSIFICATION = arrayData[19];


        $("#updateUD_MDC_CODE").val(UD_MDC_CODE);
        $("#updateUD_ATC_CODE").val(UD_ATC_CODE);
        $("#updateD_TRADE_NAME").val(D_TRADE_NAME);
        $("#updateD_GNR_NAME").val(D_GNR_NAME);
        $("#updateD_ROUTE_CODE").val(D_ROUTE_CODE);
        $("#updateD_FORM_CODE").val(D_FORM_CODE);
        $("#updateD_STRENGTH").val(D_STRENGTH);
        $("#updateD_STOCK_QTY").val(D_STOCK_QTY);
        $("#updateD_MINIMUM_QTY").val(D_MINIMUM_QTY);
        $("#updateD_MAXIMUM_QTY").val(D_MAXIMUM_QTY);
        $("#updateD_REORDER_QTY").val(D_REORDER_QTY);
        $("#updateD_LOCATION_CODE").val(D_LOCATION_CODE);
        $("#updateSTATUS").val(STATUS);

        $("#updateD_PACKAGING").val(D_PACKAGING);
        $("#updateD_PACKAGINGT").val(D_PACKAGINGT);
        $("#updateD_PRICE_PPACK").val(D_PRICE_PPACK);
        $("#updateD_COST_PRICE").val(D_COST_PRICE);
        $("#updateD_SELL_PRICE").val(D_SELL_PRICE);
        $("#updateD_QTY").val(D_QTY);
        $("#updateD_QTYT").val(D_QTYT);
        $("#updateD_FREQUENCY").val(D_FREQUENCY);
        $("#updateD_DURATION").val(D_DURATION);
        $("#updateD_DURATIONT").val(D_DURATIONT);
        $("#updateD_ADVISORY_CODE").val(D_ADVISORY_CODE);
        $("#updateD_CAUTIONARY_CODE").val(D_CAUTIONARY_CODE);
        $("#updateD_EXP_DATE").val(D_EXP_DATE);
        $("#updateD_CLASSIFICATION").val(D_CLASSIFICATION);

    });
    // Getting Data For Update End


    // Update Function Start
    $("#updateMDCButton").off('click').on('click', function (e) {

        e.preventDefault();

        var UD_MDC_CODECheck = document.getElementById("updateUD_MDC_CODE");
        var UD_ATC_CODECheck = document.getElementById("updateUD_ATC_CODE");
        var D_TRADE_NAMECheck = document.getElementById("updateD_TRADE_NAME");
        var D_GNR_NAMECheck = document.getElementById("updateD_GNR_NAME");
        var D_STRENGTHCheck = document.getElementById("updateD_STRENGTH");
        var D_STOCK_QTYCheck = document.getElementById("updateD_STOCK_QTY");
        var D_MINIMUM_QTYCheck = document.getElementById("updateD_MINIMUM_QTY");
        var D_MAXIMUM_QTYCheck = document.getElementById("updateD_MAXIMUM_QTY");
        var D_REORDER_QTYCheck = document.getElementById("updateD_REORDER_QTY");
        var D_LOCATION_CODECheck = document.getElementById("updateD_LOCATION_CODE");
        var D_PACKAGINGCheck = document.getElementById("updateD_PACKAGING");
        var D_PRICE_PPACKCheck = document.getElementById("updateD_PRICE_PPACK");
        var D_COST_PRICECheck = document.getElementById("updateD_COST_PRICE");
        var D_SELL_PRICECheck = document.getElementById("updateD_SELL_PRICE");
        var D_QTYCheck = document.getElementById("updateD_QTY");
        var D_DURATIONCheck = document.getElementById("updateD_DURATION");
        var D_CAUTIONARY_CODECheck = document.getElementById("updateD_CAUTIONARY_CODE");


        var UD_MDC_CODE = $("#updateUD_MDC_CODE").val();
        var UD_ATC_CODE = $("#updateUD_ATC_CODE").val();
        var D_TRADE_NAME = $("#updateD_TRADE_NAME").val();
        var D_GNR_NAME = $("#updateD_GNR_NAME").val();
        var D_ROUTE_CODE = $("#updateD_ROUTE_CODE").val();
        var D_FORM_CODE = $("#updateD_FORM_CODE").val();
        var D_STRENGTH = $("#updateD_STRENGTH").val();
        var D_STOCK_QTY = $("#updateD_STOCK_QTY").val();
        var D_MINIMUM_QTY = $("#updateD_MINIMUM_QTY").val();
        var D_MAXIMUM_QTY = $("#updateD_MAXIMUM_QTY").val();
        var D_REORDER_QTY = $("#updateD_REORDER_QTY").val();
        var D_LOCATION_CODE = $("#updateD_LOCATION_CODE").val();
        var STATUS = $("#updateSTATUS").val();

        var D_PACKAGING = $("#updateD_PACKAGING").val();
        var D_PACKAGINGT = $("#updateD_PACKAGINGT").val();
        var D_PRICE_PPACK = $("#updateD_PRICE_PPACK").val();
        var D_COST_PRICE = $("#updateD_COST_PRICE").val();
        var D_SELL_PRICE = $("#updateD_SELL_PRICE").val();
        var D_QTY = $("#updateD_QTY").val();
        var D_QTYT = $("#updateD_QTYT").val();
        var D_FREQUENCY = $("#updateD_FREQUENCY").val();
        var D_DURATION = $("#updateD_DURATION").val();
        var D_DURATIONT = $("#updateD_DURATIONT").val();
        var D_ADVISORY_CODE = $("#updateD_ADVISORY_CODE").val();
        var D_CAUTIONARY_CODE = $("#updateD_CAUTIONARY_CODE").val();
        var D_EXP_DATE = $("#updateD_EXP_DATE").val();
        var D_CLASSIFICATION = $("#updateD_CLASSIFICATION").val();

        var strCom = D_CAUTIONARY_CODE.replace(/'/g, '\\\'');
        D_CAUTIONARY_CODE = strCom;

        var newCostPrice = parseFloat(D_COST_PRICE).toFixed(2);
        var newSellPrice = parseFloat(D_SELL_PRICE).toFixed(2);
        var newPackPrice = parseFloat(D_PRICE_PPACK).toFixed(2);

        D_COST_PRICE = newCostPrice;
        D_SELL_PRICE = newSellPrice;
        D_PRICE_PPACK = newPackPrice;

        var sDate = D_EXP_DATE.split('/');
        var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

        D_EXP_DATE = newDate + " 00:00:00";

        if (UD_MDC_CODE === "") {
            bootbox.alert("Please Insert Drug Code");
        } else if (UD_ATC_CODE === "") {
            bootbox.alert("Please Search Any ATC Code");
        } else if (D_TRADE_NAME === "") {
            bootbox.alert("Please Insert Drug Trade Name");
        } else if (D_GNR_NAME === "") {
            bootbox.alert("Please Insert Drug Generic Name");
        } else if (D_ROUTE_CODE === "-") {
            bootbox.alert("Select Any Route");
        } else if (D_FORM_CODE === "-") {
            bootbox.alert("Select Any Form");
        } else if (D_STRENGTH === "") {
            bootbox.alert("Please Insert Drug Strength");
        } else if (D_STOCK_QTY === "") {
            bootbox.alert("Please Insert Drug Stock Quantity");
        } else if (D_MINIMUM_QTY === "") {
            bootbox.alert("Please Insert Drug Minimum Quantity");
        } else if (D_MAXIMUM_QTY === "") {
            bootbox.alert("Please Insert Drug Maximum Quantity");
        } else if (D_REORDER_QTY === "") {
            bootbox.alert("Please Insert Drug Reorder Quantity");
        } else if (D_LOCATION_CODE === "") {
            bootbox.alert("Please Insert Drug Location Code");
        } else if (STATUS === "-") {
            bootbox.alert("Select Any Status");

        } else if (D_PACKAGING === "") {
            bootbox.alert("Please Insert Drug Packaging");
        } else if (D_PACKAGINGT === "-") {
            bootbox.alert("Please Select Drug Packaging Type");
        } else if (D_PRICE_PPACK === "") {
            bootbox.alert("Please Insert Drug Per Pack Price");
        } else if (D_COST_PRICE === "") {
            bootbox.alert("Please Insert Drug Cost Price");
        } else if (D_SELL_PRICE === "") {
            bootbox.alert("Please Insert Drug Sell Price");
        } else if (D_QTY === "") {
            bootbox.alert("Please Insert Drug Quantity");
        } else if (D_QTYT === "-") {
            bootbox.alert("Select Any Dose");
        } else if (D_FREQUENCY === "-") {
            bootbox.alert("Select Any Frequency");
        } else if (D_DURATION === "") {
            bootbox.alert("Please Insert Drug Duration");
        } else if (D_DURATIONT === "-") {
            bootbox.alert("Select Any Duration");
        } else if (D_ADVISORY_CODE === "-") {
            bootbox.alert("Select Any Instruction");
        } else if (D_CAUTIONARY_CODE === "") {
            bootbox.alert("Please Insert Drug Cautionary Code");
        } else if (D_EXP_DATE === "") {
            bootbox.alert("Please Insert Drug Expire Date");
        } else if (D_CLASSIFICATION === "-") {
            bootbox.alert("Select Any Classification");

        } else if (UD_MDC_CODECheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Code Not More Than 30 Characters");
        } else if (UD_ATC_CODECheck.checkValidity() === false) {
            bootbox.alert("Please Insert ATC Code Not More Than 30 Characters");
        } else if (D_TRADE_NAMECheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Trade Name Not More Than 200 Characters");
        } else if (D_GNR_NAMECheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Generic Name Not More Than 300 Characters");
        } else if (D_STRENGTHCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Strength Not More Than 20 Characters");
        } else if (D_STOCK_QTYCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Stock Not More Than 10 Characters");
        } else if (D_MINIMUM_QTYCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Minimum Level Not More Than 10 Characters");
        } else if (D_MAXIMUM_QTYCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Maximum Level Not More Than 10 Characters");
        } else if (D_REORDER_QTYCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Reorder Level Not More Than 10 Characters");
        } else if (D_LOCATION_CODECheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Location Not More Than 10 Characters");
        } else if (D_PACKAGINGCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Packaging Not More Than 2 Number");
        } else if (D_PRICE_PPACKCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Per Pack Price Not More Than 9 Number In Decimal Form");
        } else if (D_COST_PRICECheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Cost Price Not More Than 9 Number In Decimal Form");
        } else if (D_SELL_PRICECheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Sell Price Not More Than 9 Number In Decimal Form");
        } else if (D_QTYCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Dose Not More Than 2 Number");
        } else if (D_DURATIONCheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Duration Not More Than 2 Number");
        } else if (D_CAUTIONARY_CODECheck.checkValidity() === false) {
            bootbox.alert("Please Insert Drug Cautionary Not More Than 200 Characters");

        } else {

            var data = {
                UD_MDC_CODE: UD_MDC_CODE,
                UD_ATC_CODE: UD_ATC_CODE,
                D_TRADE_NAME: D_TRADE_NAME,
                D_GNR_NAME: D_GNR_NAME,
                D_ROUTE_CODE: D_ROUTE_CODE,
                D_FORM_CODE: D_FORM_CODE,
                D_STRENGTH: D_STRENGTH,
                D_STOCK_QTY: D_STOCK_QTY,
                D_MINIMUM_QTY: D_MINIMUM_QTY,
                D_MAXIMUM_QTY: D_MAXIMUM_QTY,
                D_REORDER_QTY: D_REORDER_QTY,
                D_LOCATION_CODE: D_LOCATION_CODE,
                STATUS: STATUS,
                D_PACKAGING: D_PACKAGING,
                D_PACKAGINGT: D_PACKAGINGT,
                D_PRICE_PPACK: D_PRICE_PPACK,
                D_COST_PRICE: D_COST_PRICE,
                D_SELL_PRICE: D_SELL_PRICE,
                D_QTY: D_QTY,
                D_QTYT: D_QTYT,
                D_FREQUENCY: D_FREQUENCY,
                D_DURATION: D_DURATION,
                D_DURATIONT: D_DURATIONT,
                D_ADVISORY_CODE: D_ADVISORY_CODE,
                D_CAUTIONARY_CODE: D_CAUTIONARY_CODE,
                D_EXP_DATE: D_EXP_DATE,
                D_CLASSIFICATION: D_CLASSIFICATION
            };
            console.log(data);

            $.ajax({
                url: "controllerProcess/mdcUpdate.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    if (datas.trim() === 'Success') {

                        $('#contentMDCTable').load('mdcTableLoop.jsp');
                        $(".modal-backdrop").hide();
                        bootbox.alert({
                            message: "Drug Code is Updated Successful",
                            title: "Process Result",
                            backdrop: true
                        });

                    } else if (datas.trim() === 'Failed') {

                        bootbox.alert({
                            message: "Drug Code Update Failed",
                            title: "Process Result",
                            backdrop: true
                        });

                    }
                },
                error: function (err) {
                    alert("Error update!");
                }

            });

        }
    });
    // Update Function End


</script>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#mdcTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Drug Drug Available To Display"
            },
            initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });


    });
</script>
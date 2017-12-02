<%-- 
    Document   : getWardTrack
    Created on : Dec 2, 2017, 4:02:59 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);

    String pmiNo = request.getParameter("pmiNo");
    String epiDate = request.getParameter("epiDate");
    String orderNo = request.getParameter("orderNo");
    String orderDate = request.getParameter("orderDate");

    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();

    // set endDate to now; If cancelled, no problem, it will updated on the next request.
    String query = "UPDATE wis_inpatient_episode set `endDate`=now() "
            + "where hfc_cd = '" + hfc_cd + "' AND inpatient_status='0' AND pmi_no='" + pmiNo + "';";
    rmi.setQuerySQL(con.HOST, con.PORT, query);

    //select all record from episode and history where status is 0;
    //                  0            1              2                   3                   4       5               6          7        8               9                   10
    query = "select a.new_ic_no, a.old_ic_no, c.`ID_TYPE`, ifnull(id.`Description`, '-'), a.id_no, a.police_case, a.hfc_cd, a.pmi_no, a.episode_date, a.discipline_cd, a.subdiscipline_cd, "
            //  11                      12                  13          14          15          16              17                  18                      19
            + "a.ward_class_code, wc.ward_class_name, a.ward_id, wwn.ward_name, a.bed_id, a.payer_group, payG.`Description`, a.eligibility_type_cd, eliTy.`Description`, "
            //  20                              21                  22                  23                          24                  25
            + "a.eligibility_category_cd, eliSo.`Description`, a.referred_from_hfc, ifnull(hfc.hfc_name, '-'), a.admission_reason, emg.`Description`, "
            //  26                              27                              28
            + "a.admission_description, ifnull(a.gl_expiry_date, '-'), a.deposit_inpatient, "
            //      29              30                   31              32              33                                 34                 35                               36                                      
            + "a.document_type, docTy.`Description`, a.document_no, c.PATIENT_NAME, ifnull(usr.`USER_NAME`, '-'), ifnull(a.`startDate`, '-'), ifnull(a.`endDate`, '-') , ifnull(DATEDIFF( a.`endDate`, a.`startDate`), '0'), "
            //            37                38                              39
            + "dis.discipline_name, ifnull(chg.charges_fees, '0'), ifnull(discount.charges_fees, '0') "
            + "from wis_inpatient_episode a "
            + "left join pms_patient_biodata c on a.pmi_no = c.pmi_no "
            + "left join wis_ward_class wc on wc.ward_class_code=a.ward_class_code AND wc.hfc_cd=a.hfc_cd "
            + "left join wis_ward_name wwn on wwn.ward_id = a.ward_id AND wwn.hfc_cd=a.hfc_cd "
            + "left join adm_lookup_detail id on id.`Detail_Reference_code`=c.`ID_TYPE` AND id.hfc_cd=a.hfc_cd AND id.`Master_Reference_code`='0012' "
            + "left join adm_lookup_detail payG on payG.hfc_cd=a.hfc_cd AND payG.`Detail_Reference_code`=a.`PAYER_GROUP` AND payG.`Master_Reference_code`='0055' "
            + "left join adm_lookup_detail emg on emg.hfc_cd=a.hfc_cd AND emg.`Detail_Reference_code`=a.admission_reason AND emg.`Master_Reference_code`='0023' "
            + "left join adm_lookup_detail eliTy on eliTy.hfc_cd=a.hfc_cd AND eliTy.`Detail_Reference_code`=a.eligibility_type_cd AND eliTy.`Master_Reference_code`='0034' "
            + "left join adm_lookup_detail eliSo on eliSo.hfc_cd=a.hfc_cd AND eliSo.`Detail_Reference_code`=a.eligibility_category_cd AND eliSo.`Master_Reference_code`='0063' "
            + "left join adm_lookup_detail docTy on docTy.hfc_cd=a.hfc_cd AND docTy.`Detail_Reference_code`=a.`DOCUMENT_TYPE` AND docTy.`Master_Reference_code`='0065' "
            + "left join adm_health_facility hfc on hfc.hfc_cd=a.referred_from_hfc "
            + "left join adm_discipline dis on dis.discipline_hfc_cd=a.hfc_cd AND dis.discipline_cd=a.discipline_cd "
            + "left join adm_users usr on usr.`USER_ID`=a.order_by "
            + "left join wis_hospital_charges chg on chg.hfc_cd=a.hfc_cd AND chg.ward_id=a.ward_id AND chg.ward_class_code=a.ward_class_code AND chg.eligibility_sources_cd=a.eligibility_category_cd AND chg.eligibility_type_cd=a.eligibility_type_cd AND chg.charges_type='002' "
            + "left join wis_hospital_charges discount on discount.hfc_cd=a.hfc_cd AND discount.ward_id=a.ward_id AND discount.ward_class_code=a.ward_class_code AND discount.eligibility_sources_cd=a.eligibility_category_cd AND discount.eligibility_type_cd=a.eligibility_type_cd AND discount.charges_type='004' "
            + "where a.inpatient_status='0' AND a.hfc_cd='" + hfc_cd + "' AND a.pmi_no='" + pmiNo + "'; ";
    ArrayList<ArrayList<String>> arrEpisode = con.getData(query);

    String eliSource = arrEpisode.get(0).get(20);
    String eliTy = arrEpisode.get(0).get(18);

    ArrayList<String> arrCharges = new ArrayList<String>();
    ArrayList<String> arrDays = new ArrayList<String>();
    ArrayList<String> arrCode = new ArrayList<String>();
    ArrayList<String> arrName = new ArrayList<String>();

// calculate the ward charges after getting discount
    int days = Integer.parseInt(arrEpisode.get(0).get(36));
    float chargePerDay = Float.parseFloat(arrEpisode.get(0).get(38));
    float discount = Float.parseFloat(arrEpisode.get(0).get(39));
    float totalCharge = (days * chargePerDay) * ((100 - discount) / 100.0f);

    arrCharges.add("" + totalCharge);
    arrDays.add("" + days);
    arrCode.add(arrEpisode.get(0).get(11) + ":" + arrEpisode.get(0).get(13));
    arrName.add(arrEpisode.get(0).get(14));

    //                      0                       1               2           3           4               5               6
    query = "SELECT his.ward_class_code, wc.ward_class_name, his.ward_id, wn.ward_name, his.bed_id, his.discipline_cd, dis.discipline_name, "
            //              7                                   8                           9                                                   10
            + "ifnull(his.`startDate`, '0'), ifnull(his.`endDate`, '-'), ifnull(DATEDIFF(his.`endDate`, his.`startDate`),'0'), ifnull(chg.charges_fees, '0'), "
            //              11
            + "ifnull(discount.charges_fees, '0') "
            + "FROM wis_inpatient_episode_history his "
            + "LEFT JOIN wis_ward_class wc ON wc.hfc_cd=his.hfc_cd AND wc.ward_class_code=his.ward_class_code "
            + "LEFT JOIN wis_ward_name wn ON wn.hfc_cd=his.hfc_cd AND wn.ward_id=his.ward_id "
            + "LEFT JOIN adm_discipline dis ON dis.discipline_hfc_cd=his.hfc_cd AND dis.discipline_cd=his.discipline_cd "
            + "left join wis_hospital_charges chg on chg.hfc_cd=his.hfc_cd AND chg.ward_id=his.ward_id AND chg.ward_class_code=his.ward_class_code AND chg.eligibility_sources_cd='" + eliSource + "' AND chg.eligibility_type_cd='" + eliTy + "' AND chg.charges_type='002' "
            + "left join wis_hospital_charges discount on discount.hfc_cd=his.hfc_cd AND discount.ward_id=his.ward_id AND discount.ward_class_code=his.ward_class_code AND discount.eligibility_sources_cd='" + eliSource + "' AND discount.eligibility_type_cd='" + eliTy + "' AND discount.charges_type='004' "
            + "WHERE his.hfc_cd='" + hfc_cd + "' AND his.inpatient_status='0' AND his.pmi_no='" + pmiNo + "';";

    ArrayList<ArrayList<String>> arrHis = con.getData(query);

%>

<div class="row" id="bedDiv1">
    <div class="col-md-12">
        <h4>In-Patient Information</h4>
        <form class="form-horizontal" name="myForm2" id="myForm2">
            <div class="row">
                <div class="col-md-6">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                        <div class="col-md-6">
                            <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md" value="<%=pmiNo%>">                        
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Old IC NO</label>
                        <div class="col-md-6">
                            <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(1)%>">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">ID Type</label>
                        <div class="col-md-6">
                            <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(3)%>">
                        </div>
                    </div>

                </div>

                <div class="col-md-6">
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Name</label>
                        <div class="col-md-6">
                            <input id="pname" name="pnamef" type="text" readonly placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(32)%>">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                        <div class="col-md-6">
                            <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(0)%>">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                        <div class="col-md-6">
                            <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(4)%>">
                        </div>
                    </div>
                </div>
            </div>

            <hr/>
            <h4>More In-Patient Information</h4>

            <div class="row">

                <div class="col-md-4">  
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Source*</label>
                        <div class="col-md-6">

                            <input  readonly id="EliSrc" name="EliSrc" type="text" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(21)%>">



                        </div> 
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Eligibility Type*</label>
                        <div class="col-md-6" id="EligibilityTypeDropdown">
                            <input readonly id="EliTy" name="EliTy" type="text" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(19)%>">

                        </div>

                    </div>
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Admission type *</label>
                        <div class="col-md-6">
                            <input readonly id="AdmTy" name="AdmTy" type="text" readonly  class="form-control input-md" value="<%=arrEpisode.get(0).get(25)%>">

                        </div> 
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Admission reason* </label>
                        <div class="col-md-6">
                            <input readonly id="AdmRe" name="AdmRe" type="text" readonly  class="form-control input-md" value="<%=arrEpisode.get(0).get(26)%>">

                        </div>
                    </div>


                </div>

                <div class="col-md-4">

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Document type *</label>
                        <div class="col-md-6">
                            <input readonly id="DocTy" name="AdmRe" type="text" readonly  class="form-control input-md" value="<%=arrEpisode.get(0).get(30)%>">

                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Document no*</label>
                        <div class="col-md-6">
                            <input id="DocNo" name="textinput" type="text" readonly  placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(31)%>">
                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Referring from *</label>
                        <div class="col-md-6">
                            <input readonly id="RefFrom" name="textinput" type="text" placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(23)%>">

                        </div>
                    </div>   
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Referred By *</label>
                        <div class="col-md-6">
                            <input readonly id="RefBy" name="textinput" type="text" placeholder="" class="form-control input-md" value="<%=arrEpisode.get(0).get(33)%>">

                        </div>
                    </div> 

                </div>

                <div class="col-md-4">  

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput"> GL expiry date *</label>
                        <div class="col-md-6">
                            <input id="GL" name="GL" type="text" placeholder="Pop-up Calendar" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(27)%>">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Payer Group*</label>
                        <div class="col-md-6">
                            <input id="PayerGrp" name="PayerGrp" type="text"  readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(17)%>">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Police case *</label>
                        <div class="col-md-6">
                            <input id="Police" name="Police" type="text"  readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(5)%>">

                        </div>
                    </div>

                </div>
            </div>
            <hr/>
            <h4>Ward Admission Record</h4>

            <div class="row">

                <div class="col-md-3">
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Discipline </label>
                        <div class="col-md-6">
                            <input readonly id="Dis" name="Dis" type="text"  class="form-control input-md" value="<%=arrEpisode.get(0).get(37)%>">

                        </div>

                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                        <div class="col-md-6" >
                            <input id="WardType" name="WardType" type="text" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(12)%>">


                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                        <div class="col-md-6" >
                            <input id="wname" name="wname" type="text" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(14)%>">
                        </div>

                    </div>

                </div>



                <div class="col-md-3">  
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Bed No </label>
                        <div class="col-md-6">
                            <input   readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(15)%>">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Check In</label>
                        <div class="col-md-6">
                            <input id="Deposit" name="textinput" type="text" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(34)%>">
                        </div>
                    </div>   

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Check Out</label>
                        <div class="col-md-6">
                            <input id="Deposit" name="textinput" type="text" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(35)%>">
                        </div>
                    </div>

                </div>

                <div class="col-md-3"> 

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total Days Admit</label>
                        <div class="col-md-6">
                            <input id="day" name="day" type="text" placeholder=" " readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(36)%>">                        
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
                        <div class="col-md-6">
                            <input id="Deposit" name="textinput" type="text" readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(28)%>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Charge Per Day(RM) </label>
                        <div class="col-md-6">
                            <input id="TotalDischarge" name="TotalDischarge" type="text" placeholder=" " readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(38)%>">                        
                        </div>
                    </div>
                </div>

                <div class="col-md-3"> 

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discount (%)</label>
                        <div class="col-md-6">
                            <input id="day" name="day" type="text" placeholder=" " readonly class="form-control input-md" value="<%=arrEpisode.get(0).get(39)%>">                        
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total Charge(RM) </label>
                        <div class="col-md-6">
                            <input id="TotalDischarge" name="TotalDischarge" type="text" placeholder=" " readonly class="form-control input-md" value="<%=String.format("%.2f", totalCharge)%>">                        
                        </div>
                    </div>
                </div>
            </div>
            <%
                for (int i = 0; i < arrHis.size(); i++) {
                    days = Integer.parseInt(arrHis.get(i).get(9));
                    chargePerDay = Float.parseFloat(arrHis.get(i).get(10));
                    discount = Float.parseFloat(arrHis.get(i).get(11));
                    totalCharge = (days * chargePerDay) * ((100 - discount) / 100.0f);

                    arrDays.add("" + days);
                    arrCharges.add("" + totalCharge);
                    arrCode.add(arrHis.get(i).get(0) + ":" + arrHis.get(i).get(2));
                    arrName.add(arrHis.get(i).get(3));
            %>
            <hr/>
            <div class="row">

                <div class="col-md-3">
                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Discipline </label>
                        <div class="col-md-6">
                            <input readonly id="Dis" name="Dis" type="text"  class="form-control input-md" value="<%=arrHis.get(i).get(6)%>">

                        </div>

                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                        <div class="col-md-6" >
                            <input id="WardType" name="WardType" type="text" readonly class="form-control input-md" value="<%=arrHis.get(i).get(1)%>">


                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                        <div class="col-md-6" >
                            <input id="wname" name="wname" type="text" readonly class="form-control input-md" value="<%=arrHis.get(i).get(3)%>">
                        </div>

                    </div>

                </div>



                <div class="col-md-3">  
                    <div class="form-group">
                        <label class="col-md-4 control-label" >Bed No </label>
                        <div class="col-md-6">
                            <input   readonly class="form-control input-md" value="<%=arrHis.get(i).get(4)%>">
                        </div>
                    </div>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Check In</label>
                        <div class="col-md-6">
                            <input id="Deposit" name="textinput" type="text" readonly class="form-control input-md" value="<%=arrHis.get(i).get(7)%>">
                        </div>
                    </div>   

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Check Out</label>
                        <div class="col-md-6">
                            <input id="Deposit" name="textinput" type="text" readonly class="form-control input-md" value="<%=arrHis.get(i).get(8)%>">
                        </div>
                    </div>

                </div>

                <div class="col-md-3"> 

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total Days Admit</label>
                        <div class="col-md-6">
                            <input id="day" name="day" type="text" placeholder=" " readonly class="form-control input-md" value="<%=arrHis.get(i).get(9)%>">                        
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Charge Per Day(RM) </label>
                        <div class="col-md-6">
                            <input id="TotalDischarge" name="TotalDischarge" type="text" placeholder=" " readonly class="form-control input-md" value="<%=arrHis.get(i).get(10)%>">                        
                        </div>
                    </div>
                </div>

                <div class="col-md-3"> 

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Discount (%)</label>
                        <div class="col-md-6">
                            <input id="day" name="day" type="text" placeholder=" " readonly class="form-control input-md" value="<%=arrHis.get(i).get(11)%>">                        
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Total Charge(RM) </label>
                        <div class="col-md-6">
                            <input id="TotalDischarge" name="TotalDischarge" type="text" placeholder=" " readonly class="form-control input-md" value="<%=String.format("%.2f", totalCharge)%>">                        
                        </div>
                    </div>
                </div>
            </div>

            <%

                }//end for loop
%>

            <input type="hidden" value="<%=String.join("|", arrCharges)%>" id="hidArrCharges">
            <input type="hidden" value="<%=String.join("|", arrDays)%>" id="hidArrDays">
            <input type="hidden" value="<%=String.join("|", arrCode)%>" id="hidArrCode">
            <input type="hidden" value="<%=String.join("|", arrName)%>" id="hidArrName">
            <input type="hidden" value="<%=epiDate%>" id="hidEpiDate">
            <input type="hidden" value="<%=orderNo%>" id="hidOrderNo">
            <input type="hidden" value="<%=orderDate%>" id="hidOrderDate">
            <input type="hidden" value="<%=pmiNo%>" id="hidPmiNo">
            <input type="hidden" value="<%=arrEpisode.get(0).get(9)%>" id="hidDiscipline">
            <input type="hidden" value="<%=arrEpisode.get(0).get(15)%>" id="hidBedId">
            <input type="hidden" value="<%=arrEpisode.get(0).get(13)%>" id="hidWardId">
        </form>
        <div class="text-center">
            <button class="btn btn-default " type="button" id="d_btnBack" name="btncancel" ><i class="fa fa-arrow-circle-left"></i> Back</button>
            <button class="btn btn-primary " type="button" id="d_btnDischarge"><i class="fa fa-check-square"></i> Discharge</button>
        </div>

    </div>
</div>
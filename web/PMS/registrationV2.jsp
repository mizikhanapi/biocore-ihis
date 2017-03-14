<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<link rel="stylesheet" href="../assets/css/loading.css">-->
<!--hfc code in register queue need to get from session -->

<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String patCat = "select * from adm_lookup_detail where master_reference_code = '0033'   ";
    String visType = "select * from adm_lookup_detail where master_reference_code = '0022'   ";
    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063'   ";
    String eliType = "select * from adm_lookup_detail where master_reference_code = '0034'   ";
    //String discip = "select * from adm_lookup_detail where master_reference_code = '0072'   ";
    String prio = "select * from adm_lookup_detail where master_reference_code = '0036'   ";
    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012'   ";
    String Commonqueue = "select * from pms_queue_list where queue_type='CM' and hfc_cd='" + hfc + "' and status ='Active'";
    String Consultationqueue = "select * from pms_queue_list where queue_type='FY' and hfc_cd='" + hfc + "' and status ='Active'";
    String Doctorqueue = "select * from pms_queue_list where queue_type='PN' and hfc_cd='" + hfc + "' and status ='Active'";

    ArrayList<ArrayList<String>> dataQueue2, dataQueue3, dataPatCat, dataVisType, dataEliCat, dataEliType, dataDiscip, dataPrio, dataIdType, dataQueue;

    //Conn conn = new Conn();
    dataPatCat = conn.getData(patCat);
    dataVisType = conn.getData(visType);
    dataEliCat = conn.getData(eliCat);
    dataEliType = conn.getData(eliType);
    //dataDiscip = conn.getData(discip);
    dataPrio = conn.getData(prio);
    dataIdType = conn.getData(idTYpe);
    dataQueue = conn.getData(Commonqueue);
    dataQueue2 = conn.getData(Consultationqueue);
    dataQueue3 = conn.getData(Doctorqueue);

    // status 0 = public
    // status 1 = universiti
    // status bole dapat kat session
    String dataSystemStatus = session.getAttribute("SYSTEMSTAT").toString();

    //out.println(conn.getIpCall()+ " ");
    //out.println("  Health facility code :"+hfc);

%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=id%>" id="Rid">
<div class="row" id="register">
    <div class="col-md-12">
        <div id="searchPatientModule"><%@include file = "search/searchPatient.jsp" %></div>


        <div class="thumbnail">
            <h4>Basic Info</h4>
            <hr/>
            <form class="form-horizontal" name="myForm2" id="myForm2">
                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-8">
                                <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Name</label>
                            <div class="col-md-8">
                                <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                            <div class="col-md-8">
                                <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                            <div class="col-md-8">
                                <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-8">
                                <input id="pit" name="pit" type="text" placeholder=""  readonly class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Identification No.</label>
                            <div class="col-md-8">
                                <input id="pino" name="pino" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>
                    </div>
                </div>


                <h4>Registration Info</h4>
                <hr/>

                <div class="row">
                    <div class="col-md-6">
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Registration No.</label>
                            <div class="col-md-6">
                                <input id="rnNo" name="rnNo" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Patient Category</label>
                            <div class="col-md-6">
                                <select id="patCat" name="patCat" class="form-control">
                                    <option selected disabled>Select Patient Category</option>
                                    <!--<option value="2">General OutPatient</option>
                                    <option value="2">Inpatient</option>
                                    <option value="2">Specialist OutPatient</option>-->
                                    <%                                        for (int i = 0; i < dataPatCat.size(); i++) {%>
                                    <option value="<%=dataPatCat.get(i).get(1)%>"><%=dataPatCat.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Visit Type *</label>
                            <div class="col-md-6">
                                <select id="visTy" name="visTy" class="form-control">
                                    <option selected disabled>Select Visit Type</option>
                                    <!--<option value="2">Appointment</option>
                                    <option value="2">Referral</option>
                                    <option value="2">Walk-in</option>-->
                                    <%
                                        for (int i = 0; i < dataVisType.size(); i++) {%>
                                    <option value="<%=dataVisType.get(i).get(1)%>"><%=dataVisType.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Emergency Type</label>
                            <div class="col-md-6">
                                <select id="EmTy" name="EmTy" class="form-control">
                                    <option  selected="" disabled="">Select Emergency Type</option>
                                    <option value="-">-</option>       
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Please select the Queue</label>

                            <label class="col-md-4 control-label" for="selectbasic"></label>
                            <div class="col-md-6">
                                <label for="radios-0">
                                    <input type="radio" name="radios" id="radios-0" value="Consultant Room">
                                    Consultant Room&nbsp;
                                </label>
                                <label for="radios-1">
                                    <input type="radio" name="radios" id="radios-1" value="Queue">
                                    Common Queue&nbsp;
                                </label>
                                <label for="radios-2">
                                    <input type="radio" name="radios" id="radios-2" value="Doctor">
                                    Doctor&nbsp;
                                </label>

                                <select id="select-0" name="select-0" class="form-control">
                                    <option value="null" selected="" >Please select consultation room</option>
                                    <%
                                        for (int i = 0; i < dataQueue2.size(); i++) {%>
                                    <option value="<%=dataQueue2.get(i).get(1) + "|" + dataQueue2.get(i).get(2)%>"><%="(" + dataQueue2.get(i).get(0) + ") " + dataQueue2.get(i).get(1)%></option>
                                    <%  }
                                    %>
                                </select>
                                <select id="select-1" name="select-1" class="form-control">
                                    <option selected="" value="null">Please select Queue</option>
                                    <%
                                        for (int i = 0; i < dataQueue.size(); i++) {%>
                                    <option value="<%=dataQueue.get(i).get(1) + "|" + dataQueue.get(i).get(2)%>"><%="(" + dataQueue.get(i).get(0) + ") " + dataQueue.get(i).get(1) + " " + i%></option>
                                    <%  }
                                    %>
                                </select>
                                <select id="select-2" name="select-2" class="form-control">
                                    <option value="null"  selected="">Please select Doctor</option>
                                    <%
                                            for (int i = 0; i < dataQueue3.size(); i++) {%>
                                    <option value="<%=dataQueue3.get(i).get(1) + "|" + dataQueue3.get(i).get(2)%>"><%="(" + dataQueue3.get(i).get(0) + ") " + dataQueue3.get(i).get(1)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Category</label>
                            <div class="col-md-6">
                                <select id="EliCat" name="EliCat" class="form-control">
                                    <option value="1" selected="" disabled="">Select Eligibility Category</option>
                                    <!--<option value="2">Government</option>
                                    <option value="2">Private</option>
                                    <option value="2">Public</option>
                                    <option value="2">SOCSO</option>-->
                                    <%
                                        for (int i = 0; i < dataEliCat.size(); i++) {%>
                                    <option value="<%=dataEliCat.get(i).get(1)%>"><%=dataEliCat.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                            <div class="col-md-6">
                                <select id="EliTy" name="EliTy" class="form-control">
                                    <option value="1" selected="" disabled="">Select Eligibility Type</option>
                                    <!--<option value="2">Student</option>
                                    <option value="2">Staff</option>-->
                                    <%
                                        for (int i = 0; i < dataEliType.size(); i++) {%>
                                    <option value="<%=dataEliType.get(i).get(1)%>"><%=dataEliType.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
                            <div class="col-md-6">
                                <input id="Dis" name="Dis" type="text"  class="form-control input-md">
                                <div id="disList"></div>
                            </div>

                        </div>
                    </div>
                </div>

                <h4>Registration Details</h4>
                <hr/>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Priority Group *</label>
                            <div class="col-md-6">
                                <select id="prioGru" name="prioGru" class="form-control">
                                    <option value="1" selected="" disabled="">Select Priority Group</option>
                                    <%
                                        for (int i = 0; i < dataPrio.size(); i++) {%>
                                    <option value="<%=dataPrio.get(i).get(1)%>"><%=dataPrio.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                </select>
                                <input id="sessionHfc" name="sessionHfc" type="hidden"  class="form-control input-md" value="<%= session.getAttribute("HFC")%>">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary " type="button" id="registerQueue"><i class="fa fa-floppy-o fa-lg"></i> Register</button>
                    <button class="btn btn-default " type="button" id="btnclear" name="btnclear" > <i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                    <!--                    <div id="dialog" title="Basic dialog">
                                            <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
                                        </div>-->
                </div>
                <br/>
                <div class="text-center">
                    <button class="btn btn-default" type="button" data-toggle="modal" data-target="#appointmentModal" id="appointment"> Appointment List</button>
                    <button class="btn btn-default" type="button" data-toggle="modal" data-target="#queueModal" id="queue">List Of Queue</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div  id="modalSaya"><%@include file = "AppointmentModal.jsp" %></div>
<div class="modalLoad"></div>
<div id="modalSaya2"><%@include file = "QueueModal.jsp" %></div>




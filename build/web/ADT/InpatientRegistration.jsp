<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="old/assets/css/loading.css">



<%
//    String hfc = session.getAttribute("HFC").toString();
    String eliCat = "select * from adm_lookup_detail where master_reference_code = '0063'   ";
    String admit = "select * from lookup_detail where master_ref_code ='0023'";
    String eliType = "select * from adm_lookup_detail where master_reference_code = '0034'   ";

    String idTYpe = "select * from adm_lookup_detail where master_reference_code = '0012'   ";

    ArrayList<ArrayList<String>> dataEliCat, dataAdmit, dataEliType, dataIdType;

    dataEliCat = conn.getData(eliCat);
    dataAdmit = conn.getData(admit);
    dataEliType = conn.getData(eliType);
    dataIdType = conn.getData(idTYpe);

    String dataSystemStatus2 = session.getAttribute("SYSTEMSTAT").toString();

%>


<div class="row" id="register">
    <div class="col-md-12">
        <div> <%@include file = "searchPatient.jsp" %></div>
    </div>
</div>
<!--        <div class="thumbnail">
    <h4>Search Patient
        <button id="button2id" name="button2id" class="btn btn-success pull-right"><i class="fa fa-user fa-lg"></i>&nbsp; Read MyKad Info</button>
    </h4>
    <form class="form-horizontal" name="myForm" id="myForm">
         Select Basic 
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
            <div class="col-md-4">
                <select id="idType" name="idType" class="form-control" required="">
                    <option selected="" disabled="" value="-"> Please select ID type</option>
                    <option value="pmino">PMI No</option>
                    <option value="icnew">IC No (NEW)</option>
                    <option value="icold">IC No (OLD)</option>
                    <option value="matricno">Matric No</option>
                  <option value="staffno">Staff No</option>
<%                                if (dataSystemStatus2.equals("0")) {

    } else if (dataSystemStatus2.equals("1")) {
        for (int i = 0; i < dataIdType.size(); i++) {%>
 <option value="<%=dataIdType.get(i).get(1)%>"><%=dataIdType.get(i).get(2)%></option>
<%  }
    }

%>
   
</select>
</div>
</div>

Text input
<div class="form-group">
<label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
<div class="col-md-4">
<input type="text" class="form-control input-md" id="idInput" name="idInput" placeholder="ID" maxlength="0"/>
</div>
</div>
<div class="text-center">
<button class="btn btn-primary" type="button" id="searchPatient" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

<button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
</div>
</form>
</div>-->


<div class="row">
    <div class="col-md-12">
        <div class="thumbnail">
            <h4>In-Patient Information</h4>
            <hr/>
            <form class="form-horizontal" name="myForm2" id="myForm2">
                <div class="row">



                    <div class="col-md-6">


                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                            <div class="col-md-4">
                                <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">                        </div>
                        </div>



                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">IC NO</label>
                            <div class="col-md-4">
                                <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                            <div class="col-md-4">
                                <input id="pid" name="pid" type="text" placeholder=""  readonly class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">MRN Number</label>
                            <div class="col-md-4">
                                <input id="MRN" name="MRN" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>



                    <div class="col-md-6">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Name</label>
                            <div class="col-md-4">
                                <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                            <div class="col-md-4">
                                <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>



                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">ID No</label>
                            <div class="col-md-4">
                                <input id="pidno" name="pidno" type="text" readonly placeholder="" class="form-control input-md">
                            </div>
                        </div>

                    </div>

                </div>


                <h4>Registration Information</h4>
                <hr/>

                <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Source</label>
                            <div class="col-md-4">
                                <select id="EliSource" name="EliSource" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Eligibility Source</option>


                                    <%                                        for (int i = 0; i < dataEliCat.size(); i++) {%>
                                    <option value="<%=dataEliCat.get(i).get(2)%>"><%=dataEliCat.get(i).get(2)%></option>
                                    <%  }
                                    %>


                                </select>
                            </div> 
                        </div>


                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Admission type</label>
                            <div class="col-md-4">
                                <select id="AdmissionType" name="selectbasic" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Admission Type</option>


                                    <%                                        for (int i = 0; i < dataAdmit.size(); i++) {%>
                                    <option value="<%=dataAdmit.get(i).get(2)%>"><%=dataAdmit.get(i).get(2)%></option>
                                    <%  }
                                    %>


                                </select>
                            </div> 
                        </div>



                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Referring from</label>
                            <div class="col-md-4">
                                <select id="Refer" name="Refer" class="form-control">
                                    <option value="" selected="" disabled="">Select </option>
                                    <option value="1">1. KLINIK PESAKIT LUAR PAKAR</option>
                                    <option value="2">2. LAIN HOSP. KERAJAAN</option>
                                    <option value="3">3. KLINIK KESIHATAN/JPL</option>
                                    <option value="4">4. PENGAMAL PERUBATAN</option>
                                    <option value="5">5. BERSALIN</option>
                                    <option value="6">6. JABATAN KECEMASAN</option>
                                    <option value="7">9. LAIN-LAIN</option>

                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Document type</label>
                            <div class="col-md-4">
                                <select id="DocType" name="DocType" class="form-control">
                                    <option value="" selected="" disabled="">Select </option>
                                    <%--
                                    <option value="1">1. KLINIK PESAKIT LUAR PAKAR</option>
                                    <option value="2">2. LAIN HOSP. KERAJAAN</option>
                                  
                                    
                                    <%
                                        for (int i = 0; i < dataDiscip.size(); i++) {%>
                                    <option value="<%=dataDiscip.get(i).get(2)%>"><%=dataDiscip.get(i).get(2)%></option>
                                    <%  }
                                    %>
                                    --%>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput"> GL expiry date</label>
                            <div class="col-md-4">
                                <input id="GL" name="GL" type="text" placeholder="Pop-up Calendar" readonly class="form-control input-md">
                            </div>
                        </div>


                    </div>



                    <div class="col-md-6">  
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Eligibility Type</label>
                            <div class="col-md-4">
                                <select id="EliTy" name="EliTy" class="form-control">
                                    <option value="1" selected="" disabled="">Select Eligibility Type</option>



                                    <%
                                        for (int i = 0; i < dataEliType.size(); i++) {%>
                                    <option value="<%=dataEliType.get(i).get(2)%>"><%=dataEliType.get(i).get(2)%></option>
                                    <%  }
                                    %>


                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Admission reason</label>
                            <div class="col-md-4">
                                <input id="AdmissionReason" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Police case</label>
                            <div class="col-md-8">
                                <label class="radio-inline">
                                    <input type="radio" name="PoliceCase" id="PoliceCase1" value="Yes">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="PoliceCase" id="PoliceCase2" value="No">
                                    No
                                </label>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Document no</label>
                            <div class="col-md-4">
                                <input id="DocNo" name="textinput" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>


                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Payer Group</label>
                            <div class="col-md-4">
                                <input id="payer" name="payer" type="text" placeholder="" class="form-control input-md">
                            </div>
                        </div>
                    </div>
                </div>

                <h4>Assign Ward</h4>
                <hr/>
                <div class="row">
                    <div class="col-md-6">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Discipline</label>
                            <div class="col-md-4">
                                <select id="EliSource" name="EliSource" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Discipline</option>

                                    <%
                                        String discip = "select * from adm_lookup_detail where master_reference_code = '0072'   ";
                                        ArrayList<ArrayList<String>> dataDiscip = conn.getData(discip);

                                        int size = dataDiscip.size();

                                        for (int i = 0; i < size; i++) {
                                    %>
                                    <option value="<%= dataDiscip.get(i).get(0)%>"><%= dataDiscip.get(i).get(0)%> </option>
                                    <%
                                        }
                                    %>

                                </select>
                            </div> 
                        </div>


                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
                            <div class="col-md-4">
                                <select id="AdmissionType" name="selectbasic" class="form-control">
                                    <option value="-">-</option>
                                    <option value="null" selected="" disabled="">Select Ward Name</option>

                                    <%
                                        String wname = "select ward_name from wis_ward_name";
                                        ArrayList<ArrayList<String>> dataWardName = conn.getData(wname);

                                        int size1 = dataWardName.size();

                                        for (int i = 0; i < size1; i++) {
                                    %>
                                    <option value="<%= dataWardName.get(i).get(0)%>"><%= dataWardName.get(i).get(0)%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div> 
                        </div>





                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
                            <div class="col-md-4">
                                <input id="Deposit" name="textinput" type="text" placeholder="RM :" class="form-control input-md">
                            </div>
                        </div>


                    </div>



                    <div class="col-md-6">  
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
                            <div class="col-md-4">
                                <select id="EliTy" name="EliTy" class="form-control">
                                    <option value="1" selected="" disabled="">Select Ward Type</option>

                                    <%
                                        String wtype = "select ward_class_code from wis_ward_name";
                                        ArrayList<ArrayList<String>> dataWardType = conn.getData(wtype);

                                        int size2 = dataWardType.size();

                                        for (int i = 0; i < size2; i++) {
                                    %>
                                    <option value="<%= dataWardType.get(i).get(0)%>"><%= dataWardType.get(i).get(0)%> </option>
                                    <%
                                        }
                                    %>


                                </select>
                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
                            <div class="col-md-4">
                                <input id="BedIDReg" name="textinput" type="text" placeholder="Bed ID" readonly class="form-control input-md">
                                </br>


                                <!--                                <button type="button" class="btn btn-default" onclick="load()" id="listbed">List Bed</button>-->
                            </div>
                        </div>

                    </div>
                </div>
                <!-- List of Bed -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div>
                            <%@include file = "bed.jsp" %>
                        </div>
                    </div>
                </div>
                <!-- List of Bed -->


                <div class="text-center">
                    <button class="btn btn-primary " type="button" id="registerQueue"><i class="fa fa-floppy-o "></i> Register</button>
                    <button class="btn btn-default " type="button" id="btnclear" name="btnclear" > <i class="fa fa-ban "></i>&nbsp; Clear</button>
                </div>


            </form>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
<!-- main -->		

</div>



<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://www.w3schools.com/lib/w3data.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>-->


<script src="old/assets/js/bootbox.min.js"></script>

<script>

    //load appointment modal into the registration page
//            $("#headerindex").load("libraries/header.html");
//            $("#topmenuindex").load("libraries/topMenus.html");
//            $("#sidemenus").load("libraries/sideMenus.jsp");



//
//    function load() {
//        $("#listbed").load('bed.jsp');
//    }


//
//    $(function () {
//        $('#listbed').on('click', function (e) {
//            e.preventDefault();
//            $("#content").load(this.id + "bed.jsp");
//        });
//    });

    $("#GL").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy'
    });

    var $body = $('body');
    var yyyyMMddHHmmss;
    var HHmmss;
    var yyyyMMdd;
    var ddMMyyyy;
    var tahun, bulan, hari, ICbday;
    //function get birth date

    function getBday(x) {


        if (x.length === 12) {
            tahun = x.substr(0, 2);
            bulan = x.substr(2, 2);
            hari = x.substr(4, 2);
            if (tahun >= 00 && tahun < 50)
            {

                //                    ICbday = "20" + tahun + "-" + bulan + "-" + hari;
                ICbday = hari + "-" + bulan + "-" + "20" + tahun;
            } else
            {
                //                    ICbday = "19" + tahun + "-" + bulan + "-" + hari;
                ICbday = hari + "-" + bulan + "-" + "19" + tahun;
            }
        }

    }

    //function to get date 
    function getDateNow() {
        //yyyy-MM-dd HH:mm:ss
        var nowDate = new Date();
        var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;
        //months
        var month = (nowDate.getMonth() + 1);
        if (month < 10) {
            ZeroMonth = "0" + month;
        } else {
            ZeroMonth = month;
        }

        //days
        var day = (nowDate.getDate());
        if (day < 10) {
            ZeroDay = "0" + day;
        } else {
            ZeroDay = day;
        }

        //years
        var year = (nowDate.getFullYear());
        //hours
        var hours = nowDate.getHours();
        //minutes
        var minutes = nowDate.getMinutes();
        if (minutes < 10) {
            ZeroMinutes = "0" + minutes;
        } else {
            ZeroMinutes = minutes;
        }
        //seconds
        var seconds = nowDate.getSeconds();
        if (seconds < 10) {
            ZeroSeconds = "0" + seconds;
        } else {
            ZeroSeconds = seconds;
        }
        //complete day
        yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
        ddMMyyyy = ZeroDay + "-" + ZeroMonth + "-" + year;
    }

    //register patient
    $('#registerQueue').click(function () {
        getDateNow();
        setInterval(getDateNow, 1000);
        if ($('#pmino').val() === " " || $('#pmino').val() === "") {
            bootbox.alert('Please use a proper PMI no.');
        } else {
            //var r = confirm("Are you sure want to REGISTER PATIENT?");


            var pmino, poic, pid, MRN, pname, pnic, pidno,
                    EliSource, AdmissionType, Refer, DocType, GL, EliTy, AdmissionReason, PoliceCase, DocNo, payer,
                    Dis, wname, Deposit, WardType, BedID,
                    guardInd, referNo, referHfc, referDis, gruGuard, epiTime, epiDate, stat, hfc;
            pmino = $('#pmino').val();
            epiDate = yyyyMMddHHmmss;
            poic = $('input[id=poic]').val();
            pid = $('input[id=pid]').val();
            MRN = $('input[id=MRN]').val();
            pname = $('input[id=pname]').val();
            pnic = $('input[id=pnic]').val();
            pidno = $('input[id=pidno]').val();
            EliSource = $('#EliSource').val();
            AdmissionType = $('#AdmissionType').val();
            Refer = $('#Refer').val();
            DocType = $('#DocType').val();
            GL = $('#GL').val();
            if ($('#EliTy').val() === null) {
                EliTy = "-";
            } else {
                EliTy = $('#EliTy').val();
            }
            AdmissionReason = $('#AdmissionReason').val();
            PoliceCase = $('input[name="PoliceCase"]:checked').val();
            DocNo = $('#DocNo').val();
            payer = $('#payer').val();
            Dis = $('#Dis').val();
            wname = $('#wname').val();
            Deposit = $('#Deposit').val();
            WardType = $('#WardType').val();
            BedID = $('#BedID').val();
            guardInd = "-";
            referHfc = "-";
            referDis = "-";
            referNo = "-";
            gruGuard = "-";
            epiTime = HHmmss;
            stat = "0";
            //hfc amik kat session
            hfc = $('#sessionHfc').val();
            var datas = {'pmino': pmino,
                'epiDate': epiDate,
                'poic': poic,
                'pid': pid,
                'MRN': MRN,
                'pname': pname,
                'pnic': pnic,
                'pidno': pidno,
                'EliSource': EliSource,
                'AdmissionType': AdmissionType,
                'Refer': Refer,
                'DocType': DocType,
                'GL': GL,
                'EliTy': EliTy,
                'AdmissionReason': AdmissionReason,
                'PoliceCase': PoliceCase,
                'DocNo': DocNo,
                'payer': payer,
                'Dis': Dis,
                'wname': wname,
                'Deposit': Deposit,
                'WardType': WardType,
                'BedID': BedID,
                'guardInd': guardInd,
                'referNo': referNo,
                'referHfc': referHfc,
                'referDis': referDis,
                'gruGuard': gruGuard,
                'epiTime': epiTime,
                'stat': stat,
                'hfc': hfc,
                'now': yyyyMMdd

            };
            //console.log(datas);
            bootbox.confirm({
                message: "Are you sure want to REGISTER PATIENT?",
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
                    //if true go to PMI page
                    if (result === true) {
                        $body.addClass("loading");
                        $.ajax({
                            type: "POST",
                            url: "registerqueue.jsp",
                            data: datas, // Send input
                            timeout: 3000,
                            success: function (list) {
                                console.log(list);
                                $body.removeClass("loading");
                                if ($.trim(list) === "Success") {

                                    bootbox.alert("Patient has been register successfully");
                                } else if ($.trim(list) === "already") {
                                    bootbox.alert("Patient is already registered");
                                }
                            }, error: function () {
                                bootbox.alert("There is an error!");
                            }
                        });
                    }
                }
            });
        }


    });
    //event on click clear buton
    $('#btnclear').click(function () {
        $('#myForm2')[0].reset();
    });


</script>   
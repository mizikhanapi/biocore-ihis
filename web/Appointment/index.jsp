<%--
    Document   : index
    Created on : Sep 6, 2017, 11:28:40 AM
    Author     : -D-
--%>


<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%-- <%@page buffer="1000kb" autoFlush="false" %> --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="header.jsp"%>
    <%@include file="assets/header.html"%>
    <%    //String user_type = (String) session.getAttribute("USER_TYPE");
        String user_type = session.getAttribute("USER_TYPE") == null ? "-" : (String) session.getAttribute("USER_TYPE");
        if (user_type.equals("PUBLIC")) {
            String P_NAME = (String) session.getAttribute("USER_NAME");
            String PMI_NO = (String) session.getAttribute("PMI_NO");
            String P_EMAIL = (String) session.getAttribute("EMAIL");
            String P_MOBILE_PHONE = (String) session.getAttribute("MOBILE_PHONE");

    %>
    <body>
        <jsp:include page="main/SideMenuPatient.jsp"/>
        <div class="main" style="background: #f2f4f8;">

            <jsp:include page="main/TopMenu.jsp"/>

            <div class="container-fluid">


                <div class="row">
                    <div class="col-md-12 bodyContent">
                        <div class="thumbnail">
                            <div class="tab-content">
                                <div id="home" class="tab-pane ">
                                    <jsp:include page="main/home.jsp"/>
                                </div>
                                <div id="viewholiday" class="tab-pane fade">
                                    <jsp:include page="main/ViewHoliday.jsp"/>

                                </div>
                                <div id="viewclinicday" class="tab-pane">
                                    <jsp:include page="main/ViewClinicDay.jsp"/>
                                </div>
                                <div id="doctorDirectory" class="tab-pane fade">
                                    <jsp:include page="main/DoctorAvailability.jsp"/>
                                </div>
                                <div id="addAppointment" class="tab-pane active " >
                                    <jsp:include page="main/MakeAppointment.jsp"/>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 footer " >
                    Copyright &copy; BIOCORE 2016
                </div>
            </div>

        </div>
        <%        }// ---------------- end if user is PUBLIC
        else {

            Conn Conn = new Conn();
            String discipline_name = null;
            String subdiscipline_name = null;
            String username = (String) session.getAttribute("USER_ID");
            String my_1_gamba = session.getAttribute("PICTURE").toString();

            String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
            String hfc_name = (String) session.getAttribute("HFC_NAME");
            String name = (String) session.getAttribute("USER_NAME");
            String title = (String) session.getAttribute("OCCUPATION_CODE");
            String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
            String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

            String discipline_name_sql = "SELECT discipline_name FROM adm_discipline WHERE discipline_cd = '" + discipline + "' AND discipline_hfc_cd = '" + hfc + "';";
            ArrayList<ArrayList<String>> discipline_name_AL = Conn.getData(discipline_name_sql);
            discipline_name = discipline_name_AL.get(0).get(0);
            String subdiscipline_name_sql = "SELECT subdiscipline_name FROM adm_subdiscipline WHERE subdiscipline_hfc_cd = '" + hfc + "' AND discipline_cd = '" + discipline + "' AND subdiscipline_cd = '" + subdiscipline + "'";
            ArrayList<ArrayList<String>> subdiscipline_name_AL = Conn.getData(subdiscipline_name_sql);
            subdiscipline_name = subdiscipline_name_AL.get(0).get(0);

        %>
    <body>
        <jsp:include page="main/SideMenu.jsp"/>
        <!-- main -->
        <div class="main" style="background: #f2f4f8;">

            <jsp:include page="main/TopMenu.jsp" flush="true"/>

            <div class="container-fluid">


                <div class="row">
                    <div class="col-md-12 bodyContent">
                        <div class="thumbnail">
                            <div class="tab-content">

                                <div id="home" class="tab-pane active">
                                    <jsp:include page="main/home.jsp" flush="true"/>
                                </div>

                                <div id="maintainholiday" class="tab-pane fade" >
                                    <jsp:include page="main/MaintainHoliday.jsp" flush="true"/>

                                </div>
                                <div id="viewholiday" class="tab-pane fade">
                                    <jsp:include page="main/ViewHoliday.jsp"/>

                                </div>
                                <div id="maintainclinicday" class="tab-pane fade">
                                    <jsp:include page="main/MaintainClinicDay.jsp"/>
                                </div>
                                <div id="viewclinicday" class="tab-pane">
                                    <jsp:include page="main/ViewClinicDay.jsp"/>
                                </div>
                                <div id="maintainroster" class="tab-pane fade">
                                    <jsp:include page="main/MaintainRoster.jsp"/>
                                </div>
                                <div id="viewroster" class="tab-pane fade ">
                                    <jsp:include page="main/ViewRoster.jsp"/>
                                </div>
                                <div id="maintainleave" class="tab-pane fade">
                                    <jsp:include page="main/MaintainLeave.jsp"/>
                                </div>
                                <div id="viewleave" class="tab-pane fade">
                                    <jsp:include page="main/ApplyLeave.jsp"/>
                                </div>
                                <div id="doctorDirectory" class="tab-pane fade">
                                    <jsp:include page="main/DoctorAvailability.jsp"/>
                                </div>
                                <div id="addAppointment" class="tab-pane fade" >
                                    <jsp:include page="main/MakeAppointment.jsp"/>
                                </div>
                                <div id="manageAppointment" class="tab-pane fade" >
                                    <jsp:include page="main/ManageAppointment.jsp"/>
                                </div>
                                <div id="maintainShift" class="tab-pane fade" >
                                    <jsp:include page="main/MaintainShift.jsp"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12 footer " >
                    Copyright &copy; BIOCORE 2016
                </div>
            </div>

        </div>

        <%            }//-------------- end else if user not public
%>


        <!--        End of div container-fluid-->
        <script type="text/javascript">
            //dataTable plugin
            $.fn.dataTable.moment('DD/MM/YYYY');
            $.fn.dataTable.moment('DD-MM-YYYY');
            $.fn.dataTable.moment('dddd');
            function holidayEmptyField() {
                $('#state').val('');
                $('#startdate').val('');
                $('#desc').val('');
                $('#appTo').val('');
            }

            function selectHFC(data) {
                $.ajax({
                    url: 'adminGetUpdateHFC.jsp',
                    method: 'post',
                    timeout: 10000,
                    data: data,
                    success: function (result) {
                        document.getElementById("hfc_codeC").innerHTML = result;
                        console.log($('#hfc_codeC').val());
                    },
                    error: function (err) {
                        console.log("d");
                    }
                });
            }

            function initDataTable(tableName) {
                $('#' + tableName).dataTable({destroy: true});
                $('#' + tableName).DataTable();
            }

            $(document).ready(function () {


//                $('#startTimeRoster').ptTimeSelect();
//                $('#endTimeRoster').ptTimeSelect();

                //initialise data table
                initDataTable("tableViewClinicDay");
                initDataTable("rosterTable");
                initDataTable("viewRosterTable");
                initDataTable("maintainStaffLeave");
                

                $('#startdateC').ptTimeSelect();
                $('#enddateC').ptTimeSelect();

                $('#updateBtn').prop('disabled', true);
                $('#updateClinicDay').prop('disabled', true);
                $('#updateRoster').prop('disabled', true);

                $(function () {
                    $('#startdate').datepicker({dateFormat: 'dd/mm/yy'});
                });

                $(function () {
                    $('#datepicker').datepicker({dateFormat: 'dd/mm/yy'});
                });

                $(function () {
                    $('#startDateRoster').datepicker({dateFormat: 'dd/mm/yy'});
                });

                $(function () {
                    $('#endDateRoster').datepicker({dateFormat: 'dd/mm/yy'});
                });

                $(function () {
                    $('#dateDoctorA').datepicker({dateFormat: 'dd/mm/yy'});
                });

                $(function () {
                    $('#startDateLeave').datepicker({dateFormat: 'dd/mm/yy'});
                });

                $(function () {
                    $('#endDateLeave').datepicker({dateFormat: 'dd/mm/yy'});
                });

                $(function () {
                    $('#searchAppointmentDate').datepicker({dateFormat: 'dd/mm/yy'});
                });


                $('#maintainStaffLeaveDiv').on('click', '.notApprove-leave', function (e) {
                    e.preventDefault();
                    var idBtn = $(this).get(0).id;
                    idBtn = idBtn.split("|");
                    var dataStaffLeave = $('#dataStaffLeave' + idBtn[1]).val();
                    dataStaffLeave = dataStaffLeave.split("|");
                    var dataStaffAjax = {
                        hfcCode: dataStaffLeave[0],
                        userId: dataStaffLeave[1],
                        leaveDate: dataStaffLeave[2]
                    };
                    console.log(dataStaffAjax);
                    $.ajax({
                        url: 'updateLeaveNotApprove.jsp',
                        method: 'post',
                        data: dataStaffAjax,
                        timeout: 10000,
                        success: function (result) {
                            if (result.trim() === 'success') {
                                $('#maintainStaffLeaveDiv').load('main/MaintainLeave.jsp #maintainStaffLeave', function(){
                                    initDataTable("maintainStaffLeave");
                                });
                                alert('Successfully disapproved this staff leave application');
                            } else if (result.trim() === 'notallow') {
                                alert('You are not allow to disapprove leave for yourself as you are admin. Please ask other admin to do so');
                            } else if (result.trim() === 'nodata') {
                                alert('Data not exist');
                            } else {
                                alert('error ajax');
                            }
                            console.log(result);
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                });

                $('#cancelLeave').click(function (e) {
                    e.preventDefault();
                    $('#startDateLeave').val('');
                    $('#endDateLeave').val('');
                    $('#descLeave').val('');
                });

                $('#maintainStaffLeaveDiv').on('click', '.approve-leave', function (e) {
                    e.preventDefault();
                    var idbtn = $(this).get(0).id;
                    idbtn = idbtn.split('|');

                    var dataStaffLeave = $('#dataStaffLeave' + idbtn[1]).val();
                    dataStaffLeave = dataStaffLeave.split('|');

                    var dataLeaveAjax = {
                        hfcCode: dataStaffLeave[0],
                        userId: dataStaffLeave[1],
                        dateLeave: dataStaffLeave[2]
                    };
                    $.ajax({
                        url: 'updateLeaveApprove.jsp',
                        method: 'post',
                        data: dataLeaveAjax,
                        timeout: 10000,
                        success: function (result) {
                            if (result.trim() === 'success') {
                                alert('Successfully approved this staff leave application');
                                $('#maintainStaffLeaveDiv').load('main/MaintainLeave.jsp #maintainStaffLeave', function(){
                                    initDataTable("maintainStaffLeave");
                                });
                            } else if (result.trim() === 'nodata') {
                                alert('data not exist');
                            } else if (result.trim() === 'notallow') {
                                alert('You are not allow to approve leave for yourself as you are admin. Please ask other admin to do so');
                            } else {
                                alert('err');
                                console.log(result.trim());
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });

                });





                $('#cancelClinicDay').click(function (e) {
                    e.preventDefault();
                    $('#updateClinicDay').prop('disabled', true);
                    $('#addClinicDay').prop('disabled', false);

//                    $('#state_').val('');
//                    $('#hfc_codeC').val('');
                    $('#hfcBefore').val('');
                    $('#discipline').val('');
                    $('#disciplineBefore').val('');
                    $('#subdisciplineBefore').val('');
                    $('#subdiscipline').val('');
                    $('#clinicDay').val('');
                    $('#dayBefore').val('');
                    $('#startdateC').val('');
                    $('#enddateC').val('');
                    $('#status').val('');
                });

                $('#updateClinicDay').click(function (e) {
                    e.preventDefault();


                    var _state = $('#state_').val();
                    var _hfc = $('#hfc_codeC').val();
                    var _hfcBefore = $('#hfcBefore').val();
                    var _discipline = $('#discipline').val();
                    var _disBefore = $('#disciplineBefore').val();
                    var _subdisBefore = $('#subdisciplineBefore').val();
                    var _subdiscipline = $('#subdiscipline').val();
                    var _clinicDay = $('#clinicDay').val();
                    var _dayBefore = $('#dayBefore').val();
                    var _starttime = starttimeClinic;
                    var _endtime = endtimeClinic;
                    var _status = $('#status').val();

                    if (_state === "") {
                        alert("Please select state");
                    } else if (_hfc === "") {
                        alert("Please select hfc");
                    } else if (_discipline === "") {
                        alert("Please select discipline");
                    } else if (_subdiscipline === "") {
                        alert("Please select subdiscipline");
                    } else if (_clinicDay === "") {
                        alert("Please select clinic day");
                    } else if ($('#startdateC').val() === "") {
                        alert("Please select start time");
                    } else if ($('#enddateC').val() === "") {
                        alert("Please select end time");
                    } else if (_status === "") {
                        alert("Please select clinic status");
                    } else {
                        var starttimeClinic = ConvertTimeformat('24', $('#startdateC').val());
                        var endtimeClinic = ConvertTimeformat('24', $('#enddateC').val());
                        var uClinicData = {
                            state: _state,
                            hfcCode: _hfc,
                            hfcBefore: _hfcBefore,
                            discipline: _discipline,
                            disciplineBefore: _disBefore,
                            subdiscipline: _subdiscipline,
                            subdisciplineBefore: _subdisBefore,
                            clinicDay: _clinicDay,
                            starttime: starttimeClinic,
                            endtime: endtimeClinic,
                            daybefore: _dayBefore,
                            status: _status
                        };

                        console.log(uClinicData);

                        $.ajax({
                            url: 'updateClinicDayAjax.jsp',
                            method: 'post',
                            data: uClinicData,
                            timeout: 10000,
                            success: function (result) {
                                console.log(result);
                                if (result.trim() === 'success') {
                                    alert('Clinic day updated');
                                    $('#clinicDayTableDiv').load('index.jsp #clinicDayTable', function () {
                                        initDataTable("clinicDayTable");
                                    });
                                    $('#tableViewClinicDayDiv').load("main/ViewClinicDay.jsp #tableViewClinicDay", function(){
                                        initDataTable("tableViewClinicDay");
                                    });
                                    $('#cancelClinicDay').click();
                                } else {
                                    alert('Error');
                                }
                            }
                        });
                    }



                });

                $('#clinicDayTableDiv').on('click', '.clinic-editBtn', function (e) {

                    e.preventDefault();
                    $('#updateClinicDay').prop('disabled', false);
                    $('#addClinicDay').prop('disabled', true);

                    $('html,body').animate({
                        scrollTop: $("#maintainclinicday").offset().top
                    }, 500);

                    var idName = $(this).get(0).id;
                    var id = idName.split("|");
                    var dataCA = $('#clinicData' + id[1]).val();
                    var dataArry = dataCA.split("|");
                    console.log(dataArry);


//                    $('#state_  option').filter(function () {
//                        return ($(this).text() === dataArry[0]); //To select Blue
//                    }).prop('selected', true);

//                    showUser();
//
//                    var hfcData = {
//                        state: $('#state_').val(),
//                        hfcName: dataArry[1]
//                    };

                    //selectHFC(hfcData);


                    $('#discipline  option').filter(function () {
                        return ($(this).text() === dataArry[2]); //To select Blue
                    }).prop('selected', true);

                    $('#subdiscipline  option').filter(function () {
                        return ($(this).text() === dataArry[3]); //To select Blue
                    }).prop('selected', true);

                    var startTime = ConvertTimeformat12('12', dataArry[5]);
                    var endTime = ConvertTimeformat12('12', dataArry[6]);

                    $('#clinicDay').val(dataArry[4]);
                    $('#startdateC').val(startTime);
                    $('#enddateC').val(endTime);
                    $('#status').val(dataArry[7]);

                    $('#hfcBefore').val(dataArry[1]);
                    $('#disciplineBefore').val(dataArry[2]);
                    $('#subdisciplineBefore').val(dataArry[3]);
                    $('#dayBefore').val(dataArry[4]);

                });

                $('#addClinicDay').click(function (e) {
                    e.preventDefault();


                    var _state = $('#state_').val();
                    var _hfc = $('#hfc_codeC').val();
                    var _discipline = $('#discipline').val();
                    var _subdiscipline = $('#subdiscipline').val();
                    var _clinicDay = $('#clinicDay').val();
                    var _startTime = starttimeClinic;
                    var _endTime = endtimeClinic;
                    var _clinicStatus = $('#status').val();

                    if (_state === "") {
                        alert("Please select state");
                    } else if (_hfc === "") {
                        alert("Please select hfc");
                    } else if (_discipline === "") {
                        alert("Please select discipline");
                    } else if (_subdiscipline === "") {
                        alert("Please select subdiscipline");
                    } else if (_clinicDay === "") {
                        alert("Please select clinic day");
                    } else if ($('#startdateC').val() === "") {
                        alert("Please select start time");
                    } else if ($('#enddateC').val() === "") {
                        alert("Please select end time");
                    } else if (_clinicStatus === "") {
                        alert("Please select clinic status");
                    } else {
                        var starttimeClinic = ConvertTimeformat('24', $('#startdateC').val());
                        var endtimeClinic = ConvertTimeformat('24', $('#enddateC').val());
                        var dataC = {
                            state: _state,
                            hfc: _hfc,
                            discipline: _discipline,
                            subdiscipline: _subdiscipline,
                            clinic: _clinicDay,
                            startTime: starttimeClinic,
                            endTime: endtimeClinic,
                            status: _clinicStatus
                        };
                        console.log(dataC);
                        $.ajax({
                            url: 'addClinicDay.jsp',
                            method: 'post',
                            timeout: 10000,
                            data: dataC,
                            dataType: 'json',
                            success: function (result) {
//                                var resultTrim = result.replace(";", "");
//                                var response = resultTrim.trim();
                                if (result.valid) {
                                    alert('Clinic Day added');
                                    $('#clinicDayTableDiv').load('main/MaintainClinicDay.jsp #clinicDayTable', function () {
                                        $('#clinicDayTable').dataTable({destroy: true});
                                        $('#clinicDayTable').DataTable();
                                    });
                                    $('#tableViewClinicDayDiv').load("main/ViewClinicDay.jsp #tableViewClinicDay", function(){
                                        initDataTable("tableViewClinicDay");
                                    });
                                    $('#state_').val('');
                                    $('#hfc_codeC').val('');
                                    $('#hfcBefore').val('');
                                    $('#discipline').val('');
                                    $('#disciplineBefore').val('');
                                    $('#subdisciplineBefore').val('');
                                    $('#subdiscipline').val('');
                                    $('#clinicDay').val('');
                                    $('#dayBefore').val('');
                                    $('#startdateC').val('');
                                    $('#enddateC').val('');
                                    $('#status').val('');
                                } else {
                                    alert(result.msg);
                                    //console.log(response);
                                }
                            },
                            error: function (jsd, ksjs, err) {
                                alert("Error: " + err);
                            }
                        });

                    }


                });



                $('#holidayTableDiv').on('click', '.editBtn', function () {
                    $('#updateBtn').prop('disabled', false);
                    $('html, body').animate({
                        scrollTop: $("#maintainholiday").offset().top
                    }, 500);

                    var idName = $(this).get(0).id;
                    var id = idName.split("|");
                    console.log(id);

                    var data = $('#holidayData' + id[1]).val();
                    var dataArry = data.split("|");
                    console.log(dataArry);

                    var dateConvert = dataArry[1].split(' ');
                    dateConvert = dateConvert[0].split('-');
                    dateConvert = dateConvert[2] + "/" + dateConvert[1] + "/" + dateConvert[0];

                    $('#state').val(dataArry[0]);
                    $('#stateBefore').val(dataArry[0]);
                    $('#startdate').val(dateConvert);
                    $('#dateBefore').val(dataArry[1]);
                    $('#desc').val(dataArry[2]);
                    $('#appTo').val(dataArry[3]);
                    $('#holidayStatus').val(dataArry[4]);
                    $('#addHoliday').prop('disabled', true);
                });

                $('#updateBtn').click(function (e) {
                    e.preventDefault();

                    var _uState = $('#state').val();
                    var _uStateBefore = $('#stateBefore').val();
                    var _uDate = $('#startdate').datepicker().val();
                    var _uDesc = $('#desc').val();
                    var _uAppTo = $('#appTo').val();
                    var _uStatus = $('#holidayStatus').val();
                    var _uDateBefore = $('#dateBefore').val();
                    var _uDateArr = [];
                  
                    
                    var okey = true;
                    var errMsg = "";
                    if(_uState === "" || _uState == null){
                        okey = false;
                        errMsg = "Please select the state!";
                    }
                    else if(_uDesc==="" || _uDesc == null){
                        okey = false;
                        errMsg = "Please type some description!";
                    }
                    else if(_uDate==="" || _uDate == null){
                        okey = false;
                        errMsg = "Please pick the date!";
                    }
                    else if(_uAppTo==="" || _uAppTo == null){
                        okey = false;
                        errMsg = "Please select where the holiday applicable to!";
                    }
                    else if(_uStatus ==="" || _uStatus == null){
                        okey = false;
                        errMsg = "Please select the holiday status!";
                    }
                    
                    if(!okey){
                        alert(errMsg);
                        return;
                    }
                    
                    _uDateArr = _uDate.split('/');
                    _uDate = _uDateArr[2] + "-" + _uDateArr[1] + "-" + _uDateArr[0];

                    var _upData = {
                        state: _uState,
                        stateBefore: _uStateBefore,
                        dateBefore: _uDateBefore,
                        date: _uDate,
                        desc: _uDesc,
                        appTo: _uAppTo,
                        status: _uStatus
                    };

                    $.ajax({
                        url: 'updateHoliday.jsp',
                        type: 'post',
                        data: _upData,
                        timeout: 10000,
                        success: function (result) {
                            var resultTrim = result.replace(";", "");
                            var response = resultTrim.trim();
                            if (response === 'success') {
                                alert('Holiday has successful update');
                                $('#holidayTableDiv').load('index.jsp #holidayTable', function () {
                                    $('#holidayTable').dataTable({destroy: true});
                                    $('#holidayTable').DataTable();
                                });
                                $('#viewHoliday').load('index.jsp #viewHoliday');
                            } else if (response === 'fail') {
                                alert('Update holiday fail due to the holiday data does not exist');
                            } else if (response === 'notSuccess') {
                                alert('Error occur, Holiday not be update');
                            }
                        },
                        error: function (err) {
                            alert('error');
                        }
                    });
                });

                $('#cancelBtn').click(function (e) {
                    e.preventDefault();
                    holidayEmptyField();
                    $('#addHoliday').prop('disabled', false);
                    $('#updateBtn').prop('disabled', true);
                });

                $('#addHoliday').click(function (e) {
                    e.preventDefault();
                    var _state = $('#state').val();
                    var _date = $('#startdate').datepicker().val();
                    var _desc = $('#desc').val();
                    var _appTo = $('#appTo').val();

                    if (_state === "") {
                        alert("Please select the state");
                    } else if (_date === "") {
                        alert("Please select the holiday date");
                    } else if (_desc === "") {
                        alert("Please select the description");
                    } else if (_appTo === "") {
                        alert("Please select the applicable to");
                    } else {
                        _date = _date.split('/');
                        _date = _date[2] + "-" + _date[1] + "-" + _date[0];

                        var data = {
                            state: _state,
                            date: _date,
                            desc: _desc,
                            appTo: _appTo
                        };

                        $.ajax({
                            url: 'addHolidayAjax.jsp',
                            type: 'post',
                            data: data,
                            cache: false,
                            timeout: 10000,
                            success: function (result) {
                                console.log(result);
                                result = result.trim();
                                if (result === "success") {
                                    alert('Holiday successful added');
                                    $('#holidayTableDiv').load('index.jsp #holidayTable', function () {
                                        $('#holidayTable').dataTable({destroy: true});
                                        $('#holidayTable').DataTable();
                                    });
                                    $('#viewHoliday').load('index.jsp #viewHoliday');
                                    $('#state').val("");
                                    $('#startdate').datepicker().val("");
                                    $('#desc').val("");
                                    $('#appTo').val("");

                                } else if (result === "error")
                                {
                                    alert('The Holiday already added');
                                } else {
                                    alert(result);
                                }
                            },
                            error: function (err) {
                                console.log(err);
                            }
                        });
                    }


                });



            });


        </script>
    </body>
</html>

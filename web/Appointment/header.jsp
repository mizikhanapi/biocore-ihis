<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<head>
        <title>e-Appointment</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet' href='calender/fullcalendar/fullcalendar.css' />
        <script src="bootstrap-3.3.6-dist/js/jquery.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
        <link href="authenticate.css" rel="stylesheet" type="text/css" />
        
        <link rel="stylesheet" href="js/jquery-ui.css">
        
        <script src="js/jquery-ui.js"></script>
        
        <link rel="stylesheet" type="text/css" href="js/jquery.ptTimeSelect.css"> 
        <script type="text/javascript" src="js/jquery.ptTimeSelect.js"></script> 

        <script src="js/24hourTime.js"></script>
        <script src="js/jquery.bootpag.js"></script>
        <script src="js/login.js"></script>
        <script src="js/passwordValidation.js"></script>
        <script src="js/onKeyPress.js"></script>
        <script src="js/allowAlphabet.js"></script>
 
        

        <script src='calender/fullcalendar/lib/moment.min.js'></script>
        <script src='calender/fullcalendar/fullcalendar.js'></script>

        <script src="SearchFacility/SearchFacility.js" type="text/javascript"></script>
        <script src="assets/js/jquery.flexdatalist.min.js" type="text/javascript"></script>
        <script src="js/jquery.datetimepicker.full.js" type="text/javascript"></script>
        
        
        
        
        <script src="jsfile/ViewHoliday.js"></script> 
        <script src="jsfile/SearchPatient.js"></script>       
        <script src="jsfile/ApplyLeave.js"></script>    
        <script src="jsfile/ViewAppointment.js"></script> 
        <script src="jsfile/CancelAppointment.js"></script>
        <script src="jsfile/DoctorAvaibility.js"></script>
        <script src="jsfile/ManageAppointmentDuration.js"></script>
        
        <%
        Config.getFile_url(session);
        Conn co = new Conn();
        %>

        <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
        
        <!--for calendar js-->
<!--        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>-->
        <!--<script src="js/datepicker.js"></script>-->
</head>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page session="true" %>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
%>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <meta http-equiv="refresh" content="20; URL=HIS070004.jsp">-->
        
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../assets/css/jquery-ui.css"/>
        <!-- header -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery-ui.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>

        <!--    <input type="text" id="test">-->



        <div class="container-fluid">
            <div class="row" id="load_tweets">       
                <!-- menu side -->
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side --> 

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.jsp" %>
                    <!-- menu top -->

                    <div class="row">
                        <div class="col-md-12">
                            <h4>Bed Booking Master Summary</h4>
                            <div class="row margin-bottom-30px">
                                <div class="col-md-12">

                                    <div class="pull-right">
                                        <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;Available</span> 

                                        <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;Occupied</span>
                                    </div>
                                </div>
                            </div>
                            <div id="BedRemarks">
                                <%//@include file = "BedRemarks.jsp" %>
                            </div>
                            <hr />
                            <div id="bedsummary">
                                <%//@include file = "bedsum.jsp" %>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <!-- main -->		
        </div>


        <script type="text/javascript">
            $(document).ready(function () {
                //        var auto_refresh = setInterval(
                //                function ()
                //                {
                //                    $('#load_tweets').load('HIS070004.jsp').fadeIn("slow");
                //                }, 10000); // refresh every 10000 milliseconds
                //
                //      $.ajax({
                //            url: "BedRemarks.jsp",
                //            type: 'GET',
                //            timeout: 60000,
                //            success: function (data) {
                //                $('#wardTable').html($(data).find('#wardTable').html());
                //            }
                //        });
                //
                //        $.ajax({
                //            url: "bedsummary.jsp",
                //            type: 'GET',
                //            timeout: 60000,
                //            success: function (data) {
                //                $('#wardTable').html($(data).find('#wardTable').html());
                //            }
                //        });

                //    setTimeout(function () { 
                //      location.reload();
                //    }, 60 * 1000);
//                $('#BedRemarks').load('BedRemarks.jsp');
//                $('#bedsummary').load('bedsummary.jsp');



                function loadlink() {
                    $('#BedRemarks').load('BedRemarks.jsp', function () {
                        //$(this).unwrap();
                    });
                }

                loadlink(); // This will run on page load
                setInterval(function () {
                    loadlink(); // this will run after every 15 seconds
                }, 15000);

                function loadlink2() {
                    $('#bedsummary').load('bedsummary.jsp', function () {
                        //$(this).unwrap();
                    });
                }

                loadlink2(); // This will run on page load
                setInterval(function () {
                    loadlink2(); // this will run after every 15 seconds
                }, 15000);



            });
        </script>
                <script>
                        $('#ADTPageSix').addClass('active');
        </script>
    </body>
</html>


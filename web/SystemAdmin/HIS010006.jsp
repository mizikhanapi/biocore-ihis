<%-- 
    Document   : HIS010006
    Created on : Jun 7, 2017, 2:23:23 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>



<%@include file="validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Settings</title>
        <!-- header -->
        <!--    <div w3-include-html="libraries/header.html"></div>-->
        <!--        <script src="bootstrap-3.3.6-dist/js/jquery.min.js"></script>-->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file="../assets/header.html"%>
        <!--        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
                <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">-->
        <link rel="stylesheet" href="css/table.css">
        <!--<link rel="stylesheet" href="../assets/css/mystyles.css">-->

        <!-- Bootstrap core JavaScript
      ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap core JavaScript
        ================================================== -->


        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		

                <%@include file="libraries/sideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->	

                <div class="main" style="background: #f2f4f8;">
                    <%@include file="libraries/topMenus.jsp" %>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Settings</h3>
                                <hr class="pemisah" />
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#HM_tab1" data-toggle="tab">
                                                    CIS Setting </a>
                                            </li>

                                            <li>
                                                <a href="#HM_tab2" data-toggle="tab">
                                                    PMS Setting </a>
                                            </li>
                                            <li>
                                                <a href="#HM_tab3" data-toggle="tab">
                                                    Calling System Setting </a>
                                            </li>


                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="HM_tab1">

                                                <div id="CIS">

                                                    <div id="CISMain">
                                                    </div>


                                                </div>

                                            </div>

                                            <div class="tab-pane" id="HM_tab2">

                                                <div id="PMS">
                                                    <div id="PMSMain">
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="tab-pane" id="HM_tab3">

                                                <div id="CS">
                                                    <div id="CSMain">
                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!-- Tab Menu -->


                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <!-- main -->		

        </div>

        <%@include file="libraries/footLibrary.jsp" %>

        <script type="text/javascript" src="../assets/js/rd.jquery.preventKey.js"></script>


        <script>

            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");
                $('.modal').css("overflow", "auto");
            });



            $("#CISMain").load("setting/setting_CIS.jsp");


            $("#PMSMain").load("setting/setting_PMS.jsp");
            $("#CSMain").load("setting/setting_CS.jsp");






        </script>

    </body>
</html>


<%-- 
    Document   : HIS190004
    Created on : Jul 26, 2017, 3:12:45 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>


<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | OT Billing</title>
        <!-- header -->
        <%@include file = "libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/SideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/TopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">
                                <h3 style="margin: 0px;">Post to Bill</h3>
                                <hr class="pemisah" />
                                <div id="CompleteOrderListMain">

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/footLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
<!--        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>-->

        <script>
            // highlighted navigation//
            $('#aBill').addClass('active');
            createScreenLoading();


            $("#CompleteOrderListMain").load("billing.jsp");
            //$("#risResultContent").load("risResult_table.jsp");

        </script>

    </body>

</html>

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- header -->
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="container-fluid m-scene">
            <div class="row">       
                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">

                            <div class="thumbnail">
                                <h4>
                                    Modality Lists
                                    <button id="button1id" name="button1id" class="btn btn-success pull-right">
                                        <i class="fa fa-plus"></i>&nbsp; Add Modality
                                    </button>
                                </h4>
                                <hr/>
                                <%@include file = "tables/TBL-Manage-RIS.jsp" %>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- main -->
                
            </div>
        </div>

        <%@include file = "modal/MDL-manage-RIS.jsp" %>

        <!-- Script Goes Here -->
        <%@include file = "../assets/script.html" %>
        <!-- Script Goes Here -->
    </body>
</html>
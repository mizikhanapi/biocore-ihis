<%-- 
    Document   : adminTopMenus
    Created on : Apr 15, 2018, 9:18:38 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-static-top">
    <div class="container-fluid">
        <div class="row">

            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left back" style="">
                    <li><a href="../Entrance/Home" title="Back"><i class=" fa fa-chevron-left"></i></a></li>
                </ul>
                <div class="nav navbar-nav navbar-left">
                    <div style="padding: 10px 20px; display: block; font-size: 22px;">
                        <span style="font-size: 22px;">TMS Screen</span>
                    </div>
                </div>

                <ul class="nav navbar-nav navbar-right logout" style="">
                    <li><a href="../Entrance/destroySession.jsp"  title="Log Out"><i class=" fa fa-power-off"></i></a></li>
                </ul>

            </div>

        </div>

    </div>
</nav>

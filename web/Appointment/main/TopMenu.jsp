<%-- 
    Document   : TopMenu
    Created on : Sep 6, 2017, 5:44:11 PM
    Author     : -D-
--%>
<%
    String name = (String) session.getAttribute("USER_NAME");
%>

            <!-- Menu Top -->
            <nav class="navbar navbar-static-top">
                <div class="container-fluid">
                    <div class="row">

                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-left back" style="">
                                <li><a href="../Entrance/dashboard.jsp" title="Back"><i class=" fa fa-chevron-left"></i></a></li>
                            </ul>
                            <div class="nav navbar-nav navbar-left" style=" margin: 6px auto;">
                                <div style="padding: 10px 20px; display: block; font-size: 22px;">
                                    <span style="font-size: 22px;">e-Appointment</span>
                                </div>
                            </div>

                            <ul class="nav navbar-nav navbar-right logout" style="">
                                <li class="visible-md visible-lg"><a href="Profile" title="Log Out">Welcome <span id="welcome"><%=name%></span></a></li>
                                <li><a onclick="window.location.href = 'destroySession.jsp'" title="Log Out"><i class=" fa fa-power-off"></i></a></li>
                            </ul>

                        </div>

                    </div>

                </div>
            </nav>
            <!-- Menu Top -->
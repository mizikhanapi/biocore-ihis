<%-- 
    Document   : topMenus.jsp
    Created on : Jan 4, 2019, 10:40:42 AM
    Author     : Shammugam
--%>

<nav class="navbar navbar-static-top" >
    <div class="container-fluid">
        <div class="row">


            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-left back" style="">
                    <li><a href="../Entrance/dashboard.jsp" title="Back"><i class=" fa fa-chevron-left"></i></a></li>
                </ul>
                <div class="nav navbar-nav navbar-left">
                    <div style="padding: 10px 20px; display: block; font-size: 22px;">
                        <span style="font-size: 22px;">Inpatient Management</span>
                    </div>
                </div>

                <ul class="nav navbar-nav navbar-right logout" style="">
                    <li>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#style-3" aria-expanded="false" aria-controls="navbar">
                            <i class="fa fa-bars fa-lg"></i>
                        </button>
                    </li>
                    <li><a href="../Entrance/destroySession.jsp" title="Log Out"><i class=" fa fa-power-off"></i></a></li>
                </ul>

            </div>

        </div>

    </div>
</nav>
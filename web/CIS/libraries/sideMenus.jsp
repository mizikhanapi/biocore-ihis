

<div class="col-sm-3 col-md-2 sidebar" id="style-3">
    <!-- logo -->
    <div class="logo">
        Welcome to <span>iHIS</span>
    </div>
    <!-- logo -->

    <!-- profile Sidebar -->
    <%@include file="../../assets/side_profile.jsp" %>
    <hr/>
    <!-- profile Sidebar -->


    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <%            if (myCIS.hasMenuAccess("CIS_06")) {
        %>
        <li><a id="btnCIS_MAIN_QUEUE"><i class="fa fa-users fa-lg"></i> Queue</a></li>
            <%
                }
                if (myCIS.hasMenuAccess("CIS_07")) {
            %>
        <!--<li><a id="searchBtn"><i class="fa fa-search fa-lg"></i> View Visit History</a></li>-->
        <li><a id="btnAnalysePatient"><i class="fa fa-search fa-lg"></i> View Visit History</a></li>
            <%
                }
                if (myCIS.hasMenuAccess("CIS_08")) {
            %>
        <li><a href="../QMS/"><i class="fa fa-gear fa-lg"></i> Second Opinion</a></li>
            <%
                }
            %>
        <li class="hidden"><a id="settingBtn"><i class="fa fa-gear fa-lg"></i> Setting</a></li>

        <!--        <li><a href="./../Report/mcMain2.jsp"class="panelito"><i class="fa fa-calendar fa-lg"></i> Print MC</a></li>
                <li><a href="./../Report/timeSlipMain2.jsp" class="panelito"><i class="fa fa-clock-o fa-lg"></i> Print Time Slip</a></li>-->
        <%
            if (myCIS.hasMenuAccess("CIS_09")) {
        %>
        <li><a id="btnPrintMcPatient"><i class="fa fa-calendar fa-lg"></i>Print Patient MC</a></li>
        <!--<li><a class="panelito" onclick="checkClick('./../Report/mcMain2.jsp')"><i class="fa fa-calendar fa-lg"></i> Print MC</a></li>-->
        <%
            }
            if (myCIS.hasMenuAccess("CIS_10")) {
        %>
        <li><a id="btnPrintTcPatient"><i class="fa fa-clock-o fa-lg"></i>Print Patient Time Slip</a></li>
        <!--<li><a  class="panelito"  onclick="checkClick('./../Report/timeSlipMain2.jsp')"><i class="fa fa-clock-o fa-lg"></i> Print Time Slip</a></li>-->
        <!-- // menu tanpa dropdown -->
        <%
            }
        %>
        <hr/>

        <!-- Menu Specialist Panel -->



        <!--<li><a href="" role="presentation" data-toggle="tab" class="panelito general-exam"><i class="fa fa-angle-right fa-lg"></i> General Examination</a></li>-->
        <%
            if (myCIS.hasMenuAccess("CIS_01")) {
        %>
        <li id="generalLi"><a href="#generic-soap" role="tab" data-toggle="tab" class="panelito general-exam"><i class="fa fa-angle-right fa-lg"></i> General Examination</a></li>
            <%
                }
                if (myCIS.hasMenuAccess("CIS_02")) {
            %>
        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-angle-right fa-lg"></i> Orthopedic <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <%
                    if (myCIS.hasMenuAccess("CIS_02.1")) {
                %>
                <li><a class="panelito ortho-niward" style="cursor: pointer;">Nursing</a></li>
                    <%
                        }
                        if (myCIS.hasMenuAccess("CIS_02.2")) {
                    %>
                <li><a class="panelito ortho-opthe" style="cursor: pointer;">Report</a></li>
                    <%
                        }
                    %>
            </ul>
        </li>
        <%
            }
            if (myCIS.hasMenuAccess("CIS_03")) {
        %>
        <!--        <li><a href="#ong" role="tab" data-toggle="tab" class="panelito ong-general" id="linkOng"><i class="fa fa-angle-right fa-lg"></i> Obstetrics & Gynecology</a></li>-->
        <li role="presentation" class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-angle-right fa-lg"></i> Obstetrics & Gynecology <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <%
                    if (myCIS.hasMenuAccess("CIS_03.1")) {
                %>
                <li><a class="panelito ong-general" style="cursor: pointer;" id="LinkOngGeneral">General</a></li>
                    <%
                        }
                        if (myCIS.hasMenuAccess("CIS_03.2")) {
                    %>
                <li><a class="panelito ong-general" style="cursor: pointer;" id="LinkOngCareWard">Ward Care</a></li>
                    <%
                        }
                    %>
            </ul>
        </li>
        <%
            }
        %>

        <!-- Menu Specialist Panel -->

    </ul>
</div>
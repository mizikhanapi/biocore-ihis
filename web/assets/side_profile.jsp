<%-- 
    Document   : side_profile
    Created on : May 1, 2017, 9:55:21 PM
    Author     : user
--%>

<%
    String my_1_gamba = "";
    String my_1_nama = "";
    String my_1_role = "";
    String my_1_hfcName = "";
    String my_1_hfc_cd = "";
    String my_1_user_id = "";
    String my_1_dis_cd = "";
    String my_1_sub_cd = "";
    String my_1_dis_name = "";
    String my_1_sub_name = "";

    if (session.getAttribute("USER_NAME") != null) {

        my_1_gamba = session.getAttribute("PICTURE").toString();
        my_1_nama = session.getAttribute("USER_NAME").toString();
        my_1_role = session.getAttribute("ROLE_NAME").toString();
        my_1_hfcName = session.getAttribute("HFC_NAME").toString();
        my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        my_1_user_id = (String) session.getAttribute("USER_ID");
        my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
        my_1_dis_name = (String) session.getAttribute("DISCIPLINE_NAME");
        my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
        my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
        my_1_sub_name = (String) session.getAttribute("SUB_DISCIPLINE_NAME");

    }

%>

<div class="profile">
    <div class="profile-userpic">
        <img src="<%= my_1_gamba%>" class="img-responsive" alt="profile pic">
    </div>
    <!-- SIDEBAR USER TITLE -->
    <div class="profile-usertitle">
        <div class="profile-usertitle-name">
            <%=my_1_nama%> (<%=my_1_user_id%>)
        </div>
        <div class="profile-usertitle-job">
            <%= my_1_role%>&nbsp;
            <li data-toggle="collapse" data-target="#viewExtraProfile" class="collapsed" style="list-style: none; display: inline; cursor: pointer;">
                <i class="fa fa-caret-down"></i>
            </li>
        </div>
        <div class="collapse" id="viewExtraProfile">
            -
            <div class="profile-usertitle-job text-left">
                Health Facility: <strong><%= my_1_hfcName%> <%//=my_1_hfc_cd%></strong>
            </div>

            <div class="profile-usertitle-job text-left">
                Discipline: <strong><%= my_1_dis_name%> <%//=my_1_dis_cd%></strong>
            </div>

            <div class="profile-usertitle-job text-left">
                Subdiscipline: <strong><%= my_1_sub_name%> <%//=my_1_sub_cd%></strong>
            </div>
        </div>
    </div>

<!-- SIDEBAR BUTTONS -->
<div class="profile-userbuttons">
    <button type="button" class="btn btn-success btn-sm" onclick="window.location.href = '../Entrance/profile.jsp'">Manage Account</button>
</div>
</div>

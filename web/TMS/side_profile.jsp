<%-- 
    Document   : side_profile
    Created on : May 1, 2017, 9:55:21 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%
    String my_1_gamba = "";
    String my_1_nama = "";
    String my_1_hfcName = "";
    String my_1_user_id = "";
 
    if (session.getAttribute("USER_NAME") != null) {

        my_1_gamba = (String) session.getAttribute("PICTURE");
        my_1_nama = (String) session.getAttribute("USER_NAME");
        my_1_hfcName = (String) session.getAttribute(MySessionKey.TENANT_NAME);
        my_1_user_id = (String) session.getAttribute("USER_ID");
        
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
            Tenant Manager &nbsp;
            <li data-toggle="collapse" data-target="#viewExtraProfile" class="collapsed" style="list-style: none; display: inline; cursor: pointer;">
                <i class="fa fa-caret-down"></i>
            </li>
        </div>
        <div class="collapse" id="viewExtraProfile">
           
            <div class="profile-usertitle-job text-left">
                Tenant: <strong><%= my_1_hfcName%> <%//=my_1_hfc_cd%></strong>
            </div>

           
        </div>
    </div>

<!-- SIDEBAR BUTTONS -->

</div>

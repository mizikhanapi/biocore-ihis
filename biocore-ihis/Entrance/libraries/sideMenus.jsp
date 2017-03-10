<%-- 
    Document   : sideMenus
    Created on : Mar 10, 2017, 12:52:51 AM
    Author     : user
--%>

<div class="col-sm-3 col-md-2 sidebar" id="style-3">
		<!-- logo -->
		<div class="logo">
		Welcome to <span>iHIS</span>
		</div>
		<!-- logo -->
		
		<!-- profile Sidebar -->
		<div class="profile">
				<div class="profile-userpic">
                                    <img id="proPic" src="<%= session.getAttribute("PICTURE").toString()%>" class="img-responsive" alt="">
				</div>
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						<%= session.getAttribute("USER_NAME").toString()%>
					</div>
<!--					<div class="profile-usertitle-job">
						Developer
					</div>-->
				</div>
				<!-- SIDEBAR BUTTONS -->
<!--				<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm">Manage Account</button>
				</div>-->
		</div>
		<hr/>
		
        </div>


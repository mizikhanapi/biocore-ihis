<%@page import="Config.Config"%>		
<div class="col-sm-3 col-md-2 sidebar">
    
    <!-- logo -->
		<div class="logo">
		Welcome to <span>iHIS</span>
		</div>
		<!-- logo -->
		
		<!-- profile Sidebar -->
		<div class="profile">
				<div class="profile-userpic">
					<img src="../assets/profile.jpg" class="img-responsive" alt="">
				</div>
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						Marcus Doe
					</div>
					<div class="profile-usertitle-job">
						Developer
					</div>
				</div>
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm">Manage Account</button>
				</div>
		</div>
		<hr/>
		<!-- profile Sidebar -->
    <ul id="menu-content" class="nav nav-sidebar">
        <!-- // menu tanpa dropdown -->
        <li>
            <a  href="MainPage.jsp" >
                <i class="fa fa-briefcase fa-lg"></i> Lab Patient List Order
            </a>
        </li>
         <li>
            <a  href="ManageResult.jsp" >
                <i class="fa fa-flask fa-lg"></i> Receive Specimen
            </a>
         </li> 
        <li>
            <a  href="ManageTest.jsp" >
                <i class="fa fa-briefcase fa-lg"></i> Manage Test
            </a>
        </li> 
        <li>
            <a  href="ManageTestCode.jsp" >
                <i class="fa fa-briefcase fa-lg"></i> Manage Test Code
            </a>
        </li>
        
        

</div>  

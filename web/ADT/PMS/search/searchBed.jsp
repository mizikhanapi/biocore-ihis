<%@page import="java.util.ArrayList"%>


<%

//    String DR = "002";
//    
// String role1 = "SELECT  b.USER_ID, b.USER_NAME,a.USER_ID, a.ROLE_CODE, a.HEALTH_FACILITY_CODE, a.DISCIPLINE_CODE FROM adm_user_access_role a LEFT JOIN adm_users b ON a.USER_ID = b.USER_ID where  a.ROLE_CODE = "+DR+" AND a.HEALTH_FACILITY_CODE="+hfc+";";
// String hfc1 = "SELECT  hfc_name, hfc_cd FROM adm_health_facility where  hfc_cd ="+hfc+";";
//
//    
//    ArrayList<ArrayList<String>> dataRole, dataHFC1;
//
//    dataRole = conn.getData(role1);
//    dataHFC1 = conn.getData(hfc1);
    String EliSrc = request.getParameter("EliSrc");
    String EliSource = request.getParameter("EliSource");


%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">
<input type="hidden" value="<%=pageNow%>" id="pageNow">
<input type="hidden" value="<%=EliSrc%>" id="pageNow">
<input type="hidden" value="<%=EliSource%>" id="pageNow">


<div class="row">


    <div class="col-md-6">
        <!-- Select Basic -->
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Discipline *</label>
            <div class="col-md-6">
                <input id="DisWard" name="Dis" placeholder="Insert Discipline Code" maxlength="30" type="text"  class="form-control input-md">
                <input type="hidden" id="dis_cd">
                <input  type="hidden" id="sub_cd">


                <div id="disListWard" class="search-drop"></div>
            </div>

        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Ward Type</label>
            <div class="col-md-6" id="wardTypeList">
                <select id="WardType" name="WardType" class="form-control" disabled="">

                </select>
            </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Ward Name</label>
            <div class="col-md-6" id="wardNameDropdown">
                <select id="wname" name="selectbasic" class="form-control" disabled="">


                </select>
            </div>

        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic"></label>
            <div class="col-md-6" >                
                <button class="btn btn-info" id="searchBed" name="searchBed"><i class="fa fa-search"></i>&nbsp; Search Bed</button>
            </div>
        </div>
    </div>



    <div class="col-md-6">  
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Deposit (RM)</label>
            <div class="col-md-6" id="depositResult">
                <input id="Deposit" name="textinput" type="text" placeholder="RM :" class="form-control input-md">
            </div>
        </div>


        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="selectbasic">Bed ID</label>
            <div class="col-md-6">
                <input id="BedIDReg" readonly name="textinput" type="text" placeholder="Bed ID" class="form-control input-md">
                </br>
            </div>
        </div>






    </div>
</div>


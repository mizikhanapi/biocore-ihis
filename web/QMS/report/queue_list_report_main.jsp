<%-- 
    Document   : queue_list_report_main
    Created on : Aug 15, 2017, 9:11:32 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
%>

<h4>List of Queue</h4>
<!-- tab content -->
<div class=" form-horizontal" align="center">


    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">Show list: </label>
        <div class="col-md-4">
            <select id="RQL_searchType" class="form-control" >
                <option selected value="1">All</option>

                <option value="2">By type</option>
                
                <option value="3">By discipline</option>

                <option value="4">By user</option>
                
                <option value="5">By queue name</option>
                
            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group searchingDiv" id="RQL_div_byType" style="display: none">

        <label class="col-md-4 control-label" for="textinput">Type</label>
        <div class="col-md-3">
            <select id="RQL_listByType" class="form-control input-md">
                <option selected disabled value="">-- Select queue type --</option>
                <option value="PN">(PN) Person</option>
                <option value="CM">(CM) Common</option>
                <option value="FY">(FY) Facility</option>
            </select>
        </div>


    </div>
    <div class="form-group searchingDiv" id="RQL_div_byDiscipline" style="display: none;">
        <%
            String disQuery = "Select d.discipline_cd, d.discipline_name "
                    + "from adm_discipline d "
                    + "join adm_hfc_discipline hd on hd.hfc_cd=d.discipline_hfc_cd and hd.hfc_discipline_status=d.discipline_status and hd.discipline_cd=d.discipline_cd "
                    + "where d.discipline_hfc_cd='"+hfc_cd+"' and d.discipline_status='0' "
                    + "group by d.discipline_cd;";
            
            ArrayList<ArrayList<String>> dataDis = con.getData(disQuery);
        %>

        <label class="col-md-4 control-label" for="textinput">Discipline</label>
        <div class="col-md-3">
            <select id="RQL_listByDis" class="form-control input-md">
                <option selected disabled value="">-- Select discipline --</option>
                <%
                    for(int i=0; i<dataDis.size(); i++){
                %>
                <option value="<%=dataDis.get(i).get(0)%>">(<%=dataDis.get(i).get(0)%>) <%=dataDis.get(i).get(1)%></option>
                <%
                    }//end for loop
                %>
            </select>
        </div>
    </div>
    
    <div class="form-group searchingDiv" id="RQL_div_byUser" style="display: none;">
        <label class="col-md-4 control-label" for="textinput">User</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="RQL_listByUser" placeholder="Search the user and select..." 
                   data-search-by-word="true"
                   data-selection-required="true">
            <div id="RQL_user_match" class="search-drop"></div>
        </div>

    </div>
            
    <div class="form-group searchingDiv" id="RQL_div_byQueueName" style="display: none;">
        <label class="col-md-4 control-label" for="textinput">Queue name</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="RQL_listByQName" placeholder="Search the queue and select..." 
                   data-search-by-word="true"
                   data-selection-required="true">
            <div id="RQL_qName_match" class="search-drop"></div>
        </div>

    </div>

    <div class="text-center">
        <button class="btn btn-primary" type="button" id="RQL_btnSearch" ><i class="fa fa-search"></i>&nbsp; Search</button>

        <!--<button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>-->
    </div>
   

</div>

<script type="text/javascript">
    
    $(function(){
        RQL_listALl();
    });
    
    $('#RQL_searchType').on('change', function(){
       $('.searchingDiv').hide();
       
       var type = $(this).val();
       
       if(type==="2")
           $('#RQL_div_byType').show();
       else if(type==="3")
           $('#RQL_div_byDiscipline').show();
       else if(type==="4")
           $('#RQL_div_byUser').show();
       else if(type==="5")
           $('#RQL_div_byQueueName').show();
    });
    
    $('#RQL_btnSearch').on('click', function(){
        var type=$('#RQL_searchType').val();
        
        if(type==="1")
            RQL_listALl();
        else if(type==="2")
            RQL_byType();
        else if(type==="3")
            RQL_byDiscipline();
        else if(type==="4")
            RQL_byUser();
        else
            RQL_byQName();
    });
    
    //function to get the queue list
    function postRequestToQueueTable(type, code){
        createScreenLoading();
        
        var postData={
            type: type,
            code: code
        };
        
        $.ajax({
            type: 'POST',
            url: "report/queue_list_table.jsp",
            timeout: 60000,
            data: postData,
            success: function (data, textStatus, jqXHR) {
                        $('#RQL_table').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        $('#RQL_table').html("Oopps! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading(); 
               }
        });
    }
    
    function RQL_listALl(){
        postRequestToQueueTable("all", "-");
    }
    
    function RQL_byUser(){
        
        var code = $('#RQL_listByUser').val();
        
        if(code==="" || code==null){
            bootbox.alert("Please select existing user!");
        }
        else{
            postRequestToQueueTable("user", code);
        }
        
    }
    
    function RQL_byDiscipline(){
        var type= $('#RQL_listByDis').val();
        
        if(type===""){
            bootbox.alert("Please select the discipline!");
        }
        else{
            postRequestToQueueTable("dis", type);
        }
    }
    
    function RQL_byType(){
        var type= $('#RQL_listByType').val();
        
        if(type===""){
            bootbox.alert("Please select the queue type!");
        }
        else{
            postRequestToQueueTable("type", type);
        }
    }
    
    function RQL_byQName(){
        var name = $('#RQL_listByQName').val();
        
        if(name==="" || name==null){
            bootbox.alert("Please select existing queue name!");
        }
        else{
            postRequestToQueueTable("qName", name);
        }
        
    }
    
    //------------- search consultant ----------------------------
    $('#RQL_listByUser').flexdatalist({
        minLength: 1,
        searchIn: 'name', 
        searchDelay: 2000,
        selectionRequired: true,
        url: "search/ResultDOCTORSurgicalSearch.jsp",
        visibleProperties: 'name',
        cache: true,
        valueProperty: 'value',
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                if (result == null) {
                    $('#RQL_user_match').html('No Record');
                }
            }
        }
    });
    
    $("#RQL_listByUser").on('before:flexdatalist.data', function (response) {
        $('#RQL_user_match').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#RQL_listByUser").on('after:flexdatalist.data', function (response) {
        $('#RQL_user_match').html('');
    });
    $("#RQL_listByUser").on('select:flexdatalist', function (response) {
        $('#RQL_user_match').html('');
    });

//============= end search consultant ===============================================

 //------------- search queue ----------------------------
    $('#RQL_listByQName').flexdatalist({
        minLength: 1,
        searchIn: 'name', 
        searchDelay: 2000,
        selectionRequired: true,
        url: "search/searchQueueName.jsp",
        visibleProperties: 'name',
        cache: true,
        valueProperty: 'value',
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                if (result == null) {
                    $('#RQL_qName_match').html('No Record');
                }
            }
        }
    });
    
    $("#RQL_listByQName").on('before:flexdatalist.data', function (response) {
        $('#RQL_qName_match').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#RQL_listByQName").on('after:flexdatalist.data', function (response) {
        $('#RQL_qName_match').html('');
    });
    $("#RQL_listByQName").on('select:flexdatalist', function (response) {
        $('#RQL_qName_match').html('');
    });

//============= end search queue ===============================================
</script>
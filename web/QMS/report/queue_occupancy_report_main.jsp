<%-- 
    Document   : queue_occupancy_report_main
    Created on : Aug 21, 2017, 12:58:21 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn con = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
%>

<h4>Occupancy Report</h4>
<!-- tab content -->
<div class=" form-horizontal" align="center">

    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">Show by: </label>
        <div class="col-md-4">
            <select id="RQO_searchType" class="form-control" >
                <option selected value="1">Daily</option>

                <option value="2">Monthly</option>
                
                <option value="3">Yearly</option>

            </select>
        </div>
    </div>
    
</div>

<script type="text/javascript">
    $(function(){
        postRequestToOccupancyTable("day");
    });
    
    function postRequestToOccupancyTable(leType){
        
        createScreenLoading();
        
        var data={
            type: leType
        };
        
        $.ajax({
            type: 'POST',
            url: "report/queue_occupancy_table.jsp",
            timeout: 60000,
            data: data,
            success: function (data, textStatus, jqXHR) {
                        $('#RQO_table').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oopps! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
    $('#RQO_searchType').on('change', function(){
        var type= $(this).val();
        
        var timeType="";
        
        if(type==="1"){
            timeType="day";
        }
        else if(type==="2"){
            timeType="month";
        }
        else if(type==="3"){
            timeType="year";
        }
        
        postRequestToOccupancyTable(timeType);
    });
    
</script>
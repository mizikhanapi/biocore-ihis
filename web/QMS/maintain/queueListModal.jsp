<%-- 
    Document   : queueListModal
    Created on : Feb 8, 2017, 11:00:34 AM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String user_id = session.getAttribute("USER_ID").toString();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String queueSql = "select queue_type,queue_name from pms_queue_name where hfc_cd = '" + hfc + "' and discipline_code='"+dis+"' and queue_type in ('FY', 'CM', 'PN');";
    ArrayList<ArrayList<String>> dataQueue = conn.getData(queueSql);

//    String sqlDoctorAvailable = "SELECT doc.*,DATE(pdr.start_date),DATE(pdr.end_date) "
//            + "from pms_duty_roster pdr, "
//            + "(SELECT USER_ID,LCASE(USER_NAME),OCCUPATION_CODE "
//            + "FROM adm_users "
//            + "WHERE OCCUPATION_CODE = '002' and health_facility_code = '" + hfc + "'"
//            + "ORDER BY LCASE(USER_NAME) ASC)doc "
//            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
//            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) ";
//    ArrayList<ArrayList<String>> dataDoctorAvailable = conn.getData(sqlDoctorAvailable);


%>
<!-- Modal Detail -->
<div class="modal fade" id="list" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Maintain Queue List</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="" id="Lform" autocomplete="off">
                    <div class="form-group">
                        <div><label>Queue Name *: </label></div>
                        <select class="form-control" id="QLName">
                            <option selected="true" disabled="true">Please select Queue Name</option>
                            <%                                for (int i = 0; i < dataQueue.size(); i++) {
                                                              String optDisabled="";
                                                              if("PN".equalsIgnoreCase(dataQueue.get(i).get(0))){
                                                                  optDisabled="disabled";
                                                              }
                                                                
                            %>
                                
                            <option value="<%=dataQueue.get(i).get(0) + "|" + dataQueue.get(i).get(1)%>" <%=optDisabled%>><%="("+dataQueue.get(i).get(0) + ") " + dataQueue.get(i).get(1)%></option>  
                            <%   }
                            %>
                        </select>
                        <input type="hidden" id="QLName_hidden">
                    </div>
                    <div class="form-group">
                        <div><label>Staff *: </label></div>
                        
                        <input id="QLStaff" name="textinput" type="text" placeholder="select staff.." class="form-control input-md">
                        <input id="QLStaffCODE" name="PMIhstateCODE" type="hidden" class="form-control input-md">
                        <div id="matchDoctor" class="search-drop"></div>
                    </div>
                   
                    <div class="form-group">
                        <div><label>Start date : </label></div>
                        <input type="text" id="startDate" class="form-control" placeholder="Choose date dd/mm/yyyy">
                    </div>
                    <div class="form-group">
                        <div><label>End date : </label></div>
                        <input type="text" id="endDate" class="form-control" placeholder="Choose date dd/mm/yyyy">
                    </div>
                    <div class="form-group">
                        <div><label>Status : </label></div>
                        <select class="form-control" id="QLStatus">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button  id="saveList" class="btn btn-primary btn-block btn-lg" role="button" data-dismiss="modal">Save</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button  id="delList" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button" >Delete</button>
                    </div>
                </div>
             
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<script src="../PMS/libraries/lib/js/search/searchDoctor.js" type="text/javascript"></script>
<script>
            
    $(document).ready(function(){
       $(function(){
            $('#startDate').datepicker({dateFormat:'dd/mm/yy',changeMonth:true,changeYear:true});
            $('#endDate').datepicker({dateFormat:'dd/mm/yy',changeMonth:true,changeYear:true});
        }); 
    });
    
    //function to save or update the queue name
    $('#saveList').on('click', function () {
        var staff = $('#QLStaffCODE').val();
        var name = $('#QLName').val();
        var createdBy = "<%=user_id%>";
        var hfc = "<%=hfc%>";
        var stat = $('#QLStatus').val();
        var dis = "<%=dis%>";
        var sub = "<%=sub%>";
        var startDate = $('#startDate').val();
        var endDate = $('#endDate').val();
        
        if(name==="" || name==null){
            name = $('#QLName_hidden').val();
        }
        //console.log(staff);
//        $('#QLStaff option:not(:selected)').prop('disabled', false);
//        $('#QLName option:not(:selected)').prop('disabled', false);
//        $('#Lform')[0].reset();
        if (name === null) {
            bootbox.alert("Please Fill in the name input");
        }else if(startDate === "" || endDate===""){
            bootbox.alert("Please Fill in the date input");
        }else if(staff === "" || staff===""){
            bootbox.alert("Please Fill in the staff input");
        } else {
            //var B2 = $('#QName').val();
            //
            var array_data2;
            array_data2 = name.split("|");
            //var desc = $('#QnameDes').val();
            var ty = array_data2[0];
            var nm = array_data2[1];
            
            //console.log("userid when updated" + uid);
            //var quota = $('#typeQuota').val();

            var data = {ty : ty,
                nm : nm,
                staff : staff,
                startDate : startDate,
                endDate : endDate,
                hfc : hfc,
                dis : dis,
                sub : sub,
                stat : stat,
                createdBy : createdBy
            };
            //console.log(ty + " -|- " + nm);
            //console.log(data);
            $.ajax({
                type: "post",
                url: "maintain/saveQueueList.jsp",
                data: data,
                timeout: 3000,
                success: function (dataBack, textStatus, jqXHR) {
                    
                    var isSuccess = (dataBack.trim() == 'true');
                    var msg = 'Queue is saved.';
                    
                    if(!isSuccess){
                        msg = 'Failed to save queue list!';
                    }
                   
                    bootbox.alert(msg, function(){
                        $('#modal1 #type').remove();
                        $('#modal2 #names').remove();
                        $('#modal3 #list').remove();
                        $('#modal1').load('maintain/queueTypeModal.jsp');
                        $('#modal2').load('maintain/queueNameModal.jsp');
                        $('#modal3').load('maintain/queueListModal.jsp');
                    });
                    
                    if(!isSuccess){
                        return false;
                    }
                    $.ajax({
                        type: "post",
                        url: "maintain/listQueueList.jsp",
                        data: {hfc : hfc},
                        timeout: 3000,
                        success: function (returnHtml) {
                            //console.log(returnHtml);
                            $('#QLdiv').html(returnHtml);

                        }, error: function (jqXHR, textStatus, errorThrown) {

                            console.log("ERROR: " + errorThrown);
                        }
                    });// end of inner ajax
                    
                }, error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Error: '+errorThrown);
                }
            });// end of outer ajax
        }




    });

    $('#delList').on('click', function () {

        //var code = $('#Qtype').val();
        //var name = $('#QnameCode').val();
        var hfc = "<%=hfc%>";
        var staff = $('#QLStaffCODE').val();
        var name = $('#QLName_hidden').val();
        var array_data2;
            array_data2 = name.split("|");
            //var desc = $('#QnameDes').val();
            var ty = array_data2[0];
            var nm = array_data2[1];
            var data = {"cd": ty, "name": nm, "hfc": hfc, "staff" : staff};
            console.log(data);
        $.ajax({
            type: "post",
            url: "maintain/delQueueList.jsp",
            data: {"cd": ty, "name": nm, "hfc": hfc, "staff" : staff},
            timeout: 3000,
            success: function (data, textStatus, jqXHR) {
                
                 var isSuccess = (data.trim() == 'true');
                    var msg = 'Queue is deleted.';
                    
                    if(!isSuccess){
                        msg = 'Failed to delete queue list!';
                    }
                console.log(data);
                bootbox.alert(msg, function(){
                        $('#modal1 #type').remove();
                        $('#modal2 #names').remove();
                        $('#modal3 #list').remove();
                        $('#modal1').load('maintain/queueTypeModal.jsp');
                        $('#modal2').load('maintain/queueNameModal.jsp');
                        $('#modal3').load('maintain/queueListModal.jsp');
                    });
                    
                    if(!isSuccess){
                        return false;
                    }
                
                if(ty==="PN"){
                   $('#queueName').html('');
                   $('#queueName').load('maintain/maintainQueueName.jsp');
                }
                    
                $.ajax({
                    type: "post",
                    url: "maintain/listQueueList.jsp",
                    timeout: 3000,
                    data: {hfc : hfc},
                    success: function (returnHtml) {
                        //console.log(returnHtml);
                        $('#QLdiv').html(returnHtml);

                    }, error: function (jqXHR, textStatus, errorThrown) {

                        console.log("ERROR: " + errorThrown);
                    }
                });
            }, error: function (jqXHR, textStatus, errorThrown) {

            }
        });
    });
</script>
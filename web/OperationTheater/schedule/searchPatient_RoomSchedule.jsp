<%-- 
    Document   : searchPatient_RoomSchedule
    Created on : Jul 25, 2017, 2:17:21 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String type = request.getParameter("type");
    
    Conn con = new Conn();
    
    try{
        String condition = ""; 
        if(type.equalsIgnoreCase("1")){
            String room = request.getParameter("roomNo");
            condition=" and (rm.room_no like '%"+room+"%' or rm.room_name like '%"+room+"%') ";
        }
        else if(type.equalsIgnoreCase("3")){
            String consul = request.getParameter("consul");
            condition =" and (u.user_id like '%"+consul+"%' or u.user_name like '%"+consul+"%') ";
        }
        else if(type.equalsIgnoreCase("5")){
            String pat = request.getParameter("pmiNo");
            condition =" and (bio.pmi_no like '%"+pat+"%' or bio.patient_name like '%"+pat+"%') ";
        }
        //                                        0                                                 1                                   2                       3                 4             5               6       7                       8               9
        String query ="select date_format(d.`startDateTime`, '%d/%m/%Y %H:%i'), date_format(d.`endDateTime`, '%d/%m/%Y %H:%i'), pro.procedure_cd, pro.`procedure_shortName`, d.ot_room_no, rm.room_name, bio.`PMI_NO`, bio.`PATIENT_NAME`, u.`USER_ID`, u.`USER_NAME` "
                + "from ot_order_detail d "
                + "join ot_order_master m on m.hfc_to='"+hfc_cd+"' and d.order_no=m.order_no and (m.order_status not in ('3', '2')) "
                + "join ot_room rm on rm.hfc_cd =m.hfc_to and rm.room_no=d.ot_room_no "
                + "join pms_patient_biodata bio on bio.`PMI_NO` = m.pmi_no "
                + "join adm_users u on u.`USER_ID` = d.consultant_id "
                + "join ot_procedure pro on pro.hfc_cd=m.hfc_to and pro.category_cd=d.category_cd and pro.procedure_cd = d.procedure_cd "
                + "where (d.order_status not in ('2', '3')) "
                + condition
                + "order by d.`startDateTime`, d.`endDateTime`; ";
        
        ArrayList<ArrayList<String>> dataSche = con.getData(query);
        
        if(dataSche.size() < 1){
            out.print("<h3>Sorry, we can't find the schedule you're searching for. Please try search different word.</h3>");
        }
        else{
        
%>
<table id="THE_scheduleTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="display: none">Hidden</th>    
    <th>Start</th>
    <th>End</th>
    <th>Procedure</th>
    <th>OT-Room</th>
    <th>Consultant</th>
    <th>Patient</th>
    
<!--    <th style="width: 5%">Update</th>
    <th style="width: 5%">Delete</th>-->
</thead>

<tbody>
<%
            for(int i=0; i<dataSche.size(); i++){            

%>
<tr>
<td style="display:none" id="SCHEDULE_hidden_column"><%= String.join("|", dataSche.get(i))%></td>
<td><%= dataSche.get(i).get(0)%></td>
<td><%= dataSche.get(i).get(1)%></td>
<td>(<%= dataSche.get(i).get(2)%>) <%= dataSche.get(i).get(3)%></td>
<td>(<%= dataSche.get(i).get(4)%>) <%= dataSche.get(i).get(5)%></td>
<td>(<%= dataSche.get(i).get(8)%>) <%= dataSche.get(i).get(9)%></td>
<td>(<%= dataSche.get(i).get(6)%>) <%= dataSche.get(i).get(7)%></td>

<!--<td>
    <a id="ROOM_btnModalUpdate" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td>
    <a id="ROOM_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>-->
</tr>
<%
            }//end for loop
%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_scheduleTable').DataTable();
    });


    
</script>

<%
        
        }// end else. Got data
        
        
    
    }
    catch(Exception e){
        System.out.println("View Schedule: ");
        e.printStackTrace();
        out.print("Oopps!");
    }
%>

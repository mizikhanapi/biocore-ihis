<%-- 
    Document   : hfc_table
    Created on : Apr 15, 2018, 5:56:45 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc_cd = "99_iHIS_99";
    String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);

%>


<table  id="THE_healthFacilityTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>HFC Code</th>
    <th>HFC Name</th>
    <th>Director</th>
    <th>Address</th>
    <th>Status</th>
    <th>ACTIONS</th>
</thead>
<tbody>

    <%        //------------     0        1           2       3           4       5           6       7           8          9           10                 11         12     13        14         15       16                                                      17                18              19            20               21        22            23                   
        String sql = "Select a.hfc_cd, hfc_type, hfc_name, address1, address2, address3, state_cd, district_cd, town_cd, country_cd, post.description, telephone_no, fax_no, email, hfc_server, hfc_report, ifnull(DATE_FORMAT(established_date,'%d/%m/%Y'), ''), director_name, hfc_category_cd, hfc_sub_type, contact_person, hfc_status, hfc_ip, post.detail_reference_code "
                + "FROM adm_health_facility a "
                + "JOIN adm_lookup_detail post on master_reference_code = '0079' AND post.detail_reference_code = postcode AND post.hfc_cd = '" + hfc_cd + "' "
                + "WHERE a.hfc_report='" + tenant_cd + "' ;";

        ArrayList<ArrayList<String>> dataHFC = conn.getData(sql);

        int size = dataHFC.size();

        for (int i = 0; i < size; i++) {

            String status = "";
            String canActivate="";
            String canDeactivate="";
            boolean canEdit = true;
            switch (dataHFC.get(i).get(21)) {
                case "0":
                    status = "Active";
                    canActivate="disabled";
                    break;
                case "1":
                    status = "Inactive";
                    canDeactivate="disabled";
                    break;
                case "2":
                    status = "Waiting for approval";
                    canEdit = false;
                    break;
                case "3":
                    status = "Rejected";
                    canEdit = false;
                    break;
                default:
                    status = "Unknown";
            }

    %>
    <tr>

        <td><%= dataHFC.get(i).get(0)%></td> <!-- HFC code -->   
        <td><%= dataHFC.get(i).get(2)%></td> <!-- HFC name  --> 
        <td><%= dataHFC.get(i).get(17)%></td> <!-- Director --> 
        <td><%= dataHFC.get(i).get(3)%> <%=dataHFC.get(i).get(4)%> <%= dataHFC.get(i).get(5)%></td> <!-- Address  --> 
        <td><%= status%></td> <!-- Status --> 

        <td style="width: 10% ">
            <%
                if (canEdit) {
            %>
            <input id="HFT_hidden" type="hidden" value="<%=String.join("|", dataHFC.get(i))%>">
            <!-- Update Part Start -->
            <!--<a id="HFT_btnLogoModal" title="Update logo" style="cursor: pointer"><i class="fa fa-picture-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>-->
            <!-- Update Part Start -->
            <!--<a id="HFT_btnUpdateModal" title="Update information" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>-->
            <button <%=canActivate%> id="HFT_btnActivate" title="Activate HFC" class="btn btn-success"><i class="fa fa-check-circle" aria-hidden="true"></i></button>
            
            <button <%=canDeactivate%> id="HFT_btnDeactivate" title="Deactivate HFC" class="btn btn-danger"><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
            
            <button id="HFT_btnResendEmail" title="Resend Email" class="btn btn-default"><i class="fa fa-envelope" aria-hidden="true"></i></button>
                <%
                    }
                %>
        </td>
    </tr>

    <%
        }//end for loop

    %>

</tbody>
</table>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $('#THE_healthFacilityTable').DataTable();


    });
</script>
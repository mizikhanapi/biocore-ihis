<%-- 
    Document   : getAvailableBed
    Created on : Nov 21, 2017, 10:29:03 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    
    Conn con = new Conn();
    //                      0                   1                   2                       3                       4                   5               6              7            8           
    String sql ="SELECT dc.discipline_cd, dc.discipline_name, sdc.subdiscipline_cd, sdc.subdiscipline_name, wc.ward_class_code, wc.ward_class_name, wn.ward_id, wn.ward_name, b.bed_id "
            + "FROM wis_bed_id b "
            + "JOIN wis_ward_name wn on wn.hfc_cd=b.hfc_cd AND wn.discipline_cd=b.discipline_cd AND wn.ward_id=b.ward_id "
            + "JOIN wis_ward_class wc on wc.hfc_cd=wn.hfc_cd AND wc.ward_class_code=wn.ward_class_code "
            + "JOIN adm_discipline dc on dc.discipline_hfc_cd=b.hfc_cd AND dc.discipline_cd=b.discipline_cd "
            + "JOIN adm_subdiscipline sdc on sdc.subdiscipline_hfc_cd=b.hfc_cd AND sdc.discipline_cd=b.discipline_cd AND sdc.subdiscipline_cd=b.subdiscipline_cd "
            + "WHERE b.bed_status='Available' AND b.hfc_cd='"+hfc_cd+"' "
            + "GROUP BY dc.discipline_cd, sdc.subdiscipline_cd, wc.ward_class_code, wn.ward_id, b.bed_id;";
    
    ArrayList<ArrayList<String>> dataBed = con.getData(sql);
           
%>
<table class="table table-bordered" id="abTable">
    <thead>
        <tr>
            <th>Discipline</th>
            <th>Ward Class</th>
            <th>Ward Name</th>
            <th>Bed ID</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>Discipline</th>
            <th>Ward Class</th>
            <th>Ward Name</th>
            <th>Bed ID</th>
        </tr>
    </tfoot>
    <tbody>
        <%
            for(int i=0; i<dataBed.size(); i++){
        
        %>
        <tr data-dismiss="modal" class="clickable_tr">
            <td><%= dataBed.get(i).get(1)%> - <%= dataBed.get(i).get(3)%></td>
            <td><%= dataBed.get(i).get(5)%></td>
            <td><%= dataBed.get(i).get(7)%></td>
            <td><button style="background-color: #bada55" class="btn btn-default"> <%= dataBed.get(i).get(8)%></button><input type="hidden" id="hiddenAB" value="<%= String.join("|", dataBed.get(i))%>"></td>
        </tr>
        <%
            
            }//end for loop
        %>
        
    </tbody>
</table>
<script>
    $(function(){
         $('#abTable tfoot th').each(function () {
            var title = $(this).text();
            $(this).html('<input class="form-control input-sm" type="text" placeholder="Search ' + title + '" />');
        });
        
        var table = $('#abTable').DataTable();    
    
     // Apply the search
        table.columns().every(function () {
            var that = this;

            $('input', this.footer()).on('keyup change', function () {
                if (that.search() !== this.value) {
                    that
                            .search(this.value)
                            .draw();
                }
            });
        });
    });
   
</script>
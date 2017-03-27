<%-- 
    Document   : CIS030003
    Created on : 13-Mar-2017, 12:05:07
    Author     : ahmed
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String pmiNo = "";//session.getAttribute("patientPMINo").toString();
    
    String sql = "";
    String sql2 = "";
    sql = "select w.pmi_no,w.episode_date,h.hfc_name,d.discipline_name from wis_inpatient_episode w inner join adm_health_facility h on w.hfc_cd = h.hfc_cd inner join  adm_discipline d on w.discipline_cd = d.discipline_cd where w.pmi_no = '"+pmiNo+"'";
    sql2 = "select p.pmi_no,p.episode_date,h.hfc_name,d.discipline_name from pms_episode p inner join adm_health_facility h on p.`HEALTH_FACILITY_CODE` = h.hfc_cd inner join  adm_discipline d on p.DISCIPLINE_CODE = d.discipline_cd where p.pmi_no = '"+pmiNo+"'";

    ArrayList<ArrayList<String>> searchInpatient;
    searchInpatient = conn.getData(sql);

    ArrayList<ArrayList<String>> searchOutpatient;
    searchOutpatient = conn.getData(sql2);

%>
<!-- Modal -->
<div class="modal fade" id="CIS030003" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Problem List</h3>
            </div>
            <div class="modal-body" >
                <center><h4>PREVIOUS VISIT (INPATIENT EPISODE) <% //out.print(pmiNo);%></h4></center>
                <div class="thumbnail"  id="inpatient" >
                    <table id="inPatient" class="table table-stripout.print(pmiNo);ed table-bordered" cellspacing="0" width="100%">
                        <thead>  
                            <tr>
                                <th class="col-sm-1">Episode Date</th>
                                <th class="col-sm-1">Health Care Facility</th>
                                <th class="col-sm-1">Discipline Name</th>
                                <th class="col-sm-1">Action</th>				 
                            </tr>
                        </thead>
                         
                            <tbody id="inpatient">
                                 <%
                                  if(searchInpatient.size() > 0){
                                      for(int i = 0; i < searchInpatient.size(); i++){
                                  
                            %>
                            <tr>
                                <td><%=searchInpatient.get(i).get(1)%>
                                 <input type="hidden" id="pmi" value="<%=searchInpatient.get(i).get(0)%>">
                                 <input type="hidden" id="episode" value="<%=searchInpatient.get(i).get(1)%>">
                                 <input type="hidden" id="discipline" value="<%=searchInpatient.get(i).get(3)%>">
                                </td>
                                <td><%=searchInpatient.get(i).get(2)%></td>
                                <td><%=searchInpatient.get(i).get(3)%></td>
                                <td><a href="#inpatientProblem" id="inBtn" name="ViewDetail" class="btn btn-default" type="button" role="button"><i class="fa fa-eye" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a></td>
                            </tr>
                            <%}}%>
                        </tbody>
                    </table>
                </div>

                <center><h4>PREVIOUS VISIT (OUTPATIENT EPISODE)</h4></center>
               <div class="thumbnail" id="outpatient">
                    <table id="outPatient"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                         <thead>  
                            <tr>
                                <th class="col-sm-1">Episode Date</th>
                                <th class="col-sm-1">Health Care Facility</th>
                                <th class="col-sm-1">Discipline Name</th>
                                <th class="col-sm-1">Action</th>				 
                            </tr>
                        </thead>
                        
    <tbody id="outpatient">
        <%
                                  if(searchOutpatient.size() > 0){
                                      for(int i = 0; i < searchOutpatient.size(); i++){
                                  
                            %>
        <tr>
             <td><%=searchOutpatient.get(i).get(1)%>
                                <input type="hidden" id="pmi1" value="<%=searchOutpatient.get(i).get(0)%>">
                                <input type="hidden" id="episode1" value="<%=searchOutpatient.get(i).get(1)%>">
                                <input type="hidden" id="discipline1" value="<%=searchOutpatient.get(i).get(3)%>">
                                </td>
                                <td><%=searchOutpatient.get(i).get(2)%></td>
                                <td><%=searchOutpatient.get(i).get(3)%></td>       
            <td>
                <a href="#outpatientProblem" id="outBtn" name="ViewDetail" class="btn btn-default" type="button" role="button"><i class="fa fa-eye" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            </td>
        </tr>
            <%
                }
            }
        %>
    </tbody>
</table>

                </div>
                <div  id="inpatientProblem">
                    
                </div>
                    
                <div  id="outpatientProblem">

                </div>

            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">

                </div>

            </div>
                            
                     <script>
                        $('#inpatient').on('click','#inBtn',function(){
                            var row = $(this).closest("tr");
                            var pmi_no = row.find("#pmi").val();
                            var episodeDate = row.find("#episode").val();
                            var discipline = row.find("#discipline").val();
                             
                             $.ajax({
                                 
                                 type: 'post',
                                 data: {pmi_no: pmi_no,episodeDate:episodeDate,discipline:discipline},
                                 url: 'search/searchInpatient.jsp',
                                 timeout: 10000,
                                 success:function(getData){
                                     if(getData.trim() === "1"){
                                         alert("No Problem!");
                                     }else{
                                     $('#inpatientProblem').html(getData);
                                 }
                             }})
                          
                          });
                        </script>
                    <script>
                        $('#outpatient').on('click','#outBtn',function(){
                            var row = $(this).closest("tr");
                            var pmi_no = row.find("#pmi1").val();
                            var episodeDate = row.find("#episode1").val();
                            var discipline = row.find("#discipline1").val();
                             
                             $.ajax({
                                 
                                 type: 'post',
                                 data: {pmi_no: pmi_no,episodeDate:episodeDate,discipline:discipline},
                                 url: 'search/searchOutpatient.jsp',
                                 timeout: 10000,
                                 success:function(getData){
                                      if(getData.trim() === "1"){
                                         alert("No Problem!");
                                     }else{
                                     $('#outpatientProblem').html(getData);
                                 }
                             }})
                          
    });
                        </script>
             <script type="text/javascript" charset="utf-8">
//                $(document).ready(function () {
//                    $('#inPatient').DataTable();
//                });

//                $(document).ready(function () {
//                    $('#outPatient').DataTable();
//                });
            </script>
 
        </div>
    </div>
</div>


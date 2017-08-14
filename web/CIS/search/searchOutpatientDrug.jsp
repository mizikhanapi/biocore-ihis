<%-- 
    Document   : searchOutpatient
    Created on : 15-Mar-2017, 13:20:06
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
//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn = new Conn();

//    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//    Date date = new Date();
    String pmi_no = request.getParameter("pmi_no");
    String episodeDate = request.getParameter("episodeDate");
    String disiplineName = request.getParameter("discipline");
    //out.println(pmi_no);
    //out.println(episodeDate);

    String sql5 = "select drug_name,drug_cd,discipline_cd,subdiscipline_cd,hfc_cd,episode_date,pmi_no from lhr_medication where pmi_no = '" + pmi_no + "' and episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> searchEpisode5 = conn.getData(sql5);

    if (searchEpisode5.size() > 0) {

    
%>
<table class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc;" id="detailDrugList">
    <strong>
        <h4>
            <b>Detail By Episode : <%out.println(episodeDate);%> - <%out.println(disiplineName);%></b>
            <a href="#outPatientDrug" id="ViewDetail" name="ViewDetail" class="btn btn-default pull-right" type="button" role="button"><i class="fa fa-arrow-up" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        </h4>
    </strong>
    <br/>
    <thead>
        <th>Name</th>
        <th>Action</th>
    </thead>
    
    <tbody id="detailbyepisode">

        <%
            for (int i = 0; i < searchEpisode5.size(); i++) {
        %>
        <tr data-status="pagado">

            <td>
                <p><strong><%=searchEpisode5.get(i).get(0)%></strong></p>
                <input type="hidden" id="idDrugOutPatient" value="<%=searchEpisode5.get(i).get(1)%>">
                <input type="hidden" id="idDrugOutPatientepisodedate" value="<%=searchEpisode5.get(i).get(5)%>">
                <input type="hidden" id="idDrugOutPatientdiscipline" value="<%=searchEpisode5.get(i).get(2)%>">
                <input type="hidden" id="idDrugOutPatientsubdiscipline" value="<%=searchEpisode5.get(i).get(3)%>">
                <input type="hidden" id="idDrugOutPatienthfc" value="<%=searchEpisode5.get(i).get(4)%>">
                <input type="hidden" id="idDrugOutPatientpmino" value="<%=searchEpisode5.get(i).get(6)%>">
            </td>
            <td>
                <button id="btnAddActivDrug" class="btn btn-success">ADD</button>
            </td>
        </tr>
        <%}%>

    </tbody>
</table>
        <script>
            $('#detailDrugList').DataTable();
        </script>
<%
    } else {
        out.println("1");
    }
%>
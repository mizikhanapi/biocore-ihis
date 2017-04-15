<%-- 
    Document   : listEmp
    Created on : Jan 20, 2017, 4:54:38 PM
    Author     : shay
--%>

<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String pmiEMP = request.getParameter("PMINO");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String empList = "select a.*,g.description,h.hfc_name from pms_employment a"
            + " left join adm_lookup_detail g on g.detail_reference_code=a.occupation_code and g.master_reference_code='0050' and g.hfc_cd ='"+hfc+"'"
            + " left join adm_health_facility h on h.hfc_cd=a.health_facility"
            + " where pmi_no = '" + pmiEMP + "'";
    ArrayList<ArrayList<String>> dataEmpList;
    dataEmpList = conn.getData(empList);


%>
<table class="table table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; " id="listEMP">
    <thead>
    <th>Employer Name</th>
    <th>Occupation</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>
    <%  for (int i = 0; i < dataEmpList.size(); i++) {
            String occuName = "select * from lookup_detail where master_ref_code = '0050' and detail_ref_code = '" + dataEmpList.get(i).get(4) + "'";
            ArrayList<ArrayList<String>> dataOcuuName;
            dataOcuuName = conn.getData(occuName);
            String occu = "";
            if (dataOcuuName.size() == 0) {
                occu = "-";
            } else {
                occu = dataOcuuName.get(0).get(2);
            }
    %>
    <tr data-status="pagado" data-toggle="modal" data-id="1" data-target="#type">
        <td id="pmiNumber"><%=dataEmpList.get(i).get(3)%></td>
<input id="empval" type="hidden" value="<%=StringUtils.join(dataEmpList.get(i), "|")%>">
<td><%=occu%></td>
<td><a id="EMPedit" name="EMPedit" data-toggle="modal" data-target="#EMPModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7; cursor: pointer;"></i></a></td>
<td><a id="EMPdel" name="EMPdel" ><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f; cursor: pointer;"></i></a></td>
</tr>
<%  }
%>
</tbody>
</table>

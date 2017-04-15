<%-- 
    Document   : CIS020011_1
    Created on : Feb 15, 2017, 10:00:30 AM
    Author     : -D-
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    String pmiNo = session.getAttribute("patientPMINo").toString();
    String hfc_cd =  session.getAttribute("HFC_NAME").toString();
    
    Conn conn = new Conn();
    
    String orderNo;
    String itemCd;
    String remarks;
    String procedureName;
    String modalityName;
    String bodySystemName;
    String diagnosis;

String sqlRIS = "select result,remark,test_date,`testTime`,specimen_no,test_name,`performBy`,`Verification` from lis_assign_result where pmi_no = '"+pmiNo+"'" ;
ArrayList<ArrayList<String>> dataRIS = conn.getData(sqlRIS);

%>
<table class="table table-striped table-filter table-bordered" id="lisTable">
    <%
        if(dataRIS.size() >0){
            %>
            <thead>
                <tr>
                    <th>Test Name</th>
                    <th>Test Date</th>
                    <th>Test Time</th>
                    <th>Result</th>
                    <th>Remarks</th>
                    <th>Perform By</th>
                    <th>Verification</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < dataRIS.size(); i++) {
                %>
                <tr>
                    <td><%out.print(dataRIS.get(i).get(5));%></td>
                    <td><%out.print(dataRIS.get(i).get(2));%></td>
                    <td><%out.print(dataRIS.get(i).get(3));%></td>
                    <td><%out.print(dataRIS.get(i).get(0));%></td>
                    <td><%out.print(dataRIS.get(i).get(1));%></td>
                    <td><%out.print(dataRIS.get(i).get(6));%></td>
                    <td><%out.print(dataRIS.get(i).get(7));%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
</table>
            <%
        } else{
out.print("No record for this moment");
}
        %>
   

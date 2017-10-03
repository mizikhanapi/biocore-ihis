<%-- 
    Document   : antenatalFunction
    Created on : Oct 2, 2017, 6:10:09 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="OnG_helper.AnteNatalRecord"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AnteNatalRecord an = new AnteNatalRecord();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    //String result;

    if (methodName.equalsIgnoreCase("add")) {
        result = an.insertBloodProfile(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("addAnte")) {
        result = an.insertAntenatal(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("getBP")) {
        ArrayList<ArrayList<String>> datas = an.getBloodProfile(data);
        if (datas.size() > 0) {

            for (int i = 0; i < datas.size(); i++) {
%>
<div class="row">
    <div class="col-xs-3">
        <dt style="font-size: 18px;">Blood Profile</dt>
    </div>
    <div class="col-xs-3">
        <dd>Blood Group: <strong><%=datas.get(i).get(4)%></strong></dd>
        <dd>Rhesus Factor: <strong><%=datas.get(i).get(6)%></strong></dd>
        <dd>VDRL: <strong><%=datas.get(i).get(8)%></strong></dd>
    </div>
    <div class="col-xs-3">
        <dd>ATT Injection: <strong><%=datas.get(i).get(5)%></strong></dd>
        <dd>Rubella Status: <strong><%=datas.get(i).get(7)%></strong></dd>
        <dd>Hepatitis B Antibody: <strong><%=datas.get(i).get(9)%></strong></dd>
        <dd>Hepatitis B Antigen: <strong><%=datas.get(i).get(10)%></strong></dd>
    </div>
    <div class="col-xs-3">
        <dd>1st dose: <strong><%=datas.get(i).get(11)%></strong></dd>
        <dd>2nd dose: <strong><%=datas.get(i).get(12)%></strong></dd>
        <dd>Booster: <strong><%=datas.get(i).get(13)%></strong></dd>
    </div>
</div>
<%          }
    }
} else if (methodName.equalsIgnoreCase("getAnte")) {

    ArrayList<ArrayList<String>> datas = an.getAnteNatal(data);
    if (datas.size() > 0) {
        for (int i = 0; i < datas.size(); i++) {
%>
<tr>
    <td><%=datas.get(i).get(3)%><input type="hidden" id="ANencounter" value="<%=datas.get(i).get(3)%>">
    <input type="hidden" id="ANepisode" value="<%=datas.get(i).get(2)%>"></td>
    <td><%=datas.get(i).get(4)%></td>
    <td><%=datas.get(i).get(5)%></td>
    <td><%=datas.get(i).get(6)%></td>
    <td><%=datas.get(i).get(7)%></td>
    <td><%=datas.get(i).get(8)%></td>
    <td><%=datas.get(i).get(9)%></td>
    <td><%=datas.get(i).get(10)%></td>
    <td><%=datas.get(i).get(11)%></td>
    <td><%=datas.get(i).get(12)%></td>
    <td><a id="delAN" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>
</tr>


<%
            }
        }

    } else if (methodName.equalsIgnoreCase("del")) {
        result = an.deleteAntenatal(data);
        out.print(result);
    }
%>
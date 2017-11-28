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
    //String methodName = "getWeek";
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
<div class="row thumbnail">
    <div class="col-xs-2">
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
    <div class="col-xs-2">
        <dd>1st dose: <strong><%=datas.get(i).get(11)%></strong></dd>
        <dd>2nd dose: <strong><%=datas.get(i).get(12)%></strong></dd>
        <dd>Booster: <strong><%=datas.get(i).get(13)%></strong></dd>
    </div>
    <div class="col-xs-2" id="keyBPDIV">
        <input type="hidden" id="updateBPKEY" value="<%=datas.get(i).get(0)+"|"+datas.get(i).get(1)+"|"+datas.get(i).get(2)+"|"+datas.get(i).get(3)+"|"+datas.get(i).get(4)+"|"+datas.get(i).get(5)+"|"+datas.get(i).get(6)+"|"+datas.get(i).get(7)+"|"+datas.get(i).get(8)+"|"+datas.get(i).get(9)+"|"+datas.get(i).get(10)+"|"+datas.get(i).get(11)+"|"+datas.get(i).get(12)+"|"+datas.get(i).get(13)+"|"+datas.get(i).get(14)+"|"+datas.get(i).get(15)%>">
        <a id="updateBp" class="testing" href="" data-toggle="modal" data-target="#ong-anteNatal1"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #488dd8;"></i></a>&nbsp;&nbsp;
        <a id="delBp" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
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
    <td><%=datas.get(i).get(4)%><input type="hidden" id="updateAnteKey" value="<%=datas.get(i).get(0)+"|"+datas.get(i).get(1)+"|"+datas.get(i).get(2)+"|"+datas.get(i).get(3)+"|"+datas.get(i).get(4)+"|"+datas.get(i).get(5)+"|"+datas.get(i).get(6)+"|"+datas.get(i).get(7)+"|"+datas.get(i).get(8)+"|"+datas.get(i).get(9)+"|"+datas.get(i).get(10)+"|"+datas.get(i).get(11)+"|"+datas.get(i).get(12)+"|"+datas.get(i).get(13)%>"></td>
    <td><%=datas.get(i).get(5)%></td>
    <td><%=datas.get(i).get(6)%></td>
    <td><%=datas.get(i).get(7)+"/"+datas.get(i).get(13)%></td>
    <td><%=datas.get(i).get(8)%></td>
    <td><%=datas.get(i).get(9)%></td>
    <td><%=datas.get(i).get(10)%></td>
    <td><%=datas.get(i).get(11)%></td>
    <td><%=datas.get(i).get(12)%></td>
    <td><a id="upAN" class="testing" data-toggle="modal" data-target="#ong-anteNatal2"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #488dd8;"></i></a>&nbsp;&nbsp;
        <a id="delAN" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>
</tr>


<%
            }
        }

    } else if (methodName.equalsIgnoreCase("del")) {
        result = an.deleteAntenatal(data);
        out.print(result);
    }else if(methodName.equalsIgnoreCase("delBP")){
        result = an.deleteBloodProfile(data);
        out.print(result);
    }else if(methodName.equalsIgnoreCase("updateAntenatal")){
        result = an.updateAntenatal(data);
        out.print(result);
    }else if(methodName.equalsIgnoreCase("updateBP")){
        result = an.updateBloodProfile(data);
        out.print(result);
    }else if(methodName.equalsIgnoreCase("getWeek")){
        String x = "B0315200272|04010101";
        ArrayList<ArrayList<String>> setering = an.getWeek(data);
        String week = setering.get(0).get(0);
        String date = setering.get(0).get(1);
        out.print(week + "|" + date);
    }
%>
<%-- 
    Document   : personalDetailFunction
    Created on : Sep 27, 2017, 4:31:05 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="OnG_helper.PersonalDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PersonalDetail pd = new PersonalDetail();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    String resulta;

    if (methodName.equalsIgnoreCase("add")) {
        result = pd.insertPersonalDetail(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("addPREG")) {
        result = pd.insertPregnancy(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("getPI")) {
        ArrayList<ArrayList<String>> datas = pd.getPersonalDetail(data);
        if (datas.size() > 0) {
            for (int i = 0; i < datas.size(); i++) {%>

<div class="row">
    <div class="col-xs-3">
        <dt style="font-size: 18px;">Personal Info</dt>
    </div>
    <div class="col-xs-3">
        <dt style="font-size: 18px;">Gravida: </dt>
        <dd class="">Gravida: <strong><%=datas.get(i).get(4)%></strong></dd>
        <dd class="">Parity: <strong><%=datas.get(i).get(5)%></strong> </dd>
        <dd class="">LMP:  <strong><%=datas.get(i).get(6)%></strong></dd>
        <dd class="">EDD:  <strong><%=datas.get(i).get(7)%></strong> </dd>
        <dd class="">Scan EDD:  <strong><%=datas.get(i).get(8)%></strong></dd>
        <dd class="">Period Cycle:  <strong><%=datas.get(i).get(9)%></strong></dd>
    </div>
    <div class="col-xs-3">
        <dt style="font-size: 18px;">Past History: </dt>
        <dd>Past gynaelogical History: <strong><%=datas.get(i).get(10)%></strong></dd>
        <dd>Past Medical History: <strong><%=datas.get(i).get(11)%></strong></dd>
        <dd>Past Surgical History: <strong><%=datas.get(i).get(12)%></strong></dd>
    </div>
</div> 
<%  }
} else { %>
<div class="row">
    <div class="col-xs-3">
        <dt style="font-size: 18px;">Personal Info</dt>
    </div>
    <div class="col-xs-3">
        <dt style="font-size: 18px;">Gravida: </dt>
        <dd class="">Gravida: <strong>-</strong></dd>
        <dd class="">Parity: <strong>-</strong> </dd>
        <dd class="">LMP  <strong>-</strong></dd>
        <dd class="">EDD  <strong>-</strong> </dd>
        <dd class="">Scan EDD  <strong>-</strong></dd>
        <dd class="">Period Cycle  <strong>-</strong></dd>
    </div>
    <div class="col-xs-3">
        <dt style="font-size: 18px;">Past History: </dt>
        <dd>Past gynaelogical History: <strong>-</strong></dd>
        <dd>Past Medical History: <strong>-</strong></dd>
        <dd>Past Surgical History: <strong>-</strong></dd>
    </div>
</div> 
<%       }
} else if (methodName.equalsIgnoreCase("getPIpreg")) {
    ArrayList<ArrayList<String>> pregnancies = pd.getPregnancy(data);
    if (pregnancies.size() > 0) {
        for (int i = 0; i < pregnancies.size(); i++) {%>
<tr>
    <td><%=i + 1%><input type="hidden" id="PIpregencounter" value="<%=pregnancies.get(i).get(3)%>">
        <input type="hidden" id="PIpregepisode" value="<%=pregnancies.get(i).get(2)%>">
        <input type="hidden" id="PIdetailsFull" value="<%=pregnancies.get(i).get(0)+"|"+pregnancies.get(i).get(1)+"|"+pregnancies.get(i).get(2)+"|"+pregnancies.get(i).get(3)+"|"+pregnancies.get(i).get(4)+"|"+pregnancies.get(i).get(5)+"|"+pregnancies.get(i).get(6)+"|"+pregnancies.get(i).get(7)+"|"+pregnancies.get(i).get(8)+"|"+pregnancies.get(i).get(9)+"|"+pregnancies.get(i).get(10)+"|"+pregnancies.get(i).get(11)%>"></td>
    <td><%=pregnancies.get(i).get(4)%></td>
    <td><%=pregnancies.get(i).get(5)%></td>
    <td><%=pregnancies.get(i).get(6)%></td>
    <td><%=pregnancies.get(i).get(7)%></td>
    <td><%=pregnancies.get(i).get(8)%></td>
    <td><%=pregnancies.get(i).get(9)%></td>
    <td><%=pregnancies.get(i).get(10)%></td>
    <td><a id="updatePIpreg" class="testing" href="" data-toggle="modal" data-target="#ong-pDetails3"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #488dd8;"></i></a>&nbsp;&nbsp;
        <a id="delPIpreg" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>
</tr>

<%    }
        }
    } else if (methodName.equalsIgnoreCase("delPreg")) {
        result = pd.deletePregnancy(data);
        out.print(result);
    }else if(methodName.equalsIgnoreCase("updatePREG")){
        result = pd.updatePregnancy(data);
        out.print(result);
}
%>

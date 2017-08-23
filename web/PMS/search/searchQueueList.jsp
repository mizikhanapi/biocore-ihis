<%-- 
    Document   : searchQueueList
    Created on : Aug 23, 2017, 5:56:57 PM
    Author     : shay
--%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    Config.getFile_url(session);
    Config.getBase_url(request);
    Conn conn = new Conn();

    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String sub = request.getParameter("sub");

    String Commonqueue = "select distinct queue_type,queue_name,user_id,hfc_cd,discipline_cd,start_date,end_date,sub_discipline_cd,status,created_by,created_date from pms_queue_list where queue_type='CM' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' group by queue_name; ";
    String Consultationqueue = "select distinct queue_type,queue_name,user_id,hfc_cd,discipline_cd,start_date,end_date,sub_discipline_cd,status,created_by,created_date  from pms_queue_list where queue_type='FY' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' group by queue_name;";
    String Doctorqueue = "select distinct queue_type,queue_name,user_id,hfc_cd,discipline_cd,start_date,end_date,sub_discipline_cd,status,created_by,created_date from pms_queue_list where queue_type='PN' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' group by queue_name;";
    ArrayList<ArrayList<String>> dataQueue2, dataQueue3, dataQueue;
    dataQueue = conn.getData(Commonqueue);
    dataQueue2 = conn.getData(Consultationqueue);
    dataQueue3 = conn.getData(Doctorqueue);
%>
<label for="radios-0">
    <input type="radio" name="radios" id="radios-0" value="Consultant Room">
    Consultant Room&nbsp;
</label>
<label for="radios-1">
    <input type="radio" name="radios" id="radios-1" value="Queue">
    Common Queue&nbsp;
</label>
<label for="radios-2">
    <input type="radio" name="radios" id="radios-2" value="Doctor">
    Doctor&nbsp;
</label>

<select id="select-0" name="select-0" class="form-control">
    <option value="null" selected="" >Please select consultation room</option>
    <%
        for (int i = 0; i < dataQueue2.size(); i++) {%>
    <option value="<%=dataQueue2.get(i).get(1) + "|" + dataQueue2.get(i).get(2)%>"><%="(" + dataQueue2.get(i).get(0) + ") " + dataQueue2.get(i).get(1)%></option>
    <%  }
    %>
</select>
<select id="select-1" name="select-1" class="form-control">
    <option selected="" value="null">Please select Queue</option>
    <%
        for (int i = 0; i < dataQueue.size(); i++) {%>
    <option value="<%=dataQueue.get(i).get(1) + "|" + dataQueue.get(i).get(2)%>"><%="(" + dataQueue.get(i).get(0) + ") " + dataQueue.get(i).get(1) + " "%></option>
    <%  }
    %>
</select>
<select id="select-2" name="select-2" class="form-control">
    <option value="null"  selected="">Please select Doctor</option>
    <%
        for (int i = 0; i < dataQueue3.size(); i++) {%>
    <option value="<%=dataQueue3.get(i).get(1) + "|" + dataQueue3.get(i).get(2)%>"><%="(" + dataQueue3.get(i).get(0) + ") " + dataQueue3.get(i).get(1)%></option>
    <%  }
    %>
</select>
<script>
    $('#select-0').hide();
    $('#select-1').hide();
    $('select[id=select-2]').hide();
    $('input:radio[name="radios"]').change(
            function () {
                if ($('#radios-0').is(':checked')) {
                    $('#select-0').show();
                    $('#select-1').hide();
                    $('select[id=select-2]').hide();
                } else if ($('#radios-1').is(':checked')) {
                    $('#select-1').show();
                    $('#select-0').hide();
                    $('select[id=select-2]').hide();
                } else if ($('#radios-2').is(':checked')) {
                    $('#select-2').show();
                    $('#select-0').hide();
                    $('select[id=select-1]').hide();
                }
            });
</script>
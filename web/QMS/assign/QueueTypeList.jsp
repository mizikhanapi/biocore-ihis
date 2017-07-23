<%-- 
    Document   : QueueTypeList
    Created on : Jul 20, 2017, 12:24:36 PM
    Author     : -D-
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>
<%
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("discipline");
    String subdis = request.getParameter("subdiscipline");

    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn Conn = new Conn();

    String Commonqueue = "select * from pms_queue_list where queue_type='CM' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' and sub_discipline_cd = '" + subdis + "' ";
    String Consultationqueue = "select * from pms_queue_list where queue_type='FY' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' and sub_discipline_cd = '" + subdis + "'";
    String Doctorqueue = "select * from pms_queue_list where queue_type='PN' and hfc_cd='" + hfc + "' and status ='Active' and discipline_cd = '" + dis + "' and sub_discipline_cd = '" + subdis + "'";
    ArrayList<ArrayList<String>> dataQueue = Conn.getData(Commonqueue);
    ArrayList<ArrayList<String>> dataQueue2 = Conn.getData(Consultationqueue);
    ArrayList<ArrayList<String>> dataQueue3 = Conn.getData(Doctorqueue);


%>

<div class="col-md-12">
<label class="col-md-4 control-label" for="selectbasic">Please select the Queue *</label>

<label class="col-md-4 control-label" for="selectbasic"></label>
<div class="col-md-6">
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
        <%                                    for (int i = 0; i < dataQueue2.size(); i++) {%>
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
</div>

<script type="text/javascript">
    $(document).ready(function () {
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

    });
</script>
</div>
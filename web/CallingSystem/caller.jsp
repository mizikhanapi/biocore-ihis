<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="bean.Calling_system_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>
<p style="text-align: right; position: absolute; top: 30px; left: 30px; color: #666; display: block; font-weight: 500; font-size: 18px;"><%

    String hfccd = "-";
    String discp = "-";
    String subdi = "-";

    try {
        hfccd = request.getParameter("hfccd");
        discp = request.getParameter("discp");
        subdi = request.getParameter("subdi");
    } catch (Exception e) {
    }

    String hfccd_str = "";
    if (hfccd != "") {
        hfccd_str = " AND cs_hfc_cd = '" + hfccd + "'";
    }
    String discp_str = "";
    if (discp != "") {
        discp_str = " AND cs_discipline = '" + discp + "'";
    }
    String subdi_str = "";
    if (subdi != "") {
        subdi_str = " AND cs_sub_discipline = '" + subdi + "'";
    }

    String sql = "SELECT * FROM calling_system WHERE 1=1" + hfccd_str + discp_str + subdi_str;

    Query q = new Query();
    ArrayList<Calling_system_bean> d = q.getQueryCallingSystem(sql);

    Date datenow = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY | HH:mm:ss");
    out.print(sdf.format(datenow));

    %></p>

<table class="table table-hover table-striped" style="background: #ffffff; text-transform: uppercase; font-weight: 500; ">
    <thead>
        <tr>
            <th style="width: 10%; text-align: left; ">Queue No.</th>
            <th style="width: 80%; text-align: left;">Name</th>

            <th style="width: 10%;">Room Name</th>
</tr>
</thead>
<tbody>
    <%            if (d.size() > 0) {
            for (int i = 0; i < d.size(); i++) {
                String cs_id = d.get(i).getCs_id();
                int cs_callingtime = d.get(i).getCs_callingtime();
    %>
    <tr>
        <td style="text-align: left; font-weight: 400; "><span id="qno_<%=i%>"><%=d.get(i).getCs_queue_no()%></span></td>
        <td style="text-align: left; font-weight: 500; padding: 30px 0; font-size: 21px;"><span id="name_<%=i%>"><%=d.get(i).getCs_patient_name()%></span></td>
        <td style="text-align: left;">
            <span style="    
                  border: 1px solid #58C102;
                  padding: 5px;
                  margin: 5px;
                  border-radius: 4px;
                  font-weight: 500;
                  color: #333;
                  font-size: 21px;" id="qname_<%=i%>"><%=d.get(i).getCs_queue_name()%></span>
            <script>
                <% if (cs_callingtime > 0) {%>
                $(document).ready(function () {
                    var name = $("#name_<%=i%>").html();
                    name = name.toLowerCase().replace(/\b[a-z]/g, function(letter) {
                return letter.toUpperCase();
            });
            
                    var qno = $("#qno_<%=i%>").html();
                    var qname = $("#qname_<%=i%>").html();
                     qname = qname.toLowerCase().replace(/\b[a-z]/g, function(letter) {
                return letter.toUpperCase();
            });
                    var ayat = name + ", Number " + qno + ", queue " + qname;
                    //var ayat = "Number " + qno + ", queue " + qname;
                    var msg = new SpeechSynthesisUtterance(ayat);
                    window.speechSynthesis.speak(msg);
                });
                <%
                        Query q2 = new Query();
                        cs_callingtime -= 1;
                        String sql2 = "UPDATE calling_system SET cs_callingtime = '" + cs_callingtime + "' WHERE cs_id = '" + cs_id + "' ";
                        q2.setQuery(sql2);
                    } else {
                    } %>
            </script>
        </td>
    </tr>
    <%
            }
        }
    %>
</tbody>
</table>
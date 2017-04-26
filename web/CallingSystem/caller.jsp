<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="bean.Calling_system_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Query"%>
<p style="text-align: right; position: absolute; top: 80px; left: 30px; color: #666; display: block; font-weight: 500; font-size: 24px;"><%

    String hfccd = "-";
    String discp = "-";
    String subdi = "-";
    Conn conn = new Conn();
    try {
        hfccd = request.getParameter("hfccd");
        discp = request.getParameter("discp");
        subdi = request.getParameter("subdi");
    } catch (Exception e) {
    }

    String hfccd_str = "";
    if (hfccd != "") {
        hfccd_str = " cs_hfc_cd = '" + hfccd + "'";
    }
    String discp_str = "";
    if (discp != "") {
        discp_str = " AND cs_discipline = '" + discp + "'";
    }
    String subdi_str = "";
    if (subdi != "") {
        subdi_str = " AND cs_sub_discipline = '" + subdi + "'";
    }

    String sql = "SELECT Id,cs_patient_name,cs_queue_no,cs_queue_name,cs_callingtime FROM qcs_calling_system_queue WHERE " + hfccd_str + discp_str + subdi_str;

    Query q = new Query();
    //ArrayList<Calling_system_bean> d = q.getQueryCallingSystem(sql);
    ArrayList<ArrayList<String>> d = conn.getData(sql);

    Date datenow = new Date();
    SimpleDateFormat tarikh = new SimpleDateFormat("dd/MM/YYYY");
    SimpleDateFormat masa = new SimpleDateFormat("HH:mm");
    SimpleDateFormat formate = new SimpleDateFormat("a");
    //out.print(sdf.format(datenow));

    %></p>
<p style="text-align: right; position: absolute; top: 37px; left: 30px; color: #666; display: block; font-weight: 500; font-size: 40px; ">
    <span style="display: block; font-size: 26px; letter-spacing: .14em; margin-bottom: -10px; font-weight: 300;"><%out.print(tarikh.format(datenow));%></span>
    <%out.print(masa.format(datenow));%>&nbsp;<%out.print(formate.format(datenow));%>
</p>

<table class="table table-hover" style="background: #ffffff; text-transform: uppercase; font-weight: 500; margin-top:-30px;">

    <tbody>
        <%            if (d.size() > 0) {
                for (int i = 0; i < d.size(); i++) {
                    String cs_id = d.get(i).get(0);
                    String number = d.get(i).get(4);
                    int cs_callingtime = Integer.parseInt(number);
        %>
        <tr>
            <td style="text-align: left; font-weight: 400; width: 5%; font-size:12px;">

                <span id="qno_<%=i%>" style="    
                      background: #58C102;
                      padding: 5px 10px;
                      margin-right: 30px;
                      font-weight: 500;
                      color: #fff; font-size: 21px;"><%=d.get(i).get(2)%></span></td>
            <td style="text-align: left; font-weight: 400; padding: 30px 0; font-size: 24px;"><span id="name_<%=i%>"><%=d.get(i).get(1)%></span></td>
            <td style="text-align: right;">
                <p style="margin-bottom: 3px; font-weight: 400;">Room No</p>
                <span style="    
                      font-weight: 500;
                      color: #333; font-size: 26px;" id="qname_<%=i%>"><%=d.get(i).get(3)%></span>
                      <%
                        String myString = d.get(i).get(2);
                        %>
                        <div id="view_VS">
                            
                        </div>
                <script>
                    <% if (cs_callingtime > 0) {%>
                    $(document).ready(function () {
                        var name = $("#name_<%=i%>").html();
                        name = name.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                            return letter.toUpperCase();
                        });

                        var qno = $("#qno_<%=i%>").html();
                        var qname = $("#qname_<%=i%>").html();
                        qname = qname.toLowerCase().replace(/\b[a-z]/g, function (letter) {
                            return letter.toUpperCase();
                        });
                        //var ayat = name + ", Number " + qno + ", " + qname;
                        var ayat1 = name+", ,"; 
                        var ayat2 = ", ,";
                        var ayat3 = ", ," + qname;
                        
                     //var ayat = "Number " + qno + ", queue " + qname;
                        //$("#view_VS").load("newjsp1.jsp?idResult="+<%=myString%>);
                        
                        
                        var msg1 = new SpeechSynthesisUtterance(ayat1);
                        window.speechSynthesis.speak(msg1);
                        
                        
                        var msg2 = new SpeechSynthesisUtterance(ayat2);
                        window.speechSynthesis.speak(msg2);
                        
                        
                        var msg3 = new SpeechSynthesisUtterance(ayat3);
                        window.speechSynthesis.speak(msg3);
                        
                        //var ayat = "Number " + qno + ", queue " + qname;
                        //var msg = new SpeechSynthesisUtterance(ayat);
                        //window.speechSynthesis.speak(msg);
                    });
                    <%
                            Query q2 = new Query();
                            cs_callingtime -= 1;
                            String sql2 = "UPDATE qcs_calling_system_queue SET cs_callingtime = '" + cs_callingtime + "' WHERE Id = '" + cs_id + "' ";
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
   
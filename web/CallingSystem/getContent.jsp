<%-- 
    Document   : getContent
    Created on : 08-Jan-2019, 16:57:18
    Author     : Shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfccd = "-";
    String discp = "-";
    String subdi = "-";

    Conn conn = new Conn();

    hfccd = request.getParameter("hfccd");
    discp = request.getParameter("discp");
    subdi = request.getParameter("subdi");
//                        0     1              2            3                   4           5       6        7                             8
    String sql = "SELECT id,cs_hfc_cd,cs_discipline,cs_sub_discipline,cs_episode_date,cs_title,cs_content,date_format(cs_date,'%d.%M'),cs_img FROM qcs_calling_system_content "
            + "where cs_hfc_cd = '" + hfccd + "' and cs_discipline='" + discp + "'";

    ArrayList<ArrayList<String>> d = conn.getData(sql);

//out.print(sql);
%>
<ol class="carousel-indicators hidden">
    <% for (int i = 0; i < d.size(); i++) {
        if(i==0){ %>
            <li data-target="#carousel-example-generic" data-slide-to="<%=i%>" class="active"></li>
     <%   }else{ %>
            <li data-target="#carousel-example-generic" data-slide-to="<%=i%>"></li>
<% }
} %>
</ol>

<!-- Wrapper for slides -->
<div class="carousel-inner" role="listbox">
    <%   if (d.size() > 0) {
             for (int i = 0; i < d.size(); i++) {
    if(i==0){ %>
            <div class="item calling-panel active">
                <img src="<%=d.get(i).get(8)%>">
        <div class="carousel-caption">
            <h3><%=d.get(i).get(5)%></h3>
            <p><%=d.get(i).get(6)%></p>
        </div>
    </div>
     <%   }else{ %>
     <div class="item calling-panel">
        <img src="<%=d.get(i).get(8)%>">
        <div class="carousel-caption">
            <h3><%=d.get(i).get(5)%></h3>
            <p><%=d.get(i).get(6)%></p>
        </div>
    </div>
<% }
    
    
    %>

    

    <%   }
    }%>
</div>
<!-- Controls -->
<a class="left carousel-control " href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
</a>
<a class="right carousel-control " href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
</a>
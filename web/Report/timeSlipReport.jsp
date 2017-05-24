<%-- 
    Document   : timeslip
    Created on : Feb 16, 2017, 5:04:53 AM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Time"%>


        <%
            Conn conn = new Conn();
            String my_1_gamba = "";
            String my_1_nama = "";
            String my_1_role = "";
            String my_1_hfcName = "";
            String my_1_hfc_cd = "";
            String my_1_user_id = "";
            String my_1_dis_cd = "";
            String my_1_sub_cd = "";
            String my_1_dis_name = "";
            String my_1_sub_name = "";

            if (session.getAttribute("USER_NAME") != null) {

                my_1_gamba = session.getAttribute("PICTURE").toString();
                my_1_nama = session.getAttribute("USER_NAME").toString();
                my_1_role = session.getAttribute("ROLE_NAME").toString();
                my_1_hfcName = session.getAttribute("HFC_NAME").toString();
                my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                my_1_user_id = (String) session.getAttribute("USER_ID");
                my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
                my_1_dis_name = (String) session.getAttribute("DISCIPLINE_NAME");
                my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
                my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
                my_1_sub_name = (String) session.getAttribute("SUB_DISCIPLINE_NAME");

            }
            String sql = "SELECT address1 FROM adm_health_facility WHERE hfc_cd = '"+my_1_hfc_cd+"'";
            ArrayList<ArrayList<String>> add = conn.getData(sql);
            String name = request.getParameter("name");
            String episode = request.getParameter("episode");
            String pmi = request.getParameter("pmi");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String comment = request.getParameter("comment");
            String ic = request.getParameter("ic");


            //int days = daysBetween(start_date, end_date).getDays();

        %>
        <center><%=my_1_hfcName%><br><%=add.get(0).get(0)%></center><br>
        <div class="col-md-12">
            <div class="form-group">
                <label for=""> Dengan ini saya mengesahkan bahawa saya telah memriksa:</label>
                <br>
                <label for=""> Encik/Cik/Puan: <%=name%></label>
                <br>
                <label for=""> No. K/P: <%=ic%> dan mendapati yang beliau</label>
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label for=""> a)Tidak sihat untuk menjalankan tugasanya dengan sempurna selama <=%%> hari daripada <%=start_date%> hingga <%=end_date%></label>
                <br>
                <label for=""> b)Boleh bertugas semula pada</label>
                <br>
                <label for=""> c)Komen: <%=comment%></label>
            </div>
        </div>
        <br>
        <div class="col-md-6">
            <div class="form-group">
                <label for="">Tarikh: <%=episode%></label>
                <br>
                <br>
                <br>
                <label for="">...............................................</label><br>
                <label for=""><%=my_1_hfcName%></label>
            </div>
        </div>


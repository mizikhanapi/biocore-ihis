<%-- 
    Document   : connectDB
    Created on : Nov 24, 2016, 2:35:33 PM
    Author     : user
--%>
<%@ page import ="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

        <%
           
                Conn Conn = new Conn();
                String pmiNo = request.getParameter("pmiNo");
                String dataUserId = request.getParameter("dataUserId");
                String ic = request.getParameter("ic");
                String discipline = request.getParameter("discipline");
                String subdiscipline = request.getParameter("subdiscipline");
                String doctor = request.getParameter("doctor");
                String dateAppointment = request.getParameter("dateAppointment");
                String timeAppointment = request.getParameter("timeAppointment");
                String datetimeAppoinment = dateAppointment + " " + timeAppointment;
                String typeAppointment = request.getParameter("typeAppointment");
                //String hfcCode = request.getParameter("HfcCode");
                String hfc_cd = request.getParameter("HfcCode");

                //INSERT CODE
                RMIConnector rmic = new RMIConnector();
                String sqlInsert = "INSERT INTO pms_appointment (pmi_no, hfc_cd, appointment_date, module_cd, hfc_to, txn_date, location_cd, userid, encounter_date, episode_date, order_no, appointment_type, register_status, status, remarks, start_time, end_time, discipline, subdiscipline, created_by, created_date) "
                                    + "VALUES ('"+pmiNo+"' , '"+hfc_cd+"','"+datetimeAppoinment+"','-','-','0000-00-00','-','"+doctor+"','0000-00-00','0000-00-00','-','"+typeAppointment+"','-','active','pending','"+datetimeAppoinment+"','0000-00-00','"+discipline+"','"+subdiscipline+"','"+ic+"',now())";

                rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
                out.print(sqlInsert);
                //out.print("appointmentInsert");
                

               
          
        %>

<%-- 
    Document   : login_process
    Created on : Mar 28, 2016, 10:46:43 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
   //                       0           1               2        3          4               5               6               7
    String sql1 ="SELECT st.ic_no, st.username, st.password, st.`name`, st.birth_date, pb.`PMI_NO`, pb.`PATIENT_NAME`, pb.`ID_NO`"
            + " FROM adm_signup_tbl st "
            + "INNER JOIN pms_patient_biodata pb ON pb.`NEW_IC_NO` = st.ic_no "
            + "WHERE username = '"+username+"'";
    ArrayList<ArrayList<String>> dataPatient = Conn.getData(sql1);
    
//    out.print(sql1); if (true) { return; };
                //             0                1               2           3           4               5           
    String sql2 = "SELECT `USER_ID`,`HEALTH_FACILITY_CODE`,`USER_NAME`,`PASSWORD`,`OCCUPATION_CODE`,`PICTURE` FROM adm_users WHERE USER_ID= '" + username + "'";
    ArrayList<ArrayList<String>> dataStaff = Conn.getData(sql2);

    
    if(dataPatient.size() > 0)                                                      //login patient
    { 
        for(int index=0; index<dataPatient.size(); index++)
        {
            if(dataPatient.get(index).get(2).equals(password))
            {
                session.setAttribute("username", username);
                String ic = dataPatient.get(index).get(0) ;
                String val1 = dataPatient.get(index).get(1) ;
                String val2 = dataPatient.get(index).get(2) ;
                String val3 = dataPatient.get(index).get(3) ;
                String val4 = dataPatient.get(index).get(4) ;
                session.setAttribute("ic", ic);
                session.setAttribute("val1", val1);
                session.setAttribute("val2", val2);
                session.setAttribute("val3", val3);
                session.setAttribute("val4", val4);
                session.setAttribute("OCCUPATION_CODE", "PATIENT"); 
                session.setAttribute("PMI_NO", dataPatient.get(index).get(5)); 
                session.setAttribute("PATIENT_NAME", dataPatient.get(index).get(6)); 
                session.setAttribute("ID_NO", dataPatient.get(index).get(7)); 
                response.sendRedirect("patientSelectHFC.jsp");
            }
            else
            {
                %><script language='javascript'>
                    alert("The password you have entered is incorrect");
                    window.location= 'login.jsp';
                </script> <%
            }
        }
        
    }    else if (dataStaff.size() > 0) // login Staff (admin, nurse, doctor)
        {
            String getDISSUB = "select `DISCIPLINE_CODE`,`SUBDISCIPLINE_CODE` from adm_user_access_role WHERE `USER_ID` = '" + username + "'";
            ArrayList<ArrayList<String>> datagetDISSUB = Conn.getData(getDISSUB);
            String disCode = null;
            String subCode = null;
            disCode = datagetDISSUB.get(0).get(0);
            subCode = datagetDISSUB.get(0).get(1);
            for (int i = 0; i < dataStaff.size(); i++) {
                if (dataStaff.get(i).get(4).equals("002")) //doctor
                {
                    if (dataStaff.get(i).get(3).equals(password)) {
                        session.setAttribute("username", username);
                        String hfc = dataStaff.get(0).get(1);
                        String title = dataStaff.get(i).get(4);
                        session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                        session.setAttribute("OCCUPATION_CODE", title);
                        String name = dataStaff.get(0).get(2);
                        session.setAttribute("USER_NAME", name);
                        session.setAttribute("DISCIPLINE_CODE", disCode);
                        session.setAttribute("SUBDISCIPLINE_CODE", subCode);
                        session.setAttribute("PICTURE", dataStaff.get(i).get(5));
                        response.sendRedirect("medicalStaffDoctorAjax.jsp");
                        
 
                    } else {

                %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%                        }
                } else if (dataStaff.get(i).get(4).equals("001")) //admin
                {
                    if (dataStaff.get(i).get(3).equals(password)) {
                        session.setAttribute("username", username);
                        String hfc = dataStaff.get(0).get(1);
                        String title = dataStaff.get(i).get(4);
                        session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                        session.setAttribute("OCCUPATION_CODE", title);
                        String name = dataStaff.get(0).get(2);
                        session.setAttribute("USER_NAME", name);
                        session.setAttribute("DISCIPLINE_CODE", disCode);
                        session.setAttribute("SUBDISCIPLINE_CODE", subCode);
                        session.setAttribute("PICTURE", dataStaff.get(i).get(5));
                        //                session.setAttribute("newSession", "success");
                        response.sendRedirect("adminAppointmentAjax.jsp");

                    } else {
                %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%
                    }

                } else //nurse
                {
                    if (dataStaff.get(i).get(3).equals(password)) {
                        session.setAttribute("username", username);
                        String name = dataStaff.get(0).get(2);
                        session.setAttribute("USER_NAME", name);
                        String hfc = dataStaff.get(0).get(1);
                        session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                        String title = dataStaff.get(0).get(4);
                        session.setAttribute("OCCUPATION_CODE", title);
                        response.sendRedirect("medicalStaffNurseAjax.jsp");
                    } else {

                %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%                                    }
                                }
                            }
                        }
    else if(dataStaff.size() > 0)                                                   // login Staff (admin, nurse, doctor)
    {
        for(int i=0; i<dataStaff.size(); i++)
        {          
            if(dataStaff.get(i).get(4).equals("002"))                            //doctor
            {   
                if(dataStaff.get(i).get(3).equals(password))
                {
                    session.setAttribute("username", username);
                    String hfc = dataStaff.get(0).get(1) ;
                    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                    String name = dataStaff.get(0).get(2) ;
                    session.setAttribute("USER_NAME", name);
                    String title = dataStaff.get(0).get(4) ;
                    session.setAttribute("OCCUPATION_CODE", title);                  
                    response.sendRedirect("medicalStaffDoctorAjax.jsp");
                }
                else
                {

                    %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%
                }
            }
            else if(dataStaff.get(i).get(4).equals("001"))         //admin
            {
                if(dataStaff.get(i).get(3).equals(password))
                {
                    session.setAttribute("username", username);
                    String hfc = dataStaff.get(0).get(1) ;
                    String title = dataStaff.get(i).get(4);
                    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                    session.setAttribute("OCCUPATION_CODE", title);    
                    String name = dataStaff.get(0).get(2) ;
                    session.setAttribute("USER_NAME", name);

    //                session.setAttribute("newSession", "success");
                   response.sendRedirect("adminAppointmentAjax.jsp");     

                }
                else
                {
                    %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%
                }
                
            }
            else                                                                    //nurse
            {
                if(dataStaff.get(i).get(3).equals(password))
                {
                    session.setAttribute("username", username);
                    String name = dataStaff.get(0).get(2) ;
                    session.setAttribute("USER_NAME", name);
                    String hfc = dataStaff.get(0).get(1) ;
                    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
                    String title = dataStaff.get(0).get(4) ;
                    session.setAttribute("OCCUPATION_CODE", title);
                    response.sendRedirect("medicalStaffNurseAjax.jsp");
                }
                else
                {
 
                    %><script language='javascript'>
                        alert("The password you have entered is incorrect");
                        window.location= 'login.jsp';
                    </script> <%
                }
            }
        }
    }
    else
    {%>
        <script language='javascript'>
            alert("Your account does not exist. Please register or contact your admin");
            window.location= 'login.jsp';
        </script> <%
    }
%>

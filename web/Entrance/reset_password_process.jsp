<%-- 
    Document   : reset_password_process
    Created on : Mar 6, 2017, 4:34:06 PM
    Author     : user
--%>

<%@page import="ADM_helper.Emailer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();

    String userID = request.getParameter("userID");
    String IC = request.getParameter("IC");
    String mother = request.getParameter("mother");
    String process = request.getParameter("process");

    if (process.equalsIgnoreCase("check")) {

        mother = mother.toUpperCase();

        String sql = "Select user_id from adm_users where user_id = '" + userID + "' AND new_icno = '" + IC + "' AND mother_name = '" + mother + "' LIMIT 1";

        ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

        if (dataUser.size() > 0) {

            out.print("success");

        } else {

            out.print("Information that you have provided is wrong");
        }

    }// end if check
    else if (process.equalsIgnoreCase("reset")) {

        String sqlUpdate = "Update adm_users set password = 'abc123' where user_id = '" + userID + "'";
        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

        if (isUpdate) {
            out.print("success");

        } else {
            out.print("fail");

        }

    }// end if reset
    else if (process.equalsIgnoreCase("email")) {

        //                          0      1        2       3
        String sql = "Select user_name, email, user_id, password from adm_users where user_id = '" + userID + "' LIMIT 1";

        ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

        if (dataUser.size() > 0) {
            String strMessage = "Dear " + dataUser.get(0).get(0) + ", "
                    + "\n\nPlease do not disclose the following information to others. \n"
                    + "\n\t Your user ID: " + dataUser.get(0).get(2) + " "
                    + "\n\t Your password: " + dataUser.get(0).get(3) + " "
                    + "\n\n Please remember your password next time.";
            
            String subject = "i-HIS. NO REPLY";
            String email = dataUser.get(0).get(1);
            
            Emailer es = new Emailer(email, subject, strMessage);
            
            boolean isSent = es.sendTextEmail();
            
            String result = isSent? "success" : "fail";
            
            ArrayList<String> arrResult = new ArrayList<String>();
            arrResult.add(dataUser.get(0).get(0));
            arrResult.add(dataUser.get(0).get(1));
            arrResult.add(dataUser.get(0).get(2));
            arrResult.add(result);

            String data = String.join("|", arrResult);

            out.print(data);
        } else {
            out.print("|fail");
        }

    } else {
        out.print("What?");
    }


%>

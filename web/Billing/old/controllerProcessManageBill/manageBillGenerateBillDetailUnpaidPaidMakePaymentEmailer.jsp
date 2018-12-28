<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidMakePaymentEmailer
    Created on : Mar 22, 2018, 9:31:15 AM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="ADM_helper.Emailer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();

    DecimalFormat df = new DecimalFormat("0.00");

    String customerNo = request.getParameter("customerNo");
    String billNo = request.getParameter("billNo");

    //                          0           1   
    String sql = "Select PATIENT_NAME, EMAIL_ADDRESS from pms_patient_biodata where PMI_NO = '" + customerNo + "' LIMIT 1";

    ArrayList<ArrayList<String>> dataCustomer = conn.getData(sql);

    //                                   0        1         2   
    String sqlItemMaster = "Select item_amt, amt_given, amt_change from far_customer_hdr where bill_no = '" + billNo + "' LIMIT 1";

    ArrayList<ArrayList<String>> dataMaster = conn.getData(sqlItemMaster);

    //                                   0        1         2       3
    String sqlItemDetail = "Select item_cd, item_desc, item_amt, quantity from far_customer_dtl where bill_no = '" + billNo + "'";

    ArrayList<ArrayList<String>> dataDetail = conn.getData(sqlItemDetail);

    if (dataCustomer.size() > 0) {

        String strMessageHeader = "Dear " + dataCustomer.get(0).get(0) + ",\n\n\n\n";

        String strMessageItemMain = "Following is the details of your purchase.\n\n";
        int num = 1;

        for (int i = 0; i < dataDetail.size(); i++) {

            if (dataDetail.get(i).get(0).contains("BP001") == true) {

            } else if (dataDetail.get(i).get(0).contains("BP002") == true) {

            } else if (dataDetail.get(i).get(0).contains("BP003") == true) {

            } else {

                String strMessageItemIn = num + ". " + dataDetail.get(i).get(1) + " (" + dataDetail.get(i).get(0) + ")\n";
                strMessageItemMain = strMessageItemMain + strMessageItemIn;
                num++;

            }
        }

        String strMessagePrice = "\nGrand Total = RM " + df.format(Double.parseDouble(dataMaster.get(0).get(0))) + " "
                + "\nAmount Paid = RM " + df.format(Double.parseDouble(dataMaster.get(0).get(1))) + " "
                + "\nAmount Change = RM " + df.format(Double.parseDouble(dataMaster.get(0).get(2))) + " ";

        String strMessageFooter = "\n\n\n\nPlease do not reply to this email as it is computer generated email..."
                + "\nThank You. Have A Good Day...";

        String strMessage = strMessageHeader + strMessageItemMain + strMessagePrice + strMessageFooter;

        String subject = "i-HIS. NO REPLY";
        String email = dataCustomer.get(0).get(1);

        Emailer es = new Emailer(email, subject, strMessage);

        boolean isSent = es.sendTextEmail();

        if (isSent = true) {
            out.print("Email Ok");
        }

    } else {
        out.print("Email NOK");
    }


%>
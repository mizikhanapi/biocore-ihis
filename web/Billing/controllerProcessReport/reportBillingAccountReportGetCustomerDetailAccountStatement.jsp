<%-- 
    Document   : reportBillingAccountReportGetCustomerDetailAccountStatement
    Created on : Nov 29, 2017, 2:45:22 AM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%

    Conn con = new Conn();

    // Creating Format Date And Year
    DateTimeFormatter formatYear = DateTimeFormatter.ofPattern("yyyy");
    DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    LocalDateTime now = LocalDateTime.now();

    // Creating Date And Year
    String date = formatDate.format(now);
    String currentYear = formatYear.format(now);

    // Generate Decimal Format
    DecimalFormat df = new DecimalFormat("0.00");
    DecimalFormat dfQuan = new DecimalFormat("0");

    // Generate Parameter
    String ic = request.getParameter("ic");
    String month = request.getParameter("month");
    String year = request.getParameter("year");
    String monthString = request.getParameter("monthString");
    String period = year + "-" + month;

    // Get Session Parameter
    String userId = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    // Get HFC Details SQL
    String queryLogo = "SELECT logo, hfc_name, CONCAT(address1,' ',address2,' ',address3) FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);

    // Declare Variable
    double debit = 0;
    double credit = 0;
    String logoHFC = "";
    String nameHFC = "";
    String addressHFC = "";
    String receiptNo = "";
    int num = 1;

    // Get HFC Details
    if (dataLogo.size()
            > 0) {

        if (dataLogo.get(0).get(0) != null) {

            logoHFC = dataLogo.get(0).get(0);
            nameHFC = dataLogo.get(0).get(1);
            addressHFC = dataLogo.get(0).get(2);

        }

    }

    String sql1 = "SELECT pb.pmi_no, pb.patient_name, pb.id_no, pb.home_address, pb.mobile_phone, pb.email_address "
            + " FROM pms_patient_biodata pb "
            + " LEFT JOIN far_customer_ledger cl ON (pb.pmi_no = cl.customer_id) "
            + " WHERE pb.new_ic_no = '" + ic + "' AND cl.hfc_cd = '" + hfc_cd + "' ";

    ArrayList<ArrayList<String>> dataPatient = con.getData(sql1);

    String pmiNo = dataPatient.get(0).get(0);
    String name = dataPatient.get(0).get(1);
    String address = dataPatient.get(0).get(3);
    String email = dataPatient.get(0).get(5);

    String sql2 = " SELECT ch.txn_date, ch.bill_no, ch.item_amt, ch.amt_paid  "
            + " FROM far_customer_hdr ch "
            + " LEFT JOIN pms_patient_biodata pb ON (ch.customer_id = pb.pmi_no) "
            + " WHERE pb.new_ic_no = '" + ic + "' AND ch.hfc_cd = '" + hfc_cd + "'   "
            + " AND ch.txn_date LIKE '%" + period + "%' "
            + " ORDER BY ch.txn_date, ch.bill_no ";

    ArrayList<ArrayList<String>> dataBill = con.getData(sql2);

%>

<div id="billingReportAccountReportGenerateReportForPrintContainer" >
    <div style=" margin: auto; width: 100%;">
        <div class="logo-hfc asset-print-img"  style="text-align: center;">
            <p style="font-weight: bold;">
                <span style="font-size: 16pt;"><%=nameHFC%></span>
                <br>
                ( <span style="font-size: 10pt;"><%=addressHFC%></span> )
            </p>
        </div>
        <br>
        <hr/>
        <div id="mainConainerForCustomerYearlyStatement">
            <div class="center-block"  style="text-align: center;">
                <h2>
                    Customer Detail Account Statement <br> for <%=monthString%> of <%=year%>
                </h2>
            </div>
            <br>
            <div class="center-block row" >
                <div class="col-md-3" style="font-size: 11pt; display: table-cell;padding-left: 12px;">
                    <p><b>Name</b></p>
                    <p><b>Address</b></p>
                    <p><b>Report Date</b></p>
                </div>
                <div class="col-md-9" style="font-size: 11pt; display: table-cell;padding-left: 15px;padding-right: 12px;">
                    <p>:  <%=name%></p>
                    <p>:  <%=address%></p>
                    <p>:  <%=date%></p>
                </div>
            </div>  
            <br><br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5" border="1">
                    <thead>
                        <tr>
                            <th width="30%">Txt Date</th>
                            <th style="text-align: center;" width="50%">Description</th>
                            <th style="text-align: center;" width="20%">Amount (RM)</th>
                        </tr>
                    </thead>
                    <tbody> 
                        <%
                            for (int i = 0; i < dataBill.size(); i++) {

                                String dateHdr = dataBill.get(i).get(0);
                                String billNo = dataBill.get(i).get(1);
                                String billAmt = dataBill.get(i).get(2);
                                String amtPaid = dataBill.get(i).get(3);

                                debit += Double.parseDouble(amtPaid);
                                credit += Double.parseDouble(billAmt);
                        %>
                        <tr>
                            <td><%=dateHdr%></td>
                            <td style="text-align: center;"><%=billNo%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(billAmt))%></td>
                        </tr> 
                        <% }
                        %>
                    </tbody>
                </table>
            </div>
            <br>
            <br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5">
                    <thead>
                        <tr>
                            <th style="text-align: left;" width="70%">Total Credit of <%=monthString%> (RM)</th>
                            <td style="text-align: right;" width="30%"><%=df.format(credit)%></td>
                        </tr>
                        <tr>
                            <th style="text-align: left;" width="70%">Total Debit of <%=monthString%> (RM)</th>
                            <td style="text-align: right;" width="30%"><%=df.format(debit)%></td>
                        </tr>
                    </thead>
                </table>
            </div>
            <br>
            <hr/>
            <div class="center-block">
                <div style="font-size: 12pt;text-align: center;font-weight: bold;">
                    <p>***** Thank You *****</p>
                </div>
            </div>  
        </div>  
    </div>
</div>

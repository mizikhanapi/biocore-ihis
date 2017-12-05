<%-- 
    Document   : reportBillingAccountReportGetCustomerYearlyStatement
    Created on : Nov 28, 2017, 6:13:04 PM
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

    // Get Session Parameter
    String userId = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    // Get HFC Details SQL
    String queryLogo = "SELECT logo, hfc_name, CONCAT(address1,' ',address2,' ',address3) FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);

    // Declare Variable
    String pmiNo = "";
    String name = "";
    String idNo = "";
    String address = "";
    String phone = "";
    String email = "";
    String cr1 = "";
    String cr2 = "";
    String cr3 = "";
    String cr4 = "";
    String cr5 = "";
    String cr6 = "";
    String cr7 = "";
    String cr8 = "";
    String cr9 = "";
    String cr10 = "";
    String cr11 = "";
    String cr12 = "";
    String dr1 = "";
    String dr2 = "";
    String dr3 = "";
    String dr4 = "";
    String dr5 = "";
    String dr6 = "";
    String dr7 = "";
    String dr8 = "";
    String dr9 = "";
    String dr10 = "";
    String dr11 = "";
    String dr12 = "";
    String yearCredit = "";
    String yearDebit = "";
    String lastYearCredit = "";
    String lastYearDebit = "";
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

    String sql = " SELECT pb.pmi_no, pb.patient_name, pb.new_ic_no, pb.id_no, pb.home_address, pb.mobile_phone, pb.email_address, "
            //credit of month
            + " IFNULL(cl.cr_amt_1, 0), IFNULL(cl.cr_amt_2, 0), IFNULL(cl.cr_amt_3, 0), IFNULL(cl.cr_amt_4, 0), "
            + " IFNULL(cl.cr_amt_5, 0), IFNULL(cl.cr_amt_6, 0), IFNULL(cl.cr_amt_7, 0), IFNULL(cl.cr_amt_8, 0), "
            + " IFNULL(cl.cr_amt_9, 0), IFNULL(cl.cr_amt_10, 0), IFNULL(cl.cr_amt_11, 0), IFNULL(cl.cr_amt_12, 0), "
            //debit of month
            + " IFNULL(cl.dr_amt_1, 0), IFNULL(cl.dr_amt_2, 0), IFNULL(cl.dr_amt_3, 0), IFNULL(cl.dr_amt_4, 0), "
            + " IFNULL(cl.dr_amt_5, 0), IFNULL(cl.dr_amt_6, 0), IFNULL(cl.dr_amt_7, 0), IFNULL(cl.dr_amt_8, 0), "
            + " IFNULL(cl.dr_amt_9, 0), IFNULL(cl.dr_amt_10, 0), IFNULL(cl.dr_amt_11, 0), IFNULL(cl.dr_amt_12, 0), "
            //total credit of a year
            + " IFNULL(cl.cr_amt_1, 0)+IFNULL(cl.cr_amt_2, 0)+IFNULL(cl.cr_amt_3, 0)+IFNULL(cl.cr_amt_4, 0)+"
            + " IFNULL(cl.cr_amt_5, 0)+IFNULL(cl.cr_amt_6, 0)+IFNULL(cl.cr_amt_7, 0)+IFNULL(cl.cr_amt_8, 0)+"
            + " IFNULL(cl.cr_amt_9, 0)+IFNULL(cl.cr_amt_10, 0)+IFNULL(cl.cr_amt_11, 0)+IFNULL(cl.cr_amt_12, 0), "
            //total debit of a year
            + " IFNULL(cl.dr_amt_1, 0)+IFNULL(cl.dr_amt_2, 0)+IFNULL(cl.dr_amt_3, 0)+IFNULL(cl.dr_amt_4, 0)+"
            + " IFNULL(cl.dr_amt_5, 0)+IFNULL(cl.dr_amt_6, 0)+IFNULL(cl.dr_amt_7, 0)+IFNULL(cl.dr_amt_8, 0)+"
            + " IFNULL(cl.dr_amt_9, 0)+IFNULL(cl.dr_amt_10, 0)+IFNULL(cl.dr_amt_11, 0)+IFNULL(cl.dr_amt_12, 0), "
            //total debit and credit of last year
            + " IFNULL(cl.cr_amt_13, 0), IFNULL(cl.dr_amt_13, 0) "
            // From and
            + " FROM far_customer_ledger cl LEFT JOIN pms_patient_biodata pb ON (pb.pmi_no = cl.customer_id)  "
            + " WHERE pb.new_ic_no = '" + ic + "' AND cl.hfc_cd = '" + hfc_cd + "' ";

    ArrayList<ArrayList<String>> data = con.getData(sql);

    for (int i = 0; i < data.size(); i++) {

        pmiNo = data.get(i).get(0);
        name = data.get(i).get(1);
        idNo = data.get(i).get(3);
        address = data.get(i).get(4);
        phone = data.get(i).get(5);
        email = data.get(i).get(6);
        cr1 = data.get(i).get(7);
        cr2 = data.get(i).get(8);
        cr3 = data.get(i).get(9);
        cr4 = data.get(i).get(10);
        cr5 = data.get(i).get(11);
        cr6 = data.get(i).get(12);
        cr7 = data.get(i).get(13);
        cr8 = data.get(i).get(14);
        cr9 = data.get(i).get(15);
        cr10 = data.get(i).get(16);
        cr11 = data.get(i).get(17);
        cr12 = data.get(i).get(18);
        dr1 = data.get(i).get(19);
        dr2 = data.get(i).get(20);
        dr3 = data.get(i).get(21);
        dr4 = data.get(i).get(22);
        dr5 = data.get(i).get(23);
        dr6 = data.get(i).get(24);
        dr7 = data.get(i).get(25);
        dr8 = data.get(i).get(26);
        dr9 = data.get(i).get(27);
        dr10 = data.get(i).get(28);
        dr11 = data.get(i).get(29);
        dr12 = data.get(i).get(30);
        yearCredit = data.get(i).get(31);
        yearDebit = data.get(i).get(32);
        lastYearCredit = data.get(i).get(33);
        lastYearDebit = data.get(i).get(34);

    }

    double deficient = 0;
    double totalYearCredit = 0;
    double totalYearDebit = 0;

    totalYearCredit = Double.parseDouble(yearCredit) + Double.parseDouble(lastYearCredit);
    totalYearDebit = Double.parseDouble(yearDebit) + Double.parseDouble(lastYearDebit);
    deficient = totalYearCredit - totalYearDebit;
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
                    Customer Yearly Account Statement (<%=currentYear%>)
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
                            <th width="60%">Month</th>
                            <th style="text-align: center;" width="20%">Debit</th>
                            <th style="text-align: center;" width="20%">Credit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>January</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr1))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr1))%></td>
                        </tr>
                        <tr>
                            <td>February</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr2))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr2))%></td>
                        </tr>
                        <tr>
                            <td>March</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr3))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr3))%></td>
                        </tr>
                        <tr>
                            <td>April</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr4))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr4))%></td>
                        </tr>
                        <tr>
                            <td>May</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr5))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr5))%></td>
                        </tr>
                        <tr>
                            <td>June</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr6))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr6))%></td>
                        </tr>
                        <tr>
                            <td>July</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr7))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr7))%></td>
                        </tr>
                        <tr>
                            <td>August</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr8))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr8))%></td>
                        </tr>
                        <tr>
                            <td>September</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr9))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr9))%></td>
                        </tr>
                        <tr>
                            <td>October</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr10))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr10))%></td>
                        </tr>
                        <tr>
                            <td>November</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr11))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr11))%></td>
                        </tr>
                        <tr>
                            <td>December</td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(dr12))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(cr12))%></td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Total</th>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(yearDebit))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(yearCredit))%></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <br>
            <br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5">
                    <thead>
                        <tr>
                            <th style="text-align: left;" width="70%">Credit of last year (RM)</th>
                            <td style="text-align: right;" width="30%"><%=df.format(Double.parseDouble(lastYearCredit))%></td>
                        </tr>
                        <tr>
                            <th style="text-align: left;" width="70%">Debit of last year (RM)</th>
                            <td style="text-align: right;" width="30%"><%=df.format(Double.parseDouble(lastYearDebit))%></td>
                        </tr>
                        <tr>
                            <th style="text-align: left;" width="70%"></th>
                            <td style="text-align: right;" width="30%"></td>
                        </tr>
                        <tr>
                            <th style="text-align: left;" width="70%"></th>
                            <td style="text-align: right;" width="30%"></td>
                        </tr>
                        <tr>
                            <th style="text-align: left;" width="70%">Total Credit (RM)</th>
                            <td style="text-align: right;" width="30%"><%=df.format(totalYearCredit)%></td>
                        </tr>
                        <tr>
                            <th style="text-align: left;" width="70%">Total Debit (RM)</th>
                            <td style="text-align: right;" width="30%"><%=df.format(totalYearDebit)%></td>
                        </tr>
                        <tr>
                            <th style="text-align: left;" width="70%">Deficient (RM)</th>
                            <td style="text-align: right;" width="30%"><%=df.format(deficient)%></td>
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

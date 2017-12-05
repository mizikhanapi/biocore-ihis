<%-- 
    Document   : reportBillingAccountGetYearEndProcessingReport
    Created on : Nov 29, 2017, 6:24:05 AM
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

    // Get Session Parameter
    String userId = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    // Get HFC Details SQL
    String queryLogo = "SELECT logo, hfc_name, CONCAT(address1,' ',address2,' ',address3) FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);

    // Declare Variable
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

    // Get Processed Year
    String sqlYear = "SELECT processed_year "
            + "FROM far_year_end_parameter "
            + "WHERE code = 'yep' AND hfc_cd = '" + hfc_cd + "'";

    ArrayList<ArrayList<String>> yep = con.getData(sqlYear);
    String processedYear = yep.get(0).get(0);

    // Get Processed Year Details
    String sql = "SELECT pb.patient_name, cl.customer_id, IFNULL(cl.dr_amt_13, 0), IFNULL(cl.cr_amt_13,0), cl.hfc_cd "
            + " FROM far_customer_ledger cl  "
            + " LEFT JOIN pms_patient_biodata pb ON (cl.customer_id = pb.pmi_no) "
            + " WHERE cl.hfc_cd = '" + hfc_cd + "' ";

    ArrayList<ArrayList<String>> data = con.getData(sql);

    // Parameter Needed
    double deficient = 0;
    double totalYearCredit = 0;
    double totalYearDebit = 0;

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
                    Customer Detail Account Statement <br> for <%=processedYear%>
                </h2>
            </div>
            <br>
            <div class="center-block row" >
                <div class="col-md-3" style="font-size: 11pt; display: table-cell;padding-left: 12px;">
                    <p><b>Report Date</b></p>
                </div>
                <div class="col-md-9" style="font-size: 11pt; display: table-cell;padding-left: 15px;padding-right: 12px;">              
                    <p>:  <%=date%></p>
                </div>
            </div>  
            <br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5" border="1">
                    <thead>
                        <tr>
                            <th width="20%">Customer ID</th>
                            <th width="50%">Customer Name</th>
                            <th style="text-align: center;" width="15%">Debit (RM)</th>
                            <th style="text-align: center;" width="15%">Credit (RM)</th>
                        </tr>
                    </thead>
                    <tbody> 
                        <%
                            for (int i = 0; i < data.size(); i++) {

                                String name = data.get(i).get(0);
                                String custId = data.get(i).get(1);
                                String yearDebit = data.get(i).get(2);
                                String yearCredit = data.get(i).get(3);

                                totalYearDebit += Double.parseDouble(yearDebit);
                                totalYearCredit += Double.parseDouble(yearCredit);
                        %>
                        <tr>
                            <td><%=custId%></td>
                            <td style="text-transform: uppercase;"><%=name%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(yearDebit))%></td>
                            <td style="text-align: center;"><%=df.format(Double.parseDouble(yearCredit))%></td>
                        </tr> 
                        <% }

                            deficient = totalYearCredit - totalYearDebit;
                        %>
                        <tr>
                            <th colspan="2">Total</th>
                            <td style="text-align: center;"><%=df.format(totalYearDebit)%></td>
                            <td style="text-align: center;"><%=df.format(totalYearCredit)%></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <br>
            <br>
            <div class="center-block" style="align-content: center;">
                <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5">
                    <thead>
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

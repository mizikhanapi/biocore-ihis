<%-- 
    Document   : loginProcessGetUserDetails
    Created on : Jul 14, 2018, 2:59:01 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String user = request.getParameter("user_name");
    String pass = request.getParameter("user_pass");
    String group = request.getParameter("user_group");

    // Connection 
    Conn conn = new Conn();

    // Status To Get As Return
    final String NO_USER = "No User";
    final String WRONG_PASSWORD = "Wrong Password";
    final String LOGIN = "Login";
    final String CONFIGURE = "No Access";
    String status = "";

    // Variable to Assign Value
    String userName = "";
    String userHFC = "";
    String userIC = "";
    String userStatus = "";
    String userType = "";
    String userAddress1 = "";
    String userAddress2 = "";
    String userTown = "";
    String userDistrict = "";
    String userState = "";
    String userCountry = "";
    String userPostcode = "";
    String userTelephone = "";
    String userEmail = "";
    String userAccountNo = "";
    String userBankAccountNo = "";
    String userBankAccountName = "";
    String userJomlokaWalletNo = "";
    String userDebitNo = "";
    String userDebitExpire = "";
    String userSearchCoverage = "";

    //                          0               1          2               3                                 4                       
    String sql = " SELECT adm.user_id, adm.password, adm.user_name, adm.health_facility_code, ifnull(convert(adm.picture using utf8), ''),  "
            //              5                           6               7                       8           9
            + " ifnull(adm.login_status, '0'), adm.new_icno, ifnull(adm.user_status, ''), adm.user_type , adm.status, "
            //        10                11          12          13            14            15          16              17              18
            + " fc.customer_name, fc.address1, fc.address2, fc.town_cd, fc.district_cd, fc.state_cd, fc.country_cd, fc.postcode, fc.telephone_no,  "
            //     19               20                      21                      22                     23                   24                  25                      26
            + " fc.email, fc.customer_account_no, fc.customer_bank_acc_no, fc.customer_bank_name, fc.jomloka_wallet_no, fc.debit_card_no, fc.debit_card_expire, fc.jomloka_search_coverage "
            // FROM SQL
            + " FROM adm_users adm "
            // JOIN SQL
            + " JOIN far_customer fc ON (adm.USER_ID = fc.customer_id) "
            // WHERE CONDITION
            + " WHERE adm.user_id = '" + user + "' AND adm.user_group='" + group + "' LIMIT 1 ";

    ArrayList<ArrayList<String>> dataUser = conn.getData(sql);

    if (dataUser.size() > 0) // Login For JOMLOKA Customer
    {

        if (dataUser.get(0).get(1).equals(pass)) {

            if (dataUser.get(0).get(9).equals("0")) {

                status = LOGIN;
                userName = dataUser.get(0).get(2);
                userHFC = dataUser.get(0).get(3);
                userIC = dataUser.get(0).get(6);
                userStatus = dataUser.get(0).get(7);
                userType = dataUser.get(0).get(8);
                userAddress1 = dataUser.get(0).get(11);
                userAddress2 = dataUser.get(0).get(12);
                userTown = dataUser.get(0).get(13);
                userDistrict = dataUser.get(0).get(14);
                userState = dataUser.get(0).get(15);
                userCountry = dataUser.get(0).get(16);
                userPostcode = dataUser.get(0).get(17);
                userTelephone = dataUser.get(0).get(18);
                userEmail = dataUser.get(0).get(19);
                userAccountNo = dataUser.get(0).get(20);
                userBankAccountNo = dataUser.get(0).get(21);
                userBankAccountName = dataUser.get(0).get(22);
                userJomlokaWalletNo = dataUser.get(0).get(23);
                userDebitNo = dataUser.get(0).get(24);
                userDebitExpire = dataUser.get(0).get(25);
                userSearchCoverage = dataUser.get(0).get(26);

            } else {

                status = CONFIGURE;

            }

        } else {

            status = WRONG_PASSWORD;

        }

    } else {

        status = NO_USER;

    }

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);
    obj.put("screen", "Dashboard");
    obj.put("data",
            // 0          1             2            3               4               5               6               7              
            user + "|" + pass + "|" + group + "|" + userName + "|" + userHFC + "|" + userIC + "|" + userStatus + "|" + userType
            //           8                  9                     10                  11                12                  13              
            + "|" + userAddress1 + "|" + userAddress2 + "|" + userTown + "|" + userDistrict + "|" + userState + "|" + userCountry
            //           14                   15                  16                  17                    18                     
            + "|" + userPostcode + "|" + userTelephone + "|" + userEmail + "|" + userAccountNo + "|" + userBankAccountNo
            //             19                           20                      21                      22                  23     
            + "|" + userBankAccountName + "|" + userJomlokaWalletNo + "|" + userDebitNo + "|" + userDebitExpire + "|" + userSearchCoverage
    );

    out.print(obj);


%>
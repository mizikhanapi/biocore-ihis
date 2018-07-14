/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADM_helper;

/**
 *
 * @author user
 * 
 * This class is created to hold the session key to get the desired session object from session.
 * To avoid misspelling and mismatching the session key.
 * Eg: To get hfc_cd from session, we usually write: String hfc_cd = (String)session.getAttribute("HEALTH_FACILITY_CODE");
 *     With this class we can write: String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
 */
public class MySessionKey {
    
    //normal users
    public static final String 
            HFC_CD="HEALTH_FACILITY_CODE",
            HFC_NAME="HFC_NAME",
            USER_ID="USER_ID",
            USER_NAME="USER_NAME",
            USER_PICTURE="PICTURE",
            USER_TYPE="USER_TYPE",
            USER_GROUP="USER_GROUP",
            SESSION_ID="SESSION_ID",
            DISCIPLINE_CD="DISCIPLINE_CODE",
            DISCIPLINE_NAME="DISCIPLINE_NAME",
            SUBDISCIPLINE_CD="SUB_DISCIPLINE_CODE",
            SUBDISCIPLINE_NAME="SUB_DISCIPLINE_NAME",
            HFC_99="HFC_99";
    
    //tenant users
    public static final String
            TENANT_CD = "TENANT_CODE",
            TENANT_NAME = "TENANT_NAME";
    
}

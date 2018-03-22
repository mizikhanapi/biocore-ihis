/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BILLING_helper;

import ADM_helper.Emailer;

/**
 *
 * @author Shammugam
 */
public class RecieptEmailSender {
    
        public void SendEmail() {

        System.out.println("Sending Email....");

        String strMessageHeader = "Dear Name, "
                + "\n\n\nFollowing is the details of your purchase.";

        String strMessageFooter = "\n\n\nPlease do not reply to this email as it is computer generated email."
                + "\nThank You.";

        String strMessage = strMessageHeader + strMessageFooter;

        String subject = "i-HIS. NO REPLY";
        String email = "B031410418@student.utem.edu.my";

        Emailer es = new Emailer(email, subject, strMessage);

        boolean isSent = es.sendTextEmail();


    }

    public static void main(String[] args) {
        // Following statement would create an object myPuppy

        RecieptEmailSender res = new RecieptEmailSender();
        res.SendEmail();

    }
    
}
